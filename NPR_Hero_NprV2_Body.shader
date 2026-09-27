//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "NPR/Hero_NprV2_Body" {
Properties {

[Header(Point Light___________________________________________________________________________________________________________________________)] [Space(20)] [Toggle] _pointLightOn ("点光源开关", Float) = 0.0

_pointLightPos ("点光源位置", Vector) = (312.249,312.761,0.9,0)

_pointLightRange ("点光源范围", Float) = 1.0

_pointLightAtten ("点光源衰减", Range(1, 8)) = 1.0

_pointLightColor ("点光源颜色", Color) = (1,1,1,1)

[Header(Base Shading____g_______________________________________________________________________________________________________________________)] [Space(20)] _MainTex ("ColorMap,A:自阴影_0为固定,灰度渐变则变动态", 2D) = "white" { }

[Toggle(_USE_GRADUAL)] _useGradual ("使用3U渐变叠加基础色", Float) = 0.0

[Toggle] _showGradual ("暂时显示渐变区域", Float) = 0.0

_gradualRange ("渐变范围", Range(0.01, 20)) = 1.0

_gradualOffset ("渐变范围偏移", Range(0.01, 1)) = 1.0

_gradualColor ("渐变颜色", Color) = (1,1,1,1)

_gradualSaturation ("渐变颜色饱和度", Range(0.01, 10)) = 1.0

_LightMapTex ("FunctionMap,R:默认1半透明用,G:外描边粗细:B:自发光", 2D) = "white" { }

_EmisstionColor ("自发光颜色", Color) = (0,0,0,0)

_EmisstionParams ("x:亮度最大值,y:亮度最小,z:呼吸速度", Vector) = (1,1,0,0)

_NormalTex ("NormalMap,RG:法线,B:皮肤 =1,头发第二条,其余部分按照自定义的Ramp条数来", 2D) = "normal" { }

_NormalStr ("法线强度", Range(0, 1)) = 1.0

_PBRTexture ("PBR:R:粗糙度,G:金属度,B:碳纤维=0 特殊功能区=0.3,A:Matcap反射强度", 2D) = "white" { }

_roughness ("粗糙度调整", Range(0.04, 2)) = 1.0

_metallic ("金属度调整", Range(0.001, 1)) = 0.0010000000474974513

_speStr ("高光强度", Range(0.01, 20)) = 1.0

[Header(Ramp Shading___________________________________________________________________________________________________________________________)] [Space(20)] _RampTex ("Ramp", 2D) = "white" { }

[Toggle] _ShowRamp ("暂时显示当前id的Ramp", Float) = 0.0

_selfShadowAdjust ("自投影调整", Range(0, 1)) = 0.20999999344348907

_RampDifLerpValue ("Ramp强度", Range(0, 1)) = 1.0

_ShadowThreshold ("明暗偏移阈值,默认是0一般不用动", Range(-1, 1)) = 0.0

_ShadowFeather ("明暗边缘的平滑(会乘法线的a通道)", Range(0.01, 2.99)) = 0.009999999776482582

_LightAreaColor ("受光面灯光颜色,一般默认,A调节半透明", Color) = (1,1,1,1)

_DarkColor ("背光面灯光颜色,一般默认", Color) = (0.5,0.5,0.5,1)

_MatcapTex ("Matcap", 2D) = "white" { }

_matCapSpeEffectedByLightDir ("Matcap受灯光方向影响强弱", Range(0, 1)) = 0.20999999344348907

_inDirectSpeStr ("间接高光强度Matcap.RGB", Range(0, 20)) = 0.20999999344348907

_customMatcapFresnelRange ("特殊功能区菲尼尔范围,一般是1给丝袜用", Range(0, 1)) = 1.0

_customMatcapCol ("特殊功能区颜色", Color) = (1,1,1,1)

[Header(Clear Coat___________________________________________________________________________________________________________________________)] [Space(20)] [Toggle] _ClearCoat ("是否开启碳纤维材质,关闭时别贴贴图", Float) = 0.0

[Toggle] _ClearCoatMatcapA ("是否使用MatcapA通道作为Mask", Float) = 1.0

_ClearCoatMatcapStr ("Matcap RGB颜色的影响程度", Range(0, 1)) = 1.0

_ClearCoatTex ("碳纤维细节贴图", 2D) = "white" { }

_ClearCoatTileScale ("碳纤维细节贴图Tile", Float) = 4.300000190734863

_ClearCoatPow ("碳纤维细节对比度", Range(0, 32)) = 1.0

_ClearCoatStrength ("碳纤维细节强度", Float) = 1.0

_ClearNovPow ("碳纤维菲尼尔遮蔽强度", Range(0, 64)) = 16.0

[Header(Rim___________________________________________________________________________________________________________________________)] [Space(20)] _RimWidth ("边缘光粗细", Float) = 1.0

_RimCol ("边缘光颜色", Color) = (1,1,1,1)

_depthSubThreshold ("DepthSubThreshold", Float) = 0.5

_depthRimOffset ("边缘光偏移", Vector) = (0,0,0,0)

_ColorScaleByLightDir ("边缘光颜色受灯光亮暗强弱影响", Range(0.001, 5)) = 1.0

_WidthEffectByLightDir ("边缘光粗细受灯光亮暗强弱影响", Range(0, 1)) = 0.0

[Header(InsideLine___________________________________________________________________________________________________________________________)] [Space(20)] _InSideLine ("内描边贴图", 2D) = "white" { }

_InSideLineColor ("内描边颜色", Color) = (1,1,1,1)

_InSideLineSaturation ("内描边饱和度", Range(0, 20)) = 1.5

_InSideLineStrength ("内描边强度", Range(0, 2)) = 1.0

[Header(Outline___________________________________________________________________________________________________________________________)] [Space(20)] _Outline_Width ("外描边宽度", Float) = 0.019999999552965164

_Outline_Color ("外描边颜色", Color) = (0.5,0.5,0.5,1)

_Outline_Offset_X ("Outline_Offset_X 一般不用动", Float) = 0.0

_Outline_Offset_Y ("Outline_Offset_Y一般不用动", Float) = 0.0

[Header(LiuGuang___________________________________________________________________________________________________________________________)] [Space(20)] [Toggle(_LG_ON)] _LG_ON ("流光开关(UV3)", Float) = 0.0

[Toggle] _useUv3 ("使用UV3作为流光UV,关闭则为UV1", Float) = 1.0

_LG_Tex ("流光纹理", 2D) = "black" { }

_LG_Color ("流光颜色", Color) = (1,1,1,1)

_LG_Intensity ("流光强度", Float) = 1.0

_U_LG ("U向流动速度", Float) = 0.0

_V_LG ("V向流动速度", Float) = 0.0

[Toggle] _useLg2 ("使用第二条流光纹理", Float) = 0.0

[Toggle] _useUv32 ("使用UV3作为流光UV,关闭则为UV1", Float) = 1.0

_LG_Tex2 ("流光纹理2", 2D) = "black" { }

_LG_Color2 ("流光颜色2", Color) = (1,1,1,1)

_LG_Intensity2 ("流光强度2", Float) = 1.0

_U_LG2 ("U向流动速度2", Float) = 0.0

_V_LG2 ("V向流动速度2", Float) = 0.0

}
SubShader {
 Pass {
 Name "NPR Base"
  Tags { "LIGHTMODE" = "FORWARDBASE" }
  GpuProgramID 42107
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD5.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD9.xy = in_TEXCOORD2.xy;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _NormalStr;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _ShowRamp;
uniform 	mediump float _selfShadowAdjust;
uniform 	mediump float _metallic;
uniform 	mediump float _roughness;
uniform 	mediump float _speStr;
uniform 	mediump float _inDirectSpeStr;
uniform 	mediump float _ClearCoat;
uniform 	mediump float _ClearCoatPow;
uniform 	mediump float _ClearCoatStrength;
uniform 	mediump float _ClearCoatTileScale;
uniform 	mediump float _ClearNovPow;
uniform 	mediump float _ClearCoatMatcapStr;
uniform 	mediump float _ClearCoatMatcapA;
uniform 	mediump float _customMatcapFresnelRange;
uniform 	mediump vec3 _customMatcapCol;
uniform 	mediump float _SkinThroughOn;
uniform 	mediump vec3 _SkinEffectCol;
uniform 	mediump vec4 _throughSkinSpeDir;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ShadowOffsetTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(6) uniform mediump sampler2D _PBRTexture;
UNITY_LOCATION(7) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _ClearCoatTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinEffectTex;
UNITY_LOCATION(10) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
bool u_xlatb10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
float u_xlat18;
mediump vec2 u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat26;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
vec2 u_xlat34;
vec2 u_xlat37;
mediump vec2 u_xlat16_37;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
vec2 u_xlat42;
mediump float u_xlat16_42;
bool u_xlatb42;
vec2 u_xlat44;
mediump float u_xlat16_45;
mediump vec2 u_xlat16_46;
float u_xlat52;
mediump float u_xlat16_53;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
bool u_xlatb59;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_65;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat17.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat52 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat2.xyz = vec3(u_xlat52) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4.x = (-_USE3UV_ON) + 1.0;
    u_xlat37.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat37.xy = vs_TEXCOORD0.xy * u_xlat16_4.xx + u_xlat37.xy;
    u_xlat16_4 = texture(_MainTex, u_xlat37.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_53 = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_56 = u_xlat16_53 + -1.0;
    u_xlat16_56 = _InSideLineStrength * u_xlat16_56 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz;
    u_xlat37.x = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_57 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_57 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_56) + (-u_xlat37.xxx);
    u_xlat8.xyz = vec3(u_xlat16_57) * u_xlat8.xyz + u_xlat37.xxx;
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_6.xyz = u_xlat8.xyz * vec3(u_xlat16_56) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_37.xy = texture(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat42.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat9.x = (-u_xlat42.x) * u_xlat42.x + 1.0;
    u_xlat9.x = (-u_xlat42.y) * u_xlat42.y + u_xlat9.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat26.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat26.xyz = u_xlat26.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat17.zxy * u_xlat26.yzx;
    u_xlat10.xyz = u_xlat17.yzx * u_xlat26.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat42.yyy * u_xlat10.xyz;
    u_xlat26.xyz = u_xlat42.xxx * u_xlat26.xyz + u_xlat10.xyz;
    u_xlat9.xyz = u_xlat9.xxx * u_xlat17.xyz + u_xlat26.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat9.xyz = vec3(_NormalStr) * u_xlat9.xyz + u_xlat17.xyz;
    u_xlat16_56 = (-u_xlat16_4.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat16_6.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_23 = _ShadowThreshold + 0.5;
    u_xlat16_42 = texture(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat42.x = u_xlat16_42 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.99000001<u_xlat16_56);
#else
    u_xlatb59 = 0.99000001<u_xlat16_56;
#endif
    u_xlat16_40 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_40 = (u_xlatb59) ? u_xlat16_40 : 0.0;
    u_xlat16_40 = u_xlat16_40 + _selfShadowAdjust;
    u_xlat42.x = u_xlat16_56 * u_xlat16_40 + u_xlat42.x;
    u_xlat42.x = u_xlat16_23 + u_xlat42.x;
    u_xlat16_23 = u_xlat42.x + (-_ShadowFeather);
    u_xlat16_40 = u_xlat42.x + _ShadowFeather;
    u_xlat16_40 = (-u_xlat16_23) + u_xlat16_40;
    u_xlat16_7.x = (-u_xlat16_23) + u_xlat16_6.x;
    u_xlat16_24.x = float(1.0) / u_xlat16_40;
    u_xlat16_7.x = u_xlat16_24.x * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_24.x;
    u_xlat16_8 = min(u_xlat16_7.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.96875>=u_xlat8.y);
#else
    u_xlatb42 = 0.96875>=u_xlat8.y;
#endif
    u_xlat8.x = u_xlat16_8;
    u_xlat16_10.xyz = texture(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_10.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_7.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_11.xyz = vec3(_RampDifLerpValue) * u_xlat16_11.xyz + u_xlat16_5.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _DarkColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _LightAreaColor.xyz + (-u_xlat16_12.xyz);
    u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat25.xz = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat25.xz;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat25.xz;
    u_xlat16_12.xy = u_xlat25.xz + vec2(1.0, 1.0);
    u_xlat16_58 = u_xlat3.y * 0.100000001;
    u_xlat10.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat10.y = u_xlat16_58 * _matCapSpeEffectedByLightDir;
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.5, 0.5) + (-u_xlat10.xy);
    u_xlat16_4 = texture(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_46.xy = u_xlat16_4.yx * vec2(_metallic, _roughness);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46.xy = min(max(u_xlat16_46.xy, 0.0), 1.0);
#else
    u_xlat16_46.xy = clamp(u_xlat16_46.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.100000001>=u_xlat16_4.z);
#else
    u_xlatb60 = 0.100000001>=u_xlat16_4.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat));
#else
    u_xlatb10 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
#endif
    u_xlatb60 = u_xlatb60 && u_xlatb10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.100000001<u_xlat16_4.z);
#else
    u_xlatb10 = 0.100000001<u_xlat16_4.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_4.z<0.449999988);
#else
    u_xlatb27 = u_xlat16_4.z<0.449999988;
#endif
    u_xlatb10 = u_xlatb27 && u_xlatb10;
    u_xlatb27 = u_xlatb60 || u_xlatb10;
    u_xlat16_58 = u_xlat16_46.y * 6.0;
    u_xlat16_58 = (u_xlatb27) ? 0.0 : u_xlat16_58;
    u_xlat16_13 = textureLod(_MatcapTex, u_xlat16_12.xy, u_xlat16_58);
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    if(u_xlatb60){
        u_xlat16_58 = log2(u_xlat27);
        u_xlat16_58 = u_xlat16_58 * _ClearNovPow;
        u_xlat16_58 = exp2(u_xlat16_58);
        u_xlat44.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat16_60 = texture(_ClearCoatTex, u_xlat44.xy).x;
        u_xlat16_62 = log2(u_xlat16_60);
        u_xlat16_62 = u_xlat16_62 * _ClearCoatPow;
        u_xlat16_62 = exp2(u_xlat16_62);
        u_xlat16_62 = u_xlat16_62 * _ClearCoatStrength;
        u_xlat16_58 = u_xlat16_58 * u_xlat16_62;
        u_xlat16_62 = (-u_xlat16_56) + 1.21000004;
        u_xlat16_62 = min(u_xlat16_62, 1.0);
        u_xlat16_58 = u_xlat16_58 * u_xlat16_62;
        u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_14.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_14.xyz;
        u_xlat16_14.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
        u_xlat16_14.xyz = u_xlat16_4.www * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA));
#else
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
#endif
        u_xlat16_16.xyz = u_xlat16_13.www * u_xlat16_14.xyz;
        u_xlat16_14.xyz = (bool(u_xlatb60)) ? u_xlat16_16.xyz : u_xlat16_14.xyz;
        u_xlat16_14.xyz = u_xlat16_11.xyz + u_xlat16_14.xyz;
    } else {
        u_xlat16_58 = (-u_xlat16_46.x) + 1.0;
        u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_11.xyz;
    }
    if(u_xlatb42){
        u_xlat16_58 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
        u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
        u_xlat13.xyz = u_xlat16_5.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat13.xyz = u_xlat16_46.xxx * u_xlat13.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat52) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat9.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat16_11.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_11.y = u_xlat16_46.y * u_xlat16_46.y;
        u_xlat16_11.xz = u_xlat16_11.xy * u_xlat16_11.xy;
        u_xlat16_28 = u_xlat16_11.y * u_xlat16_11.y + -1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_28 + 1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.z / u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.x * 0.318309873;
        u_xlat16_28 = (-u_xlat27) * u_xlat16_11.z + u_xlat27;
        u_xlat16_28 = u_xlat27 * u_xlat16_28 + u_xlat16_11.z;
        u_xlat16_28 = sqrt(u_xlat16_28);
        u_xlat16_28 = u_xlat27 + u_xlat16_28;
        u_xlat16_62 = (-u_xlat16_58) * u_xlat16_11.z + u_xlat16_58;
        u_xlat16_45 = u_xlat16_58 * u_xlat16_62 + u_xlat16_11.z;
        u_xlat16_45 = sqrt(u_xlat16_45);
        u_xlat16_45 = u_xlat16_58 + u_xlat16_45;
        u_xlat16_28 = u_xlat16_45 * u_xlat16_28;
        u_xlat16_11.y = float(1.0) / u_xlat16_28;
        u_xlat16_11.z = (-u_xlat1.x) + 1.0;
        u_xlat16_11.xw = u_xlat16_11.xz * u_xlat16_11.yz;
        u_xlat16_62 = u_xlat16_11.w * u_xlat16_11.w;
        u_xlat16_12.x = u_xlat16_11.z * u_xlat16_62;
        u_xlat16_29 = u_xlat13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
        u_xlat16_45 = (-u_xlat16_62) * u_xlat16_11.z + 1.0;
        u_xlat16_16.xyz = u_xlat13.xyz * vec3(u_xlat16_45);
        u_xlat16_12.xyz = vec3(u_xlat16_29) * u_xlat16_12.xxx + u_xlat16_16.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_12.xyz;
        u_xlat16_11.xyz = vec3(u_xlat16_58) * u_xlat16_11.xyz;
        u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
        u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
        u_xlat0.x = (-u_xlat27) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_62 = (-u_xlat16_46.y) + 1.0;
        u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
        u_xlat16_62 = u_xlat16_62 * 0.899999976 + 0.100000001;
        u_xlat16_12.xyz = u_xlat16_13.www * _customMatcapCol.xyz;
        u_xlat16_12.xyz = (bool(u_xlatb10)) ? u_xlat16_12.xyz : u_xlat16_15.xyz;
        u_xlat1.x = u_xlat27 + _customMatcapFresnelRange;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat18 = u_xlatb10 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat18 * u_xlat1.x + 1.0;
        u_xlat16_63 = (u_xlatb10) ? 1.0 : 0.0;
        u_xlat16_65 = (-u_xlat0.x) + 1.0;
        u_xlat16_65 = u_xlat16_63 * u_xlat16_65 + u_xlat0.x;
        u_xlat16_15.x = (-_inDirectSpeStr) + 1.0;
        u_xlat16_63 = u_xlat16_63 * u_xlat16_15.x + _inDirectSpeStr;
        u_xlat16_63 = u_xlat16_4.w * u_xlat16_63;
        u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
        u_xlat16_12.xyz = vec3(u_xlat16_65) * u_xlat16_12.xyz;
        u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
        u_xlat16_62 = (-u_xlat16_56) + 1.21000004;
        u_xlat16_62 = min(u_xlat16_62, 1.0);
        u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_speStr, _speStr, _speStr)) + u_xlat16_12.xyz;
        u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat1.xxx + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn));
#else
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
#endif
        if(u_xlatb0){
            u_xlat16_11.xy = u_xlat3.xy + (-u_xlat25.xz);
            u_xlat16_11.xy = _throughSkinSpeDir.ww * u_xlat16_11.xy + u_xlat25.xz;
            u_xlat16_11.xy = u_xlat16_11.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_11.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat16_0 = texture(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_11.x = u_xlat16_0 * 0.349999994;
            u_xlat16_56 = (-u_xlat16_56) + 1.0;
            u_xlat16_56 = u_xlat16_56 * u_xlat16_11.x;
            u_xlat16_56 = u_xlat16_58 * u_xlat16_56;
            u_xlat16_14.xyz = vec3(u_xlat16_56) * _SkinEffectCol.xyz + u_xlat16_14.xyz;
        }
    }
    u_xlat16_56 = u_xlat16_37.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat1.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + _EmisstionParams.x;
    u_xlat1.xyz = u_xlat16_5.xyz * _EmisstionColor.xyz;
    u_xlat16_5.x = (-u_xlat16_37.y) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xxx;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
#endif
    u_xlat16_5.x = 1.0;
    u_xlat16_7.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat1.xyz;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_5.x : u_xlat16_56;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat3.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xz = u_xlat17.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat17.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat17.zz + u_xlat0.xy;
    u_xlat34.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat34.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat3.xx + u_xlat34.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat3.zz + u_xlat34.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_39 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_39);
    u_xlat16_5 = u_xlat0 * u_xlat16_5.xxzz;
    u_xlat16_5.x = dot(u_xlat16_5.xy, u_xlat16_5.zw);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _ColorScaleByLightDir;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_22.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_22.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_22.xy + u_xlat0.xy;
    u_xlat16_56 = dot(u_xlat16_22.xy, u_xlat16_22.xy);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_22.xy = vec2(u_xlat16_56) * u_xlat16_22.xy;
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_22.xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=_depthSubThreshold);
#else
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx + u_xlat16_7.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_pointLightOn);
#else
    u_xlatb0 = 0.5<_pointLightOn;
#endif
    u_xlat17.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat17.x = sqrt(u_xlat17.x);
    u_xlat16_56 = u_xlat17.x + 9.99999975e-05;
    u_xlat16_56 = log2(u_xlat16_56);
    u_xlat16_56 = u_xlat16_56 * _pointLightAtten;
    u_xlat16_56 = exp2(u_xlat16_56);
    u_xlat16_56 = float(1.0) / u_xlat16_56;
    u_xlat16_7.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_7.x = u_xlat17.x / u_xlat16_7.x;
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_24.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = (-u_xlat16_24.x) * u_xlat16_7.x + 1.0;
    u_xlat16_24.xyz = vec3(u_xlat16_56) * _pointLightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_24.xyz * u_xlat16_7.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD5.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD9.xy = in_TEXCOORD2.xy;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _NormalStr;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _ShowRamp;
uniform 	mediump float _selfShadowAdjust;
uniform 	mediump float _metallic;
uniform 	mediump float _roughness;
uniform 	mediump float _speStr;
uniform 	mediump float _inDirectSpeStr;
uniform 	mediump float _ClearCoat;
uniform 	mediump float _ClearCoatPow;
uniform 	mediump float _ClearCoatStrength;
uniform 	mediump float _ClearCoatTileScale;
uniform 	mediump float _ClearNovPow;
uniform 	mediump float _ClearCoatMatcapStr;
uniform 	mediump float _ClearCoatMatcapA;
uniform 	mediump float _customMatcapFresnelRange;
uniform 	mediump vec3 _customMatcapCol;
uniform 	mediump float _SkinThroughOn;
uniform 	mediump vec3 _SkinEffectCol;
uniform 	mediump vec4 _throughSkinSpeDir;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ShadowOffsetTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(6) uniform mediump sampler2D _PBRTexture;
UNITY_LOCATION(7) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _ClearCoatTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinEffectTex;
UNITY_LOCATION(10) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
bool u_xlatb10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
float u_xlat18;
mediump vec2 u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat26;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
vec2 u_xlat34;
vec2 u_xlat37;
mediump vec2 u_xlat16_37;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
vec2 u_xlat42;
mediump float u_xlat16_42;
bool u_xlatb42;
vec2 u_xlat44;
mediump float u_xlat16_45;
mediump vec2 u_xlat16_46;
float u_xlat52;
mediump float u_xlat16_53;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
bool u_xlatb59;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_65;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat17.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat52 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat2.xyz = vec3(u_xlat52) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4.x = (-_USE3UV_ON) + 1.0;
    u_xlat37.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat37.xy = vs_TEXCOORD0.xy * u_xlat16_4.xx + u_xlat37.xy;
    u_xlat16_4 = texture(_MainTex, u_xlat37.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_53 = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_56 = u_xlat16_53 + -1.0;
    u_xlat16_56 = _InSideLineStrength * u_xlat16_56 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz;
    u_xlat37.x = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_57 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_57 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_56) + (-u_xlat37.xxx);
    u_xlat8.xyz = vec3(u_xlat16_57) * u_xlat8.xyz + u_xlat37.xxx;
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_6.xyz = u_xlat8.xyz * vec3(u_xlat16_56) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_37.xy = texture(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat42.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat9.x = (-u_xlat42.x) * u_xlat42.x + 1.0;
    u_xlat9.x = (-u_xlat42.y) * u_xlat42.y + u_xlat9.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat26.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat26.xyz = u_xlat26.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat17.zxy * u_xlat26.yzx;
    u_xlat10.xyz = u_xlat17.yzx * u_xlat26.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat42.yyy * u_xlat10.xyz;
    u_xlat26.xyz = u_xlat42.xxx * u_xlat26.xyz + u_xlat10.xyz;
    u_xlat9.xyz = u_xlat9.xxx * u_xlat17.xyz + u_xlat26.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat9.xyz = vec3(_NormalStr) * u_xlat9.xyz + u_xlat17.xyz;
    u_xlat16_56 = (-u_xlat16_4.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat16_6.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_23 = _ShadowThreshold + 0.5;
    u_xlat16_42 = texture(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat42.x = u_xlat16_42 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.99000001<u_xlat16_56);
#else
    u_xlatb59 = 0.99000001<u_xlat16_56;
#endif
    u_xlat16_40 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_40 = (u_xlatb59) ? u_xlat16_40 : 0.0;
    u_xlat16_40 = u_xlat16_40 + _selfShadowAdjust;
    u_xlat42.x = u_xlat16_56 * u_xlat16_40 + u_xlat42.x;
    u_xlat42.x = u_xlat16_23 + u_xlat42.x;
    u_xlat16_23 = u_xlat42.x + (-_ShadowFeather);
    u_xlat16_40 = u_xlat42.x + _ShadowFeather;
    u_xlat16_40 = (-u_xlat16_23) + u_xlat16_40;
    u_xlat16_7.x = (-u_xlat16_23) + u_xlat16_6.x;
    u_xlat16_24.x = float(1.0) / u_xlat16_40;
    u_xlat16_7.x = u_xlat16_24.x * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_24.x;
    u_xlat16_8 = min(u_xlat16_7.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.96875>=u_xlat8.y);
#else
    u_xlatb42 = 0.96875>=u_xlat8.y;
#endif
    u_xlat8.x = u_xlat16_8;
    u_xlat16_10.xyz = texture(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_10.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_7.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_11.xyz = vec3(_RampDifLerpValue) * u_xlat16_11.xyz + u_xlat16_5.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _DarkColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _LightAreaColor.xyz + (-u_xlat16_12.xyz);
    u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat25.xz = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat25.xz;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat25.xz;
    u_xlat16_12.xy = u_xlat25.xz + vec2(1.0, 1.0);
    u_xlat16_58 = u_xlat3.y * 0.100000001;
    u_xlat10.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat10.y = u_xlat16_58 * _matCapSpeEffectedByLightDir;
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.5, 0.5) + (-u_xlat10.xy);
    u_xlat16_4 = texture(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_46.xy = u_xlat16_4.yx * vec2(_metallic, _roughness);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46.xy = min(max(u_xlat16_46.xy, 0.0), 1.0);
#else
    u_xlat16_46.xy = clamp(u_xlat16_46.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.100000001>=u_xlat16_4.z);
#else
    u_xlatb60 = 0.100000001>=u_xlat16_4.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat));
#else
    u_xlatb10 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
#endif
    u_xlatb60 = u_xlatb60 && u_xlatb10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.100000001<u_xlat16_4.z);
#else
    u_xlatb10 = 0.100000001<u_xlat16_4.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_4.z<0.449999988);
#else
    u_xlatb27 = u_xlat16_4.z<0.449999988;
#endif
    u_xlatb10 = u_xlatb27 && u_xlatb10;
    u_xlatb27 = u_xlatb60 || u_xlatb10;
    u_xlat16_58 = u_xlat16_46.y * 6.0;
    u_xlat16_58 = (u_xlatb27) ? 0.0 : u_xlat16_58;
    u_xlat16_13 = textureLod(_MatcapTex, u_xlat16_12.xy, u_xlat16_58);
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    if(u_xlatb60){
        u_xlat16_58 = log2(u_xlat27);
        u_xlat16_58 = u_xlat16_58 * _ClearNovPow;
        u_xlat16_58 = exp2(u_xlat16_58);
        u_xlat44.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat16_60 = texture(_ClearCoatTex, u_xlat44.xy).x;
        u_xlat16_62 = log2(u_xlat16_60);
        u_xlat16_62 = u_xlat16_62 * _ClearCoatPow;
        u_xlat16_62 = exp2(u_xlat16_62);
        u_xlat16_62 = u_xlat16_62 * _ClearCoatStrength;
        u_xlat16_58 = u_xlat16_58 * u_xlat16_62;
        u_xlat16_62 = (-u_xlat16_56) + 1.21000004;
        u_xlat16_62 = min(u_xlat16_62, 1.0);
        u_xlat16_58 = u_xlat16_58 * u_xlat16_62;
        u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_14.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_14.xyz;
        u_xlat16_14.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
        u_xlat16_14.xyz = u_xlat16_4.www * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA));
#else
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
#endif
        u_xlat16_16.xyz = u_xlat16_13.www * u_xlat16_14.xyz;
        u_xlat16_14.xyz = (bool(u_xlatb60)) ? u_xlat16_16.xyz : u_xlat16_14.xyz;
        u_xlat16_14.xyz = u_xlat16_11.xyz + u_xlat16_14.xyz;
    } else {
        u_xlat16_58 = (-u_xlat16_46.x) + 1.0;
        u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_11.xyz;
    }
    if(u_xlatb42){
        u_xlat16_58 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_58 = min(max(u_xlat16_58, 0.0), 1.0);
#else
        u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
#endif
        u_xlat13.xyz = u_xlat16_5.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat13.xyz = u_xlat16_46.xxx * u_xlat13.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat52) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat9.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat16_11.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_11.y = u_xlat16_46.y * u_xlat16_46.y;
        u_xlat16_11.xz = u_xlat16_11.xy * u_xlat16_11.xy;
        u_xlat16_28 = u_xlat16_11.y * u_xlat16_11.y + -1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_28 + 1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.z / u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.x * 0.318309873;
        u_xlat16_28 = (-u_xlat27) * u_xlat16_11.z + u_xlat27;
        u_xlat16_28 = u_xlat27 * u_xlat16_28 + u_xlat16_11.z;
        u_xlat16_28 = sqrt(u_xlat16_28);
        u_xlat16_28 = u_xlat27 + u_xlat16_28;
        u_xlat16_62 = (-u_xlat16_58) * u_xlat16_11.z + u_xlat16_58;
        u_xlat16_45 = u_xlat16_58 * u_xlat16_62 + u_xlat16_11.z;
        u_xlat16_45 = sqrt(u_xlat16_45);
        u_xlat16_45 = u_xlat16_58 + u_xlat16_45;
        u_xlat16_28 = u_xlat16_45 * u_xlat16_28;
        u_xlat16_11.y = float(1.0) / u_xlat16_28;
        u_xlat16_11.z = (-u_xlat1.x) + 1.0;
        u_xlat16_11.xw = u_xlat16_11.xz * u_xlat16_11.yz;
        u_xlat16_62 = u_xlat16_11.w * u_xlat16_11.w;
        u_xlat16_12.x = u_xlat16_11.z * u_xlat16_62;
        u_xlat16_29 = u_xlat13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
        u_xlat16_45 = (-u_xlat16_62) * u_xlat16_11.z + 1.0;
        u_xlat16_16.xyz = u_xlat13.xyz * vec3(u_xlat16_45);
        u_xlat16_12.xyz = vec3(u_xlat16_29) * u_xlat16_12.xxx + u_xlat16_16.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_12.xyz;
        u_xlat16_11.xyz = vec3(u_xlat16_58) * u_xlat16_11.xyz;
        u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
        u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
        u_xlat0.x = (-u_xlat27) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_62 = (-u_xlat16_46.y) + 1.0;
        u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
        u_xlat16_62 = u_xlat16_62 * 0.899999976 + 0.100000001;
        u_xlat16_12.xyz = u_xlat16_13.www * _customMatcapCol.xyz;
        u_xlat16_12.xyz = (bool(u_xlatb10)) ? u_xlat16_12.xyz : u_xlat16_15.xyz;
        u_xlat1.x = u_xlat27 + _customMatcapFresnelRange;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat18 = u_xlatb10 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat18 * u_xlat1.x + 1.0;
        u_xlat16_63 = (u_xlatb10) ? 1.0 : 0.0;
        u_xlat16_65 = (-u_xlat0.x) + 1.0;
        u_xlat16_65 = u_xlat16_63 * u_xlat16_65 + u_xlat0.x;
        u_xlat16_15.x = (-_inDirectSpeStr) + 1.0;
        u_xlat16_63 = u_xlat16_63 * u_xlat16_15.x + _inDirectSpeStr;
        u_xlat16_63 = u_xlat16_4.w * u_xlat16_63;
        u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
        u_xlat16_12.xyz = vec3(u_xlat16_65) * u_xlat16_12.xyz;
        u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
        u_xlat16_62 = (-u_xlat16_56) + 1.21000004;
        u_xlat16_62 = min(u_xlat16_62, 1.0);
        u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_speStr, _speStr, _speStr)) + u_xlat16_12.xyz;
        u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat1.xxx + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn));
#else
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
#endif
        if(u_xlatb0){
            u_xlat16_11.xy = u_xlat3.xy + (-u_xlat25.xz);
            u_xlat16_11.xy = _throughSkinSpeDir.ww * u_xlat16_11.xy + u_xlat25.xz;
            u_xlat16_11.xy = u_xlat16_11.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_11.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat16_0 = texture(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_11.x = u_xlat16_0 * 0.349999994;
            u_xlat16_56 = (-u_xlat16_56) + 1.0;
            u_xlat16_56 = u_xlat16_56 * u_xlat16_11.x;
            u_xlat16_56 = u_xlat16_58 * u_xlat16_56;
            u_xlat16_14.xyz = vec3(u_xlat16_56) * _SkinEffectCol.xyz + u_xlat16_14.xyz;
        }
    }
    u_xlat16_56 = u_xlat16_37.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat1.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + _EmisstionParams.x;
    u_xlat1.xyz = u_xlat16_5.xyz * _EmisstionColor.xyz;
    u_xlat16_5.x = (-u_xlat16_37.y) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xxx;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
#endif
    u_xlat16_5.x = 1.0;
    u_xlat16_7.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat1.xyz;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_5.x : u_xlat16_56;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat3.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xz = u_xlat17.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat17.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat17.zz + u_xlat0.xy;
    u_xlat34.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat34.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat3.xx + u_xlat34.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat3.zz + u_xlat34.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_39 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_39);
    u_xlat16_5 = u_xlat0 * u_xlat16_5.xxzz;
    u_xlat16_5.x = dot(u_xlat16_5.xy, u_xlat16_5.zw);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _ColorScaleByLightDir;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_22.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_22.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_22.xy + u_xlat0.xy;
    u_xlat16_56 = dot(u_xlat16_22.xy, u_xlat16_22.xy);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_22.xy = vec2(u_xlat16_56) * u_xlat16_22.xy;
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_22.xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=_depthSubThreshold);
#else
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx + u_xlat16_7.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_pointLightOn);
#else
    u_xlatb0 = 0.5<_pointLightOn;
#endif
    u_xlat17.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat17.x = sqrt(u_xlat17.x);
    u_xlat16_56 = u_xlat17.x + 9.99999975e-05;
    u_xlat16_56 = log2(u_xlat16_56);
    u_xlat16_56 = u_xlat16_56 * _pointLightAtten;
    u_xlat16_56 = exp2(u_xlat16_56);
    u_xlat16_56 = float(1.0) / u_xlat16_56;
    u_xlat16_7.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_7.x = u_xlat17.x / u_xlat16_7.x;
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_24.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = (-u_xlat16_24.x) * u_xlat16_7.x + 1.0;
    u_xlat16_24.xyz = vec3(u_xlat16_56) * _pointLightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_24.xyz * u_xlat16_7.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD5.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD9.xy = in_TEXCOORD2.xy;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _NormalStr;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _ShowRamp;
uniform 	mediump float _selfShadowAdjust;
uniform 	mediump float _metallic;
uniform 	mediump float _roughness;
uniform 	mediump float _speStr;
uniform 	mediump float _inDirectSpeStr;
uniform 	mediump float _ClearCoat;
uniform 	mediump float _ClearCoatPow;
uniform 	mediump float _ClearCoatStrength;
uniform 	mediump float _ClearCoatTileScale;
uniform 	mediump float _ClearNovPow;
uniform 	mediump float _ClearCoatMatcapStr;
uniform 	mediump float _ClearCoatMatcapA;
uniform 	mediump float _customMatcapFresnelRange;
uniform 	mediump vec3 _customMatcapCol;
uniform 	mediump float _SkinThroughOn;
uniform 	mediump vec3 _SkinEffectCol;
uniform 	mediump vec4 _throughSkinSpeDir;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _ShadowOffsetTex;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _PBRTexture;
uniform lowp sampler2D _MatcapTex;
uniform lowp sampler2D _ClearCoatTex;
uniform lowp sampler2D _SkinEffectTex;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
lowp vec3 u_xlat10_10;
bool u_xlatb10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
lowp vec4 u_xlat10_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
float u_xlat18;
mediump vec2 u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat26;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
vec2 u_xlat34;
vec2 u_xlat37;
lowp vec2 u_xlat10_37;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
vec2 u_xlat42;
lowp float u_xlat10_42;
bool u_xlatb42;
vec2 u_xlat44;
mediump float u_xlat16_45;
mediump vec2 u_xlat16_46;
float u_xlat52;
lowp float u_xlat10_53;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
bool u_xlatb59;
lowp float u_xlat10_60;
bool u_xlatb60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_65;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat17.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat52 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat2.xyz = vec3(u_xlat52) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4 = (-_USE3UV_ON) + 1.0;
    u_xlat37.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat37.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_4) + u_xlat37.xy;
    u_xlat10_4 = texture2D(_MainTex, u_xlat37.xy);
    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz;
    u_xlat10_53 = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_56 = u_xlat10_53 + -1.0;
    u_xlat16_56 = _InSideLineStrength * u_xlat16_56 + 1.0;
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz;
    u_xlat37.x = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_57 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_57 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_56) + (-u_xlat37.xxx);
    u_xlat8.xyz = vec3(u_xlat16_57) * u_xlat8.xyz + u_xlat37.xxx;
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_6.xyz = u_xlat8.xyz * vec3(u_xlat16_56) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat10_37.xy = texture2D(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture2D(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat42.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat9.x = (-u_xlat42.x) * u_xlat42.x + 1.0;
    u_xlat9.x = (-u_xlat42.y) * u_xlat42.y + u_xlat9.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat26.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat26.xyz = u_xlat26.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat17.zxy * u_xlat26.yzx;
    u_xlat10.xyz = u_xlat17.yzx * u_xlat26.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat42.yyy * u_xlat10.xyz;
    u_xlat26.xyz = u_xlat42.xxx * u_xlat26.xyz + u_xlat10.xyz;
    u_xlat9.xyz = u_xlat9.xxx * u_xlat17.xyz + u_xlat26.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat9.xyz = vec3(_NormalStr) * u_xlat9.xyz + u_xlat17.xyz;
    u_xlat16_56 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat16_6.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_23 = _ShadowThreshold + 0.5;
    u_xlat10_42 = texture2D(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat42.x = u_xlat10_42 + -0.5;
    u_xlatb59 = 0.99000001<u_xlat16_56;
    u_xlat16_40 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_40 = (u_xlatb59) ? u_xlat16_40 : 0.0;
    u_xlat16_40 = u_xlat16_40 + _selfShadowAdjust;
    u_xlat42.x = u_xlat16_56 * u_xlat16_40 + u_xlat42.x;
    u_xlat42.x = u_xlat16_23 + u_xlat42.x;
    u_xlat16_23 = u_xlat42.x + (-_ShadowFeather);
    u_xlat16_40 = u_xlat42.x + _ShadowFeather;
    u_xlat16_40 = (-u_xlat16_23) + u_xlat16_40;
    u_xlat16_7.x = (-u_xlat16_23) + u_xlat16_6.x;
    u_xlat16_24.x = float(1.0) / u_xlat16_40;
    u_xlat16_7.x = u_xlat16_24.x * u_xlat16_7.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_24.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_24.x;
    u_xlat16_8 = min(u_xlat16_7.x, 1.0);
    u_xlatb42 = 0.96875>=u_xlat8.y;
    u_xlat8.x = u_xlat16_8;
    u_xlat10_10.xyz = texture2D(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat10_10.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat10_10.xyz;
    u_xlat16_11.xyz = u_xlat16_7.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_11.xyz = vec3(_RampDifLerpValue) * u_xlat16_11.xyz + u_xlat16_5.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _DarkColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _LightAreaColor.xyz + (-u_xlat16_12.xyz);
    u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat25.xz = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat25.xz;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat25.xz;
    u_xlat16_12.xy = u_xlat25.xz + vec2(1.0, 1.0);
    u_xlat16_58 = u_xlat3.y * 0.100000001;
    u_xlat10.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat10.y = u_xlat16_58 * _matCapSpeEffectedByLightDir;
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.5, 0.5) + (-u_xlat10.xy);
    u_xlat10_4 = texture2D(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_46.xy = u_xlat10_4.yx * vec2(_metallic, _roughness);
    u_xlat16_46.xy = clamp(u_xlat16_46.xy, 0.0, 1.0);
    u_xlatb60 = 0.100000001>=u_xlat10_4.z;
    u_xlatb10 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
    u_xlatb60 = u_xlatb60 && u_xlatb10;
    u_xlatb10 = 0.100000001<u_xlat10_4.z;
    u_xlatb27 = u_xlat10_4.z<0.449999988;
    u_xlatb10 = u_xlatb27 && u_xlatb10;
    u_xlatb27 = u_xlatb60 || u_xlatb10;
    u_xlat16_58 = u_xlat16_46.y * 6.0;
    u_xlat16_58 = (u_xlatb27) ? 0.0 : u_xlat16_58;
    u_xlat10_13 = texture2DLodEXT(_MatcapTex, u_xlat16_12.xy, u_xlat16_58);
    u_xlat16_14.xyz = u_xlat10_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat10_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat10_13.xyz * u_xlat16_14.xyz;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    if(u_xlatb60){
        u_xlat16_58 = log2(u_xlat27);
        u_xlat16_58 = u_xlat16_58 * _ClearNovPow;
        u_xlat16_58 = exp2(u_xlat16_58);
        u_xlat44.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat10_60 = texture2D(_ClearCoatTex, u_xlat44.xy).x;
        u_xlat16_62 = log2(u_xlat10_60);
        u_xlat16_62 = u_xlat16_62 * _ClearCoatPow;
        u_xlat16_62 = exp2(u_xlat16_62);
        u_xlat16_62 = u_xlat16_62 * _ClearCoatStrength;
        u_xlat16_58 = u_xlat16_58 * u_xlat16_62;
        u_xlat16_62 = (-u_xlat16_56) + 1.21000004;
        u_xlat16_62 = min(u_xlat16_62, 1.0);
        u_xlat16_58 = u_xlat16_58 * u_xlat16_62;
        u_xlat16_14.xyz = u_xlat10_13.xyz * u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_14.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_14.xyz;
        u_xlat16_14.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
        u_xlat16_14.xyz = u_xlat10_4.www * u_xlat16_14.xyz;
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
        u_xlat16_16.xyz = u_xlat10_13.www * u_xlat16_14.xyz;
        u_xlat16_14.xyz = (bool(u_xlatb60)) ? u_xlat16_16.xyz : u_xlat16_14.xyz;
        u_xlat16_14.xyz = u_xlat16_11.xyz + u_xlat16_14.xyz;
    } else {
        u_xlat16_58 = (-u_xlat16_46.x) + 1.0;
        u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_11.xyz;
    }
    if(u_xlatb42){
        u_xlat16_58 = u_xlat0.x;
        u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
        u_xlat13.xyz = u_xlat16_5.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat13.xyz = u_xlat16_46.xxx * u_xlat13.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat52) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat9.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat16_11.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_11.y = u_xlat16_46.y * u_xlat16_46.y;
        u_xlat16_11.xz = u_xlat16_11.xy * u_xlat16_11.xy;
        u_xlat16_28 = u_xlat16_11.y * u_xlat16_11.y + -1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_28 + 1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.z / u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.x * 0.318309873;
        u_xlat16_28 = (-u_xlat27) * u_xlat16_11.z + u_xlat27;
        u_xlat16_28 = u_xlat27 * u_xlat16_28 + u_xlat16_11.z;
        u_xlat16_28 = sqrt(u_xlat16_28);
        u_xlat16_28 = u_xlat27 + u_xlat16_28;
        u_xlat16_62 = (-u_xlat16_58) * u_xlat16_11.z + u_xlat16_58;
        u_xlat16_45 = u_xlat16_58 * u_xlat16_62 + u_xlat16_11.z;
        u_xlat16_45 = sqrt(u_xlat16_45);
        u_xlat16_45 = u_xlat16_58 + u_xlat16_45;
        u_xlat16_28 = u_xlat16_45 * u_xlat16_28;
        u_xlat16_11.y = float(1.0) / u_xlat16_28;
        u_xlat16_11.z = (-u_xlat1.x) + 1.0;
        u_xlat16_11.xw = u_xlat16_11.xz * u_xlat16_11.yz;
        u_xlat16_62 = u_xlat16_11.w * u_xlat16_11.w;
        u_xlat16_12.x = u_xlat16_11.z * u_xlat16_62;
        u_xlat16_29 = u_xlat13.y * 50.0;
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
        u_xlat16_45 = (-u_xlat16_62) * u_xlat16_11.z + 1.0;
        u_xlat16_16.xyz = u_xlat13.xyz * vec3(u_xlat16_45);
        u_xlat16_12.xyz = vec3(u_xlat16_29) * u_xlat16_12.xxx + u_xlat16_16.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_12.xyz;
        u_xlat16_11.xyz = vec3(u_xlat16_58) * u_xlat16_11.xyz;
        u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz;
        u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
        u_xlat0.x = (-u_xlat27) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_62 = (-u_xlat16_46.y) + 1.0;
        u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
        u_xlat16_62 = u_xlat16_62 * 0.899999976 + 0.100000001;
        u_xlat16_12.xyz = u_xlat10_13.www * _customMatcapCol.xyz;
        u_xlat16_12.xyz = (bool(u_xlatb10)) ? u_xlat16_12.xyz : u_xlat16_15.xyz;
        u_xlat1.x = u_xlat27 + _customMatcapFresnelRange;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat18 = u_xlatb10 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat18 * u_xlat1.x + 1.0;
        u_xlat16_63 = (u_xlatb10) ? 1.0 : 0.0;
        u_xlat16_65 = (-u_xlat0.x) + 1.0;
        u_xlat16_65 = u_xlat16_63 * u_xlat16_65 + u_xlat0.x;
        u_xlat16_15.x = (-_inDirectSpeStr) + 1.0;
        u_xlat16_63 = u_xlat16_63 * u_xlat16_15.x + _inDirectSpeStr;
        u_xlat16_63 = u_xlat10_4.w * u_xlat16_63;
        u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
        u_xlat16_12.xyz = vec3(u_xlat16_65) * u_xlat16_12.xyz;
        u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
        u_xlat16_62 = (-u_xlat16_56) + 1.21000004;
        u_xlat16_62 = min(u_xlat16_62, 1.0);
        u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_speStr, _speStr, _speStr)) + u_xlat16_12.xyz;
        u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat1.xxx + u_xlat16_11.xyz;
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
        if(u_xlatb0){
            u_xlat16_11.xy = u_xlat3.xy + (-u_xlat25.xz);
            u_xlat16_11.xy = _throughSkinSpeDir.ww * u_xlat16_11.xy + u_xlat25.xz;
            u_xlat16_11.xy = u_xlat16_11.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_11.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat10_0 = texture2D(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_11.x = u_xlat10_0 * 0.349999994;
            u_xlat16_56 = (-u_xlat16_56) + 1.0;
            u_xlat16_56 = u_xlat16_56 * u_xlat16_11.x;
            u_xlat16_56 = u_xlat16_58 * u_xlat16_56;
            u_xlat16_14.xyz = vec3(u_xlat16_56) * _SkinEffectCol.xyz + u_xlat16_14.xyz;
        }
    }
    u_xlat16_56 = u_xlat10_37.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat1.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + _EmisstionParams.x;
    u_xlat1.xyz = u_xlat16_5.xyz * _EmisstionColor.xyz;
    u_xlat16_5.x = (-u_xlat10_37.y) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xxx;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
    u_xlat16_5.x = 1.0;
    u_xlat16_7.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat1.xyz;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_5.x : u_xlat16_56;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat3.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xz = u_xlat17.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat17.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat17.zz + u_xlat0.xy;
    u_xlat34.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat34.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat3.xx + u_xlat34.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat3.zz + u_xlat34.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_39 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_39);
    u_xlat16_5 = u_xlat0 * u_xlat16_5.xxzz;
    u_xlat16_5.x = dot(u_xlat16_5.xy, u_xlat16_5.zw);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _ColorScaleByLightDir;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_22.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_22.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_22.xy + u_xlat0.xy;
    u_xlat16_56 = dot(u_xlat16_22.xy, u_xlat16_22.xy);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_22.xy = vec2(u_xlat16_56) * u_xlat16_22.xy;
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_22.xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx + u_xlat16_7.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb0 = 0.5<_pointLightOn;
    u_xlat17.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat17.x = sqrt(u_xlat17.x);
    u_xlat16_56 = u_xlat17.x + 9.99999975e-05;
    u_xlat16_56 = log2(u_xlat16_56);
    u_xlat16_56 = u_xlat16_56 * _pointLightAtten;
    u_xlat16_56 = exp2(u_xlat16_56);
    u_xlat16_56 = float(1.0) / u_xlat16_56;
    u_xlat16_7.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_7.x = u_xlat17.x / u_xlat16_7.x;
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_24.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = (-u_xlat16_24.x) * u_xlat16_7.x + 1.0;
    u_xlat16_24.xyz = vec3(u_xlat16_56) * _pointLightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_24.xyz * u_xlat16_7.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD5.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD9.xy = in_TEXCOORD2.xy;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _NormalStr;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _ShowRamp;
uniform 	mediump float _selfShadowAdjust;
uniform 	mediump float _metallic;
uniform 	mediump float _roughness;
uniform 	mediump float _speStr;
uniform 	mediump float _inDirectSpeStr;
uniform 	mediump float _ClearCoat;
uniform 	mediump float _ClearCoatPow;
uniform 	mediump float _ClearCoatStrength;
uniform 	mediump float _ClearCoatTileScale;
uniform 	mediump float _ClearNovPow;
uniform 	mediump float _ClearCoatMatcapStr;
uniform 	mediump float _ClearCoatMatcapA;
uniform 	mediump float _customMatcapFresnelRange;
uniform 	mediump vec3 _customMatcapCol;
uniform 	mediump float _SkinThroughOn;
uniform 	mediump vec3 _SkinEffectCol;
uniform 	mediump vec4 _throughSkinSpeDir;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _ShadowOffsetTex;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _PBRTexture;
uniform lowp sampler2D _MatcapTex;
uniform lowp sampler2D _ClearCoatTex;
uniform lowp sampler2D _SkinEffectTex;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
lowp vec3 u_xlat10_10;
bool u_xlatb10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
lowp vec4 u_xlat10_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
float u_xlat18;
mediump vec2 u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat26;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
vec2 u_xlat34;
vec2 u_xlat37;
lowp vec2 u_xlat10_37;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
vec2 u_xlat42;
lowp float u_xlat10_42;
bool u_xlatb42;
vec2 u_xlat44;
mediump float u_xlat16_45;
mediump vec2 u_xlat16_46;
float u_xlat52;
lowp float u_xlat10_53;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
bool u_xlatb59;
lowp float u_xlat10_60;
bool u_xlatb60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_65;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat17.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat52 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat2.xyz = vec3(u_xlat52) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4 = (-_USE3UV_ON) + 1.0;
    u_xlat37.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat37.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_4) + u_xlat37.xy;
    u_xlat10_4 = texture2D(_MainTex, u_xlat37.xy);
    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz;
    u_xlat10_53 = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_56 = u_xlat10_53 + -1.0;
    u_xlat16_56 = _InSideLineStrength * u_xlat16_56 + 1.0;
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz;
    u_xlat37.x = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_57 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_57 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_56) + (-u_xlat37.xxx);
    u_xlat8.xyz = vec3(u_xlat16_57) * u_xlat8.xyz + u_xlat37.xxx;
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_6.xyz = u_xlat8.xyz * vec3(u_xlat16_56) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat10_37.xy = texture2D(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture2D(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat42.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat9.x = (-u_xlat42.x) * u_xlat42.x + 1.0;
    u_xlat9.x = (-u_xlat42.y) * u_xlat42.y + u_xlat9.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat26.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat26.xyz = u_xlat26.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat17.zxy * u_xlat26.yzx;
    u_xlat10.xyz = u_xlat17.yzx * u_xlat26.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat42.yyy * u_xlat10.xyz;
    u_xlat26.xyz = u_xlat42.xxx * u_xlat26.xyz + u_xlat10.xyz;
    u_xlat9.xyz = u_xlat9.xxx * u_xlat17.xyz + u_xlat26.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat9.xyz = vec3(_NormalStr) * u_xlat9.xyz + u_xlat17.xyz;
    u_xlat16_56 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat16_6.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_23 = _ShadowThreshold + 0.5;
    u_xlat10_42 = texture2D(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat42.x = u_xlat10_42 + -0.5;
    u_xlatb59 = 0.99000001<u_xlat16_56;
    u_xlat16_40 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_40 = (u_xlatb59) ? u_xlat16_40 : 0.0;
    u_xlat16_40 = u_xlat16_40 + _selfShadowAdjust;
    u_xlat42.x = u_xlat16_56 * u_xlat16_40 + u_xlat42.x;
    u_xlat42.x = u_xlat16_23 + u_xlat42.x;
    u_xlat16_23 = u_xlat42.x + (-_ShadowFeather);
    u_xlat16_40 = u_xlat42.x + _ShadowFeather;
    u_xlat16_40 = (-u_xlat16_23) + u_xlat16_40;
    u_xlat16_7.x = (-u_xlat16_23) + u_xlat16_6.x;
    u_xlat16_24.x = float(1.0) / u_xlat16_40;
    u_xlat16_7.x = u_xlat16_24.x * u_xlat16_7.x;
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
    u_xlat16_24.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_24.x;
    u_xlat16_8 = min(u_xlat16_7.x, 1.0);
    u_xlatb42 = 0.96875>=u_xlat8.y;
    u_xlat8.x = u_xlat16_8;
    u_xlat10_10.xyz = texture2D(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat10_10.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat10_10.xyz;
    u_xlat16_11.xyz = u_xlat16_7.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_11.xyz = vec3(_RampDifLerpValue) * u_xlat16_11.xyz + u_xlat16_5.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _DarkColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _LightAreaColor.xyz + (-u_xlat16_12.xyz);
    u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat25.xz = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat25.xz;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat25.xz;
    u_xlat16_12.xy = u_xlat25.xz + vec2(1.0, 1.0);
    u_xlat16_58 = u_xlat3.y * 0.100000001;
    u_xlat10.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat10.y = u_xlat16_58 * _matCapSpeEffectedByLightDir;
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.5, 0.5) + (-u_xlat10.xy);
    u_xlat10_4 = texture2D(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_46.xy = u_xlat10_4.yx * vec2(_metallic, _roughness);
    u_xlat16_46.xy = clamp(u_xlat16_46.xy, 0.0, 1.0);
    u_xlatb60 = 0.100000001>=u_xlat10_4.z;
    u_xlatb10 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
    u_xlatb60 = u_xlatb60 && u_xlatb10;
    u_xlatb10 = 0.100000001<u_xlat10_4.z;
    u_xlatb27 = u_xlat10_4.z<0.449999988;
    u_xlatb10 = u_xlatb27 && u_xlatb10;
    u_xlatb27 = u_xlatb60 || u_xlatb10;
    u_xlat16_58 = u_xlat16_46.y * 6.0;
    u_xlat16_58 = (u_xlatb27) ? 0.0 : u_xlat16_58;
    u_xlat10_13 = texture2DLodEXT(_MatcapTex, u_xlat16_12.xy, u_xlat16_58);
    u_xlat16_14.xyz = u_xlat10_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat10_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_15.xyz = u_xlat10_13.xyz * u_xlat16_14.xyz;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    if(u_xlatb60){
        u_xlat16_58 = log2(u_xlat27);
        u_xlat16_58 = u_xlat16_58 * _ClearNovPow;
        u_xlat16_58 = exp2(u_xlat16_58);
        u_xlat44.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat10_60 = texture2D(_ClearCoatTex, u_xlat44.xy).x;
        u_xlat16_62 = log2(u_xlat10_60);
        u_xlat16_62 = u_xlat16_62 * _ClearCoatPow;
        u_xlat16_62 = exp2(u_xlat16_62);
        u_xlat16_62 = u_xlat16_62 * _ClearCoatStrength;
        u_xlat16_58 = u_xlat16_58 * u_xlat16_62;
        u_xlat16_62 = (-u_xlat16_56) + 1.21000004;
        u_xlat16_62 = min(u_xlat16_62, 1.0);
        u_xlat16_58 = u_xlat16_58 * u_xlat16_62;
        u_xlat16_14.xyz = u_xlat10_13.xyz * u_xlat16_14.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_14.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_14.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_14.xyz;
        u_xlat16_14.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
        u_xlat16_14.xyz = u_xlat10_4.www * u_xlat16_14.xyz;
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
        u_xlat16_16.xyz = u_xlat10_13.www * u_xlat16_14.xyz;
        u_xlat16_14.xyz = (bool(u_xlatb60)) ? u_xlat16_16.xyz : u_xlat16_14.xyz;
        u_xlat16_14.xyz = u_xlat16_11.xyz + u_xlat16_14.xyz;
    } else {
        u_xlat16_58 = (-u_xlat16_46.x) + 1.0;
        u_xlat16_14.xyz = vec3(u_xlat16_58) * u_xlat16_11.xyz;
    }
    if(u_xlatb42){
        u_xlat16_58 = u_xlat0.x;
        u_xlat16_58 = clamp(u_xlat16_58, 0.0, 1.0);
        u_xlat13.xyz = u_xlat16_5.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat13.xyz = u_xlat16_46.xxx * u_xlat13.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat52) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat9.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat16_11.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_11.y = u_xlat16_46.y * u_xlat16_46.y;
        u_xlat16_11.xz = u_xlat16_11.xy * u_xlat16_11.xy;
        u_xlat16_28 = u_xlat16_11.y * u_xlat16_11.y + -1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_28 + 1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.z / u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.x * 0.318309873;
        u_xlat16_28 = (-u_xlat27) * u_xlat16_11.z + u_xlat27;
        u_xlat16_28 = u_xlat27 * u_xlat16_28 + u_xlat16_11.z;
        u_xlat16_28 = sqrt(u_xlat16_28);
        u_xlat16_28 = u_xlat27 + u_xlat16_28;
        u_xlat16_62 = (-u_xlat16_58) * u_xlat16_11.z + u_xlat16_58;
        u_xlat16_45 = u_xlat16_58 * u_xlat16_62 + u_xlat16_11.z;
        u_xlat16_45 = sqrt(u_xlat16_45);
        u_xlat16_45 = u_xlat16_58 + u_xlat16_45;
        u_xlat16_28 = u_xlat16_45 * u_xlat16_28;
        u_xlat16_11.y = float(1.0) / u_xlat16_28;
        u_xlat16_11.z = (-u_xlat1.x) + 1.0;
        u_xlat16_11.xw = u_xlat16_11.xz * u_xlat16_11.yz;
        u_xlat16_62 = u_xlat16_11.w * u_xlat16_11.w;
        u_xlat16_12.x = u_xlat16_11.z * u_xlat16_62;
        u_xlat16_29 = u_xlat13.y * 50.0;
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
        u_xlat16_45 = (-u_xlat16_62) * u_xlat16_11.z + 1.0;
        u_xlat16_16.xyz = u_xlat13.xyz * vec3(u_xlat16_45);
        u_xlat16_12.xyz = vec3(u_xlat16_29) * u_xlat16_12.xxx + u_xlat16_16.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_12.xyz;
        u_xlat16_11.xyz = vec3(u_xlat16_58) * u_xlat16_11.xyz;
        u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz;
        u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
        u_xlat0.x = (-u_xlat27) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_62 = (-u_xlat16_46.y) + 1.0;
        u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
        u_xlat16_62 = u_xlat16_62 * 0.899999976 + 0.100000001;
        u_xlat16_12.xyz = u_xlat10_13.www * _customMatcapCol.xyz;
        u_xlat16_12.xyz = (bool(u_xlatb10)) ? u_xlat16_12.xyz : u_xlat16_15.xyz;
        u_xlat1.x = u_xlat27 + _customMatcapFresnelRange;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat18 = u_xlatb10 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat18 * u_xlat1.x + 1.0;
        u_xlat16_63 = (u_xlatb10) ? 1.0 : 0.0;
        u_xlat16_65 = (-u_xlat0.x) + 1.0;
        u_xlat16_65 = u_xlat16_63 * u_xlat16_65 + u_xlat0.x;
        u_xlat16_15.x = (-_inDirectSpeStr) + 1.0;
        u_xlat16_63 = u_xlat16_63 * u_xlat16_15.x + _inDirectSpeStr;
        u_xlat16_63 = u_xlat10_4.w * u_xlat16_63;
        u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
        u_xlat16_12.xyz = vec3(u_xlat16_65) * u_xlat16_12.xyz;
        u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
        u_xlat16_62 = (-u_xlat16_56) + 1.21000004;
        u_xlat16_62 = min(u_xlat16_62, 1.0);
        u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_speStr, _speStr, _speStr)) + u_xlat16_12.xyz;
        u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat1.xxx + u_xlat16_11.xyz;
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
        if(u_xlatb0){
            u_xlat16_11.xy = u_xlat3.xy + (-u_xlat25.xz);
            u_xlat16_11.xy = _throughSkinSpeDir.ww * u_xlat16_11.xy + u_xlat25.xz;
            u_xlat16_11.xy = u_xlat16_11.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_11.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat10_0 = texture2D(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_11.x = u_xlat10_0 * 0.349999994;
            u_xlat16_56 = (-u_xlat16_56) + 1.0;
            u_xlat16_56 = u_xlat16_56 * u_xlat16_11.x;
            u_xlat16_56 = u_xlat16_58 * u_xlat16_56;
            u_xlat16_14.xyz = vec3(u_xlat16_56) * _SkinEffectCol.xyz + u_xlat16_14.xyz;
        }
    }
    u_xlat16_56 = u_xlat10_37.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat1.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + _EmisstionParams.x;
    u_xlat1.xyz = u_xlat16_5.xyz * _EmisstionColor.xyz;
    u_xlat16_5.x = (-u_xlat10_37.y) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xxx;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
    u_xlat16_5.x = 1.0;
    u_xlat16_7.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat1.xyz;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_5.x : u_xlat16_56;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat3.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xz = u_xlat17.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat17.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat17.zz + u_xlat0.xy;
    u_xlat34.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat34.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat3.xx + u_xlat34.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat3.zz + u_xlat34.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_39 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_39);
    u_xlat16_5 = u_xlat0 * u_xlat16_5.xxzz;
    u_xlat16_5.x = dot(u_xlat16_5.xy, u_xlat16_5.zw);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _ColorScaleByLightDir;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_22.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_22.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_22.xy + u_xlat0.xy;
    u_xlat16_56 = dot(u_xlat16_22.xy, u_xlat16_22.xy);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_22.xy = vec2(u_xlat16_56) * u_xlat16_22.xy;
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_22.xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx + u_xlat16_7.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb0 = 0.5<_pointLightOn;
    u_xlat17.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat17.x = sqrt(u_xlat17.x);
    u_xlat16_56 = u_xlat17.x + 9.99999975e-05;
    u_xlat16_56 = log2(u_xlat16_56);
    u_xlat16_56 = u_xlat16_56 * _pointLightAtten;
    u_xlat16_56 = exp2(u_xlat16_56);
    u_xlat16_56 = float(1.0) / u_xlat16_56;
    u_xlat16_7.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_7.x = u_xlat17.x / u_xlat16_7.x;
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_24.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = (-u_xlat16_24.x) * u_xlat16_7.x + 1.0;
    u_xlat16_24.xyz = vec3(u_xlat16_56) * _pointLightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_24.xyz * u_xlat16_7.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_GRADUAL" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD5.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD9.xy = in_TEXCOORD2.xy;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _NormalStr;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _ShowRamp;
uniform 	mediump float _selfShadowAdjust;
uniform 	mediump float _metallic;
uniform 	mediump float _roughness;
uniform 	mediump float _speStr;
uniform 	mediump float _inDirectSpeStr;
uniform 	mediump float _ClearCoat;
uniform 	mediump float _ClearCoatPow;
uniform 	mediump float _ClearCoatStrength;
uniform 	mediump float _ClearCoatTileScale;
uniform 	mediump float _ClearNovPow;
uniform 	mediump float _ClearCoatMatcapStr;
uniform 	mediump float _ClearCoatMatcapA;
uniform 	mediump float _customMatcapFresnelRange;
uniform 	mediump vec3 _customMatcapCol;
uniform 	mediump float _SkinThroughOn;
uniform 	mediump vec3 _SkinEffectCol;
uniform 	mediump vec4 _throughSkinSpeDir;
uniform 	mediump float _showGradual;
uniform 	mediump float _gradualRange;
uniform 	mediump float _gradualOffset;
uniform 	mediump vec4 _gradualColor;
uniform 	mediump float _gradualSaturation;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ShadowOffsetTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(6) uniform mediump sampler2D _PBRTexture;
UNITY_LOCATION(7) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _ClearCoatTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinEffectTex;
UNITY_LOCATION(10) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
bool u_xlatb10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
float u_xlat18;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
vec2 u_xlat34;
vec2 u_xlat37;
mediump vec2 u_xlat16_37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
vec2 u_xlat42;
bool u_xlatb42;
vec2 u_xlat44;
mediump float u_xlat16_45;
mediump vec2 u_xlat16_46;
float u_xlat52;
float u_xlat53;
mediump float u_xlat16_53;
bool u_xlatb53;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
bool u_xlatb59;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat17.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat52 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat2.xyz = vec3(u_xlat52) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4.x = (-_USE3UV_ON) + 1.0;
    u_xlat37.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat37.xy = vs_TEXCOORD0.xy * u_xlat16_4.xx + u_xlat37.xy;
    u_xlat16_4 = texture(_MainTex, u_xlat37.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_53 = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_56 = u_xlat16_53 + -1.0;
    u_xlat16_56 = _InSideLineStrength * u_xlat16_56 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz;
    u_xlat53 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_57 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_57 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_56) + (-vec3(u_xlat53));
    u_xlat8.xyz = vec3(u_xlat16_57) * u_xlat8.xyz + vec3(u_xlat53);
    u_xlat16_6.x = (-u_xlat16_56) + 1.0;
    u_xlat16_23.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat16_5.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_23.xyz + u_xlat16_5.xyz;
    u_xlat53 = vs_TEXCOORD9.x / _gradualOffset;
    u_xlat53 = max(u_xlat53, 0.00999999978);
    u_xlat53 = log2(u_xlat53);
    u_xlat53 = u_xlat53 * _gradualRange;
    u_xlat53 = exp2(u_xlat53);
    u_xlat53 = min(u_xlat53, 1.0);
    u_xlat16_7.xyz = _gradualColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xyz = vec3(u_xlat53) * u_xlat16_7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat53 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat8.xyz = (-vec3(u_xlat53)) + u_xlat16_7.xyz;
    u_xlat8.xyz = vec3(_gradualSaturation) * u_xlat8.xyz + vec3(u_xlat53);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_showGradual));
#else
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_showGradual);
#endif
    u_xlat16_6.xyz = (bool(u_xlatb53)) ? u_xlat8.xyz : u_xlat16_6.xyz;
    u_xlat16_37.xy = texture(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat42.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat53 = (-u_xlat42.x) * u_xlat42.x + 1.0;
    u_xlat53 = (-u_xlat42.y) * u_xlat42.y + u_xlat53;
    u_xlat53 = sqrt(u_xlat53);
    u_xlat9.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat17.zxy * u_xlat9.yzx;
    u_xlat10.xyz = u_xlat17.yzx * u_xlat9.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat42.yyy * u_xlat10.xyz;
    u_xlat9.xyz = u_xlat42.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat9.xyz = vec3(u_xlat53) * u_xlat17.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat9.xyz = vec3(_NormalStr) * u_xlat9.xyz + u_xlat17.xyz;
    u_xlat16_57 = (-u_xlat16_4.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat16_7.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_24.x = _ShadowThreshold + 0.5;
    u_xlat16_53 = texture(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat42.x = u_xlat16_53 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.99000001<u_xlat16_57);
#else
    u_xlatb59 = 0.99000001<u_xlat16_57;
#endif
    u_xlat16_41 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_41 = (u_xlatb59) ? u_xlat16_41 : 0.0;
    u_xlat16_41 = u_xlat16_41 + _selfShadowAdjust;
    u_xlat42.x = u_xlat16_57 * u_xlat16_41 + u_xlat42.x;
    u_xlat42.x = u_xlat16_24.x + u_xlat42.x;
    u_xlat16_24.x = u_xlat42.x + (-_ShadowFeather);
    u_xlat16_41 = u_xlat42.x + _ShadowFeather;
    u_xlat16_41 = (-u_xlat16_24.x) + u_xlat16_41;
    u_xlat16_24.x = (-u_xlat16_24.x) + u_xlat16_7.x;
    u_xlat16_41 = float(1.0) / u_xlat16_41;
    u_xlat16_24.x = u_xlat16_41 * u_xlat16_24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_41 = u_xlat16_24.x * -2.0 + 3.0;
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_41;
    u_xlat16_8 = min(u_xlat16_24.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.96875>=u_xlat8.y);
#else
    u_xlatb42 = 0.96875>=u_xlat8.y;
#endif
    u_xlat8.x = u_xlat16_8;
    u_xlat16_10.xyz = texture(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_24.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_24.xyz = u_xlat16_10.xyz * u_xlat16_24.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_24.xyz * u_xlat16_6.xyz + (-u_xlat16_6.xyz);
    u_xlat16_11.xyz = vec3(_RampDifLerpValue) * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _DarkColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _LightAreaColor.xyz + (-u_xlat16_12.xyz);
    u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat25.xz = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat25.xz;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat25.xz;
    u_xlat16_12.xy = u_xlat25.xz + vec2(1.0, 1.0);
    u_xlat16_62 = u_xlat3.y * 0.100000001;
    u_xlat10.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat10.y = u_xlat16_62 * _matCapSpeEffectedByLightDir;
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.5, 0.5) + (-u_xlat10.xy);
    u_xlat16_4 = texture(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_46.xy = u_xlat16_4.yx * vec2(_metallic, _roughness);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46.xy = min(max(u_xlat16_46.xy, 0.0), 1.0);
#else
    u_xlat16_46.xy = clamp(u_xlat16_46.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.100000001>=u_xlat16_4.z);
#else
    u_xlatb60 = 0.100000001>=u_xlat16_4.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat));
#else
    u_xlatb10 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
#endif
    u_xlatb60 = u_xlatb60 && u_xlatb10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.100000001<u_xlat16_4.z);
#else
    u_xlatb10 = 0.100000001<u_xlat16_4.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_4.z<0.449999988);
#else
    u_xlatb27 = u_xlat16_4.z<0.449999988;
#endif
    u_xlatb10 = u_xlatb27 && u_xlatb10;
    u_xlatb27 = u_xlatb60 || u_xlatb10;
    u_xlat16_62 = u_xlat16_46.y * 6.0;
    u_xlat16_62 = (u_xlatb27) ? 0.0 : u_xlat16_62;
    u_xlat16_5 = textureLod(_MatcapTex, u_xlat16_12.xy, u_xlat16_62);
    u_xlat16_13.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    if(u_xlatb60){
        u_xlat16_62 = log2(u_xlat27);
        u_xlat16_62 = u_xlat16_62 * _ClearNovPow;
        u_xlat16_62 = exp2(u_xlat16_62);
        u_xlat44.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat16_60 = texture(_ClearCoatTex, u_xlat44.xy).x;
        u_xlat16_12.x = log2(u_xlat16_60);
        u_xlat16_12.x = u_xlat16_12.x * _ClearCoatPow;
        u_xlat16_12.x = exp2(u_xlat16_12.x);
        u_xlat16_12.x = u_xlat16_12.x * _ClearCoatStrength;
        u_xlat16_62 = u_xlat16_62 * u_xlat16_12.x;
        u_xlat16_12.x = (-u_xlat16_57) + 1.21000004;
        u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
        u_xlat16_62 = u_xlat16_62 * u_xlat16_12.x;
        u_xlat16_13.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_13.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_13.xyz = vec3(u_xlat16_62) * u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA));
#else
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
#endif
        u_xlat16_15.xyz = u_xlat16_5.www * u_xlat16_13.xyz;
        u_xlat16_13.xyz = (bool(u_xlatb60)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_11.xyz + u_xlat16_13.xyz;
    } else {
        u_xlat16_7.x = (-u_xlat16_46.x) + 1.0;
        u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz;
    }
    if(u_xlatb42){
        u_xlat16_7.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
        u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
        u_xlat16.xyz = u_xlat16_6.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat16.xyz = u_xlat16_46.xxx * u_xlat16.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat52) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat9.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat16_11.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_11.y = u_xlat16_46.y * u_xlat16_46.y;
        u_xlat16_11.xz = u_xlat16_11.xy * u_xlat16_11.xy;
        u_xlat16_28 = u_xlat16_11.y * u_xlat16_11.y + -1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_28 + 1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.z / u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.x * 0.318309873;
        u_xlat16_28 = (-u_xlat27) * u_xlat16_11.z + u_xlat27;
        u_xlat16_28 = u_xlat27 * u_xlat16_28 + u_xlat16_11.z;
        u_xlat16_28 = sqrt(u_xlat16_28);
        u_xlat16_28 = u_xlat27 + u_xlat16_28;
        u_xlat16_62 = (-u_xlat16_7.x) * u_xlat16_11.z + u_xlat16_7.x;
        u_xlat16_45 = u_xlat16_7.x * u_xlat16_62 + u_xlat16_11.z;
        u_xlat16_45 = sqrt(u_xlat16_45);
        u_xlat16_45 = u_xlat16_7.x + u_xlat16_45;
        u_xlat16_28 = u_xlat16_45 * u_xlat16_28;
        u_xlat16_11.y = float(1.0) / u_xlat16_28;
        u_xlat16_11.z = (-u_xlat1.x) + 1.0;
        u_xlat16_11.xw = u_xlat16_11.xz * u_xlat16_11.yz;
        u_xlat16_62 = u_xlat16_11.w * u_xlat16_11.w;
        u_xlat16_12.x = u_xlat16_11.z * u_xlat16_62;
        u_xlat16_29 = u_xlat16.y * 50.0;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
        u_xlat16_45 = (-u_xlat16_62) * u_xlat16_11.z + 1.0;
        u_xlat16_15.xyz = u_xlat16.xyz * vec3(u_xlat16_45);
        u_xlat16_12.xyz = vec3(u_xlat16_29) * u_xlat16_12.xxx + u_xlat16_15.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_12.xyz;
        u_xlat16_11.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz;
        u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
        u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
        u_xlat0.x = (-u_xlat27) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_62 = (-u_xlat16_46.y) + 1.0;
        u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
        u_xlat16_62 = u_xlat16_62 * 0.899999976 + 0.100000001;
        u_xlat16_12.xyz = u_xlat16_5.www * _customMatcapCol.xyz;
        u_xlat16_12.xyz = (bool(u_xlatb10)) ? u_xlat16_12.xyz : u_xlat16_14.xyz;
        u_xlat1.x = u_xlat27 + _customMatcapFresnelRange;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat18 = u_xlatb10 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat18 * u_xlat1.x + 1.0;
        u_xlat16_63 = (u_xlatb10) ? 1.0 : 0.0;
        u_xlat16_64 = (-u_xlat0.x) + 1.0;
        u_xlat16_64 = u_xlat16_63 * u_xlat16_64 + u_xlat0.x;
        u_xlat16_14.x = (-_inDirectSpeStr) + 1.0;
        u_xlat16_63 = u_xlat16_63 * u_xlat16_14.x + _inDirectSpeStr;
        u_xlat16_63 = u_xlat16_4.w * u_xlat16_63;
        u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
        u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz;
        u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
        u_xlat16_62 = (-u_xlat16_57) + 1.21000004;
        u_xlat16_62 = min(u_xlat16_62, 1.0);
        u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_speStr, _speStr, _speStr)) + u_xlat16_12.xyz;
        u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn));
#else
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
#endif
        if(u_xlatb0){
            u_xlat16_11.xy = u_xlat3.xy + (-u_xlat25.xz);
            u_xlat16_11.xy = _throughSkinSpeDir.ww * u_xlat16_11.xy + u_xlat25.xz;
            u_xlat16_11.xy = u_xlat16_11.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_11.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat16_0 = texture(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_11.x = u_xlat16_0 * 0.349999994;
            u_xlat16_57 = (-u_xlat16_57) + 1.0;
            u_xlat16_57 = u_xlat16_57 * u_xlat16_11.x;
            u_xlat16_57 = u_xlat16_7.x * u_xlat16_57;
            u_xlat16_13.xyz = vec3(u_xlat16_57) * _SkinEffectCol.xyz + u_xlat16_13.xyz;
        }
    }
    u_xlat16_57 = u_xlat16_37.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat1.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + _EmisstionParams.x;
    u_xlat1.xyz = u_xlat16_6.xyz * _EmisstionColor.xyz;
    u_xlat16_6.x = (-u_xlat16_37.y) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_6.xxx;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
#endif
    u_xlat16_6.x = 1.0;
    u_xlat16_7.xyz = (bool(u_xlatb0)) ? u_xlat16_24.xyz : u_xlat1.xyz;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_57;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat3.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xz = u_xlat17.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat17.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat17.zz + u_xlat0.xy;
    u_xlat34.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat34.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat3.xx + u_xlat34.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat3.zz + u_xlat34.xy;
    u_xlat16_6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_40 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_6.z = inversesqrt(u_xlat16_40);
    u_xlat16_6 = u_xlat0 * u_xlat16_6.xxzz;
    u_xlat16_6.x = dot(u_xlat16_6.xy, u_xlat16_6.zw);
    u_xlat16_6.x = u_xlat16_6.x * 0.5 + 0.5;
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_6.x * _ColorScaleByLightDir;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_23.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_23.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_23.xy + u_xlat0.xy;
    u_xlat16_57 = dot(u_xlat16_23.xy, u_xlat16_23.xy);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_23.xy = vec2(u_xlat16_57) * u_xlat16_23.xy;
    u_xlat16_23.xy = u_xlat16_23.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_23.xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=_depthSubThreshold);
#else
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_6.xyz = exp2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_pointLightOn);
#else
    u_xlatb0 = 0.5<_pointLightOn;
#endif
    u_xlat17.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat17.x = sqrt(u_xlat17.x);
    u_xlat16_57 = u_xlat17.x + 9.99999975e-05;
    u_xlat16_57 = log2(u_xlat16_57);
    u_xlat16_57 = u_xlat16_57 * _pointLightAtten;
    u_xlat16_57 = exp2(u_xlat16_57);
    u_xlat16_57 = float(1.0) / u_xlat16_57;
    u_xlat16_7.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_7.x = u_xlat17.x / u_xlat16_7.x;
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_24.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = (-u_xlat16_24.x) * u_xlat16_7.x + 1.0;
    u_xlat16_24.xyz = vec3(u_xlat16_57) * _pointLightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_24.xyz * u_xlat16_7.xxx + u_xlat16_6.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_GRADUAL" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD5.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD9.xy = in_TEXCOORD2.xy;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _NormalStr;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _ShowRamp;
uniform 	mediump float _selfShadowAdjust;
uniform 	mediump float _metallic;
uniform 	mediump float _roughness;
uniform 	mediump float _speStr;
uniform 	mediump float _inDirectSpeStr;
uniform 	mediump float _ClearCoat;
uniform 	mediump float _ClearCoatPow;
uniform 	mediump float _ClearCoatStrength;
uniform 	mediump float _ClearCoatTileScale;
uniform 	mediump float _ClearNovPow;
uniform 	mediump float _ClearCoatMatcapStr;
uniform 	mediump float _ClearCoatMatcapA;
uniform 	mediump float _customMatcapFresnelRange;
uniform 	mediump vec3 _customMatcapCol;
uniform 	mediump float _SkinThroughOn;
uniform 	mediump vec3 _SkinEffectCol;
uniform 	mediump vec4 _throughSkinSpeDir;
uniform 	mediump float _showGradual;
uniform 	mediump float _gradualRange;
uniform 	mediump float _gradualOffset;
uniform 	mediump vec4 _gradualColor;
uniform 	mediump float _gradualSaturation;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ShadowOffsetTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(6) uniform mediump sampler2D _PBRTexture;
UNITY_LOCATION(7) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _ClearCoatTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinEffectTex;
UNITY_LOCATION(10) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
bool u_xlatb10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
float u_xlat18;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
vec2 u_xlat34;
vec2 u_xlat37;
mediump vec2 u_xlat16_37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
vec2 u_xlat42;
bool u_xlatb42;
vec2 u_xlat44;
mediump float u_xlat16_45;
mediump vec2 u_xlat16_46;
float u_xlat52;
float u_xlat53;
mediump float u_xlat16_53;
bool u_xlatb53;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
bool u_xlatb59;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat17.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat52 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat2.xyz = vec3(u_xlat52) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4.x = (-_USE3UV_ON) + 1.0;
    u_xlat37.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat37.xy = vs_TEXCOORD0.xy * u_xlat16_4.xx + u_xlat37.xy;
    u_xlat16_4 = texture(_MainTex, u_xlat37.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_53 = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_56 = u_xlat16_53 + -1.0;
    u_xlat16_56 = _InSideLineStrength * u_xlat16_56 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz;
    u_xlat53 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_57 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_57 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_56) + (-vec3(u_xlat53));
    u_xlat8.xyz = vec3(u_xlat16_57) * u_xlat8.xyz + vec3(u_xlat53);
    u_xlat16_6.x = (-u_xlat16_56) + 1.0;
    u_xlat16_23.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat16_5.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_23.xyz + u_xlat16_5.xyz;
    u_xlat53 = vs_TEXCOORD9.x / _gradualOffset;
    u_xlat53 = max(u_xlat53, 0.00999999978);
    u_xlat53 = log2(u_xlat53);
    u_xlat53 = u_xlat53 * _gradualRange;
    u_xlat53 = exp2(u_xlat53);
    u_xlat53 = min(u_xlat53, 1.0);
    u_xlat16_7.xyz = _gradualColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xyz = vec3(u_xlat53) * u_xlat16_7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat53 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat8.xyz = (-vec3(u_xlat53)) + u_xlat16_7.xyz;
    u_xlat8.xyz = vec3(_gradualSaturation) * u_xlat8.xyz + vec3(u_xlat53);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_showGradual));
#else
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_showGradual);
#endif
    u_xlat16_6.xyz = (bool(u_xlatb53)) ? u_xlat8.xyz : u_xlat16_6.xyz;
    u_xlat16_37.xy = texture(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat42.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat53 = (-u_xlat42.x) * u_xlat42.x + 1.0;
    u_xlat53 = (-u_xlat42.y) * u_xlat42.y + u_xlat53;
    u_xlat53 = sqrt(u_xlat53);
    u_xlat9.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat17.zxy * u_xlat9.yzx;
    u_xlat10.xyz = u_xlat17.yzx * u_xlat9.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat42.yyy * u_xlat10.xyz;
    u_xlat9.xyz = u_xlat42.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat9.xyz = vec3(u_xlat53) * u_xlat17.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat9.xyz = vec3(_NormalStr) * u_xlat9.xyz + u_xlat17.xyz;
    u_xlat16_57 = (-u_xlat16_4.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat16_7.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_24.x = _ShadowThreshold + 0.5;
    u_xlat16_53 = texture(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat42.x = u_xlat16_53 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.99000001<u_xlat16_57);
#else
    u_xlatb59 = 0.99000001<u_xlat16_57;
#endif
    u_xlat16_41 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_41 = (u_xlatb59) ? u_xlat16_41 : 0.0;
    u_xlat16_41 = u_xlat16_41 + _selfShadowAdjust;
    u_xlat42.x = u_xlat16_57 * u_xlat16_41 + u_xlat42.x;
    u_xlat42.x = u_xlat16_24.x + u_xlat42.x;
    u_xlat16_24.x = u_xlat42.x + (-_ShadowFeather);
    u_xlat16_41 = u_xlat42.x + _ShadowFeather;
    u_xlat16_41 = (-u_xlat16_24.x) + u_xlat16_41;
    u_xlat16_24.x = (-u_xlat16_24.x) + u_xlat16_7.x;
    u_xlat16_41 = float(1.0) / u_xlat16_41;
    u_xlat16_24.x = u_xlat16_41 * u_xlat16_24.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_41 = u_xlat16_24.x * -2.0 + 3.0;
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_41;
    u_xlat16_8 = min(u_xlat16_24.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.96875>=u_xlat8.y);
#else
    u_xlatb42 = 0.96875>=u_xlat8.y;
#endif
    u_xlat8.x = u_xlat16_8;
    u_xlat16_10.xyz = texture(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_24.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_24.xyz = u_xlat16_10.xyz * u_xlat16_24.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_24.xyz * u_xlat16_6.xyz + (-u_xlat16_6.xyz);
    u_xlat16_11.xyz = vec3(_RampDifLerpValue) * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _DarkColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _LightAreaColor.xyz + (-u_xlat16_12.xyz);
    u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat25.xz = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat25.xz;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat25.xz;
    u_xlat16_12.xy = u_xlat25.xz + vec2(1.0, 1.0);
    u_xlat16_62 = u_xlat3.y * 0.100000001;
    u_xlat10.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat10.y = u_xlat16_62 * _matCapSpeEffectedByLightDir;
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.5, 0.5) + (-u_xlat10.xy);
    u_xlat16_4 = texture(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_46.xy = u_xlat16_4.yx * vec2(_metallic, _roughness);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_46.xy = min(max(u_xlat16_46.xy, 0.0), 1.0);
#else
    u_xlat16_46.xy = clamp(u_xlat16_46.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.100000001>=u_xlat16_4.z);
#else
    u_xlatb60 = 0.100000001>=u_xlat16_4.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat));
#else
    u_xlatb10 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
#endif
    u_xlatb60 = u_xlatb60 && u_xlatb10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.100000001<u_xlat16_4.z);
#else
    u_xlatb10 = 0.100000001<u_xlat16_4.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_4.z<0.449999988);
#else
    u_xlatb27 = u_xlat16_4.z<0.449999988;
#endif
    u_xlatb10 = u_xlatb27 && u_xlatb10;
    u_xlatb27 = u_xlatb60 || u_xlatb10;
    u_xlat16_62 = u_xlat16_46.y * 6.0;
    u_xlat16_62 = (u_xlatb27) ? 0.0 : u_xlat16_62;
    u_xlat16_5 = textureLod(_MatcapTex, u_xlat16_12.xy, u_xlat16_62);
    u_xlat16_13.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    if(u_xlatb60){
        u_xlat16_62 = log2(u_xlat27);
        u_xlat16_62 = u_xlat16_62 * _ClearNovPow;
        u_xlat16_62 = exp2(u_xlat16_62);
        u_xlat44.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat16_60 = texture(_ClearCoatTex, u_xlat44.xy).x;
        u_xlat16_12.x = log2(u_xlat16_60);
        u_xlat16_12.x = u_xlat16_12.x * _ClearCoatPow;
        u_xlat16_12.x = exp2(u_xlat16_12.x);
        u_xlat16_12.x = u_xlat16_12.x * _ClearCoatStrength;
        u_xlat16_62 = u_xlat16_62 * u_xlat16_12.x;
        u_xlat16_12.x = (-u_xlat16_57) + 1.21000004;
        u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
        u_xlat16_62 = u_xlat16_62 * u_xlat16_12.x;
        u_xlat16_13.xyz = u_xlat16_5.xyz * u_xlat16_13.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_13.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_13.xyz = vec3(u_xlat16_62) * u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA));
#else
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
#endif
        u_xlat16_15.xyz = u_xlat16_5.www * u_xlat16_13.xyz;
        u_xlat16_13.xyz = (bool(u_xlatb60)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_11.xyz + u_xlat16_13.xyz;
    } else {
        u_xlat16_7.x = (-u_xlat16_46.x) + 1.0;
        u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz;
    }
    if(u_xlatb42){
        u_xlat16_7.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
        u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
        u_xlat16.xyz = u_xlat16_6.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat16.xyz = u_xlat16_46.xxx * u_xlat16.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat52) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat9.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat16_11.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_11.y = u_xlat16_46.y * u_xlat16_46.y;
        u_xlat16_11.xz = u_xlat16_11.xy * u_xlat16_11.xy;
        u_xlat16_28 = u_xlat16_11.y * u_xlat16_11.y + -1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_28 + 1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.z / u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.x * 0.318309873;
        u_xlat16_28 = (-u_xlat27) * u_xlat16_11.z + u_xlat27;
        u_xlat16_28 = u_xlat27 * u_xlat16_28 + u_xlat16_11.z;
        u_xlat16_28 = sqrt(u_xlat16_28);
        u_xlat16_28 = u_xlat27 + u_xlat16_28;
        u_xlat16_62 = (-u_xlat16_7.x) * u_xlat16_11.z + u_xlat16_7.x;
        u_xlat16_45 = u_xlat16_7.x * u_xlat16_62 + u_xlat16_11.z;
        u_xlat16_45 = sqrt(u_xlat16_45);
        u_xlat16_45 = u_xlat16_7.x + u_xlat16_45;
        u_xlat16_28 = u_xlat16_45 * u_xlat16_28;
        u_xlat16_11.y = float(1.0) / u_xlat16_28;
        u_xlat16_11.z = (-u_xlat1.x) + 1.0;
        u_xlat16_11.xw = u_xlat16_11.xz * u_xlat16_11.yz;
        u_xlat16_62 = u_xlat16_11.w * u_xlat16_11.w;
        u_xlat16_12.x = u_xlat16_11.z * u_xlat16_62;
        u_xlat16_29 = u_xlat16.y * 50.0;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
        u_xlat16_45 = (-u_xlat16_62) * u_xlat16_11.z + 1.0;
        u_xlat16_15.xyz = u_xlat16.xyz * vec3(u_xlat16_45);
        u_xlat16_12.xyz = vec3(u_xlat16_29) * u_xlat16_12.xxx + u_xlat16_15.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_12.xyz;
        u_xlat16_11.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz;
        u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
        u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
        u_xlat0.x = (-u_xlat27) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_62 = (-u_xlat16_46.y) + 1.0;
        u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
        u_xlat16_62 = u_xlat16_62 * 0.899999976 + 0.100000001;
        u_xlat16_12.xyz = u_xlat16_5.www * _customMatcapCol.xyz;
        u_xlat16_12.xyz = (bool(u_xlatb10)) ? u_xlat16_12.xyz : u_xlat16_14.xyz;
        u_xlat1.x = u_xlat27 + _customMatcapFresnelRange;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat18 = u_xlatb10 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat18 * u_xlat1.x + 1.0;
        u_xlat16_63 = (u_xlatb10) ? 1.0 : 0.0;
        u_xlat16_64 = (-u_xlat0.x) + 1.0;
        u_xlat16_64 = u_xlat16_63 * u_xlat16_64 + u_xlat0.x;
        u_xlat16_14.x = (-_inDirectSpeStr) + 1.0;
        u_xlat16_63 = u_xlat16_63 * u_xlat16_14.x + _inDirectSpeStr;
        u_xlat16_63 = u_xlat16_4.w * u_xlat16_63;
        u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
        u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz;
        u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
        u_xlat16_62 = (-u_xlat16_57) + 1.21000004;
        u_xlat16_62 = min(u_xlat16_62, 1.0);
        u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_speStr, _speStr, _speStr)) + u_xlat16_12.xyz;
        u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn));
#else
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
#endif
        if(u_xlatb0){
            u_xlat16_11.xy = u_xlat3.xy + (-u_xlat25.xz);
            u_xlat16_11.xy = _throughSkinSpeDir.ww * u_xlat16_11.xy + u_xlat25.xz;
            u_xlat16_11.xy = u_xlat16_11.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_11.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat16_0 = texture(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_11.x = u_xlat16_0 * 0.349999994;
            u_xlat16_57 = (-u_xlat16_57) + 1.0;
            u_xlat16_57 = u_xlat16_57 * u_xlat16_11.x;
            u_xlat16_57 = u_xlat16_7.x * u_xlat16_57;
            u_xlat16_13.xyz = vec3(u_xlat16_57) * _SkinEffectCol.xyz + u_xlat16_13.xyz;
        }
    }
    u_xlat16_57 = u_xlat16_37.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat1.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + _EmisstionParams.x;
    u_xlat1.xyz = u_xlat16_6.xyz * _EmisstionColor.xyz;
    u_xlat16_6.x = (-u_xlat16_37.y) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_6.xxx;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
#endif
    u_xlat16_6.x = 1.0;
    u_xlat16_7.xyz = (bool(u_xlatb0)) ? u_xlat16_24.xyz : u_xlat1.xyz;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_57;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat3.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xz = u_xlat17.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat17.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat17.zz + u_xlat0.xy;
    u_xlat34.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat34.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat3.xx + u_xlat34.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat3.zz + u_xlat34.xy;
    u_xlat16_6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_40 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_6.z = inversesqrt(u_xlat16_40);
    u_xlat16_6 = u_xlat0 * u_xlat16_6.xxzz;
    u_xlat16_6.x = dot(u_xlat16_6.xy, u_xlat16_6.zw);
    u_xlat16_6.x = u_xlat16_6.x * 0.5 + 0.5;
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_6.x * _ColorScaleByLightDir;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_23.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_23.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_23.xy + u_xlat0.xy;
    u_xlat16_57 = dot(u_xlat16_23.xy, u_xlat16_23.xy);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_23.xy = vec2(u_xlat16_57) * u_xlat16_23.xy;
    u_xlat16_23.xy = u_xlat16_23.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_23.xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=_depthSubThreshold);
#else
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_6.xyz = exp2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_pointLightOn);
#else
    u_xlatb0 = 0.5<_pointLightOn;
#endif
    u_xlat17.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat17.x = sqrt(u_xlat17.x);
    u_xlat16_57 = u_xlat17.x + 9.99999975e-05;
    u_xlat16_57 = log2(u_xlat16_57);
    u_xlat16_57 = u_xlat16_57 * _pointLightAtten;
    u_xlat16_57 = exp2(u_xlat16_57);
    u_xlat16_57 = float(1.0) / u_xlat16_57;
    u_xlat16_7.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_7.x = u_xlat17.x / u_xlat16_7.x;
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_24.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = (-u_xlat16_24.x) * u_xlat16_7.x + 1.0;
    u_xlat16_24.xyz = vec3(u_xlat16_57) * _pointLightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_24.xyz * u_xlat16_7.xxx + u_xlat16_6.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_GRADUAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD5.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD9.xy = in_TEXCOORD2.xy;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _NormalStr;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _ShowRamp;
uniform 	mediump float _selfShadowAdjust;
uniform 	mediump float _metallic;
uniform 	mediump float _roughness;
uniform 	mediump float _speStr;
uniform 	mediump float _inDirectSpeStr;
uniform 	mediump float _ClearCoat;
uniform 	mediump float _ClearCoatPow;
uniform 	mediump float _ClearCoatStrength;
uniform 	mediump float _ClearCoatTileScale;
uniform 	mediump float _ClearNovPow;
uniform 	mediump float _ClearCoatMatcapStr;
uniform 	mediump float _ClearCoatMatcapA;
uniform 	mediump float _customMatcapFresnelRange;
uniform 	mediump vec3 _customMatcapCol;
uniform 	mediump float _SkinThroughOn;
uniform 	mediump vec3 _SkinEffectCol;
uniform 	mediump vec4 _throughSkinSpeDir;
uniform 	mediump float _showGradual;
uniform 	mediump float _gradualRange;
uniform 	mediump float _gradualOffset;
uniform 	mediump vec4 _gradualColor;
uniform 	mediump float _gradualSaturation;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _ShadowOffsetTex;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _PBRTexture;
uniform lowp sampler2D _MatcapTex;
uniform lowp sampler2D _ClearCoatTex;
uniform lowp sampler2D _SkinEffectTex;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
lowp vec4 u_xlat10_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
lowp vec3 u_xlat10_10;
bool u_xlatb10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
float u_xlat18;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
vec2 u_xlat34;
vec2 u_xlat37;
lowp vec2 u_xlat10_37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
vec2 u_xlat42;
bool u_xlatb42;
vec2 u_xlat44;
mediump float u_xlat16_45;
mediump vec2 u_xlat16_46;
float u_xlat52;
float u_xlat53;
lowp float u_xlat10_53;
bool u_xlatb53;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
bool u_xlatb59;
lowp float u_xlat10_60;
bool u_xlatb60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat17.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat52 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat2.xyz = vec3(u_xlat52) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4 = (-_USE3UV_ON) + 1.0;
    u_xlat37.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat37.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_4) + u_xlat37.xy;
    u_xlat10_4 = texture2D(_MainTex, u_xlat37.xy);
    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz;
    u_xlat10_53 = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_56 = u_xlat10_53 + -1.0;
    u_xlat16_56 = _InSideLineStrength * u_xlat16_56 + 1.0;
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz;
    u_xlat53 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_57 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_57 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_56) + (-vec3(u_xlat53));
    u_xlat8.xyz = vec3(u_xlat16_57) * u_xlat8.xyz + vec3(u_xlat53);
    u_xlat16_6.x = (-u_xlat16_56) + 1.0;
    u_xlat16_23.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat16_5.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_23.xyz + u_xlat16_5.xyz;
    u_xlat53 = vs_TEXCOORD9.x / _gradualOffset;
    u_xlat53 = max(u_xlat53, 0.00999999978);
    u_xlat53 = log2(u_xlat53);
    u_xlat53 = u_xlat53 * _gradualRange;
    u_xlat53 = exp2(u_xlat53);
    u_xlat53 = min(u_xlat53, 1.0);
    u_xlat16_7.xyz = _gradualColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xyz = vec3(u_xlat53) * u_xlat16_7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat53 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat8.xyz = (-vec3(u_xlat53)) + u_xlat16_7.xyz;
    u_xlat8.xyz = vec3(_gradualSaturation) * u_xlat8.xyz + vec3(u_xlat53);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat8.xyz;
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_showGradual);
    u_xlat16_6.xyz = (bool(u_xlatb53)) ? u_xlat8.xyz : u_xlat16_6.xyz;
    u_xlat10_37.xy = texture2D(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture2D(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat42.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat53 = (-u_xlat42.x) * u_xlat42.x + 1.0;
    u_xlat53 = (-u_xlat42.y) * u_xlat42.y + u_xlat53;
    u_xlat53 = sqrt(u_xlat53);
    u_xlat9.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat17.zxy * u_xlat9.yzx;
    u_xlat10.xyz = u_xlat17.yzx * u_xlat9.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat42.yyy * u_xlat10.xyz;
    u_xlat9.xyz = u_xlat42.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat9.xyz = vec3(u_xlat53) * u_xlat17.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat9.xyz = vec3(_NormalStr) * u_xlat9.xyz + u_xlat17.xyz;
    u_xlat16_57 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat16_7.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_24.x = _ShadowThreshold + 0.5;
    u_xlat10_53 = texture2D(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat42.x = u_xlat10_53 + -0.5;
    u_xlatb59 = 0.99000001<u_xlat16_57;
    u_xlat16_41 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_41 = (u_xlatb59) ? u_xlat16_41 : 0.0;
    u_xlat16_41 = u_xlat16_41 + _selfShadowAdjust;
    u_xlat42.x = u_xlat16_57 * u_xlat16_41 + u_xlat42.x;
    u_xlat42.x = u_xlat16_24.x + u_xlat42.x;
    u_xlat16_24.x = u_xlat42.x + (-_ShadowFeather);
    u_xlat16_41 = u_xlat42.x + _ShadowFeather;
    u_xlat16_41 = (-u_xlat16_24.x) + u_xlat16_41;
    u_xlat16_24.x = (-u_xlat16_24.x) + u_xlat16_7.x;
    u_xlat16_41 = float(1.0) / u_xlat16_41;
    u_xlat16_24.x = u_xlat16_41 * u_xlat16_24.x;
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
    u_xlat16_41 = u_xlat16_24.x * -2.0 + 3.0;
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_41;
    u_xlat16_8 = min(u_xlat16_24.x, 1.0);
    u_xlatb42 = 0.96875>=u_xlat8.y;
    u_xlat8.x = u_xlat16_8;
    u_xlat10_10.xyz = texture2D(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_24.xyz = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_24.xyz = u_xlat10_10.xyz * u_xlat16_24.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat10_10.xyz;
    u_xlat16_11.xyz = u_xlat16_24.xyz * u_xlat16_6.xyz + (-u_xlat16_6.xyz);
    u_xlat16_11.xyz = vec3(_RampDifLerpValue) * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _DarkColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _LightAreaColor.xyz + (-u_xlat16_12.xyz);
    u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat25.xz = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat25.xz;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat25.xz;
    u_xlat16_12.xy = u_xlat25.xz + vec2(1.0, 1.0);
    u_xlat16_62 = u_xlat3.y * 0.100000001;
    u_xlat10.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat10.y = u_xlat16_62 * _matCapSpeEffectedByLightDir;
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.5, 0.5) + (-u_xlat10.xy);
    u_xlat10_4 = texture2D(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_46.xy = u_xlat10_4.yx * vec2(_metallic, _roughness);
    u_xlat16_46.xy = clamp(u_xlat16_46.xy, 0.0, 1.0);
    u_xlatb60 = 0.100000001>=u_xlat10_4.z;
    u_xlatb10 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
    u_xlatb60 = u_xlatb60 && u_xlatb10;
    u_xlatb10 = 0.100000001<u_xlat10_4.z;
    u_xlatb27 = u_xlat10_4.z<0.449999988;
    u_xlatb10 = u_xlatb27 && u_xlatb10;
    u_xlatb27 = u_xlatb60 || u_xlatb10;
    u_xlat16_62 = u_xlat16_46.y * 6.0;
    u_xlat16_62 = (u_xlatb27) ? 0.0 : u_xlat16_62;
    u_xlat10_5 = texture2DLodEXT(_MatcapTex, u_xlat16_12.xy, u_xlat16_62);
    u_xlat16_13.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat10_5.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat10_5.xyz * u_xlat16_13.xyz;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    if(u_xlatb60){
        u_xlat16_62 = log2(u_xlat27);
        u_xlat16_62 = u_xlat16_62 * _ClearNovPow;
        u_xlat16_62 = exp2(u_xlat16_62);
        u_xlat44.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat10_60 = texture2D(_ClearCoatTex, u_xlat44.xy).x;
        u_xlat16_12.x = log2(u_xlat10_60);
        u_xlat16_12.x = u_xlat16_12.x * _ClearCoatPow;
        u_xlat16_12.x = exp2(u_xlat16_12.x);
        u_xlat16_12.x = u_xlat16_12.x * _ClearCoatStrength;
        u_xlat16_62 = u_xlat16_62 * u_xlat16_12.x;
        u_xlat16_12.x = (-u_xlat16_57) + 1.21000004;
        u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
        u_xlat16_62 = u_xlat16_62 * u_xlat16_12.x;
        u_xlat16_13.xyz = u_xlat10_5.xyz * u_xlat16_13.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_13.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_13.xyz = vec3(u_xlat16_62) * u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat10_4.www * u_xlat16_13.xyz;
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
        u_xlat16_15.xyz = u_xlat10_5.www * u_xlat16_13.xyz;
        u_xlat16_13.xyz = (bool(u_xlatb60)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_11.xyz + u_xlat16_13.xyz;
    } else {
        u_xlat16_7.x = (-u_xlat16_46.x) + 1.0;
        u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz;
    }
    if(u_xlatb42){
        u_xlat16_7.x = u_xlat0.x;
        u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
        u_xlat16.xyz = u_xlat16_6.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat16.xyz = u_xlat16_46.xxx * u_xlat16.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat52) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat9.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat16_11.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_11.y = u_xlat16_46.y * u_xlat16_46.y;
        u_xlat16_11.xz = u_xlat16_11.xy * u_xlat16_11.xy;
        u_xlat16_28 = u_xlat16_11.y * u_xlat16_11.y + -1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_28 + 1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.z / u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.x * 0.318309873;
        u_xlat16_28 = (-u_xlat27) * u_xlat16_11.z + u_xlat27;
        u_xlat16_28 = u_xlat27 * u_xlat16_28 + u_xlat16_11.z;
        u_xlat16_28 = sqrt(u_xlat16_28);
        u_xlat16_28 = u_xlat27 + u_xlat16_28;
        u_xlat16_62 = (-u_xlat16_7.x) * u_xlat16_11.z + u_xlat16_7.x;
        u_xlat16_45 = u_xlat16_7.x * u_xlat16_62 + u_xlat16_11.z;
        u_xlat16_45 = sqrt(u_xlat16_45);
        u_xlat16_45 = u_xlat16_7.x + u_xlat16_45;
        u_xlat16_28 = u_xlat16_45 * u_xlat16_28;
        u_xlat16_11.y = float(1.0) / u_xlat16_28;
        u_xlat16_11.z = (-u_xlat1.x) + 1.0;
        u_xlat16_11.xw = u_xlat16_11.xz * u_xlat16_11.yz;
        u_xlat16_62 = u_xlat16_11.w * u_xlat16_11.w;
        u_xlat16_12.x = u_xlat16_11.z * u_xlat16_62;
        u_xlat16_29 = u_xlat16.y * 50.0;
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
        u_xlat16_45 = (-u_xlat16_62) * u_xlat16_11.z + 1.0;
        u_xlat16_15.xyz = u_xlat16.xyz * vec3(u_xlat16_45);
        u_xlat16_12.xyz = vec3(u_xlat16_29) * u_xlat16_12.xxx + u_xlat16_15.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_12.xyz;
        u_xlat16_11.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz;
        u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz;
        u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
        u_xlat0.x = (-u_xlat27) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_62 = (-u_xlat16_46.y) + 1.0;
        u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
        u_xlat16_62 = u_xlat16_62 * 0.899999976 + 0.100000001;
        u_xlat16_12.xyz = u_xlat10_5.www * _customMatcapCol.xyz;
        u_xlat16_12.xyz = (bool(u_xlatb10)) ? u_xlat16_12.xyz : u_xlat16_14.xyz;
        u_xlat1.x = u_xlat27 + _customMatcapFresnelRange;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat18 = u_xlatb10 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat18 * u_xlat1.x + 1.0;
        u_xlat16_63 = (u_xlatb10) ? 1.0 : 0.0;
        u_xlat16_64 = (-u_xlat0.x) + 1.0;
        u_xlat16_64 = u_xlat16_63 * u_xlat16_64 + u_xlat0.x;
        u_xlat16_14.x = (-_inDirectSpeStr) + 1.0;
        u_xlat16_63 = u_xlat16_63 * u_xlat16_14.x + _inDirectSpeStr;
        u_xlat16_63 = u_xlat10_4.w * u_xlat16_63;
        u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
        u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz;
        u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
        u_xlat16_62 = (-u_xlat16_57) + 1.21000004;
        u_xlat16_62 = min(u_xlat16_62, 1.0);
        u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_speStr, _speStr, _speStr)) + u_xlat16_12.xyz;
        u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_11.xyz;
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
        if(u_xlatb0){
            u_xlat16_11.xy = u_xlat3.xy + (-u_xlat25.xz);
            u_xlat16_11.xy = _throughSkinSpeDir.ww * u_xlat16_11.xy + u_xlat25.xz;
            u_xlat16_11.xy = u_xlat16_11.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_11.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat10_0 = texture2D(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_11.x = u_xlat10_0 * 0.349999994;
            u_xlat16_57 = (-u_xlat16_57) + 1.0;
            u_xlat16_57 = u_xlat16_57 * u_xlat16_11.x;
            u_xlat16_57 = u_xlat16_7.x * u_xlat16_57;
            u_xlat16_13.xyz = vec3(u_xlat16_57) * _SkinEffectCol.xyz + u_xlat16_13.xyz;
        }
    }
    u_xlat16_57 = u_xlat10_37.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat1.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + _EmisstionParams.x;
    u_xlat1.xyz = u_xlat16_6.xyz * _EmisstionColor.xyz;
    u_xlat16_6.x = (-u_xlat10_37.y) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_6.xxx;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat16_13.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
    u_xlat16_6.x = 1.0;
    u_xlat16_7.xyz = (bool(u_xlatb0)) ? u_xlat16_24.xyz : u_xlat1.xyz;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_57;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat3.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xz = u_xlat17.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat17.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat17.zz + u_xlat0.xy;
    u_xlat34.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat34.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat3.xx + u_xlat34.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat3.zz + u_xlat34.xy;
    u_xlat16_6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_40 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_6.z = inversesqrt(u_xlat16_40);
    u_xlat16_6 = u_xlat0 * u_xlat16_6.xxzz;
    u_xlat16_6.x = dot(u_xlat16_6.xy, u_xlat16_6.zw);
    u_xlat16_6.x = u_xlat16_6.x * 0.5 + 0.5;
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_6.x * _ColorScaleByLightDir;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_23.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_23.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_23.xy + u_xlat0.xy;
    u_xlat16_57 = dot(u_xlat16_23.xy, u_xlat16_23.xy);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_23.xy = vec2(u_xlat16_57) * u_xlat16_23.xy;
    u_xlat16_23.xy = u_xlat16_23.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_23.xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_6.xyz = exp2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb0 = 0.5<_pointLightOn;
    u_xlat17.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat17.x = sqrt(u_xlat17.x);
    u_xlat16_57 = u_xlat17.x + 9.99999975e-05;
    u_xlat16_57 = log2(u_xlat16_57);
    u_xlat16_57 = u_xlat16_57 * _pointLightAtten;
    u_xlat16_57 = exp2(u_xlat16_57);
    u_xlat16_57 = float(1.0) / u_xlat16_57;
    u_xlat16_7.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_7.x = u_xlat17.x / u_xlat16_7.x;
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_24.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = (-u_xlat16_24.x) * u_xlat16_7.x + 1.0;
    u_xlat16_24.xyz = vec3(u_xlat16_57) * _pointLightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_24.xyz * u_xlat16_7.xxx + u_xlat16_6.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_GRADUAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD5.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    vs_TEXCOORD9.xy = in_TEXCOORD2.xy;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _NormalStr;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _ShowRamp;
uniform 	mediump float _selfShadowAdjust;
uniform 	mediump float _metallic;
uniform 	mediump float _roughness;
uniform 	mediump float _speStr;
uniform 	mediump float _inDirectSpeStr;
uniform 	mediump float _ClearCoat;
uniform 	mediump float _ClearCoatPow;
uniform 	mediump float _ClearCoatStrength;
uniform 	mediump float _ClearCoatTileScale;
uniform 	mediump float _ClearNovPow;
uniform 	mediump float _ClearCoatMatcapStr;
uniform 	mediump float _ClearCoatMatcapA;
uniform 	mediump float _customMatcapFresnelRange;
uniform 	mediump vec3 _customMatcapCol;
uniform 	mediump float _SkinThroughOn;
uniform 	mediump vec3 _SkinEffectCol;
uniform 	mediump vec4 _throughSkinSpeDir;
uniform 	mediump float _showGradual;
uniform 	mediump float _gradualRange;
uniform 	mediump float _gradualOffset;
uniform 	mediump vec4 _gradualColor;
uniform 	mediump float _gradualSaturation;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _ShadowOffsetTex;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _PBRTexture;
uniform lowp sampler2D _MatcapTex;
uniform lowp sampler2D _ClearCoatTex;
uniform lowp sampler2D _SkinEffectTex;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
lowp vec4 u_xlat10_5;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
lowp vec3 u_xlat10_10;
bool u_xlatb10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
float u_xlat18;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
vec2 u_xlat34;
vec2 u_xlat37;
lowp vec2 u_xlat10_37;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
vec2 u_xlat42;
bool u_xlatb42;
vec2 u_xlat44;
mediump float u_xlat16_45;
mediump vec2 u_xlat16_46;
float u_xlat52;
float u_xlat53;
lowp float u_xlat10_53;
bool u_xlatb53;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
bool u_xlatb59;
lowp float u_xlat10_60;
bool u_xlatb60;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat17.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat52 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat2.xyz = vec3(u_xlat52) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4 = (-_USE3UV_ON) + 1.0;
    u_xlat37.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat37.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_4) + u_xlat37.xy;
    u_xlat10_4 = texture2D(_MainTex, u_xlat37.xy);
    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz;
    u_xlat10_53 = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_56 = u_xlat10_53 + -1.0;
    u_xlat16_56 = _InSideLineStrength * u_xlat16_56 + 1.0;
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz;
    u_xlat53 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_57 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_57 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_56) + (-vec3(u_xlat53));
    u_xlat8.xyz = vec3(u_xlat16_57) * u_xlat8.xyz + vec3(u_xlat53);
    u_xlat16_6.x = (-u_xlat16_56) + 1.0;
    u_xlat16_23.xyz = u_xlat8.xyz * u_xlat16_6.xxx + (-u_xlat16_5.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_23.xyz + u_xlat16_5.xyz;
    u_xlat53 = vs_TEXCOORD9.x / _gradualOffset;
    u_xlat53 = max(u_xlat53, 0.00999999978);
    u_xlat53 = log2(u_xlat53);
    u_xlat53 = u_xlat53 * _gradualRange;
    u_xlat53 = exp2(u_xlat53);
    u_xlat53 = min(u_xlat53, 1.0);
    u_xlat16_7.xyz = _gradualColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xyz = vec3(u_xlat53) * u_xlat16_7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat53 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat8.xyz = (-vec3(u_xlat53)) + u_xlat16_7.xyz;
    u_xlat8.xyz = vec3(_gradualSaturation) * u_xlat8.xyz + vec3(u_xlat53);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat8.xyz;
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_showGradual);
    u_xlat16_6.xyz = (bool(u_xlatb53)) ? u_xlat8.xyz : u_xlat16_6.xyz;
    u_xlat10_37.xy = texture2D(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture2D(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat42.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat53 = (-u_xlat42.x) * u_xlat42.x + 1.0;
    u_xlat53 = (-u_xlat42.y) * u_xlat42.y + u_xlat53;
    u_xlat53 = sqrt(u_xlat53);
    u_xlat9.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat17.zxy * u_xlat9.yzx;
    u_xlat10.xyz = u_xlat17.yzx * u_xlat9.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat42.yyy * u_xlat10.xyz;
    u_xlat9.xyz = u_xlat42.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat9.xyz = vec3(u_xlat53) * u_xlat17.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat9.xyz = vec3(_NormalStr) * u_xlat9.xyz + u_xlat17.xyz;
    u_xlat16_57 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat16_7.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_24.x = _ShadowThreshold + 0.5;
    u_xlat10_53 = texture2D(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat42.x = u_xlat10_53 + -0.5;
    u_xlatb59 = 0.99000001<u_xlat16_57;
    u_xlat16_41 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_41 = (u_xlatb59) ? u_xlat16_41 : 0.0;
    u_xlat16_41 = u_xlat16_41 + _selfShadowAdjust;
    u_xlat42.x = u_xlat16_57 * u_xlat16_41 + u_xlat42.x;
    u_xlat42.x = u_xlat16_24.x + u_xlat42.x;
    u_xlat16_24.x = u_xlat42.x + (-_ShadowFeather);
    u_xlat16_41 = u_xlat42.x + _ShadowFeather;
    u_xlat16_41 = (-u_xlat16_24.x) + u_xlat16_41;
    u_xlat16_24.x = (-u_xlat16_24.x) + u_xlat16_7.x;
    u_xlat16_41 = float(1.0) / u_xlat16_41;
    u_xlat16_24.x = u_xlat16_41 * u_xlat16_24.x;
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
    u_xlat16_41 = u_xlat16_24.x * -2.0 + 3.0;
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_41;
    u_xlat16_8 = min(u_xlat16_24.x, 1.0);
    u_xlatb42 = 0.96875>=u_xlat8.y;
    u_xlat8.x = u_xlat16_8;
    u_xlat10_10.xyz = texture2D(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_24.xyz = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_24.xyz = u_xlat10_10.xyz * u_xlat16_24.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat10_10.xyz;
    u_xlat16_11.xyz = u_xlat16_24.xyz * u_xlat16_6.xyz + (-u_xlat16_6.xyz);
    u_xlat16_11.xyz = vec3(_RampDifLerpValue) * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * _DarkColor.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _LightAreaColor.xyz + (-u_xlat16_12.xyz);
    u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz + u_xlat16_12.xyz;
    u_xlat25.xz = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat25.xz;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat25.xz;
    u_xlat16_12.xy = u_xlat25.xz + vec2(1.0, 1.0);
    u_xlat16_62 = u_xlat3.y * 0.100000001;
    u_xlat10.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat10.y = u_xlat16_62 * _matCapSpeEffectedByLightDir;
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.5, 0.5) + (-u_xlat10.xy);
    u_xlat10_4 = texture2D(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_46.xy = u_xlat10_4.yx * vec2(_metallic, _roughness);
    u_xlat16_46.xy = clamp(u_xlat16_46.xy, 0.0, 1.0);
    u_xlatb60 = 0.100000001>=u_xlat10_4.z;
    u_xlatb10 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
    u_xlatb60 = u_xlatb60 && u_xlatb10;
    u_xlatb10 = 0.100000001<u_xlat10_4.z;
    u_xlatb27 = u_xlat10_4.z<0.449999988;
    u_xlatb10 = u_xlatb27 && u_xlatb10;
    u_xlatb27 = u_xlatb60 || u_xlatb10;
    u_xlat16_62 = u_xlat16_46.y * 6.0;
    u_xlat16_62 = (u_xlatb27) ? 0.0 : u_xlat16_62;
    u_xlat10_5 = texture2DLodEXT(_MatcapTex, u_xlat16_12.xy, u_xlat16_62);
    u_xlat16_13.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat10_5.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat10_5.xyz * u_xlat16_13.xyz;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    if(u_xlatb60){
        u_xlat16_62 = log2(u_xlat27);
        u_xlat16_62 = u_xlat16_62 * _ClearNovPow;
        u_xlat16_62 = exp2(u_xlat16_62);
        u_xlat44.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat10_60 = texture2D(_ClearCoatTex, u_xlat44.xy).x;
        u_xlat16_12.x = log2(u_xlat10_60);
        u_xlat16_12.x = u_xlat16_12.x * _ClearCoatPow;
        u_xlat16_12.x = exp2(u_xlat16_12.x);
        u_xlat16_12.x = u_xlat16_12.x * _ClearCoatStrength;
        u_xlat16_62 = u_xlat16_62 * u_xlat16_12.x;
        u_xlat16_12.x = (-u_xlat16_57) + 1.21000004;
        u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
        u_xlat16_62 = u_xlat16_62 * u_xlat16_12.x;
        u_xlat16_13.xyz = u_xlat10_5.xyz * u_xlat16_13.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_13.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_13.xyz = vec3(u_xlat16_62) * u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat10_4.www * u_xlat16_13.xyz;
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
        u_xlat16_15.xyz = u_xlat10_5.www * u_xlat16_13.xyz;
        u_xlat16_13.xyz = (bool(u_xlatb60)) ? u_xlat16_15.xyz : u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_11.xyz + u_xlat16_13.xyz;
    } else {
        u_xlat16_7.x = (-u_xlat16_46.x) + 1.0;
        u_xlat16_13.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz;
    }
    if(u_xlatb42){
        u_xlat16_7.x = u_xlat0.x;
        u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
        u_xlat16.xyz = u_xlat16_6.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat16.xyz = u_xlat16_46.xxx * u_xlat16.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat52) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat9.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat16_11.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_11.y = u_xlat16_46.y * u_xlat16_46.y;
        u_xlat16_11.xz = u_xlat16_11.xy * u_xlat16_11.xy;
        u_xlat16_28 = u_xlat16_11.y * u_xlat16_11.y + -1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_28 + 1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.z / u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.x * 0.318309873;
        u_xlat16_28 = (-u_xlat27) * u_xlat16_11.z + u_xlat27;
        u_xlat16_28 = u_xlat27 * u_xlat16_28 + u_xlat16_11.z;
        u_xlat16_28 = sqrt(u_xlat16_28);
        u_xlat16_28 = u_xlat27 + u_xlat16_28;
        u_xlat16_62 = (-u_xlat16_7.x) * u_xlat16_11.z + u_xlat16_7.x;
        u_xlat16_45 = u_xlat16_7.x * u_xlat16_62 + u_xlat16_11.z;
        u_xlat16_45 = sqrt(u_xlat16_45);
        u_xlat16_45 = u_xlat16_7.x + u_xlat16_45;
        u_xlat16_28 = u_xlat16_45 * u_xlat16_28;
        u_xlat16_11.y = float(1.0) / u_xlat16_28;
        u_xlat16_11.z = (-u_xlat1.x) + 1.0;
        u_xlat16_11.xw = u_xlat16_11.xz * u_xlat16_11.yz;
        u_xlat16_62 = u_xlat16_11.w * u_xlat16_11.w;
        u_xlat16_12.x = u_xlat16_11.z * u_xlat16_62;
        u_xlat16_29 = u_xlat16.y * 50.0;
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
        u_xlat16_45 = (-u_xlat16_62) * u_xlat16_11.z + 1.0;
        u_xlat16_15.xyz = u_xlat16.xyz * vec3(u_xlat16_45);
        u_xlat16_12.xyz = vec3(u_xlat16_29) * u_xlat16_12.xxx + u_xlat16_15.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_12.xyz;
        u_xlat16_11.xyz = u_xlat16_7.xxx * u_xlat16_11.xyz;
        u_xlat16_11.xyz = u_xlat8.xxx * u_xlat16_11.xyz;
        u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
        u_xlat0.x = (-u_xlat27) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_62 = (-u_xlat16_46.y) + 1.0;
        u_xlat16_62 = u_xlat16_62 * u_xlat16_62;
        u_xlat16_62 = u_xlat16_62 * 0.899999976 + 0.100000001;
        u_xlat16_12.xyz = u_xlat10_5.www * _customMatcapCol.xyz;
        u_xlat16_12.xyz = (bool(u_xlatb10)) ? u_xlat16_12.xyz : u_xlat16_14.xyz;
        u_xlat1.x = u_xlat27 + _customMatcapFresnelRange;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat18 = u_xlatb10 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat18 * u_xlat1.x + 1.0;
        u_xlat16_63 = (u_xlatb10) ? 1.0 : 0.0;
        u_xlat16_64 = (-u_xlat0.x) + 1.0;
        u_xlat16_64 = u_xlat16_63 * u_xlat16_64 + u_xlat0.x;
        u_xlat16_14.x = (-_inDirectSpeStr) + 1.0;
        u_xlat16_63 = u_xlat16_63 * u_xlat16_14.x + _inDirectSpeStr;
        u_xlat16_63 = u_xlat10_4.w * u_xlat16_63;
        u_xlat16_12.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
        u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz;
        u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
        u_xlat16_62 = (-u_xlat16_57) + 1.21000004;
        u_xlat16_62 = min(u_xlat16_62, 1.0);
        u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_speStr, _speStr, _speStr)) + u_xlat16_12.xyz;
        u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_11.xyz;
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
        if(u_xlatb0){
            u_xlat16_11.xy = u_xlat3.xy + (-u_xlat25.xz);
            u_xlat16_11.xy = _throughSkinSpeDir.ww * u_xlat16_11.xy + u_xlat25.xz;
            u_xlat16_11.xy = u_xlat16_11.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_11.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat10_0 = texture2D(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_11.x = u_xlat10_0 * 0.349999994;
            u_xlat16_57 = (-u_xlat16_57) + 1.0;
            u_xlat16_57 = u_xlat16_57 * u_xlat16_11.x;
            u_xlat16_57 = u_xlat16_7.x * u_xlat16_57;
            u_xlat16_13.xyz = vec3(u_xlat16_57) * _SkinEffectCol.xyz + u_xlat16_13.xyz;
        }
    }
    u_xlat16_57 = u_xlat10_37.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat1.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + _EmisstionParams.x;
    u_xlat1.xyz = u_xlat16_6.xyz * _EmisstionColor.xyz;
    u_xlat16_6.x = (-u_xlat10_37.y) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_6.xxx;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat16_13.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
    u_xlat16_6.x = 1.0;
    u_xlat16_7.xyz = (bool(u_xlatb0)) ? u_xlat16_24.xyz : u_xlat1.xyz;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_57;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat3.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xz = u_xlat17.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat17.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat17.zz + u_xlat0.xy;
    u_xlat34.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat34.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat3.xx + u_xlat34.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat3.zz + u_xlat34.xy;
    u_xlat16_6.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_40 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_6.z = inversesqrt(u_xlat16_40);
    u_xlat16_6 = u_xlat0 * u_xlat16_6.xxzz;
    u_xlat16_6.x = dot(u_xlat16_6.xy, u_xlat16_6.zw);
    u_xlat16_6.x = u_xlat16_6.x * 0.5 + 0.5;
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_6.x * _ColorScaleByLightDir;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_23.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_23.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_23.xy + u_xlat0.xy;
    u_xlat16_57 = dot(u_xlat16_23.xy, u_xlat16_23.xy);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_23.xy = vec2(u_xlat16_57) * u_xlat16_23.xy;
    u_xlat16_23.xy = u_xlat16_23.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_23.xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat16_6.xxx + u_xlat16_7.xyz;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = log2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_6.xyz = exp2(u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb0 = 0.5<_pointLightOn;
    u_xlat17.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat17.x = sqrt(u_xlat17.x);
    u_xlat16_57 = u_xlat17.x + 9.99999975e-05;
    u_xlat16_57 = log2(u_xlat16_57);
    u_xlat16_57 = u_xlat16_57 * _pointLightAtten;
    u_xlat16_57 = exp2(u_xlat16_57);
    u_xlat16_57 = float(1.0) / u_xlat16_57;
    u_xlat16_7.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_7.x = u_xlat17.x / u_xlat16_7.x;
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_24.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = (-u_xlat16_24.x) * u_xlat16_7.x + 1.0;
    u_xlat16_24.xyz = vec3(u_xlat16_57) * _pointLightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_24.xyz * u_xlat16_7.xxx + u_xlat16_6.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_LG_ON" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_VAR_LIUUV0;
highp  vec4 phase0_Output0_8;
out highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD5.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    phase0_Output0_8 = in_TEXCOORD2.xyxy;
vs_VAR_LIUUV0 = phase0_Output0_8.xy;
vs_TEXCOORD9 = phase0_Output0_8.zw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _NormalStr;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _ShowRamp;
uniform 	mediump float _selfShadowAdjust;
uniform 	mediump float _metallic;
uniform 	mediump float _roughness;
uniform 	mediump float _speStr;
uniform 	mediump float _inDirectSpeStr;
uniform 	mediump float _ClearCoat;
uniform 	mediump float _ClearCoatPow;
uniform 	mediump float _ClearCoatStrength;
uniform 	mediump float _ClearCoatTileScale;
uniform 	mediump float _ClearNovPow;
uniform 	mediump float _ClearCoatMatcapStr;
uniform 	mediump float _ClearCoatMatcapA;
uniform 	mediump float _customMatcapFresnelRange;
uniform 	mediump vec3 _customMatcapCol;
uniform 	mediump float _SkinThroughOn;
uniform 	mediump vec3 _SkinEffectCol;
uniform 	mediump vec4 _throughSkinSpeDir;
uniform 	mediump float _useUv3;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump float _useUv32;
uniform 	mediump float _useLg2;
uniform 	float _U_LG2;
uniform 	float _V_LG2;
uniform 	mediump float _LG_Intensity2;
uniform 	mediump vec3 _LG_Color2;
uniform 	mediump vec4 _LG_Tex2_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ShadowOffsetTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(6) uniform mediump sampler2D _PBRTexture;
UNITY_LOCATION(7) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _ClearCoatTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinEffectTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(11) uniform mediump sampler2D _LG_Tex2;
UNITY_LOCATION(12) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_VAR_LIUUV0;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
bool u_xlatb10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
float u_xlat18;
mediump vec2 u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat26;
float u_xlat27;
bool u_xlatb27;
mediump vec3 u_xlat16_28;
mediump float u_xlat16_31;
vec2 u_xlat34;
vec2 u_xlat37;
mediump vec2 u_xlat16_37;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
vec2 u_xlat42;
mediump float u_xlat16_42;
bool u_xlatb42;
mediump vec2 u_xlat16_45;
float u_xlat52;
mediump float u_xlat16_53;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
bool u_xlatb59;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_62;
mediump float u_xlat16_64;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat17.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat52 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat2.xyz = vec3(u_xlat52) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4.x = (-_USE3UV_ON) + 1.0;
    u_xlat37.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat37.xy = vs_TEXCOORD0.xy * u_xlat16_4.xx + u_xlat37.xy;
    u_xlat16_4 = texture(_MainTex, u_xlat37.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_53 = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_56 = u_xlat16_53 + -1.0;
    u_xlat16_56 = _InSideLineStrength * u_xlat16_56 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz;
    u_xlat37.x = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_57 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_57 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_56) + (-u_xlat37.xxx);
    u_xlat8.xyz = vec3(u_xlat16_57) * u_xlat8.xyz + u_xlat37.xxx;
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_6.xyz = u_xlat8.xyz * vec3(u_xlat16_56) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_37.xy = texture(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat42.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat9.x = (-u_xlat42.x) * u_xlat42.x + 1.0;
    u_xlat9.x = (-u_xlat42.y) * u_xlat42.y + u_xlat9.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat26.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat26.xyz = u_xlat26.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat17.zxy * u_xlat26.yzx;
    u_xlat10.xyz = u_xlat17.yzx * u_xlat26.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat42.yyy * u_xlat10.xyz;
    u_xlat26.xyz = u_xlat42.xxx * u_xlat26.xyz + u_xlat10.xyz;
    u_xlat9.xyz = u_xlat9.xxx * u_xlat17.xyz + u_xlat26.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat9.xyz = vec3(_NormalStr) * u_xlat9.xyz + u_xlat17.xyz;
    u_xlat16_56 = (-u_xlat16_4.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat16_6.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_23 = _ShadowThreshold + 0.5;
    u_xlat16_42 = texture(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat42.x = u_xlat16_42 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.99000001<u_xlat16_56);
#else
    u_xlatb59 = 0.99000001<u_xlat16_56;
#endif
    u_xlat16_40 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_40 = (u_xlatb59) ? u_xlat16_40 : 0.0;
    u_xlat16_40 = u_xlat16_40 + _selfShadowAdjust;
    u_xlat42.x = u_xlat16_56 * u_xlat16_40 + u_xlat42.x;
    u_xlat42.x = u_xlat16_23 + u_xlat42.x;
    u_xlat16_23 = u_xlat42.x + (-_ShadowFeather);
    u_xlat16_40 = u_xlat42.x + _ShadowFeather;
    u_xlat16_40 = (-u_xlat16_23) + u_xlat16_40;
    u_xlat16_23 = (-u_xlat16_23) + u_xlat16_6.x;
    u_xlat16_40 = float(1.0) / u_xlat16_40;
    u_xlat16_23 = u_xlat16_40 * u_xlat16_23;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_23 * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_23 * u_xlat16_23;
    u_xlat16_7.x = u_xlat16_40 * u_xlat16_7.x;
    u_xlat16_8.x = min(u_xlat16_7.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.96875>=u_xlat8.y);
#else
    u_xlatb42 = 0.96875>=u_xlat8.y;
#endif
    u_xlat8.x = u_xlat16_8.x;
    u_xlat16_10.xyz = texture(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_10.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_7.xyz = vec3(_RampDifLerpValue) * u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_11.xyz = u_xlat16_7.xyz * _DarkColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightAreaColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_7.xyz = u_xlat8.xxx * u_xlat16_7.xyz + u_xlat16_11.xyz;
    u_xlat25.xz = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat25.xz;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat25.xz;
    u_xlat16_11.xy = u_xlat25.xz + vec2(1.0, 1.0);
    u_xlat16_58 = u_xlat3.y * 0.100000001;
    u_xlat10.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat10.y = u_xlat16_58 * _matCapSpeEffectedByLightDir;
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.5, 0.5) + (-u_xlat10.xy);
    u_xlat16_10 = texture(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_45.xy = u_xlat16_10.yx * vec2(_metallic, _roughness);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45.xy = min(max(u_xlat16_45.xy, 0.0), 1.0);
#else
    u_xlat16_45.xy = clamp(u_xlat16_45.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.100000001>=u_xlat16_10.z);
#else
    u_xlatb60 = 0.100000001>=u_xlat16_10.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat));
#else
    u_xlatb10 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
#endif
    u_xlatb60 = u_xlatb60 && u_xlatb10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.100000001<u_xlat16_10.z);
#else
    u_xlatb10 = 0.100000001<u_xlat16_10.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_10.z<0.449999988);
#else
    u_xlatb27 = u_xlat16_10.z<0.449999988;
#endif
    u_xlatb10 = u_xlatb27 && u_xlatb10;
    u_xlatb27 = u_xlatb60 || u_xlatb10;
    u_xlat16_58 = u_xlat16_45.y * 6.0;
    u_xlat16_58 = (u_xlatb27) ? 0.0 : u_xlat16_58;
    u_xlat16_12 = textureLod(_MatcapTex, u_xlat16_11.xy, u_xlat16_58);
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    if(u_xlatb60){
        u_xlat16_58 = log2(u_xlat27);
        u_xlat16_58 = u_xlat16_58 * _ClearNovPow;
        u_xlat16_58 = exp2(u_xlat16_58);
        u_xlat15.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat16_60 = texture(_ClearCoatTex, u_xlat15.xy).x;
        u_xlat16_11.x = log2(u_xlat16_60);
        u_xlat16_11.x = u_xlat16_11.x * _ClearCoatPow;
        u_xlat16_11.x = exp2(u_xlat16_11.x);
        u_xlat16_11.x = u_xlat16_11.x * _ClearCoatStrength;
        u_xlat16_58 = u_xlat16_58 * u_xlat16_11.x;
        u_xlat16_11.x = (-u_xlat16_56) + 1.21000004;
        u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
        u_xlat16_58 = u_xlat16_58 * u_xlat16_11.x;
        u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_13.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_13.xyz = vec3(u_xlat16_58) * u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_6.xxx * u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_10.www * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA));
#else
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
#endif
        u_xlat16_16.xyz = u_xlat16_12.www * u_xlat16_13.xyz;
        u_xlat16_13.xyz = (bool(u_xlatb60)) ? u_xlat16_16.xyz : u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_7.xyz + u_xlat16_13.xyz;
    } else {
        u_xlat16_58 = (-u_xlat16_45.x) + 1.0;
        u_xlat16_13.xyz = vec3(u_xlat16_58) * u_xlat16_7.xyz;
    }
    if(u_xlatb42){
        u_xlat16_7.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
        u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
        u_xlat12.xyz = u_xlat16_5.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat12.xyz = u_xlat16_45.xxx * u_xlat12.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat52) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat9.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat16_24.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_24.y = u_xlat16_45.y * u_xlat16_45.y;
        u_xlat16_24.xz = u_xlat16_24.xy * u_xlat16_24.xy;
        u_xlat16_41 = u_xlat16_24.y * u_xlat16_24.y + -1.0;
        u_xlat16_24.x = u_xlat16_24.x * u_xlat16_41 + 1.0;
        u_xlat16_24.x = u_xlat16_24.x * u_xlat16_24.x;
        u_xlat16_24.x = u_xlat16_24.z / u_xlat16_24.x;
        u_xlat16_24.x = u_xlat16_24.x * 0.318309873;
        u_xlat16_41 = (-u_xlat27) * u_xlat16_24.z + u_xlat27;
        u_xlat16_41 = u_xlat27 * u_xlat16_41 + u_xlat16_24.z;
        u_xlat16_41 = sqrt(u_xlat16_41);
        u_xlat16_41 = u_xlat16_41 + u_xlat27;
        u_xlat16_11.x = (-u_xlat16_7.x) * u_xlat16_24.z + u_xlat16_7.x;
        u_xlat16_58 = u_xlat16_7.x * u_xlat16_11.x + u_xlat16_24.z;
        u_xlat16_58 = sqrt(u_xlat16_58);
        u_xlat16_58 = u_xlat16_58 + u_xlat16_7.x;
        u_xlat16_41 = u_xlat16_58 * u_xlat16_41;
        u_xlat16_41 = float(1.0) / u_xlat16_41;
        u_xlat16_58 = (-u_xlat1.x) + 1.0;
        u_xlat16_11.x = u_xlat16_58 * u_xlat16_58;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
        u_xlat16_28.x = u_xlat16_58 * u_xlat16_11.x;
        u_xlat16_45.x = u_xlat12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_45.x = min(max(u_xlat16_45.x, 0.0), 1.0);
#else
        u_xlat16_45.x = clamp(u_xlat16_45.x, 0.0, 1.0);
#endif
        u_xlat16_58 = (-u_xlat16_11.x) * u_xlat16_58 + 1.0;
        u_xlat16_16.xyz = u_xlat12.xyz * vec3(u_xlat16_58);
        u_xlat16_11.xyz = u_xlat16_45.xxx * u_xlat16_28.xxx + u_xlat16_16.xyz;
        u_xlat16_24.x = u_xlat16_24.x * u_xlat16_41;
        u_xlat16_24.xyz = u_xlat16_11.xyz * u_xlat16_24.xxx;
        u_xlat16_24.xyz = u_xlat16_7.xxx * u_xlat16_24.xyz;
        u_xlat16_24.xyz = u_xlat8.xxx * u_xlat16_24.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_24.xyz = min(max(u_xlat16_24.xyz, 0.0), 1.0);
#else
        u_xlat16_24.xyz = clamp(u_xlat16_24.xyz, 0.0, 1.0);
#endif
        u_xlat0.x = (-u_xlat27) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_11.x = (-u_xlat16_45.y) + 1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.x * 0.899999976 + 0.100000001;
        u_xlat16_28.xyz = u_xlat16_12.www * _customMatcapCol.xyz;
        u_xlat16_28.xyz = (bool(u_xlatb10)) ? u_xlat16_28.xyz : u_xlat16_14.xyz;
        u_xlat1.x = u_xlat27 + _customMatcapFresnelRange;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat18 = u_xlatb10 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat18 * u_xlat1.x + 1.0;
        u_xlat16_64 = (u_xlatb10) ? 1.0 : 0.0;
        u_xlat16_14.x = (-u_xlat0.x) + 1.0;
        u_xlat16_14.x = u_xlat16_64 * u_xlat16_14.x + u_xlat0.x;
        u_xlat16_31 = (-_inDirectSpeStr) + 1.0;
        u_xlat16_64 = u_xlat16_64 * u_xlat16_31 + _inDirectSpeStr;
        u_xlat16_64 = u_xlat16_10.w * u_xlat16_64;
        u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(u_xlat16_64);
        u_xlat16_28.xyz = u_xlat16_14.xxx * u_xlat16_28.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_28.xyz;
        u_xlat16_62 = (-u_xlat16_56) + 1.21000004;
        u_xlat16_62 = min(u_xlat16_62, 1.0);
        u_xlat16_11.xyz = vec3(u_xlat16_62) * u_xlat16_11.xyz;
        u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(vec3(_speStr, _speStr, _speStr)) + u_xlat16_11.xyz;
        u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_24.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn));
#else
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
#endif
        if(u_xlatb0){
            u_xlat16_24.xy = u_xlat3.xy + (-u_xlat25.xz);
            u_xlat16_24.xy = _throughSkinSpeDir.ww * u_xlat16_24.xy + u_xlat25.xz;
            u_xlat16_24.xy = u_xlat16_24.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_24.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat16_0 = texture(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_24.x = u_xlat16_0 * 0.349999994;
            u_xlat16_56 = (-u_xlat16_56) + 1.0;
            u_xlat16_56 = u_xlat16_56 * u_xlat16_24.x;
            u_xlat16_56 = u_xlat16_7.x * u_xlat16_56;
            u_xlat16_13.xyz = vec3(u_xlat16_56) * _SkinEffectCol.xyz + u_xlat16_13.xyz;
        }
    }
    u_xlat16_1.w = u_xlat16_37.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat3.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat3.x + _EmisstionParams.x;
    u_xlat3.xyz = u_xlat16_5.xyz * _EmisstionColor.xyz;
    u_xlat16_5.x = (-u_xlat16_37.y) + 1.0;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_5.xxx;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3);
#endif
    u_xlat8.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
    u_xlat42.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat8.xy;
    u_xlat42.xy = u_xlat42.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_9.xyz = texture(_LG_Tex, u_xlat42.xy).xyz;
    u_xlat16_0 = texture(_LG_Tex, u_xlat8.xy).w;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(_LG_Intensity);
    u_xlat16_5.xyz = vec3(u_xlat16_0) * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
#endif
    if(u_xlatb0){
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32));
#else
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
#endif
        u_xlat3.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat37.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat3.xy;
        u_xlat37.xy = u_xlat37.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat16_8.xyz = texture(_LG_Tex2, u_xlat37.xy).xyz;
        u_xlat16_0 = texture(_LG_Tex2, u_xlat3.xy).w;
        u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(_LG_Intensity2);
        u_xlat16_5.xyz = vec3(u_xlat16_0) * u_xlat16_5.xyz;
        u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color2.x, _LG_Color2.y, _LG_Color2.z) + u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
#endif
    u_xlat16_4.w = 1.0;
    u_xlat16_1 = (bool(u_xlatb0)) ? u_xlat16_4 : u_xlat16_1;
    u_xlat3.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat8.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat0.xz = u_xlat17.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat17.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat17.zz + u_xlat0.xy;
    u_xlat34.xy = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat34.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat34.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat34.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_39 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_39);
    u_xlat16_5 = u_xlat0 * u_xlat16_5.xxzz;
    u_xlat16_5.x = dot(u_xlat16_5.xy, u_xlat16_5.zw);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _ColorScaleByLightDir;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_22.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_22.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_22.xy + u_xlat0.xy;
    u_xlat16_56 = dot(u_xlat16_22.xy, u_xlat16_22.xy);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_22.xy = vec2(u_xlat16_56) * u_xlat16_22.xy;
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_22.xy * u_xlat0.xx + u_xlat3.xy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=_depthSubThreshold);
#else
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_pointLightOn);
#else
    u_xlatb0 = 0.5<_pointLightOn;
#endif
    u_xlat17.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat17.x = sqrt(u_xlat17.x);
    u_xlat16_56 = u_xlat17.x + 9.99999975e-05;
    u_xlat16_56 = log2(u_xlat16_56);
    u_xlat16_56 = u_xlat16_56 * _pointLightAtten;
    u_xlat16_56 = exp2(u_xlat16_56);
    u_xlat16_56 = float(1.0) / u_xlat16_56;
    u_xlat16_7.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_7.x = u_xlat17.x / u_xlat16_7.x;
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_24.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = (-u_xlat16_24.x) * u_xlat16_7.x + 1.0;
    u_xlat16_24.xyz = vec3(u_xlat16_56) * _pointLightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_24.xyz * u_xlat16_7.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    SV_Target0.w = u_xlat16_1.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_LG_ON" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_VAR_LIUUV0;
highp  vec4 phase0_Output0_8;
out highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD5.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    phase0_Output0_8 = in_TEXCOORD2.xyxy;
vs_VAR_LIUUV0 = phase0_Output0_8.xy;
vs_TEXCOORD9 = phase0_Output0_8.zw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _NormalStr;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _ShowRamp;
uniform 	mediump float _selfShadowAdjust;
uniform 	mediump float _metallic;
uniform 	mediump float _roughness;
uniform 	mediump float _speStr;
uniform 	mediump float _inDirectSpeStr;
uniform 	mediump float _ClearCoat;
uniform 	mediump float _ClearCoatPow;
uniform 	mediump float _ClearCoatStrength;
uniform 	mediump float _ClearCoatTileScale;
uniform 	mediump float _ClearNovPow;
uniform 	mediump float _ClearCoatMatcapStr;
uniform 	mediump float _ClearCoatMatcapA;
uniform 	mediump float _customMatcapFresnelRange;
uniform 	mediump vec3 _customMatcapCol;
uniform 	mediump float _SkinThroughOn;
uniform 	mediump vec3 _SkinEffectCol;
uniform 	mediump vec4 _throughSkinSpeDir;
uniform 	mediump float _useUv3;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump float _useUv32;
uniform 	mediump float _useLg2;
uniform 	float _U_LG2;
uniform 	float _V_LG2;
uniform 	mediump float _LG_Intensity2;
uniform 	mediump vec3 _LG_Color2;
uniform 	mediump vec4 _LG_Tex2_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ShadowOffsetTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(6) uniform mediump sampler2D _PBRTexture;
UNITY_LOCATION(7) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _ClearCoatTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinEffectTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(11) uniform mediump sampler2D _LG_Tex2;
UNITY_LOCATION(12) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_VAR_LIUUV0;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
bool u_xlatb10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
float u_xlat18;
mediump vec2 u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat26;
float u_xlat27;
bool u_xlatb27;
mediump vec3 u_xlat16_28;
mediump float u_xlat16_31;
vec2 u_xlat34;
vec2 u_xlat37;
mediump vec2 u_xlat16_37;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
vec2 u_xlat42;
mediump float u_xlat16_42;
bool u_xlatb42;
mediump vec2 u_xlat16_45;
float u_xlat52;
mediump float u_xlat16_53;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
bool u_xlatb59;
mediump float u_xlat16_60;
bool u_xlatb60;
mediump float u_xlat16_62;
mediump float u_xlat16_64;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat17.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat52 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat2.xyz = vec3(u_xlat52) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4.x = (-_USE3UV_ON) + 1.0;
    u_xlat37.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat37.xy = vs_TEXCOORD0.xy * u_xlat16_4.xx + u_xlat37.xy;
    u_xlat16_4 = texture(_MainTex, u_xlat37.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_53 = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_56 = u_xlat16_53 + -1.0;
    u_xlat16_56 = _InSideLineStrength * u_xlat16_56 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz;
    u_xlat37.x = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_57 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_57 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_56) + (-u_xlat37.xxx);
    u_xlat8.xyz = vec3(u_xlat16_57) * u_xlat8.xyz + u_xlat37.xxx;
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_6.xyz = u_xlat8.xyz * vec3(u_xlat16_56) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_37.xy = texture(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat42.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat9.x = (-u_xlat42.x) * u_xlat42.x + 1.0;
    u_xlat9.x = (-u_xlat42.y) * u_xlat42.y + u_xlat9.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat26.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat26.xyz = u_xlat26.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat17.zxy * u_xlat26.yzx;
    u_xlat10.xyz = u_xlat17.yzx * u_xlat26.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat42.yyy * u_xlat10.xyz;
    u_xlat26.xyz = u_xlat42.xxx * u_xlat26.xyz + u_xlat10.xyz;
    u_xlat9.xyz = u_xlat9.xxx * u_xlat17.xyz + u_xlat26.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat9.xyz = vec3(_NormalStr) * u_xlat9.xyz + u_xlat17.xyz;
    u_xlat16_56 = (-u_xlat16_4.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat16_6.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_23 = _ShadowThreshold + 0.5;
    u_xlat16_42 = texture(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat42.x = u_xlat16_42 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.99000001<u_xlat16_56);
#else
    u_xlatb59 = 0.99000001<u_xlat16_56;
#endif
    u_xlat16_40 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_40 = (u_xlatb59) ? u_xlat16_40 : 0.0;
    u_xlat16_40 = u_xlat16_40 + _selfShadowAdjust;
    u_xlat42.x = u_xlat16_56 * u_xlat16_40 + u_xlat42.x;
    u_xlat42.x = u_xlat16_23 + u_xlat42.x;
    u_xlat16_23 = u_xlat42.x + (-_ShadowFeather);
    u_xlat16_40 = u_xlat42.x + _ShadowFeather;
    u_xlat16_40 = (-u_xlat16_23) + u_xlat16_40;
    u_xlat16_23 = (-u_xlat16_23) + u_xlat16_6.x;
    u_xlat16_40 = float(1.0) / u_xlat16_40;
    u_xlat16_23 = u_xlat16_40 * u_xlat16_23;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_40 = u_xlat16_23 * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_23 * u_xlat16_23;
    u_xlat16_7.x = u_xlat16_40 * u_xlat16_7.x;
    u_xlat16_8.x = min(u_xlat16_7.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.96875>=u_xlat8.y);
#else
    u_xlatb42 = 0.96875>=u_xlat8.y;
#endif
    u_xlat8.x = u_xlat16_8.x;
    u_xlat16_10.xyz = texture(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_10.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_7.xyz * u_xlat16_10.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_7.xyz = vec3(_RampDifLerpValue) * u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_11.xyz = u_xlat16_7.xyz * _DarkColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightAreaColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_7.xyz = u_xlat8.xxx * u_xlat16_7.xyz + u_xlat16_11.xyz;
    u_xlat25.xz = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat25.xz;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat25.xz;
    u_xlat16_11.xy = u_xlat25.xz + vec2(1.0, 1.0);
    u_xlat16_58 = u_xlat3.y * 0.100000001;
    u_xlat10.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat10.y = u_xlat16_58 * _matCapSpeEffectedByLightDir;
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.5, 0.5) + (-u_xlat10.xy);
    u_xlat16_10 = texture(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_45.xy = u_xlat16_10.yx * vec2(_metallic, _roughness);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45.xy = min(max(u_xlat16_45.xy, 0.0), 1.0);
#else
    u_xlat16_45.xy = clamp(u_xlat16_45.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb60 = !!(0.100000001>=u_xlat16_10.z);
#else
    u_xlatb60 = 0.100000001>=u_xlat16_10.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat));
#else
    u_xlatb10 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
#endif
    u_xlatb60 = u_xlatb60 && u_xlatb10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.100000001<u_xlat16_10.z);
#else
    u_xlatb10 = 0.100000001<u_xlat16_10.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat16_10.z<0.449999988);
#else
    u_xlatb27 = u_xlat16_10.z<0.449999988;
#endif
    u_xlatb10 = u_xlatb27 && u_xlatb10;
    u_xlatb27 = u_xlatb60 || u_xlatb10;
    u_xlat16_58 = u_xlat16_45.y * 6.0;
    u_xlat16_58 = (u_xlatb27) ? 0.0 : u_xlat16_58;
    u_xlat16_12 = textureLod(_MatcapTex, u_xlat16_11.xy, u_xlat16_58);
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    if(u_xlatb60){
        u_xlat16_58 = log2(u_xlat27);
        u_xlat16_58 = u_xlat16_58 * _ClearNovPow;
        u_xlat16_58 = exp2(u_xlat16_58);
        u_xlat15.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat16_60 = texture(_ClearCoatTex, u_xlat15.xy).x;
        u_xlat16_11.x = log2(u_xlat16_60);
        u_xlat16_11.x = u_xlat16_11.x * _ClearCoatPow;
        u_xlat16_11.x = exp2(u_xlat16_11.x);
        u_xlat16_11.x = u_xlat16_11.x * _ClearCoatStrength;
        u_xlat16_58 = u_xlat16_58 * u_xlat16_11.x;
        u_xlat16_11.x = (-u_xlat16_56) + 1.21000004;
        u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
        u_xlat16_58 = u_xlat16_58 * u_xlat16_11.x;
        u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_13.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_13.xyz = vec3(u_xlat16_58) * u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_6.xxx * u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_10.www * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb60 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA));
#else
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
#endif
        u_xlat16_16.xyz = u_xlat16_12.www * u_xlat16_13.xyz;
        u_xlat16_13.xyz = (bool(u_xlatb60)) ? u_xlat16_16.xyz : u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_7.xyz + u_xlat16_13.xyz;
    } else {
        u_xlat16_58 = (-u_xlat16_45.x) + 1.0;
        u_xlat16_13.xyz = vec3(u_xlat16_58) * u_xlat16_7.xyz;
    }
    if(u_xlatb42){
        u_xlat16_7.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
        u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
        u_xlat12.xyz = u_xlat16_5.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat12.xyz = u_xlat16_45.xxx * u_xlat12.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat52) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat9.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat16_24.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_24.y = u_xlat16_45.y * u_xlat16_45.y;
        u_xlat16_24.xz = u_xlat16_24.xy * u_xlat16_24.xy;
        u_xlat16_41 = u_xlat16_24.y * u_xlat16_24.y + -1.0;
        u_xlat16_24.x = u_xlat16_24.x * u_xlat16_41 + 1.0;
        u_xlat16_24.x = u_xlat16_24.x * u_xlat16_24.x;
        u_xlat16_24.x = u_xlat16_24.z / u_xlat16_24.x;
        u_xlat16_24.x = u_xlat16_24.x * 0.318309873;
        u_xlat16_41 = (-u_xlat27) * u_xlat16_24.z + u_xlat27;
        u_xlat16_41 = u_xlat27 * u_xlat16_41 + u_xlat16_24.z;
        u_xlat16_41 = sqrt(u_xlat16_41);
        u_xlat16_41 = u_xlat16_41 + u_xlat27;
        u_xlat16_11.x = (-u_xlat16_7.x) * u_xlat16_24.z + u_xlat16_7.x;
        u_xlat16_58 = u_xlat16_7.x * u_xlat16_11.x + u_xlat16_24.z;
        u_xlat16_58 = sqrt(u_xlat16_58);
        u_xlat16_58 = u_xlat16_58 + u_xlat16_7.x;
        u_xlat16_41 = u_xlat16_58 * u_xlat16_41;
        u_xlat16_41 = float(1.0) / u_xlat16_41;
        u_xlat16_58 = (-u_xlat1.x) + 1.0;
        u_xlat16_11.x = u_xlat16_58 * u_xlat16_58;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
        u_xlat16_28.x = u_xlat16_58 * u_xlat16_11.x;
        u_xlat16_45.x = u_xlat12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_45.x = min(max(u_xlat16_45.x, 0.0), 1.0);
#else
        u_xlat16_45.x = clamp(u_xlat16_45.x, 0.0, 1.0);
#endif
        u_xlat16_58 = (-u_xlat16_11.x) * u_xlat16_58 + 1.0;
        u_xlat16_16.xyz = u_xlat12.xyz * vec3(u_xlat16_58);
        u_xlat16_11.xyz = u_xlat16_45.xxx * u_xlat16_28.xxx + u_xlat16_16.xyz;
        u_xlat16_24.x = u_xlat16_24.x * u_xlat16_41;
        u_xlat16_24.xyz = u_xlat16_11.xyz * u_xlat16_24.xxx;
        u_xlat16_24.xyz = u_xlat16_7.xxx * u_xlat16_24.xyz;
        u_xlat16_24.xyz = u_xlat8.xxx * u_xlat16_24.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_24.xyz = min(max(u_xlat16_24.xyz, 0.0), 1.0);
#else
        u_xlat16_24.xyz = clamp(u_xlat16_24.xyz, 0.0, 1.0);
#endif
        u_xlat0.x = (-u_xlat27) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_11.x = (-u_xlat16_45.y) + 1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.x * 0.899999976 + 0.100000001;
        u_xlat16_28.xyz = u_xlat16_12.www * _customMatcapCol.xyz;
        u_xlat16_28.xyz = (bool(u_xlatb10)) ? u_xlat16_28.xyz : u_xlat16_14.xyz;
        u_xlat1.x = u_xlat27 + _customMatcapFresnelRange;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat18 = u_xlatb10 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat18 * u_xlat1.x + 1.0;
        u_xlat16_64 = (u_xlatb10) ? 1.0 : 0.0;
        u_xlat16_14.x = (-u_xlat0.x) + 1.0;
        u_xlat16_14.x = u_xlat16_64 * u_xlat16_14.x + u_xlat0.x;
        u_xlat16_31 = (-_inDirectSpeStr) + 1.0;
        u_xlat16_64 = u_xlat16_64 * u_xlat16_31 + _inDirectSpeStr;
        u_xlat16_64 = u_xlat16_10.w * u_xlat16_64;
        u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(u_xlat16_64);
        u_xlat16_28.xyz = u_xlat16_14.xxx * u_xlat16_28.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_28.xyz;
        u_xlat16_62 = (-u_xlat16_56) + 1.21000004;
        u_xlat16_62 = min(u_xlat16_62, 1.0);
        u_xlat16_11.xyz = vec3(u_xlat16_62) * u_xlat16_11.xyz;
        u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(vec3(_speStr, _speStr, _speStr)) + u_xlat16_11.xyz;
        u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_24.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn));
#else
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
#endif
        if(u_xlatb0){
            u_xlat16_24.xy = u_xlat3.xy + (-u_xlat25.xz);
            u_xlat16_24.xy = _throughSkinSpeDir.ww * u_xlat16_24.xy + u_xlat25.xz;
            u_xlat16_24.xy = u_xlat16_24.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_24.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat16_0 = texture(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_24.x = u_xlat16_0 * 0.349999994;
            u_xlat16_56 = (-u_xlat16_56) + 1.0;
            u_xlat16_56 = u_xlat16_56 * u_xlat16_24.x;
            u_xlat16_56 = u_xlat16_7.x * u_xlat16_56;
            u_xlat16_13.xyz = vec3(u_xlat16_56) * _SkinEffectCol.xyz + u_xlat16_13.xyz;
        }
    }
    u_xlat16_1.w = u_xlat16_37.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat3.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat3.x + _EmisstionParams.x;
    u_xlat3.xyz = u_xlat16_5.xyz * _EmisstionColor.xyz;
    u_xlat16_5.x = (-u_xlat16_37.y) + 1.0;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_5.xxx;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3);
#endif
    u_xlat8.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
    u_xlat42.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat8.xy;
    u_xlat42.xy = u_xlat42.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_9.xyz = texture(_LG_Tex, u_xlat42.xy).xyz;
    u_xlat16_0 = texture(_LG_Tex, u_xlat8.xy).w;
    u_xlat16_5.xyz = u_xlat16_9.xyz * vec3(_LG_Intensity);
    u_xlat16_5.xyz = vec3(u_xlat16_0) * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
#endif
    if(u_xlatb0){
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32));
#else
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
#endif
        u_xlat3.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat37.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat3.xy;
        u_xlat37.xy = u_xlat37.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat16_8.xyz = texture(_LG_Tex2, u_xlat37.xy).xyz;
        u_xlat16_0 = texture(_LG_Tex2, u_xlat3.xy).w;
        u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(_LG_Intensity2);
        u_xlat16_5.xyz = vec3(u_xlat16_0) * u_xlat16_5.xyz;
        u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color2.x, _LG_Color2.y, _LG_Color2.z) + u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
#endif
    u_xlat16_4.w = 1.0;
    u_xlat16_1 = (bool(u_xlatb0)) ? u_xlat16_4 : u_xlat16_1;
    u_xlat3.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat8.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat0.xz = u_xlat17.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat17.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat17.zz + u_xlat0.xy;
    u_xlat34.xy = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat34.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat34.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat34.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_39 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_39);
    u_xlat16_5 = u_xlat0 * u_xlat16_5.xxzz;
    u_xlat16_5.x = dot(u_xlat16_5.xy, u_xlat16_5.zw);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _ColorScaleByLightDir;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_22.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_22.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_22.xy + u_xlat0.xy;
    u_xlat16_56 = dot(u_xlat16_22.xy, u_xlat16_22.xy);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_22.xy = vec2(u_xlat16_56) * u_xlat16_22.xy;
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_22.xy * u_xlat0.xx + u_xlat3.xy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=_depthSubThreshold);
#else
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_pointLightOn);
#else
    u_xlatb0 = 0.5<_pointLightOn;
#endif
    u_xlat17.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat17.x = sqrt(u_xlat17.x);
    u_xlat16_56 = u_xlat17.x + 9.99999975e-05;
    u_xlat16_56 = log2(u_xlat16_56);
    u_xlat16_56 = u_xlat16_56 * _pointLightAtten;
    u_xlat16_56 = exp2(u_xlat16_56);
    u_xlat16_56 = float(1.0) / u_xlat16_56;
    u_xlat16_7.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_7.x = u_xlat17.x / u_xlat16_7.x;
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_24.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = (-u_xlat16_24.x) * u_xlat16_7.x + 1.0;
    u_xlat16_24.xyz = vec3(u_xlat16_56) * _pointLightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_24.xyz * u_xlat16_7.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    SV_Target0.w = u_xlat16_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
highp  vec4 phase0_Output0_8;
varying highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD5.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    phase0_Output0_8 = in_TEXCOORD2.xyxy;
vs_VAR_LIUUV0 = phase0_Output0_8.xy;
vs_TEXCOORD9 = phase0_Output0_8.zw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _NormalStr;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _ShowRamp;
uniform 	mediump float _selfShadowAdjust;
uniform 	mediump float _metallic;
uniform 	mediump float _roughness;
uniform 	mediump float _speStr;
uniform 	mediump float _inDirectSpeStr;
uniform 	mediump float _ClearCoat;
uniform 	mediump float _ClearCoatPow;
uniform 	mediump float _ClearCoatStrength;
uniform 	mediump float _ClearCoatTileScale;
uniform 	mediump float _ClearNovPow;
uniform 	mediump float _ClearCoatMatcapStr;
uniform 	mediump float _ClearCoatMatcapA;
uniform 	mediump float _customMatcapFresnelRange;
uniform 	mediump vec3 _customMatcapCol;
uniform 	mediump float _SkinThroughOn;
uniform 	mediump vec3 _SkinEffectCol;
uniform 	mediump vec4 _throughSkinSpeDir;
uniform 	mediump float _useUv3;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump float _useUv32;
uniform 	mediump float _useLg2;
uniform 	float _U_LG2;
uniform 	float _V_LG2;
uniform 	mediump float _LG_Intensity2;
uniform 	mediump vec3 _LG_Color2;
uniform 	mediump vec4 _LG_Tex2_ST;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _ShadowOffsetTex;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _PBRTexture;
uniform lowp sampler2D _MatcapTex;
uniform lowp sampler2D _ClearCoatTex;
uniform lowp sampler2D _SkinEffectTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Tex2;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
bool u_xlatb10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
lowp vec4 u_xlat10_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
float u_xlat18;
mediump vec2 u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat26;
float u_xlat27;
bool u_xlatb27;
mediump vec3 u_xlat16_28;
mediump float u_xlat16_31;
vec2 u_xlat34;
vec2 u_xlat37;
lowp vec2 u_xlat10_37;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
vec2 u_xlat42;
lowp float u_xlat10_42;
bool u_xlatb42;
mediump vec2 u_xlat16_45;
float u_xlat52;
lowp float u_xlat10_53;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
bool u_xlatb59;
lowp float u_xlat10_60;
bool u_xlatb60;
mediump float u_xlat16_62;
mediump float u_xlat16_64;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat17.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat52 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat2.xyz = vec3(u_xlat52) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4.x = (-_USE3UV_ON) + 1.0;
    u_xlat37.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat37.xy = vs_TEXCOORD0.xy * u_xlat16_4.xx + u_xlat37.xy;
    u_xlat10_4 = texture2D(_MainTex, u_xlat37.xy);
    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz;
    u_xlat10_53 = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_56 = u_xlat10_53 + -1.0;
    u_xlat16_56 = _InSideLineStrength * u_xlat16_56 + 1.0;
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz;
    u_xlat37.x = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_57 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_57 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_56) + (-u_xlat37.xxx);
    u_xlat8.xyz = vec3(u_xlat16_57) * u_xlat8.xyz + u_xlat37.xxx;
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_6.xyz = u_xlat8.xyz * vec3(u_xlat16_56) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat10_37.xy = texture2D(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture2D(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat42.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat9.x = (-u_xlat42.x) * u_xlat42.x + 1.0;
    u_xlat9.x = (-u_xlat42.y) * u_xlat42.y + u_xlat9.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat26.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat26.xyz = u_xlat26.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat17.zxy * u_xlat26.yzx;
    u_xlat10.xyz = u_xlat17.yzx * u_xlat26.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat42.yyy * u_xlat10.xyz;
    u_xlat26.xyz = u_xlat42.xxx * u_xlat26.xyz + u_xlat10.xyz;
    u_xlat9.xyz = u_xlat9.xxx * u_xlat17.xyz + u_xlat26.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat9.xyz = vec3(_NormalStr) * u_xlat9.xyz + u_xlat17.xyz;
    u_xlat16_56 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat16_6.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_23 = _ShadowThreshold + 0.5;
    u_xlat10_42 = texture2D(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat42.x = u_xlat10_42 + -0.5;
    u_xlatb59 = 0.99000001<u_xlat16_56;
    u_xlat16_40 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_40 = (u_xlatb59) ? u_xlat16_40 : 0.0;
    u_xlat16_40 = u_xlat16_40 + _selfShadowAdjust;
    u_xlat42.x = u_xlat16_56 * u_xlat16_40 + u_xlat42.x;
    u_xlat42.x = u_xlat16_23 + u_xlat42.x;
    u_xlat16_23 = u_xlat42.x + (-_ShadowFeather);
    u_xlat16_40 = u_xlat42.x + _ShadowFeather;
    u_xlat16_40 = (-u_xlat16_23) + u_xlat16_40;
    u_xlat16_23 = (-u_xlat16_23) + u_xlat16_6.x;
    u_xlat16_40 = float(1.0) / u_xlat16_40;
    u_xlat16_23 = u_xlat16_40 * u_xlat16_23;
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
    u_xlat16_40 = u_xlat16_23 * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_23 * u_xlat16_23;
    u_xlat16_7.x = u_xlat16_40 * u_xlat16_7.x;
    u_xlat16_8 = min(u_xlat16_7.x, 1.0);
    u_xlatb42 = 0.96875>=u_xlat8.y;
    u_xlat8.x = u_xlat16_8;
    u_xlat10_10.xyz = texture2D(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat10_10.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_7.xyz * u_xlat10_10.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_7.xyz = vec3(_RampDifLerpValue) * u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_11.xyz = u_xlat16_7.xyz * _DarkColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightAreaColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_7.xyz = u_xlat8.xxx * u_xlat16_7.xyz + u_xlat16_11.xyz;
    u_xlat25.xz = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat25.xz;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat25.xz;
    u_xlat16_11.xy = u_xlat25.xz + vec2(1.0, 1.0);
    u_xlat16_58 = u_xlat3.y * 0.100000001;
    u_xlat10.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat10.y = u_xlat16_58 * _matCapSpeEffectedByLightDir;
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.5, 0.5) + (-u_xlat10.xy);
    u_xlat10_10 = texture2D(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_45.xy = u_xlat10_10.yx * vec2(_metallic, _roughness);
    u_xlat16_45.xy = clamp(u_xlat16_45.xy, 0.0, 1.0);
    u_xlatb60 = 0.100000001>=u_xlat10_10.z;
    u_xlatb10 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
    u_xlatb60 = u_xlatb60 && u_xlatb10;
    u_xlatb10 = 0.100000001<u_xlat10_10.z;
    u_xlatb27 = u_xlat10_10.z<0.449999988;
    u_xlatb10 = u_xlatb27 && u_xlatb10;
    u_xlatb27 = u_xlatb60 || u_xlatb10;
    u_xlat16_58 = u_xlat16_45.y * 6.0;
    u_xlat16_58 = (u_xlatb27) ? 0.0 : u_xlat16_58;
    u_xlat10_12 = texture2DLodEXT(_MatcapTex, u_xlat16_11.xy, u_xlat16_58);
    u_xlat16_13.xyz = u_xlat10_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat10_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat10_12.xyz * u_xlat16_13.xyz;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    if(u_xlatb60){
        u_xlat16_58 = log2(u_xlat27);
        u_xlat16_58 = u_xlat16_58 * _ClearNovPow;
        u_xlat16_58 = exp2(u_xlat16_58);
        u_xlat15.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat10_60 = texture2D(_ClearCoatTex, u_xlat15.xy).x;
        u_xlat16_11.x = log2(u_xlat10_60);
        u_xlat16_11.x = u_xlat16_11.x * _ClearCoatPow;
        u_xlat16_11.x = exp2(u_xlat16_11.x);
        u_xlat16_11.x = u_xlat16_11.x * _ClearCoatStrength;
        u_xlat16_58 = u_xlat16_58 * u_xlat16_11.x;
        u_xlat16_11.x = (-u_xlat16_56) + 1.21000004;
        u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
        u_xlat16_58 = u_xlat16_58 * u_xlat16_11.x;
        u_xlat16_13.xyz = u_xlat10_12.xyz * u_xlat16_13.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_13.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_13.xyz = vec3(u_xlat16_58) * u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_6.xxx * u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat10_10.www * u_xlat16_13.xyz;
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
        u_xlat16_16.xyz = u_xlat10_12.www * u_xlat16_13.xyz;
        u_xlat16_13.xyz = (bool(u_xlatb60)) ? u_xlat16_16.xyz : u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_7.xyz + u_xlat16_13.xyz;
    } else {
        u_xlat16_58 = (-u_xlat16_45.x) + 1.0;
        u_xlat16_13.xyz = vec3(u_xlat16_58) * u_xlat16_7.xyz;
    }
    if(u_xlatb42){
        u_xlat16_7.x = u_xlat0.x;
        u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
        u_xlat12.xyz = u_xlat16_5.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat12.xyz = u_xlat16_45.xxx * u_xlat12.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat52) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat9.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat16_24.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_24.y = u_xlat16_45.y * u_xlat16_45.y;
        u_xlat16_24.xz = u_xlat16_24.xy * u_xlat16_24.xy;
        u_xlat16_41 = u_xlat16_24.y * u_xlat16_24.y + -1.0;
        u_xlat16_24.x = u_xlat16_24.x * u_xlat16_41 + 1.0;
        u_xlat16_24.x = u_xlat16_24.x * u_xlat16_24.x;
        u_xlat16_24.x = u_xlat16_24.z / u_xlat16_24.x;
        u_xlat16_24.x = u_xlat16_24.x * 0.318309873;
        u_xlat16_41 = (-u_xlat27) * u_xlat16_24.z + u_xlat27;
        u_xlat16_41 = u_xlat27 * u_xlat16_41 + u_xlat16_24.z;
        u_xlat16_41 = sqrt(u_xlat16_41);
        u_xlat16_41 = u_xlat16_41 + u_xlat27;
        u_xlat16_11.x = (-u_xlat16_7.x) * u_xlat16_24.z + u_xlat16_7.x;
        u_xlat16_58 = u_xlat16_7.x * u_xlat16_11.x + u_xlat16_24.z;
        u_xlat16_58 = sqrt(u_xlat16_58);
        u_xlat16_58 = u_xlat16_58 + u_xlat16_7.x;
        u_xlat16_41 = u_xlat16_58 * u_xlat16_41;
        u_xlat16_41 = float(1.0) / u_xlat16_41;
        u_xlat16_58 = (-u_xlat1.x) + 1.0;
        u_xlat16_11.x = u_xlat16_58 * u_xlat16_58;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
        u_xlat16_28.x = u_xlat16_58 * u_xlat16_11.x;
        u_xlat16_45.x = u_xlat12.y * 50.0;
        u_xlat16_45.x = clamp(u_xlat16_45.x, 0.0, 1.0);
        u_xlat16_58 = (-u_xlat16_11.x) * u_xlat16_58 + 1.0;
        u_xlat16_16.xyz = u_xlat12.xyz * vec3(u_xlat16_58);
        u_xlat16_11.xyz = u_xlat16_45.xxx * u_xlat16_28.xxx + u_xlat16_16.xyz;
        u_xlat16_24.x = u_xlat16_24.x * u_xlat16_41;
        u_xlat16_24.xyz = u_xlat16_11.xyz * u_xlat16_24.xxx;
        u_xlat16_24.xyz = u_xlat16_7.xxx * u_xlat16_24.xyz;
        u_xlat16_24.xyz = u_xlat8.xxx * u_xlat16_24.xyz;
        u_xlat16_24.xyz = clamp(u_xlat16_24.xyz, 0.0, 1.0);
        u_xlat0.x = (-u_xlat27) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_11.x = (-u_xlat16_45.y) + 1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.x * 0.899999976 + 0.100000001;
        u_xlat16_28.xyz = u_xlat10_12.www * _customMatcapCol.xyz;
        u_xlat16_28.xyz = (bool(u_xlatb10)) ? u_xlat16_28.xyz : u_xlat16_14.xyz;
        u_xlat1.x = u_xlat27 + _customMatcapFresnelRange;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat18 = u_xlatb10 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat18 * u_xlat1.x + 1.0;
        u_xlat16_64 = (u_xlatb10) ? 1.0 : 0.0;
        u_xlat16_14.x = (-u_xlat0.x) + 1.0;
        u_xlat16_14.x = u_xlat16_64 * u_xlat16_14.x + u_xlat0.x;
        u_xlat16_31 = (-_inDirectSpeStr) + 1.0;
        u_xlat16_64 = u_xlat16_64 * u_xlat16_31 + _inDirectSpeStr;
        u_xlat16_64 = u_xlat10_10.w * u_xlat16_64;
        u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(u_xlat16_64);
        u_xlat16_28.xyz = u_xlat16_14.xxx * u_xlat16_28.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_28.xyz;
        u_xlat16_62 = (-u_xlat16_56) + 1.21000004;
        u_xlat16_62 = min(u_xlat16_62, 1.0);
        u_xlat16_11.xyz = vec3(u_xlat16_62) * u_xlat16_11.xyz;
        u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(vec3(_speStr, _speStr, _speStr)) + u_xlat16_11.xyz;
        u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_24.xyz;
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
        if(u_xlatb0){
            u_xlat16_24.xy = u_xlat3.xy + (-u_xlat25.xz);
            u_xlat16_24.xy = _throughSkinSpeDir.ww * u_xlat16_24.xy + u_xlat25.xz;
            u_xlat16_24.xy = u_xlat16_24.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_24.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat10_0 = texture2D(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_24.x = u_xlat10_0 * 0.349999994;
            u_xlat16_56 = (-u_xlat16_56) + 1.0;
            u_xlat16_56 = u_xlat16_56 * u_xlat16_24.x;
            u_xlat16_56 = u_xlat16_7.x * u_xlat16_56;
            u_xlat16_13.xyz = vec3(u_xlat16_56) * _SkinEffectCol.xyz + u_xlat16_13.xyz;
        }
    }
    u_xlat16_1.w = u_xlat10_37.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat3.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat3.x + _EmisstionParams.x;
    u_xlat3.xyz = u_xlat16_5.xyz * _EmisstionColor.xyz;
    u_xlat16_5.x = (-u_xlat10_37.y) + 1.0;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_5.xxx;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx + u_xlat16_13.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3);
    u_xlat8.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
    u_xlat42.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat8.xy;
    u_xlat42.xy = u_xlat42.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_9.xyz = texture2D(_LG_Tex, u_xlat42.xy).xyz;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat8.xy).w;
    u_xlat16_5.xyz = u_xlat10_9.xyz * vec3(_LG_Intensity);
    u_xlat16_5.xyz = vec3(u_xlat10_0) * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat3.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
    if(u_xlatb0){
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
        u_xlat3.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat37.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat3.xy;
        u_xlat37.xy = u_xlat37.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat10_8.xyz = texture2D(_LG_Tex2, u_xlat37.xy).xyz;
        u_xlat10_0 = texture2D(_LG_Tex2, u_xlat3.xy).w;
        u_xlat16_5.xyz = u_xlat10_8.xyz * vec3(_LG_Intensity2);
        u_xlat16_5.xyz = vec3(u_xlat10_0) * u_xlat16_5.xyz;
        u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color2.x, _LG_Color2.y, _LG_Color2.z) + u_xlat16_1.xyz;
    }
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
    u_xlat16_4.w = 1.0;
    u_xlat16_1 = (bool(u_xlatb0)) ? u_xlat16_4 : u_xlat16_1;
    u_xlat3.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat8.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat0.xz = u_xlat17.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat17.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat17.zz + u_xlat0.xy;
    u_xlat34.xy = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat34.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat34.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat34.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_39 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_39);
    u_xlat16_5 = u_xlat0 * u_xlat16_5.xxzz;
    u_xlat16_5.x = dot(u_xlat16_5.xy, u_xlat16_5.zw);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _ColorScaleByLightDir;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_22.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_22.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_22.xy + u_xlat0.xy;
    u_xlat16_56 = dot(u_xlat16_22.xy, u_xlat16_22.xy);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_22.xy = vec2(u_xlat16_56) * u_xlat16_22.xy;
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_22.xy * u_xlat0.xx + u_xlat3.xy;
    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb0 = 0.5<_pointLightOn;
    u_xlat17.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat17.x = sqrt(u_xlat17.x);
    u_xlat16_56 = u_xlat17.x + 9.99999975e-05;
    u_xlat16_56 = log2(u_xlat16_56);
    u_xlat16_56 = u_xlat16_56 * _pointLightAtten;
    u_xlat16_56 = exp2(u_xlat16_56);
    u_xlat16_56 = float(1.0) / u_xlat16_56;
    u_xlat16_7.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_7.x = u_xlat17.x / u_xlat16_7.x;
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_24.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = (-u_xlat16_24.x) * u_xlat16_7.x + 1.0;
    u_xlat16_24.xyz = vec3(u_xlat16_56) * _pointLightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_24.xyz * u_xlat16_7.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    SV_Target0.w = u_xlat16_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
highp  vec4 phase0_Output0_8;
varying highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD5.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    phase0_Output0_8 = in_TEXCOORD2.xyxy;
vs_VAR_LIUUV0 = phase0_Output0_8.xy;
vs_TEXCOORD9 = phase0_Output0_8.zw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _NormalStr;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _ShowRamp;
uniform 	mediump float _selfShadowAdjust;
uniform 	mediump float _metallic;
uniform 	mediump float _roughness;
uniform 	mediump float _speStr;
uniform 	mediump float _inDirectSpeStr;
uniform 	mediump float _ClearCoat;
uniform 	mediump float _ClearCoatPow;
uniform 	mediump float _ClearCoatStrength;
uniform 	mediump float _ClearCoatTileScale;
uniform 	mediump float _ClearNovPow;
uniform 	mediump float _ClearCoatMatcapStr;
uniform 	mediump float _ClearCoatMatcapA;
uniform 	mediump float _customMatcapFresnelRange;
uniform 	mediump vec3 _customMatcapCol;
uniform 	mediump float _SkinThroughOn;
uniform 	mediump vec3 _SkinEffectCol;
uniform 	mediump vec4 _throughSkinSpeDir;
uniform 	mediump float _useUv3;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump float _useUv32;
uniform 	mediump float _useLg2;
uniform 	float _U_LG2;
uniform 	float _V_LG2;
uniform 	mediump float _LG_Intensity2;
uniform 	mediump vec3 _LG_Color2;
uniform 	mediump vec4 _LG_Tex2_ST;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _ShadowOffsetTex;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _PBRTexture;
uniform lowp sampler2D _MatcapTex;
uniform lowp sampler2D _ClearCoatTex;
uniform lowp sampler2D _SkinEffectTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Tex2;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
bool u_xlatb10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
lowp vec4 u_xlat10_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec2 u_xlat15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
float u_xlat18;
mediump vec2 u_xlat16_22;
mediump float u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
vec3 u_xlat26;
float u_xlat27;
bool u_xlatb27;
mediump vec3 u_xlat16_28;
mediump float u_xlat16_31;
vec2 u_xlat34;
vec2 u_xlat37;
lowp vec2 u_xlat10_37;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
mediump float u_xlat16_41;
vec2 u_xlat42;
lowp float u_xlat10_42;
bool u_xlatb42;
mediump vec2 u_xlat16_45;
float u_xlat52;
lowp float u_xlat10_53;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump float u_xlat16_58;
bool u_xlatb59;
lowp float u_xlat10_60;
bool u_xlatb60;
mediump float u_xlat16_62;
mediump float u_xlat16_64;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat17.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat52 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat1.xyz = vec3(u_xlat52) * u_xlat1.xyz;
    u_xlat52 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat52 = inversesqrt(u_xlat52);
    u_xlat2.xyz = vec3(u_xlat52) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4.x = (-_USE3UV_ON) + 1.0;
    u_xlat37.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat37.xy = vs_TEXCOORD0.xy * u_xlat16_4.xx + u_xlat37.xy;
    u_xlat10_4 = texture2D(_MainTex, u_xlat37.xy);
    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz;
    u_xlat10_53 = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_56 = u_xlat10_53 + -1.0;
    u_xlat16_56 = _InSideLineStrength * u_xlat16_56 + 1.0;
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz;
    u_xlat37.x = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_57 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_57 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_56) + (-u_xlat37.xxx);
    u_xlat8.xyz = vec3(u_xlat16_57) * u_xlat8.xyz + u_xlat37.xxx;
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_6.xyz = u_xlat8.xyz * vec3(u_xlat16_56) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat10_37.xy = texture2D(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture2D(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat42.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat9.x = (-u_xlat42.x) * u_xlat42.x + 1.0;
    u_xlat9.x = (-u_xlat42.y) * u_xlat42.y + u_xlat9.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat26.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat26.xyz = u_xlat26.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat17.zxy * u_xlat26.yzx;
    u_xlat10.xyz = u_xlat17.yzx * u_xlat26.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat42.yyy * u_xlat10.xyz;
    u_xlat26.xyz = u_xlat42.xxx * u_xlat26.xyz + u_xlat10.xyz;
    u_xlat9.xyz = u_xlat9.xxx * u_xlat17.xyz + u_xlat26.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat9.xyz = vec3(_NormalStr) * u_xlat9.xyz + u_xlat17.xyz;
    u_xlat16_56 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat16_6.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_23 = _ShadowThreshold + 0.5;
    u_xlat10_42 = texture2D(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat42.x = u_xlat10_42 + -0.5;
    u_xlatb59 = 0.99000001<u_xlat16_56;
    u_xlat16_40 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_40 = (u_xlatb59) ? u_xlat16_40 : 0.0;
    u_xlat16_40 = u_xlat16_40 + _selfShadowAdjust;
    u_xlat42.x = u_xlat16_56 * u_xlat16_40 + u_xlat42.x;
    u_xlat42.x = u_xlat16_23 + u_xlat42.x;
    u_xlat16_23 = u_xlat42.x + (-_ShadowFeather);
    u_xlat16_40 = u_xlat42.x + _ShadowFeather;
    u_xlat16_40 = (-u_xlat16_23) + u_xlat16_40;
    u_xlat16_23 = (-u_xlat16_23) + u_xlat16_6.x;
    u_xlat16_40 = float(1.0) / u_xlat16_40;
    u_xlat16_23 = u_xlat16_40 * u_xlat16_23;
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
    u_xlat16_40 = u_xlat16_23 * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_23 * u_xlat16_23;
    u_xlat16_7.x = u_xlat16_40 * u_xlat16_7.x;
    u_xlat16_8 = min(u_xlat16_7.x, 1.0);
    u_xlatb42 = 0.96875>=u_xlat8.y;
    u_xlat8.x = u_xlat16_8;
    u_xlat10_10.xyz = texture2D(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat10_10.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_7.xyz * u_xlat10_10.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_7.xyz = vec3(_RampDifLerpValue) * u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_11.xyz = u_xlat16_7.xyz * _DarkColor.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _LightAreaColor.xyz + (-u_xlat16_11.xyz);
    u_xlat16_7.xyz = u_xlat8.xxx * u_xlat16_7.xyz + u_xlat16_11.xyz;
    u_xlat25.xz = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat25.xz;
    u_xlat25.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat25.xz;
    u_xlat16_11.xy = u_xlat25.xz + vec2(1.0, 1.0);
    u_xlat16_58 = u_xlat3.y * 0.100000001;
    u_xlat10.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat10.y = u_xlat16_58 * _matCapSpeEffectedByLightDir;
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.5, 0.5) + (-u_xlat10.xy);
    u_xlat10_10 = texture2D(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_45.xy = u_xlat10_10.yx * vec2(_metallic, _roughness);
    u_xlat16_45.xy = clamp(u_xlat16_45.xy, 0.0, 1.0);
    u_xlatb60 = 0.100000001>=u_xlat10_10.z;
    u_xlatb10 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
    u_xlatb60 = u_xlatb60 && u_xlatb10;
    u_xlatb10 = 0.100000001<u_xlat10_10.z;
    u_xlatb27 = u_xlat10_10.z<0.449999988;
    u_xlatb10 = u_xlatb27 && u_xlatb10;
    u_xlatb27 = u_xlatb60 || u_xlatb10;
    u_xlat16_58 = u_xlat16_45.y * 6.0;
    u_xlat16_58 = (u_xlatb27) ? 0.0 : u_xlat16_58;
    u_xlat10_12 = texture2DLodEXT(_MatcapTex, u_xlat16_11.xy, u_xlat16_58);
    u_xlat16_13.xyz = u_xlat10_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat10_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat10_12.xyz * u_xlat16_13.xyz;
    u_xlat27 = dot(u_xlat9.xyz, u_xlat1.xyz);
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    if(u_xlatb60){
        u_xlat16_58 = log2(u_xlat27);
        u_xlat16_58 = u_xlat16_58 * _ClearNovPow;
        u_xlat16_58 = exp2(u_xlat16_58);
        u_xlat15.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat10_60 = texture2D(_ClearCoatTex, u_xlat15.xy).x;
        u_xlat16_11.x = log2(u_xlat10_60);
        u_xlat16_11.x = u_xlat16_11.x * _ClearCoatPow;
        u_xlat16_11.x = exp2(u_xlat16_11.x);
        u_xlat16_11.x = u_xlat16_11.x * _ClearCoatStrength;
        u_xlat16_58 = u_xlat16_58 * u_xlat16_11.x;
        u_xlat16_11.x = (-u_xlat16_56) + 1.21000004;
        u_xlat16_11.x = min(u_xlat16_11.x, 1.0);
        u_xlat16_58 = u_xlat16_58 * u_xlat16_11.x;
        u_xlat16_13.xyz = u_xlat10_12.xyz * u_xlat16_13.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_13.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_13.xyz = vec3(u_xlat16_58) * u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_6.xxx * u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat10_10.www * u_xlat16_13.xyz;
        u_xlatb60 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
        u_xlat16_16.xyz = u_xlat10_12.www * u_xlat16_13.xyz;
        u_xlat16_13.xyz = (bool(u_xlatb60)) ? u_xlat16_16.xyz : u_xlat16_13.xyz;
        u_xlat16_13.xyz = u_xlat16_7.xyz + u_xlat16_13.xyz;
    } else {
        u_xlat16_58 = (-u_xlat16_45.x) + 1.0;
        u_xlat16_13.xyz = vec3(u_xlat16_58) * u_xlat16_7.xyz;
    }
    if(u_xlatb42){
        u_xlat16_7.x = u_xlat0.x;
        u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
        u_xlat12.xyz = u_xlat16_5.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat12.xyz = u_xlat16_45.xxx * u_xlat12.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat52) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat9.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat16_24.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_24.y = u_xlat16_45.y * u_xlat16_45.y;
        u_xlat16_24.xz = u_xlat16_24.xy * u_xlat16_24.xy;
        u_xlat16_41 = u_xlat16_24.y * u_xlat16_24.y + -1.0;
        u_xlat16_24.x = u_xlat16_24.x * u_xlat16_41 + 1.0;
        u_xlat16_24.x = u_xlat16_24.x * u_xlat16_24.x;
        u_xlat16_24.x = u_xlat16_24.z / u_xlat16_24.x;
        u_xlat16_24.x = u_xlat16_24.x * 0.318309873;
        u_xlat16_41 = (-u_xlat27) * u_xlat16_24.z + u_xlat27;
        u_xlat16_41 = u_xlat27 * u_xlat16_41 + u_xlat16_24.z;
        u_xlat16_41 = sqrt(u_xlat16_41);
        u_xlat16_41 = u_xlat16_41 + u_xlat27;
        u_xlat16_11.x = (-u_xlat16_7.x) * u_xlat16_24.z + u_xlat16_7.x;
        u_xlat16_58 = u_xlat16_7.x * u_xlat16_11.x + u_xlat16_24.z;
        u_xlat16_58 = sqrt(u_xlat16_58);
        u_xlat16_58 = u_xlat16_58 + u_xlat16_7.x;
        u_xlat16_41 = u_xlat16_58 * u_xlat16_41;
        u_xlat16_41 = float(1.0) / u_xlat16_41;
        u_xlat16_58 = (-u_xlat1.x) + 1.0;
        u_xlat16_11.x = u_xlat16_58 * u_xlat16_58;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
        u_xlat16_28.x = u_xlat16_58 * u_xlat16_11.x;
        u_xlat16_45.x = u_xlat12.y * 50.0;
        u_xlat16_45.x = clamp(u_xlat16_45.x, 0.0, 1.0);
        u_xlat16_58 = (-u_xlat16_11.x) * u_xlat16_58 + 1.0;
        u_xlat16_16.xyz = u_xlat12.xyz * vec3(u_xlat16_58);
        u_xlat16_11.xyz = u_xlat16_45.xxx * u_xlat16_28.xxx + u_xlat16_16.xyz;
        u_xlat16_24.x = u_xlat16_24.x * u_xlat16_41;
        u_xlat16_24.xyz = u_xlat16_11.xyz * u_xlat16_24.xxx;
        u_xlat16_24.xyz = u_xlat16_7.xxx * u_xlat16_24.xyz;
        u_xlat16_24.xyz = u_xlat8.xxx * u_xlat16_24.xyz;
        u_xlat16_24.xyz = clamp(u_xlat16_24.xyz, 0.0, 1.0);
        u_xlat0.x = (-u_xlat27) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_11.x = (-u_xlat16_45.y) + 1.0;
        u_xlat16_11.x = u_xlat16_11.x * u_xlat16_11.x;
        u_xlat16_11.x = u_xlat16_11.x * 0.899999976 + 0.100000001;
        u_xlat16_28.xyz = u_xlat10_12.www * _customMatcapCol.xyz;
        u_xlat16_28.xyz = (bool(u_xlatb10)) ? u_xlat16_28.xyz : u_xlat16_14.xyz;
        u_xlat1.x = u_xlat27 + _customMatcapFresnelRange;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat18 = u_xlatb10 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat18 * u_xlat1.x + 1.0;
        u_xlat16_64 = (u_xlatb10) ? 1.0 : 0.0;
        u_xlat16_14.x = (-u_xlat0.x) + 1.0;
        u_xlat16_14.x = u_xlat16_64 * u_xlat16_14.x + u_xlat0.x;
        u_xlat16_31 = (-_inDirectSpeStr) + 1.0;
        u_xlat16_64 = u_xlat16_64 * u_xlat16_31 + _inDirectSpeStr;
        u_xlat16_64 = u_xlat10_10.w * u_xlat16_64;
        u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(u_xlat16_64);
        u_xlat16_28.xyz = u_xlat16_14.xxx * u_xlat16_28.xyz;
        u_xlat16_11.xyz = u_xlat16_11.xxx * u_xlat16_28.xyz;
        u_xlat16_62 = (-u_xlat16_56) + 1.21000004;
        u_xlat16_62 = min(u_xlat16_62, 1.0);
        u_xlat16_11.xyz = vec3(u_xlat16_62) * u_xlat16_11.xyz;
        u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(vec3(_speStr, _speStr, _speStr)) + u_xlat16_11.xyz;
        u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat1.xxx + u_xlat16_24.xyz;
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
        if(u_xlatb0){
            u_xlat16_24.xy = u_xlat3.xy + (-u_xlat25.xz);
            u_xlat16_24.xy = _throughSkinSpeDir.ww * u_xlat16_24.xy + u_xlat25.xz;
            u_xlat16_24.xy = u_xlat16_24.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_24.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat10_0 = texture2D(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_24.x = u_xlat10_0 * 0.349999994;
            u_xlat16_56 = (-u_xlat16_56) + 1.0;
            u_xlat16_56 = u_xlat16_56 * u_xlat16_24.x;
            u_xlat16_56 = u_xlat16_7.x * u_xlat16_56;
            u_xlat16_13.xyz = vec3(u_xlat16_56) * _SkinEffectCol.xyz + u_xlat16_13.xyz;
        }
    }
    u_xlat16_1.w = u_xlat10_37.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat3.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat3.x + _EmisstionParams.x;
    u_xlat3.xyz = u_xlat16_5.xyz * _EmisstionColor.xyz;
    u_xlat16_5.x = (-u_xlat10_37.y) + 1.0;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat16_5.xxx;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat0.xxx + u_xlat16_13.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3);
    u_xlat8.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
    u_xlat42.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat8.xy;
    u_xlat42.xy = u_xlat42.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_9.xyz = texture2D(_LG_Tex, u_xlat42.xy).xyz;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat8.xy).w;
    u_xlat16_5.xyz = u_xlat10_9.xyz * vec3(_LG_Intensity);
    u_xlat16_5.xyz = vec3(u_xlat10_0) * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat3.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
    if(u_xlatb0){
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
        u_xlat3.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat37.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat3.xy;
        u_xlat37.xy = u_xlat37.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat10_8.xyz = texture2D(_LG_Tex2, u_xlat37.xy).xyz;
        u_xlat10_0 = texture2D(_LG_Tex2, u_xlat3.xy).w;
        u_xlat16_5.xyz = u_xlat10_8.xyz * vec3(_LG_Intensity2);
        u_xlat16_5.xyz = vec3(u_xlat10_0) * u_xlat16_5.xyz;
        u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color2.x, _LG_Color2.y, _LG_Color2.z) + u_xlat16_1.xyz;
    }
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
    u_xlat16_4.w = 1.0;
    u_xlat16_1 = (bool(u_xlatb0)) ? u_xlat16_4 : u_xlat16_1;
    u_xlat3.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat8.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat8.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat0.xz = u_xlat17.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat17.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat17.zz + u_xlat0.xy;
    u_xlat34.xy = u_xlat8.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat34.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat8.xx + u_xlat34.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat8.zz + u_xlat34.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_39 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_39);
    u_xlat16_5 = u_xlat0 * u_xlat16_5.xxzz;
    u_xlat16_5.x = dot(u_xlat16_5.xy, u_xlat16_5.zw);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _ColorScaleByLightDir;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_22.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_22.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_22.xy + u_xlat0.xy;
    u_xlat16_56 = dot(u_xlat16_22.xy, u_xlat16_22.xy);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_22.xy = vec2(u_xlat16_56) * u_xlat16_22.xy;
    u_xlat16_22.xy = u_xlat16_22.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_22.xy * u_xlat0.xx + u_xlat3.xy;
    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb0 = 0.5<_pointLightOn;
    u_xlat17.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat17.x = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat17.x = sqrt(u_xlat17.x);
    u_xlat16_56 = u_xlat17.x + 9.99999975e-05;
    u_xlat16_56 = log2(u_xlat16_56);
    u_xlat16_56 = u_xlat16_56 * _pointLightAtten;
    u_xlat16_56 = exp2(u_xlat16_56);
    u_xlat16_56 = float(1.0) / u_xlat16_56;
    u_xlat16_7.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_7.x = u_xlat17.x / u_xlat16_7.x;
    u_xlat16_7.x = min(u_xlat16_7.x, 1.0);
    u_xlat16_7.x = u_xlat16_7.x + -0.800000012;
    u_xlat16_7.x = u_xlat16_7.x * 5.00000048;
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_24.x = u_xlat16_7.x * -2.0 + 3.0;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
    u_xlat16_7.x = (-u_xlat16_24.x) * u_xlat16_7.x + 1.0;
    u_xlat16_24.xyz = vec3(u_xlat16_56) * _pointLightColor.xyz;
    u_xlat16_7.xyz = u_xlat16_24.xyz * u_xlat16_7.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_7.xyz : u_xlat16_5.xyz;
    SV_Target0.w = u_xlat16_1.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_LG_ON" "_USE_GRADUAL" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_VAR_LIUUV0;
highp  vec4 phase0_Output0_8;
out highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD5.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    phase0_Output0_8 = in_TEXCOORD2.xyxy;
vs_VAR_LIUUV0 = phase0_Output0_8.xy;
vs_TEXCOORD9 = phase0_Output0_8.zw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _NormalStr;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _ShowRamp;
uniform 	mediump float _selfShadowAdjust;
uniform 	mediump float _metallic;
uniform 	mediump float _roughness;
uniform 	mediump float _speStr;
uniform 	mediump float _inDirectSpeStr;
uniform 	mediump float _ClearCoat;
uniform 	mediump float _ClearCoatPow;
uniform 	mediump float _ClearCoatStrength;
uniform 	mediump float _ClearCoatTileScale;
uniform 	mediump float _ClearNovPow;
uniform 	mediump float _ClearCoatMatcapStr;
uniform 	mediump float _ClearCoatMatcapA;
uniform 	mediump float _customMatcapFresnelRange;
uniform 	mediump vec3 _customMatcapCol;
uniform 	mediump float _SkinThroughOn;
uniform 	mediump vec3 _SkinEffectCol;
uniform 	mediump vec4 _throughSkinSpeDir;
uniform 	mediump float _showGradual;
uniform 	mediump float _gradualRange;
uniform 	mediump float _gradualOffset;
uniform 	mediump vec4 _gradualColor;
uniform 	mediump float _gradualSaturation;
uniform 	mediump float _useUv3;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump float _useUv32;
uniform 	mediump float _useLg2;
uniform 	float _U_LG2;
uniform 	float _V_LG2;
uniform 	mediump float _LG_Intensity2;
uniform 	mediump vec3 _LG_Color2;
uniform 	mediump vec4 _LG_Tex2_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ShadowOffsetTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(6) uniform mediump sampler2D _PBRTexture;
UNITY_LOCATION(7) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _ClearCoatTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinEffectTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(11) uniform mediump sampler2D _LG_Tex2;
UNITY_LOCATION(12) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_VAR_LIUUV0;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
bool u_xlatb10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
float u_xlat17;
mediump vec2 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
vec2 u_xlat26;
mediump float u_xlat16_29;
vec2 u_xlat32;
vec2 u_xlat34;
vec2 u_xlat35;
mediump vec2 u_xlat16_35;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump vec2 u_xlat16_39;
vec2 u_xlat40;
bool u_xlatb40;
float u_xlat49;
float u_xlat50;
mediump float u_xlat16_50;
bool u_xlatb50;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
bool u_xlatb56;
bool u_xlatb57;
mediump float u_xlat16_60;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat16.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat49 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat49 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat2.xyz = vec3(u_xlat49) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4.x = (-_USE3UV_ON) + 1.0;
    u_xlat35.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat35.xy = vs_TEXCOORD0.xy * u_xlat16_4.xx + u_xlat35.xy;
    u_xlat16_4 = texture(_MainTex, u_xlat35.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_50 = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_53 = u_xlat16_50 + -1.0;
    u_xlat16_53 = _InSideLineStrength * u_xlat16_53 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_53) * u_xlat16_6.xyz;
    u_xlat50 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_54 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_54 = u_xlat16_53 * u_xlat16_54 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_53) + (-vec3(u_xlat50));
    u_xlat8.xyz = vec3(u_xlat16_54) * u_xlat8.xyz + vec3(u_xlat50);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_6.xyz = u_xlat8.xyz * vec3(u_xlat16_53) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_53) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat50 = vs_TEXCOORD9.x / _gradualOffset;
    u_xlat50 = max(u_xlat50, 0.00999999978);
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _gradualRange;
    u_xlat50 = exp2(u_xlat50);
    u_xlat50 = min(u_xlat50, 1.0);
    u_xlat16_6.xyz = _gradualColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = vec3(u_xlat50) * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat50 = dot(u_xlat16_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat8.xyz = (-vec3(u_xlat50)) + u_xlat16_6.xyz;
    u_xlat8.xyz = vec3(_gradualSaturation) * u_xlat8.xyz + vec3(u_xlat50);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_showGradual));
#else
    u_xlatb50 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_showGradual);
#endif
    u_xlat16_5.xyz = (bool(u_xlatb50)) ? u_xlat8.xyz : u_xlat16_5.xyz;
    u_xlat16_35.xy = texture(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat40.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat50 = (-u_xlat40.x) * u_xlat40.x + 1.0;
    u_xlat50 = (-u_xlat40.y) * u_xlat40.y + u_xlat50;
    u_xlat50 = sqrt(u_xlat50);
    u_xlat9.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat16.zxy * u_xlat9.yzx;
    u_xlat10.xyz = u_xlat16.yzx * u_xlat9.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat40.yyy * u_xlat10.xyz;
    u_xlat9.xyz = u_xlat40.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat9.xyz = vec3(u_xlat50) * u_xlat16.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat9.xyz = vec3(_NormalStr) * u_xlat9.xyz + u_xlat16.xyz;
    u_xlat16_53 = (-u_xlat16_4.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat16_6.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_22.x = _ShadowThreshold + 0.5;
    u_xlat16_50 = texture(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat50 = u_xlat16_50 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.99000001<u_xlat16_53);
#else
    u_xlatb40 = 0.99000001<u_xlat16_53;
#endif
    u_xlat16_38 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_38 = (u_xlatb40) ? u_xlat16_38 : 0.0;
    u_xlat16_38 = u_xlat16_38 + _selfShadowAdjust;
    u_xlat50 = u_xlat16_53 * u_xlat16_38 + u_xlat50;
    u_xlat50 = u_xlat50 + u_xlat16_22.x;
    u_xlat16_22.x = u_xlat50 + (-_ShadowFeather);
    u_xlat16_38 = u_xlat50 + _ShadowFeather;
    u_xlat16_38 = (-u_xlat16_22.x) + u_xlat16_38;
    u_xlat16_22.x = (-u_xlat16_22.x) + u_xlat16_6.x;
    u_xlat16_38 = float(1.0) / u_xlat16_38;
    u_xlat16_22.x = u_xlat16_38 * u_xlat16_22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_22.x * -2.0 + 3.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_38;
    u_xlat16_8.x = min(u_xlat16_22.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.96875>=u_xlat8.y);
#else
    u_xlatb50 = 0.96875>=u_xlat8.y;
#endif
    u_xlat8.x = u_xlat16_8.x;
    u_xlat16_24.xyz = texture(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_22.xyz = u_xlat16_24.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_22.xyz = u_xlat16_24.xyz * u_xlat16_22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_22.xyz * u_xlat16_24.xyz;
    u_xlat16_22.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_22.xyz = vec3(_RampDifLerpValue) * u_xlat16_22.xyz + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_22.xyz * _DarkColor.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _LightAreaColor.xyz + (-u_xlat16_7.xyz);
    u_xlat16_22.xyz = u_xlat8.xxx * u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlat24.xy = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat24.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat24.xy;
    u_xlat24.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat24.xy;
    u_xlat16_7.xy = u_xlat24.xy + vec2(1.0, 1.0);
    u_xlat16_39.x = u_xlat3.y * 0.100000001;
    u_xlat10.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat10.y = u_xlat16_39.x * _matCapSpeEffectedByLightDir;
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.5, 0.5) + (-u_xlat10.xy);
    u_xlat16_10 = texture(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_39.xy = u_xlat16_10.yx * vec2(_metallic, _roughness);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39.xy = min(max(u_xlat16_39.xy, 0.0), 1.0);
#else
    u_xlat16_39.xy = clamp(u_xlat16_39.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.100000001>=u_xlat16_10.z);
#else
    u_xlatb56 = 0.100000001>=u_xlat16_10.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat));
#else
    u_xlatb57 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
#endif
    u_xlatb56 = u_xlatb56 && u_xlatb57;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.100000001<u_xlat16_10.z);
#else
    u_xlatb57 = 0.100000001<u_xlat16_10.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_10.z<0.449999988);
#else
    u_xlatb10 = u_xlat16_10.z<0.449999988;
#endif
    u_xlatb57 = u_xlatb57 && u_xlatb10;
    u_xlatb10 = u_xlatb56 || u_xlatb57;
    u_xlat16_11.x = u_xlat16_39.y * 6.0;
    u_xlat16_11.x = (u_xlatb10) ? 0.0 : u_xlat16_11.x;
    u_xlat16_11 = textureLod(_MatcapTex, u_xlat16_7.xy, u_xlat16_11.x);
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    if(u_xlatb56){
        u_xlat16_7.x = log2(u_xlat10.x);
        u_xlat16_7.x = u_xlat16_7.x * _ClearNovPow;
        u_xlat16_7.x = exp2(u_xlat16_7.x);
        u_xlat26.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat16_56 = texture(_ClearCoatTex, u_xlat26.xy).x;
        u_xlat16_23.x = log2(u_xlat16_56);
        u_xlat16_23.x = u_xlat16_23.x * _ClearCoatPow;
        u_xlat16_23.x = exp2(u_xlat16_23.x);
        u_xlat16_23.x = u_xlat16_23.x * _ClearCoatStrength;
        u_xlat16_7.x = u_xlat16_7.x * u_xlat16_23.x;
        u_xlat16_23.x = (-u_xlat16_53) + 1.21000004;
        u_xlat16_23.x = min(u_xlat16_23.x, 1.0);
        u_xlat16_7.x = u_xlat16_23.x * u_xlat16_7.x;
        u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_12.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_12.xyz = u_xlat16_7.xxx * u_xlat16_12.xyz;
        u_xlat16_12.xyz = u_xlat16_6.xxx * u_xlat16_12.xyz;
        u_xlat16_12.xyz = u_xlat16_10.www * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb56 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA));
#else
        u_xlatb56 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
#endif
        u_xlat16_14.xyz = u_xlat16_11.www * u_xlat16_12.xyz;
        u_xlat16_12.xyz = (bool(u_xlatb56)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
        u_xlat16_12.xyz = u_xlat16_22.xyz + u_xlat16_12.xyz;
    } else {
        u_xlat16_6.x = (-u_xlat16_39.x) + 1.0;
        u_xlat16_12.xyz = u_xlat16_6.xxx * u_xlat16_22.xyz;
    }
    if(u_xlatb50){
        u_xlat16_6.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
        u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
        u_xlat15.xyz = u_xlat16_5.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat15.xyz = u_xlat16_39.xxx * u_xlat15.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat49) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat9.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat16_22.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_22.y = u_xlat16_39.y * u_xlat16_39.y;
        u_xlat16_22.xz = u_xlat16_22.xy * u_xlat16_22.xy;
        u_xlat16_38 = u_xlat16_22.y * u_xlat16_22.y + -1.0;
        u_xlat16_22.x = u_xlat16_22.x * u_xlat16_38 + 1.0;
        u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
        u_xlat16_22.x = u_xlat16_22.z / u_xlat16_22.x;
        u_xlat16_22.x = u_xlat16_22.x * 0.318309873;
        u_xlat16_38 = (-u_xlat10.x) * u_xlat16_22.z + u_xlat10.x;
        u_xlat16_38 = u_xlat10.x * u_xlat16_38 + u_xlat16_22.z;
        u_xlat16_38 = sqrt(u_xlat16_38);
        u_xlat16_38 = u_xlat16_38 + u_xlat10.x;
        u_xlat16_7.x = (-u_xlat16_6.x) * u_xlat16_22.z + u_xlat16_6.x;
        u_xlat16_54 = u_xlat16_6.x * u_xlat16_7.x + u_xlat16_22.z;
        u_xlat16_54 = sqrt(u_xlat16_54);
        u_xlat16_54 = u_xlat16_54 + u_xlat16_6.x;
        u_xlat16_38 = u_xlat16_54 * u_xlat16_38;
        u_xlat16_38 = float(1.0) / u_xlat16_38;
        u_xlat16_54 = (-u_xlat1.x) + 1.0;
        u_xlat16_7.x = u_xlat16_54 * u_xlat16_54;
        u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
        u_xlat16_23.x = u_xlat16_54 * u_xlat16_7.x;
        u_xlat16_39.x = u_xlat15.y * 50.0;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_39.x = min(max(u_xlat16_39.x, 0.0), 1.0);
#else
        u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
#endif
        u_xlat16_54 = (-u_xlat16_7.x) * u_xlat16_54 + 1.0;
        u_xlat16_14.xyz = u_xlat15.xyz * vec3(u_xlat16_54);
        u_xlat16_7.xyz = u_xlat16_39.xxx * u_xlat16_23.xxx + u_xlat16_14.xyz;
        u_xlat16_22.x = u_xlat16_22.x * u_xlat16_38;
        u_xlat16_22.xyz = u_xlat16_7.xyz * u_xlat16_22.xxx;
        u_xlat16_22.xyz = u_xlat16_6.xxx * u_xlat16_22.xyz;
        u_xlat16_22.xyz = u_xlat8.xxx * u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_22.xyz = min(max(u_xlat16_22.xyz, 0.0), 1.0);
#else
        u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
#endif
        u_xlat0.x = (-u_xlat10.x) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_7.x = (-u_xlat16_39.y) + 1.0;
        u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
        u_xlat16_7.x = u_xlat16_7.x * 0.899999976 + 0.100000001;
        u_xlat16_23.xyz = u_xlat16_11.www * _customMatcapCol.xyz;
        u_xlat16_23.xyz = (bool(u_xlatb57)) ? u_xlat16_23.xyz : u_xlat16_13.xyz;
        u_xlat1.x = u_xlat10.x + _customMatcapFresnelRange;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat17 = u_xlatb57 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat17 * u_xlat1.x + 1.0;
        u_xlat16_60 = (u_xlatb57) ? 1.0 : 0.0;
        u_xlat16_13.x = (-u_xlat0.x) + 1.0;
        u_xlat16_13.x = u_xlat16_60 * u_xlat16_13.x + u_xlat0.x;
        u_xlat16_29 = (-_inDirectSpeStr) + 1.0;
        u_xlat16_60 = u_xlat16_60 * u_xlat16_29 + _inDirectSpeStr;
        u_xlat16_60 = u_xlat16_10.w * u_xlat16_60;
        u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(u_xlat16_60);
        u_xlat16_23.xyz = u_xlat16_13.xxx * u_xlat16_23.xyz;
        u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat16_23.xyz;
        u_xlat16_55 = (-u_xlat16_53) + 1.21000004;
        u_xlat16_55 = min(u_xlat16_55, 1.0);
        u_xlat16_7.xyz = vec3(u_xlat16_55) * u_xlat16_7.xyz;
        u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(vec3(_speStr, _speStr, _speStr)) + u_xlat16_7.xyz;
        u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat1.xxx + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn));
#else
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
#endif
        if(u_xlatb0){
            u_xlat16_22.xy = u_xlat3.xy + (-u_xlat24.xy);
            u_xlat16_22.xy = _throughSkinSpeDir.ww * u_xlat16_22.xy + u_xlat24.xy;
            u_xlat16_22.xy = u_xlat16_22.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_22.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat16_0 = texture(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_22.x = u_xlat16_0 * 0.349999994;
            u_xlat16_53 = (-u_xlat16_53) + 1.0;
            u_xlat16_53 = u_xlat16_53 * u_xlat16_22.x;
            u_xlat16_53 = u_xlat16_6.x * u_xlat16_53;
            u_xlat16_12.xyz = vec3(u_xlat16_53) * _SkinEffectCol.xyz + u_xlat16_12.xyz;
        }
    }
    u_xlat16_1.w = u_xlat16_35.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat2.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat2.x + _EmisstionParams.x;
    u_xlat2.xyz = u_xlat16_5.xyz * _EmisstionColor.xyz;
    u_xlat16_5.x = (-u_xlat16_35.y) + 1.0;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3);
#endif
    u_xlat3.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
    u_xlat35.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_8.xyz = texture(_LG_Tex, u_xlat35.xy).xyz;
    u_xlat16_0 = texture(_LG_Tex, u_xlat3.xy).w;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(_LG_Intensity);
    u_xlat16_5.xyz = vec3(u_xlat16_0) * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
#endif
    if(u_xlatb0){
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32));
#else
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
#endif
        u_xlat2.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat34.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat2.xy;
        u_xlat34.xy = u_xlat34.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat16_3.xyz = texture(_LG_Tex2, u_xlat34.xy).xyz;
        u_xlat16_0 = texture(_LG_Tex2, u_xlat2.xy).w;
        u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(_LG_Intensity2);
        u_xlat16_5.xyz = vec3(u_xlat16_0) * u_xlat16_5.xyz;
        u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color2.x, _LG_Color2.y, _LG_Color2.z) + u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
#endif
    u_xlat16_4.w = 1.0;
    u_xlat16_1 = (bool(u_xlatb0)) ? u_xlat16_4 : u_xlat16_1;
    u_xlat2.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat3.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xz = u_xlat16.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat16.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat16.zz + u_xlat0.xy;
    u_xlat32.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat32.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat3.xx + u_xlat32.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat3.zz + u_xlat32.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_37 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_37);
    u_xlat16_5 = u_xlat0 * u_xlat16_5.xxzz;
    u_xlat16_5.x = dot(u_xlat16_5.xy, u_xlat16_5.zw);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _ColorScaleByLightDir;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_21.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_21.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_21.xy + u_xlat0.xy;
    u_xlat16_53 = dot(u_xlat16_21.xy, u_xlat16_21.xy);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_21.xy = vec2(u_xlat16_53) * u_xlat16_21.xy;
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_21.xy * u_xlat0.xx + u_xlat2.xy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=_depthSubThreshold);
#else
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_pointLightOn);
#else
    u_xlatb0 = 0.5<_pointLightOn;
#endif
    u_xlat16.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat16.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16.x = sqrt(u_xlat16.x);
    u_xlat16_53 = u_xlat16.x + 9.99999975e-05;
    u_xlat16_53 = log2(u_xlat16_53);
    u_xlat16_53 = u_xlat16_53 * _pointLightAtten;
    u_xlat16_53 = exp2(u_xlat16_53);
    u_xlat16_53 = float(1.0) / u_xlat16_53;
    u_xlat16_6.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_6.x = u_xlat16.x / u_xlat16_6.x;
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x + -0.800000012;
    u_xlat16_6.x = u_xlat16_6.x * 5.00000048;
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_22.x = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = (-u_xlat16_22.x) * u_xlat16_6.x + 1.0;
    u_xlat16_22.xyz = vec3(u_xlat16_53) * _pointLightColor.xyz;
    u_xlat16_6.xyz = u_xlat16_22.xyz * u_xlat16_6.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    SV_Target0.w = u_xlat16_1.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_LG_ON" "_USE_GRADUAL" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_VAR_LIUUV0;
highp  vec4 phase0_Output0_8;
out highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD5.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    phase0_Output0_8 = in_TEXCOORD2.xyxy;
vs_VAR_LIUUV0 = phase0_Output0_8.xy;
vs_TEXCOORD9 = phase0_Output0_8.zw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _NormalStr;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _ShowRamp;
uniform 	mediump float _selfShadowAdjust;
uniform 	mediump float _metallic;
uniform 	mediump float _roughness;
uniform 	mediump float _speStr;
uniform 	mediump float _inDirectSpeStr;
uniform 	mediump float _ClearCoat;
uniform 	mediump float _ClearCoatPow;
uniform 	mediump float _ClearCoatStrength;
uniform 	mediump float _ClearCoatTileScale;
uniform 	mediump float _ClearNovPow;
uniform 	mediump float _ClearCoatMatcapStr;
uniform 	mediump float _ClearCoatMatcapA;
uniform 	mediump float _customMatcapFresnelRange;
uniform 	mediump vec3 _customMatcapCol;
uniform 	mediump float _SkinThroughOn;
uniform 	mediump vec3 _SkinEffectCol;
uniform 	mediump vec4 _throughSkinSpeDir;
uniform 	mediump float _showGradual;
uniform 	mediump float _gradualRange;
uniform 	mediump float _gradualOffset;
uniform 	mediump vec4 _gradualColor;
uniform 	mediump float _gradualSaturation;
uniform 	mediump float _useUv3;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump float _useUv32;
uniform 	mediump float _useLg2;
uniform 	float _U_LG2;
uniform 	float _V_LG2;
uniform 	mediump float _LG_Intensity2;
uniform 	mediump vec3 _LG_Color2;
uniform 	mediump vec4 _LG_Tex2_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(4) uniform mediump sampler2D _ShadowOffsetTex;
UNITY_LOCATION(5) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(6) uniform mediump sampler2D _PBRTexture;
UNITY_LOCATION(7) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(8) uniform mediump sampler2D _ClearCoatTex;
UNITY_LOCATION(9) uniform mediump sampler2D _SkinEffectTex;
UNITY_LOCATION(10) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(11) uniform mediump sampler2D _LG_Tex2;
UNITY_LOCATION(12) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_VAR_LIUUV0;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
bool u_xlatb10;
mediump vec4 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
float u_xlat17;
mediump vec2 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
mediump vec3 u_xlat16_24;
vec2 u_xlat26;
mediump float u_xlat16_29;
vec2 u_xlat32;
vec2 u_xlat34;
vec2 u_xlat35;
mediump vec2 u_xlat16_35;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump vec2 u_xlat16_39;
vec2 u_xlat40;
bool u_xlatb40;
float u_xlat49;
float u_xlat50;
mediump float u_xlat16_50;
bool u_xlatb50;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
bool u_xlatb56;
bool u_xlatb57;
mediump float u_xlat16_60;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat16.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat49 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat49 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat2.xyz = vec3(u_xlat49) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4.x = (-_USE3UV_ON) + 1.0;
    u_xlat35.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat35.xy = vs_TEXCOORD0.xy * u_xlat16_4.xx + u_xlat35.xy;
    u_xlat16_4 = texture(_MainTex, u_xlat35.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_50 = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_53 = u_xlat16_50 + -1.0;
    u_xlat16_53 = _InSideLineStrength * u_xlat16_53 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_53) * u_xlat16_6.xyz;
    u_xlat50 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_54 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_54 = u_xlat16_53 * u_xlat16_54 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_53) + (-vec3(u_xlat50));
    u_xlat8.xyz = vec3(u_xlat16_54) * u_xlat8.xyz + vec3(u_xlat50);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_6.xyz = u_xlat8.xyz * vec3(u_xlat16_53) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_53) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat50 = vs_TEXCOORD9.x / _gradualOffset;
    u_xlat50 = max(u_xlat50, 0.00999999978);
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _gradualRange;
    u_xlat50 = exp2(u_xlat50);
    u_xlat50 = min(u_xlat50, 1.0);
    u_xlat16_6.xyz = _gradualColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = vec3(u_xlat50) * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat50 = dot(u_xlat16_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat8.xyz = (-vec3(u_xlat50)) + u_xlat16_6.xyz;
    u_xlat8.xyz = vec3(_gradualSaturation) * u_xlat8.xyz + vec3(u_xlat50);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_showGradual));
#else
    u_xlatb50 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_showGradual);
#endif
    u_xlat16_5.xyz = (bool(u_xlatb50)) ? u_xlat8.xyz : u_xlat16_5.xyz;
    u_xlat16_35.xy = texture(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat40.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat50 = (-u_xlat40.x) * u_xlat40.x + 1.0;
    u_xlat50 = (-u_xlat40.y) * u_xlat40.y + u_xlat50;
    u_xlat50 = sqrt(u_xlat50);
    u_xlat9.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat16.zxy * u_xlat9.yzx;
    u_xlat10.xyz = u_xlat16.yzx * u_xlat9.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat40.yyy * u_xlat10.xyz;
    u_xlat9.xyz = u_xlat40.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat9.xyz = vec3(u_xlat50) * u_xlat16.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat9.xyz = vec3(_NormalStr) * u_xlat9.xyz + u_xlat16.xyz;
    u_xlat16_53 = (-u_xlat16_4.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat16_6.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_22.x = _ShadowThreshold + 0.5;
    u_xlat16_50 = texture(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat50 = u_xlat16_50 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.99000001<u_xlat16_53);
#else
    u_xlatb40 = 0.99000001<u_xlat16_53;
#endif
    u_xlat16_38 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_38 = (u_xlatb40) ? u_xlat16_38 : 0.0;
    u_xlat16_38 = u_xlat16_38 + _selfShadowAdjust;
    u_xlat50 = u_xlat16_53 * u_xlat16_38 + u_xlat50;
    u_xlat50 = u_xlat50 + u_xlat16_22.x;
    u_xlat16_22.x = u_xlat50 + (-_ShadowFeather);
    u_xlat16_38 = u_xlat50 + _ShadowFeather;
    u_xlat16_38 = (-u_xlat16_22.x) + u_xlat16_38;
    u_xlat16_22.x = (-u_xlat16_22.x) + u_xlat16_6.x;
    u_xlat16_38 = float(1.0) / u_xlat16_38;
    u_xlat16_22.x = u_xlat16_38 * u_xlat16_22.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22.x = min(max(u_xlat16_22.x, 0.0), 1.0);
#else
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_22.x * -2.0 + 3.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_38;
    u_xlat16_8.x = min(u_xlat16_22.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(0.96875>=u_xlat8.y);
#else
    u_xlatb50 = 0.96875>=u_xlat8.y;
#endif
    u_xlat8.x = u_xlat16_8.x;
    u_xlat16_24.xyz = texture(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_22.xyz = u_xlat16_24.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_22.xyz = u_xlat16_24.xyz * u_xlat16_22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_22.xyz * u_xlat16_24.xyz;
    u_xlat16_22.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_22.xyz = vec3(_RampDifLerpValue) * u_xlat16_22.xyz + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_22.xyz * _DarkColor.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _LightAreaColor.xyz + (-u_xlat16_7.xyz);
    u_xlat16_22.xyz = u_xlat8.xxx * u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlat24.xy = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat24.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat24.xy;
    u_xlat24.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat24.xy;
    u_xlat16_7.xy = u_xlat24.xy + vec2(1.0, 1.0);
    u_xlat16_39.x = u_xlat3.y * 0.100000001;
    u_xlat10.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat10.y = u_xlat16_39.x * _matCapSpeEffectedByLightDir;
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.5, 0.5) + (-u_xlat10.xy);
    u_xlat16_10 = texture(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_39.xy = u_xlat16_10.yx * vec2(_metallic, _roughness);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39.xy = min(max(u_xlat16_39.xy, 0.0), 1.0);
#else
    u_xlat16_39.xy = clamp(u_xlat16_39.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.100000001>=u_xlat16_10.z);
#else
    u_xlatb56 = 0.100000001>=u_xlat16_10.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat));
#else
    u_xlatb57 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
#endif
    u_xlatb56 = u_xlatb56 && u_xlatb57;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(0.100000001<u_xlat16_10.z);
#else
    u_xlatb57 = 0.100000001<u_xlat16_10.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_10.z<0.449999988);
#else
    u_xlatb10 = u_xlat16_10.z<0.449999988;
#endif
    u_xlatb57 = u_xlatb57 && u_xlatb10;
    u_xlatb10 = u_xlatb56 || u_xlatb57;
    u_xlat16_11.x = u_xlat16_39.y * 6.0;
    u_xlat16_11.x = (u_xlatb10) ? 0.0 : u_xlat16_11.x;
    u_xlat16_11 = textureLod(_MatcapTex, u_xlat16_7.xy, u_xlat16_11.x);
    u_xlat16_12.xyz = u_xlat16_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    if(u_xlatb56){
        u_xlat16_7.x = log2(u_xlat10.x);
        u_xlat16_7.x = u_xlat16_7.x * _ClearNovPow;
        u_xlat16_7.x = exp2(u_xlat16_7.x);
        u_xlat26.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat16_56 = texture(_ClearCoatTex, u_xlat26.xy).x;
        u_xlat16_23.x = log2(u_xlat16_56);
        u_xlat16_23.x = u_xlat16_23.x * _ClearCoatPow;
        u_xlat16_23.x = exp2(u_xlat16_23.x);
        u_xlat16_23.x = u_xlat16_23.x * _ClearCoatStrength;
        u_xlat16_7.x = u_xlat16_7.x * u_xlat16_23.x;
        u_xlat16_23.x = (-u_xlat16_53) + 1.21000004;
        u_xlat16_23.x = min(u_xlat16_23.x, 1.0);
        u_xlat16_7.x = u_xlat16_23.x * u_xlat16_7.x;
        u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_12.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_12.xyz = u_xlat16_7.xxx * u_xlat16_12.xyz;
        u_xlat16_12.xyz = u_xlat16_6.xxx * u_xlat16_12.xyz;
        u_xlat16_12.xyz = u_xlat16_10.www * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb56 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA));
#else
        u_xlatb56 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
#endif
        u_xlat16_14.xyz = u_xlat16_11.www * u_xlat16_12.xyz;
        u_xlat16_12.xyz = (bool(u_xlatb56)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
        u_xlat16_12.xyz = u_xlat16_22.xyz + u_xlat16_12.xyz;
    } else {
        u_xlat16_6.x = (-u_xlat16_39.x) + 1.0;
        u_xlat16_12.xyz = u_xlat16_6.xxx * u_xlat16_22.xyz;
    }
    if(u_xlatb50){
        u_xlat16_6.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
        u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
        u_xlat15.xyz = u_xlat16_5.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat15.xyz = u_xlat16_39.xxx * u_xlat15.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat49) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat9.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat16_22.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_22.y = u_xlat16_39.y * u_xlat16_39.y;
        u_xlat16_22.xz = u_xlat16_22.xy * u_xlat16_22.xy;
        u_xlat16_38 = u_xlat16_22.y * u_xlat16_22.y + -1.0;
        u_xlat16_22.x = u_xlat16_22.x * u_xlat16_38 + 1.0;
        u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
        u_xlat16_22.x = u_xlat16_22.z / u_xlat16_22.x;
        u_xlat16_22.x = u_xlat16_22.x * 0.318309873;
        u_xlat16_38 = (-u_xlat10.x) * u_xlat16_22.z + u_xlat10.x;
        u_xlat16_38 = u_xlat10.x * u_xlat16_38 + u_xlat16_22.z;
        u_xlat16_38 = sqrt(u_xlat16_38);
        u_xlat16_38 = u_xlat16_38 + u_xlat10.x;
        u_xlat16_7.x = (-u_xlat16_6.x) * u_xlat16_22.z + u_xlat16_6.x;
        u_xlat16_54 = u_xlat16_6.x * u_xlat16_7.x + u_xlat16_22.z;
        u_xlat16_54 = sqrt(u_xlat16_54);
        u_xlat16_54 = u_xlat16_54 + u_xlat16_6.x;
        u_xlat16_38 = u_xlat16_54 * u_xlat16_38;
        u_xlat16_38 = float(1.0) / u_xlat16_38;
        u_xlat16_54 = (-u_xlat1.x) + 1.0;
        u_xlat16_7.x = u_xlat16_54 * u_xlat16_54;
        u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
        u_xlat16_23.x = u_xlat16_54 * u_xlat16_7.x;
        u_xlat16_39.x = u_xlat15.y * 50.0;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_39.x = min(max(u_xlat16_39.x, 0.0), 1.0);
#else
        u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
#endif
        u_xlat16_54 = (-u_xlat16_7.x) * u_xlat16_54 + 1.0;
        u_xlat16_14.xyz = u_xlat15.xyz * vec3(u_xlat16_54);
        u_xlat16_7.xyz = u_xlat16_39.xxx * u_xlat16_23.xxx + u_xlat16_14.xyz;
        u_xlat16_22.x = u_xlat16_22.x * u_xlat16_38;
        u_xlat16_22.xyz = u_xlat16_7.xyz * u_xlat16_22.xxx;
        u_xlat16_22.xyz = u_xlat16_6.xxx * u_xlat16_22.xyz;
        u_xlat16_22.xyz = u_xlat8.xxx * u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_22.xyz = min(max(u_xlat16_22.xyz, 0.0), 1.0);
#else
        u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
#endif
        u_xlat0.x = (-u_xlat10.x) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_7.x = (-u_xlat16_39.y) + 1.0;
        u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
        u_xlat16_7.x = u_xlat16_7.x * 0.899999976 + 0.100000001;
        u_xlat16_23.xyz = u_xlat16_11.www * _customMatcapCol.xyz;
        u_xlat16_23.xyz = (bool(u_xlatb57)) ? u_xlat16_23.xyz : u_xlat16_13.xyz;
        u_xlat1.x = u_xlat10.x + _customMatcapFresnelRange;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat17 = u_xlatb57 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat17 * u_xlat1.x + 1.0;
        u_xlat16_60 = (u_xlatb57) ? 1.0 : 0.0;
        u_xlat16_13.x = (-u_xlat0.x) + 1.0;
        u_xlat16_13.x = u_xlat16_60 * u_xlat16_13.x + u_xlat0.x;
        u_xlat16_29 = (-_inDirectSpeStr) + 1.0;
        u_xlat16_60 = u_xlat16_60 * u_xlat16_29 + _inDirectSpeStr;
        u_xlat16_60 = u_xlat16_10.w * u_xlat16_60;
        u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(u_xlat16_60);
        u_xlat16_23.xyz = u_xlat16_13.xxx * u_xlat16_23.xyz;
        u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat16_23.xyz;
        u_xlat16_55 = (-u_xlat16_53) + 1.21000004;
        u_xlat16_55 = min(u_xlat16_55, 1.0);
        u_xlat16_7.xyz = vec3(u_xlat16_55) * u_xlat16_7.xyz;
        u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(vec3(_speStr, _speStr, _speStr)) + u_xlat16_7.xyz;
        u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat1.xxx + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn));
#else
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
#endif
        if(u_xlatb0){
            u_xlat16_22.xy = u_xlat3.xy + (-u_xlat24.xy);
            u_xlat16_22.xy = _throughSkinSpeDir.ww * u_xlat16_22.xy + u_xlat24.xy;
            u_xlat16_22.xy = u_xlat16_22.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_22.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat16_0 = texture(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_22.x = u_xlat16_0 * 0.349999994;
            u_xlat16_53 = (-u_xlat16_53) + 1.0;
            u_xlat16_53 = u_xlat16_53 * u_xlat16_22.x;
            u_xlat16_53 = u_xlat16_6.x * u_xlat16_53;
            u_xlat16_12.xyz = vec3(u_xlat16_53) * _SkinEffectCol.xyz + u_xlat16_12.xyz;
        }
    }
    u_xlat16_1.w = u_xlat16_35.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat2.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat2.x + _EmisstionParams.x;
    u_xlat2.xyz = u_xlat16_5.xyz * _EmisstionColor.xyz;
    u_xlat16_5.x = (-u_xlat16_35.y) + 1.0;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3);
#endif
    u_xlat3.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
    u_xlat35.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_8.xyz = texture(_LG_Tex, u_xlat35.xy).xyz;
    u_xlat16_0 = texture(_LG_Tex, u_xlat3.xy).w;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(_LG_Intensity);
    u_xlat16_5.xyz = vec3(u_xlat16_0) * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
#endif
    if(u_xlatb0){
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32));
#else
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
#endif
        u_xlat2.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat34.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat2.xy;
        u_xlat34.xy = u_xlat34.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat16_3.xyz = texture(_LG_Tex2, u_xlat34.xy).xyz;
        u_xlat16_0 = texture(_LG_Tex2, u_xlat2.xy).w;
        u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(_LG_Intensity2);
        u_xlat16_5.xyz = vec3(u_xlat16_0) * u_xlat16_5.xyz;
        u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color2.x, _LG_Color2.y, _LG_Color2.z) + u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
#endif
    u_xlat16_4.w = 1.0;
    u_xlat16_1 = (bool(u_xlatb0)) ? u_xlat16_4 : u_xlat16_1;
    u_xlat2.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat3.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xz = u_xlat16.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat16.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat16.zz + u_xlat0.xy;
    u_xlat32.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat32.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat3.xx + u_xlat32.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat3.zz + u_xlat32.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_37 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_37);
    u_xlat16_5 = u_xlat0 * u_xlat16_5.xxzz;
    u_xlat16_5.x = dot(u_xlat16_5.xy, u_xlat16_5.zw);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _ColorScaleByLightDir;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_21.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_21.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_21.xy + u_xlat0.xy;
    u_xlat16_53 = dot(u_xlat16_21.xy, u_xlat16_21.xy);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_21.xy = vec2(u_xlat16_53) * u_xlat16_21.xy;
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_21.xy * u_xlat0.xx + u_xlat2.xy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=_depthSubThreshold);
#else
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_pointLightOn);
#else
    u_xlatb0 = 0.5<_pointLightOn;
#endif
    u_xlat16.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat16.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16.x = sqrt(u_xlat16.x);
    u_xlat16_53 = u_xlat16.x + 9.99999975e-05;
    u_xlat16_53 = log2(u_xlat16_53);
    u_xlat16_53 = u_xlat16_53 * _pointLightAtten;
    u_xlat16_53 = exp2(u_xlat16_53);
    u_xlat16_53 = float(1.0) / u_xlat16_53;
    u_xlat16_6.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_6.x = u_xlat16.x / u_xlat16_6.x;
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x + -0.800000012;
    u_xlat16_6.x = u_xlat16_6.x * 5.00000048;
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_22.x = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = (-u_xlat16_22.x) * u_xlat16_6.x + 1.0;
    u_xlat16_22.xyz = vec3(u_xlat16_53) * _pointLightColor.xyz;
    u_xlat16_6.xyz = u_xlat16_22.xyz * u_xlat16_6.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    SV_Target0.w = u_xlat16_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_LG_ON" "_USE_GRADUAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
highp  vec4 phase0_Output0_8;
varying highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD5.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    phase0_Output0_8 = in_TEXCOORD2.xyxy;
vs_VAR_LIUUV0 = phase0_Output0_8.xy;
vs_TEXCOORD9 = phase0_Output0_8.zw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _NormalStr;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _ShowRamp;
uniform 	mediump float _selfShadowAdjust;
uniform 	mediump float _metallic;
uniform 	mediump float _roughness;
uniform 	mediump float _speStr;
uniform 	mediump float _inDirectSpeStr;
uniform 	mediump float _ClearCoat;
uniform 	mediump float _ClearCoatPow;
uniform 	mediump float _ClearCoatStrength;
uniform 	mediump float _ClearCoatTileScale;
uniform 	mediump float _ClearNovPow;
uniform 	mediump float _ClearCoatMatcapStr;
uniform 	mediump float _ClearCoatMatcapA;
uniform 	mediump float _customMatcapFresnelRange;
uniform 	mediump vec3 _customMatcapCol;
uniform 	mediump float _SkinThroughOn;
uniform 	mediump vec3 _SkinEffectCol;
uniform 	mediump vec4 _throughSkinSpeDir;
uniform 	mediump float _showGradual;
uniform 	mediump float _gradualRange;
uniform 	mediump float _gradualOffset;
uniform 	mediump vec4 _gradualColor;
uniform 	mediump float _gradualSaturation;
uniform 	mediump float _useUv3;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump float _useUv32;
uniform 	mediump float _useLg2;
uniform 	float _U_LG2;
uniform 	float _V_LG2;
uniform 	mediump float _LG_Intensity2;
uniform 	mediump vec3 _LG_Color2;
uniform 	mediump vec4 _LG_Tex2_ST;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _ShadowOffsetTex;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _PBRTexture;
uniform lowp sampler2D _MatcapTex;
uniform lowp sampler2D _ClearCoatTex;
uniform lowp sampler2D _SkinEffectTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Tex2;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
bool u_xlatb10;
mediump float u_xlat16_11;
lowp vec4 u_xlat10_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
float u_xlat17;
mediump vec2 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
lowp vec3 u_xlat10_24;
vec2 u_xlat26;
mediump float u_xlat16_29;
vec2 u_xlat32;
vec2 u_xlat34;
vec2 u_xlat35;
lowp vec2 u_xlat10_35;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump vec2 u_xlat16_39;
vec2 u_xlat40;
bool u_xlatb40;
float u_xlat49;
float u_xlat50;
lowp float u_xlat10_50;
bool u_xlatb50;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
lowp float u_xlat10_56;
bool u_xlatb56;
bool u_xlatb57;
mediump float u_xlat16_60;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat16.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat49 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat49 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat2.xyz = vec3(u_xlat49) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4.x = (-_USE3UV_ON) + 1.0;
    u_xlat35.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat35.xy = vs_TEXCOORD0.xy * u_xlat16_4.xx + u_xlat35.xy;
    u_xlat10_4 = texture2D(_MainTex, u_xlat35.xy);
    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz;
    u_xlat10_50 = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_53 = u_xlat10_50 + -1.0;
    u_xlat16_53 = _InSideLineStrength * u_xlat16_53 + 1.0;
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_53) * u_xlat16_6.xyz;
    u_xlat50 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_54 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_54 = u_xlat16_53 * u_xlat16_54 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_53) + (-vec3(u_xlat50));
    u_xlat8.xyz = vec3(u_xlat16_54) * u_xlat8.xyz + vec3(u_xlat50);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_6.xyz = u_xlat8.xyz * vec3(u_xlat16_53) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_53) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat50 = vs_TEXCOORD9.x / _gradualOffset;
    u_xlat50 = max(u_xlat50, 0.00999999978);
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _gradualRange;
    u_xlat50 = exp2(u_xlat50);
    u_xlat50 = min(u_xlat50, 1.0);
    u_xlat16_6.xyz = _gradualColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = vec3(u_xlat50) * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat50 = dot(u_xlat16_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat8.xyz = (-vec3(u_xlat50)) + u_xlat16_6.xyz;
    u_xlat8.xyz = vec3(_gradualSaturation) * u_xlat8.xyz + vec3(u_xlat50);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat8.xyz;
    u_xlatb50 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_showGradual);
    u_xlat16_5.xyz = (bool(u_xlatb50)) ? u_xlat8.xyz : u_xlat16_5.xyz;
    u_xlat10_35.xy = texture2D(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture2D(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat40.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat50 = (-u_xlat40.x) * u_xlat40.x + 1.0;
    u_xlat50 = (-u_xlat40.y) * u_xlat40.y + u_xlat50;
    u_xlat50 = sqrt(u_xlat50);
    u_xlat9.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat16.zxy * u_xlat9.yzx;
    u_xlat10.xyz = u_xlat16.yzx * u_xlat9.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat40.yyy * u_xlat10.xyz;
    u_xlat9.xyz = u_xlat40.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat9.xyz = vec3(u_xlat50) * u_xlat16.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat9.xyz = vec3(_NormalStr) * u_xlat9.xyz + u_xlat16.xyz;
    u_xlat16_53 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat16_6.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_22.x = _ShadowThreshold + 0.5;
    u_xlat10_50 = texture2D(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat50 = u_xlat10_50 + -0.5;
    u_xlatb40 = 0.99000001<u_xlat16_53;
    u_xlat16_38 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_38 = (u_xlatb40) ? u_xlat16_38 : 0.0;
    u_xlat16_38 = u_xlat16_38 + _selfShadowAdjust;
    u_xlat50 = u_xlat16_53 * u_xlat16_38 + u_xlat50;
    u_xlat50 = u_xlat50 + u_xlat16_22.x;
    u_xlat16_22.x = u_xlat50 + (-_ShadowFeather);
    u_xlat16_38 = u_xlat50 + _ShadowFeather;
    u_xlat16_38 = (-u_xlat16_22.x) + u_xlat16_38;
    u_xlat16_22.x = (-u_xlat16_22.x) + u_xlat16_6.x;
    u_xlat16_38 = float(1.0) / u_xlat16_38;
    u_xlat16_22.x = u_xlat16_38 * u_xlat16_22.x;
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
    u_xlat16_38 = u_xlat16_22.x * -2.0 + 3.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_38;
    u_xlat16_8 = min(u_xlat16_22.x, 1.0);
    u_xlatb50 = 0.96875>=u_xlat8.y;
    u_xlat8.x = u_xlat16_8;
    u_xlat10_24.xyz = texture2D(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_22.xyz = u_xlat10_24.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_22.xyz = u_xlat10_24.xyz * u_xlat16_22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_22.xyz * u_xlat10_24.xyz;
    u_xlat16_22.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_22.xyz = vec3(_RampDifLerpValue) * u_xlat16_22.xyz + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_22.xyz * _DarkColor.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _LightAreaColor.xyz + (-u_xlat16_7.xyz);
    u_xlat16_22.xyz = u_xlat8.xxx * u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlat24.xy = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat24.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat24.xy;
    u_xlat24.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat24.xy;
    u_xlat16_7.xy = u_xlat24.xy + vec2(1.0, 1.0);
    u_xlat16_39.x = u_xlat3.y * 0.100000001;
    u_xlat10.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat10.y = u_xlat16_39.x * _matCapSpeEffectedByLightDir;
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.5, 0.5) + (-u_xlat10.xy);
    u_xlat10_10 = texture2D(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_39.xy = u_xlat10_10.yx * vec2(_metallic, _roughness);
    u_xlat16_39.xy = clamp(u_xlat16_39.xy, 0.0, 1.0);
    u_xlatb56 = 0.100000001>=u_xlat10_10.z;
    u_xlatb57 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
    u_xlatb56 = u_xlatb56 && u_xlatb57;
    u_xlatb57 = 0.100000001<u_xlat10_10.z;
    u_xlatb10 = u_xlat10_10.z<0.449999988;
    u_xlatb57 = u_xlatb57 && u_xlatb10;
    u_xlatb10 = u_xlatb56 || u_xlatb57;
    u_xlat16_11 = u_xlat16_39.y * 6.0;
    u_xlat16_11 = (u_xlatb10) ? 0.0 : u_xlat16_11;
    u_xlat10_11 = texture2DLodEXT(_MatcapTex, u_xlat16_7.xy, u_xlat16_11);
    u_xlat16_12.xyz = u_xlat10_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat10_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat10_11.xyz * u_xlat16_12.xyz;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat1.xyz);
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
    if(u_xlatb56){
        u_xlat16_7.x = log2(u_xlat10.x);
        u_xlat16_7.x = u_xlat16_7.x * _ClearNovPow;
        u_xlat16_7.x = exp2(u_xlat16_7.x);
        u_xlat26.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat10_56 = texture2D(_ClearCoatTex, u_xlat26.xy).x;
        u_xlat16_23.x = log2(u_xlat10_56);
        u_xlat16_23.x = u_xlat16_23.x * _ClearCoatPow;
        u_xlat16_23.x = exp2(u_xlat16_23.x);
        u_xlat16_23.x = u_xlat16_23.x * _ClearCoatStrength;
        u_xlat16_7.x = u_xlat16_7.x * u_xlat16_23.x;
        u_xlat16_23.x = (-u_xlat16_53) + 1.21000004;
        u_xlat16_23.x = min(u_xlat16_23.x, 1.0);
        u_xlat16_7.x = u_xlat16_23.x * u_xlat16_7.x;
        u_xlat16_12.xyz = u_xlat10_11.xyz * u_xlat16_12.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_12.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_12.xyz = u_xlat16_7.xxx * u_xlat16_12.xyz;
        u_xlat16_12.xyz = u_xlat16_6.xxx * u_xlat16_12.xyz;
        u_xlat16_12.xyz = u_xlat10_10.www * u_xlat16_12.xyz;
        u_xlatb56 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
        u_xlat16_14.xyz = u_xlat10_11.www * u_xlat16_12.xyz;
        u_xlat16_12.xyz = (bool(u_xlatb56)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
        u_xlat16_12.xyz = u_xlat16_22.xyz + u_xlat16_12.xyz;
    } else {
        u_xlat16_6.x = (-u_xlat16_39.x) + 1.0;
        u_xlat16_12.xyz = u_xlat16_6.xxx * u_xlat16_22.xyz;
    }
    if(u_xlatb50){
        u_xlat16_6.x = u_xlat0.x;
        u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
        u_xlat15.xyz = u_xlat16_5.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat15.xyz = u_xlat16_39.xxx * u_xlat15.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat49) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat9.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat16_22.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_22.y = u_xlat16_39.y * u_xlat16_39.y;
        u_xlat16_22.xz = u_xlat16_22.xy * u_xlat16_22.xy;
        u_xlat16_38 = u_xlat16_22.y * u_xlat16_22.y + -1.0;
        u_xlat16_22.x = u_xlat16_22.x * u_xlat16_38 + 1.0;
        u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
        u_xlat16_22.x = u_xlat16_22.z / u_xlat16_22.x;
        u_xlat16_22.x = u_xlat16_22.x * 0.318309873;
        u_xlat16_38 = (-u_xlat10.x) * u_xlat16_22.z + u_xlat10.x;
        u_xlat16_38 = u_xlat10.x * u_xlat16_38 + u_xlat16_22.z;
        u_xlat16_38 = sqrt(u_xlat16_38);
        u_xlat16_38 = u_xlat16_38 + u_xlat10.x;
        u_xlat16_7.x = (-u_xlat16_6.x) * u_xlat16_22.z + u_xlat16_6.x;
        u_xlat16_54 = u_xlat16_6.x * u_xlat16_7.x + u_xlat16_22.z;
        u_xlat16_54 = sqrt(u_xlat16_54);
        u_xlat16_54 = u_xlat16_54 + u_xlat16_6.x;
        u_xlat16_38 = u_xlat16_54 * u_xlat16_38;
        u_xlat16_38 = float(1.0) / u_xlat16_38;
        u_xlat16_54 = (-u_xlat1.x) + 1.0;
        u_xlat16_7.x = u_xlat16_54 * u_xlat16_54;
        u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
        u_xlat16_23.x = u_xlat16_54 * u_xlat16_7.x;
        u_xlat16_39.x = u_xlat15.y * 50.0;
        u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
        u_xlat16_54 = (-u_xlat16_7.x) * u_xlat16_54 + 1.0;
        u_xlat16_14.xyz = u_xlat15.xyz * vec3(u_xlat16_54);
        u_xlat16_7.xyz = u_xlat16_39.xxx * u_xlat16_23.xxx + u_xlat16_14.xyz;
        u_xlat16_22.x = u_xlat16_22.x * u_xlat16_38;
        u_xlat16_22.xyz = u_xlat16_7.xyz * u_xlat16_22.xxx;
        u_xlat16_22.xyz = u_xlat16_6.xxx * u_xlat16_22.xyz;
        u_xlat16_22.xyz = u_xlat8.xxx * u_xlat16_22.xyz;
        u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
        u_xlat0.x = (-u_xlat10.x) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_7.x = (-u_xlat16_39.y) + 1.0;
        u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
        u_xlat16_7.x = u_xlat16_7.x * 0.899999976 + 0.100000001;
        u_xlat16_23.xyz = u_xlat10_11.www * _customMatcapCol.xyz;
        u_xlat16_23.xyz = (bool(u_xlatb57)) ? u_xlat16_23.xyz : u_xlat16_13.xyz;
        u_xlat1.x = u_xlat10.x + _customMatcapFresnelRange;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat17 = u_xlatb57 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat17 * u_xlat1.x + 1.0;
        u_xlat16_60 = (u_xlatb57) ? 1.0 : 0.0;
        u_xlat16_13.x = (-u_xlat0.x) + 1.0;
        u_xlat16_13.x = u_xlat16_60 * u_xlat16_13.x + u_xlat0.x;
        u_xlat16_29 = (-_inDirectSpeStr) + 1.0;
        u_xlat16_60 = u_xlat16_60 * u_xlat16_29 + _inDirectSpeStr;
        u_xlat16_60 = u_xlat10_10.w * u_xlat16_60;
        u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(u_xlat16_60);
        u_xlat16_23.xyz = u_xlat16_13.xxx * u_xlat16_23.xyz;
        u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat16_23.xyz;
        u_xlat16_55 = (-u_xlat16_53) + 1.21000004;
        u_xlat16_55 = min(u_xlat16_55, 1.0);
        u_xlat16_7.xyz = vec3(u_xlat16_55) * u_xlat16_7.xyz;
        u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(vec3(_speStr, _speStr, _speStr)) + u_xlat16_7.xyz;
        u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat1.xxx + u_xlat16_22.xyz;
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
        if(u_xlatb0){
            u_xlat16_22.xy = u_xlat3.xy + (-u_xlat24.xy);
            u_xlat16_22.xy = _throughSkinSpeDir.ww * u_xlat16_22.xy + u_xlat24.xy;
            u_xlat16_22.xy = u_xlat16_22.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_22.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat10_0 = texture2D(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_22.x = u_xlat10_0 * 0.349999994;
            u_xlat16_53 = (-u_xlat16_53) + 1.0;
            u_xlat16_53 = u_xlat16_53 * u_xlat16_22.x;
            u_xlat16_53 = u_xlat16_6.x * u_xlat16_53;
            u_xlat16_12.xyz = vec3(u_xlat16_53) * _SkinEffectCol.xyz + u_xlat16_12.xyz;
        }
    }
    u_xlat16_1.w = u_xlat10_35.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat2.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat2.x + _EmisstionParams.x;
    u_xlat2.xyz = u_xlat16_5.xyz * _EmisstionColor.xyz;
    u_xlat16_5.x = (-u_xlat10_35.y) + 1.0;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat16_12.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3);
    u_xlat3.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
    u_xlat35.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_8.xyz = texture2D(_LG_Tex, u_xlat35.xy).xyz;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat3.xy).w;
    u_xlat16_5.xyz = u_xlat10_8.xyz * vec3(_LG_Intensity);
    u_xlat16_5.xyz = vec3(u_xlat10_0) * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat2.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
    if(u_xlatb0){
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
        u_xlat2.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat34.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat2.xy;
        u_xlat34.xy = u_xlat34.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat10_3.xyz = texture2D(_LG_Tex2, u_xlat34.xy).xyz;
        u_xlat10_0 = texture2D(_LG_Tex2, u_xlat2.xy).w;
        u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(_LG_Intensity2);
        u_xlat16_5.xyz = vec3(u_xlat10_0) * u_xlat16_5.xyz;
        u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color2.x, _LG_Color2.y, _LG_Color2.z) + u_xlat16_1.xyz;
    }
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
    u_xlat16_4.w = 1.0;
    u_xlat16_1 = (bool(u_xlatb0)) ? u_xlat16_4 : u_xlat16_1;
    u_xlat2.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat3.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xz = u_xlat16.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat16.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat16.zz + u_xlat0.xy;
    u_xlat32.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat32.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat3.xx + u_xlat32.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat3.zz + u_xlat32.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_37 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_37);
    u_xlat16_5 = u_xlat0 * u_xlat16_5.xxzz;
    u_xlat16_5.x = dot(u_xlat16_5.xy, u_xlat16_5.zw);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _ColorScaleByLightDir;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_21.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_21.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_21.xy + u_xlat0.xy;
    u_xlat16_53 = dot(u_xlat16_21.xy, u_xlat16_21.xy);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_21.xy = vec2(u_xlat16_53) * u_xlat16_21.xy;
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_21.xy * u_xlat0.xx + u_xlat2.xy;
    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb0 = 0.5<_pointLightOn;
    u_xlat16.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat16.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16.x = sqrt(u_xlat16.x);
    u_xlat16_53 = u_xlat16.x + 9.99999975e-05;
    u_xlat16_53 = log2(u_xlat16_53);
    u_xlat16_53 = u_xlat16_53 * _pointLightAtten;
    u_xlat16_53 = exp2(u_xlat16_53);
    u_xlat16_53 = float(1.0) / u_xlat16_53;
    u_xlat16_6.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_6.x = u_xlat16.x / u_xlat16_6.x;
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x + -0.800000012;
    u_xlat16_6.x = u_xlat16_6.x * 5.00000048;
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_22.x = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = (-u_xlat16_22.x) * u_xlat16_6.x + 1.0;
    u_xlat16_22.xyz = vec3(u_xlat16_53) * _pointLightColor.xyz;
    u_xlat16_6.xyz = u_xlat16_22.xyz * u_xlat16_6.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    SV_Target0.w = u_xlat16_1.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_LG_ON" "_USE_GRADUAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
highp  vec4 phase0_Output0_8;
varying highp vec2 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD5.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD5.w = in_TANGENT0.w * unity_WorldTransformParams.w;
    phase0_Output0_8 = in_TEXCOORD2.xyxy;
vs_VAR_LIUUV0 = phase0_Output0_8.xy;
vs_TEXCOORD9 = phase0_Output0_8.zw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _pointLightPos;
uniform 	mediump vec4 _pointLightColor;
uniform 	mediump float _pointLightOn;
uniform 	mediump float _pointLightRange;
uniform 	mediump float _pointLightAtten;
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump vec4 _depthRimOffset;
uniform 	mediump vec4 _InSideLineColor;
uniform 	mediump float _InSideLineSaturation;
uniform 	mediump float _InSideLineStrength;
uniform 	mediump vec4 _EmisstionColor;
uniform 	mediump vec4 _EmisstionParams;
uniform 	mediump float _NormalStr;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _ShowRamp;
uniform 	mediump float _selfShadowAdjust;
uniform 	mediump float _metallic;
uniform 	mediump float _roughness;
uniform 	mediump float _speStr;
uniform 	mediump float _inDirectSpeStr;
uniform 	mediump float _ClearCoat;
uniform 	mediump float _ClearCoatPow;
uniform 	mediump float _ClearCoatStrength;
uniform 	mediump float _ClearCoatTileScale;
uniform 	mediump float _ClearNovPow;
uniform 	mediump float _ClearCoatMatcapStr;
uniform 	mediump float _ClearCoatMatcapA;
uniform 	mediump float _customMatcapFresnelRange;
uniform 	mediump vec3 _customMatcapCol;
uniform 	mediump float _SkinThroughOn;
uniform 	mediump vec3 _SkinEffectCol;
uniform 	mediump vec4 _throughSkinSpeDir;
uniform 	mediump float _showGradual;
uniform 	mediump float _gradualRange;
uniform 	mediump float _gradualOffset;
uniform 	mediump vec4 _gradualColor;
uniform 	mediump float _gradualSaturation;
uniform 	mediump float _useUv3;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump float _useUv32;
uniform 	mediump float _useLg2;
uniform 	float _U_LG2;
uniform 	float _V_LG2;
uniform 	mediump float _LG_Intensity2;
uniform 	mediump vec3 _LG_Color2;
uniform 	mediump vec4 _LG_Tex2_ST;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _ShadowOffsetTex;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _PBRTexture;
uniform lowp sampler2D _MatcapTex;
uniform lowp sampler2D _ClearCoatTex;
uniform lowp sampler2D _SkinEffectTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Tex2;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
bool u_xlatb10;
mediump float u_xlat16_11;
lowp vec4 u_xlat10_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
float u_xlat17;
mediump vec2 u_xlat16_21;
mediump vec3 u_xlat16_22;
mediump vec3 u_xlat16_23;
vec2 u_xlat24;
lowp vec3 u_xlat10_24;
vec2 u_xlat26;
mediump float u_xlat16_29;
vec2 u_xlat32;
vec2 u_xlat34;
vec2 u_xlat35;
lowp vec2 u_xlat10_35;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
mediump vec2 u_xlat16_39;
vec2 u_xlat40;
bool u_xlatb40;
float u_xlat49;
float u_xlat50;
lowp float u_xlat10_50;
bool u_xlatb50;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
lowp float u_xlat10_56;
bool u_xlatb56;
bool u_xlatb57;
mediump float u_xlat16_60;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat16.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat49 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat1.xyz = vec3(u_xlat49) * u_xlat1.xyz;
    u_xlat49 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat49 = inversesqrt(u_xlat49);
    u_xlat2.xyz = vec3(u_xlat49) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4.x = (-_USE3UV_ON) + 1.0;
    u_xlat35.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat35.xy = vs_TEXCOORD0.xy * u_xlat16_4.xx + u_xlat35.xy;
    u_xlat10_4 = texture2D(_MainTex, u_xlat35.xy);
    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz;
    u_xlat10_50 = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_53 = u_xlat10_50 + -1.0;
    u_xlat16_53 = _InSideLineStrength * u_xlat16_53 + 1.0;
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_53) * u_xlat16_6.xyz;
    u_xlat50 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_54 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_54 = u_xlat16_53 * u_xlat16_54 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_53) + (-vec3(u_xlat50));
    u_xlat8.xyz = vec3(u_xlat16_54) * u_xlat8.xyz + vec3(u_xlat50);
    u_xlat16_53 = (-u_xlat16_53) + 1.0;
    u_xlat16_6.xyz = u_xlat8.xyz * vec3(u_xlat16_53) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_53) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat50 = vs_TEXCOORD9.x / _gradualOffset;
    u_xlat50 = max(u_xlat50, 0.00999999978);
    u_xlat50 = log2(u_xlat50);
    u_xlat50 = u_xlat50 * _gradualRange;
    u_xlat50 = exp2(u_xlat50);
    u_xlat50 = min(u_xlat50, 1.0);
    u_xlat16_6.xyz = _gradualColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6.xyz = vec3(u_xlat50) * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat50 = dot(u_xlat16_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat8.xyz = (-vec3(u_xlat50)) + u_xlat16_6.xyz;
    u_xlat8.xyz = vec3(_gradualSaturation) * u_xlat8.xyz + vec3(u_xlat50);
    u_xlat8.xyz = max(u_xlat8.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat8.xyz;
    u_xlatb50 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_showGradual);
    u_xlat16_5.xyz = (bool(u_xlatb50)) ? u_xlat8.xyz : u_xlat16_5.xyz;
    u_xlat10_35.xy = texture2D(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture2D(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat40.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat50 = (-u_xlat40.x) * u_xlat40.x + 1.0;
    u_xlat50 = (-u_xlat40.y) * u_xlat40.y + u_xlat50;
    u_xlat50 = sqrt(u_xlat50);
    u_xlat9.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat16.zxy * u_xlat9.yzx;
    u_xlat10.xyz = u_xlat16.yzx * u_xlat9.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat10.xyz = u_xlat40.yyy * u_xlat10.xyz;
    u_xlat9.xyz = u_xlat40.xxx * u_xlat9.xyz + u_xlat10.xyz;
    u_xlat9.xyz = vec3(u_xlat50) * u_xlat16.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat9.xyz = vec3(_NormalStr) * u_xlat9.xyz + u_xlat16.xyz;
    u_xlat16_53 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat2.xyz);
    u_xlat16_6.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_22.x = _ShadowThreshold + 0.5;
    u_xlat10_50 = texture2D(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat50 = u_xlat10_50 + -0.5;
    u_xlatb40 = 0.99000001<u_xlat16_53;
    u_xlat16_38 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_38 = (u_xlatb40) ? u_xlat16_38 : 0.0;
    u_xlat16_38 = u_xlat16_38 + _selfShadowAdjust;
    u_xlat50 = u_xlat16_53 * u_xlat16_38 + u_xlat50;
    u_xlat50 = u_xlat50 + u_xlat16_22.x;
    u_xlat16_22.x = u_xlat50 + (-_ShadowFeather);
    u_xlat16_38 = u_xlat50 + _ShadowFeather;
    u_xlat16_38 = (-u_xlat16_22.x) + u_xlat16_38;
    u_xlat16_22.x = (-u_xlat16_22.x) + u_xlat16_6.x;
    u_xlat16_38 = float(1.0) / u_xlat16_38;
    u_xlat16_22.x = u_xlat16_38 * u_xlat16_22.x;
    u_xlat16_22.x = clamp(u_xlat16_22.x, 0.0, 1.0);
    u_xlat16_38 = u_xlat16_22.x * -2.0 + 3.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_38;
    u_xlat16_8 = min(u_xlat16_22.x, 1.0);
    u_xlatb50 = 0.96875>=u_xlat8.y;
    u_xlat8.x = u_xlat16_8;
    u_xlat10_24.xyz = texture2D(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_22.xyz = u_xlat10_24.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_22.xyz = u_xlat10_24.xyz * u_xlat16_22.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_22.xyz * u_xlat10_24.xyz;
    u_xlat16_22.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_22.xyz = vec3(_RampDifLerpValue) * u_xlat16_22.xyz + u_xlat16_5.xyz;
    u_xlat16_7.xyz = u_xlat16_22.xyz * _DarkColor.xyz;
    u_xlat16_22.xyz = u_xlat16_22.xyz * _LightAreaColor.xyz + (-u_xlat16_7.xyz);
    u_xlat16_22.xyz = u_xlat8.xxx * u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlat24.xy = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat24.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat24.xy;
    u_xlat24.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat24.xy;
    u_xlat16_7.xy = u_xlat24.xy + vec2(1.0, 1.0);
    u_xlat16_39.x = u_xlat3.y * 0.100000001;
    u_xlat10.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat10.y = u_xlat16_39.x * _matCapSpeEffectedByLightDir;
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.5, 0.5) + (-u_xlat10.xy);
    u_xlat10_10 = texture2D(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_39.xy = u_xlat10_10.yx * vec2(_metallic, _roughness);
    u_xlat16_39.xy = clamp(u_xlat16_39.xy, 0.0, 1.0);
    u_xlatb56 = 0.100000001>=u_xlat10_10.z;
    u_xlatb57 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
    u_xlatb56 = u_xlatb56 && u_xlatb57;
    u_xlatb57 = 0.100000001<u_xlat10_10.z;
    u_xlatb10 = u_xlat10_10.z<0.449999988;
    u_xlatb57 = u_xlatb57 && u_xlatb10;
    u_xlatb10 = u_xlatb56 || u_xlatb57;
    u_xlat16_11 = u_xlat16_39.y * 6.0;
    u_xlat16_11 = (u_xlatb10) ? 0.0 : u_xlat16_11;
    u_xlat10_11 = texture2DLodEXT(_MatcapTex, u_xlat16_7.xy, u_xlat16_11);
    u_xlat16_12.xyz = u_xlat10_11.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat10_11.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat10_11.xyz * u_xlat16_12.xyz;
    u_xlat10.x = dot(u_xlat9.xyz, u_xlat1.xyz);
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
    if(u_xlatb56){
        u_xlat16_7.x = log2(u_xlat10.x);
        u_xlat16_7.x = u_xlat16_7.x * _ClearNovPow;
        u_xlat16_7.x = exp2(u_xlat16_7.x);
        u_xlat26.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat10_56 = texture2D(_ClearCoatTex, u_xlat26.xy).x;
        u_xlat16_23.x = log2(u_xlat10_56);
        u_xlat16_23.x = u_xlat16_23.x * _ClearCoatPow;
        u_xlat16_23.x = exp2(u_xlat16_23.x);
        u_xlat16_23.x = u_xlat16_23.x * _ClearCoatStrength;
        u_xlat16_7.x = u_xlat16_7.x * u_xlat16_23.x;
        u_xlat16_23.x = (-u_xlat16_53) + 1.21000004;
        u_xlat16_23.x = min(u_xlat16_23.x, 1.0);
        u_xlat16_7.x = u_xlat16_23.x * u_xlat16_7.x;
        u_xlat16_12.xyz = u_xlat10_11.xyz * u_xlat16_12.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_12.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_12.xyz = u_xlat16_7.xxx * u_xlat16_12.xyz;
        u_xlat16_12.xyz = u_xlat16_6.xxx * u_xlat16_12.xyz;
        u_xlat16_12.xyz = u_xlat10_10.www * u_xlat16_12.xyz;
        u_xlatb56 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
        u_xlat16_14.xyz = u_xlat10_11.www * u_xlat16_12.xyz;
        u_xlat16_12.xyz = (bool(u_xlatb56)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
        u_xlat16_12.xyz = u_xlat16_22.xyz + u_xlat16_12.xyz;
    } else {
        u_xlat16_6.x = (-u_xlat16_39.x) + 1.0;
        u_xlat16_12.xyz = u_xlat16_6.xxx * u_xlat16_22.xyz;
    }
    if(u_xlatb50){
        u_xlat16_6.x = u_xlat0.x;
        u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
        u_xlat15.xyz = u_xlat16_5.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat15.xyz = u_xlat16_39.xxx * u_xlat15.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat49) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat9.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat16_22.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_22.y = u_xlat16_39.y * u_xlat16_39.y;
        u_xlat16_22.xz = u_xlat16_22.xy * u_xlat16_22.xy;
        u_xlat16_38 = u_xlat16_22.y * u_xlat16_22.y + -1.0;
        u_xlat16_22.x = u_xlat16_22.x * u_xlat16_38 + 1.0;
        u_xlat16_22.x = u_xlat16_22.x * u_xlat16_22.x;
        u_xlat16_22.x = u_xlat16_22.z / u_xlat16_22.x;
        u_xlat16_22.x = u_xlat16_22.x * 0.318309873;
        u_xlat16_38 = (-u_xlat10.x) * u_xlat16_22.z + u_xlat10.x;
        u_xlat16_38 = u_xlat10.x * u_xlat16_38 + u_xlat16_22.z;
        u_xlat16_38 = sqrt(u_xlat16_38);
        u_xlat16_38 = u_xlat16_38 + u_xlat10.x;
        u_xlat16_7.x = (-u_xlat16_6.x) * u_xlat16_22.z + u_xlat16_6.x;
        u_xlat16_54 = u_xlat16_6.x * u_xlat16_7.x + u_xlat16_22.z;
        u_xlat16_54 = sqrt(u_xlat16_54);
        u_xlat16_54 = u_xlat16_54 + u_xlat16_6.x;
        u_xlat16_38 = u_xlat16_54 * u_xlat16_38;
        u_xlat16_38 = float(1.0) / u_xlat16_38;
        u_xlat16_54 = (-u_xlat1.x) + 1.0;
        u_xlat16_7.x = u_xlat16_54 * u_xlat16_54;
        u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
        u_xlat16_23.x = u_xlat16_54 * u_xlat16_7.x;
        u_xlat16_39.x = u_xlat15.y * 50.0;
        u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
        u_xlat16_54 = (-u_xlat16_7.x) * u_xlat16_54 + 1.0;
        u_xlat16_14.xyz = u_xlat15.xyz * vec3(u_xlat16_54);
        u_xlat16_7.xyz = u_xlat16_39.xxx * u_xlat16_23.xxx + u_xlat16_14.xyz;
        u_xlat16_22.x = u_xlat16_22.x * u_xlat16_38;
        u_xlat16_22.xyz = u_xlat16_7.xyz * u_xlat16_22.xxx;
        u_xlat16_22.xyz = u_xlat16_6.xxx * u_xlat16_22.xyz;
        u_xlat16_22.xyz = u_xlat8.xxx * u_xlat16_22.xyz;
        u_xlat16_22.xyz = clamp(u_xlat16_22.xyz, 0.0, 1.0);
        u_xlat0.x = (-u_xlat10.x) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_7.x = (-u_xlat16_39.y) + 1.0;
        u_xlat16_7.x = u_xlat16_7.x * u_xlat16_7.x;
        u_xlat16_7.x = u_xlat16_7.x * 0.899999976 + 0.100000001;
        u_xlat16_23.xyz = u_xlat10_11.www * _customMatcapCol.xyz;
        u_xlat16_23.xyz = (bool(u_xlatb57)) ? u_xlat16_23.xyz : u_xlat16_13.xyz;
        u_xlat1.x = u_xlat10.x + _customMatcapFresnelRange;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat17 = u_xlatb57 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat17 * u_xlat1.x + 1.0;
        u_xlat16_60 = (u_xlatb57) ? 1.0 : 0.0;
        u_xlat16_13.x = (-u_xlat0.x) + 1.0;
        u_xlat16_13.x = u_xlat16_60 * u_xlat16_13.x + u_xlat0.x;
        u_xlat16_29 = (-_inDirectSpeStr) + 1.0;
        u_xlat16_60 = u_xlat16_60 * u_xlat16_29 + _inDirectSpeStr;
        u_xlat16_60 = u_xlat10_10.w * u_xlat16_60;
        u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(u_xlat16_60);
        u_xlat16_23.xyz = u_xlat16_13.xxx * u_xlat16_23.xyz;
        u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat16_23.xyz;
        u_xlat16_55 = (-u_xlat16_53) + 1.21000004;
        u_xlat16_55 = min(u_xlat16_55, 1.0);
        u_xlat16_7.xyz = vec3(u_xlat16_55) * u_xlat16_7.xyz;
        u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(vec3(_speStr, _speStr, _speStr)) + u_xlat16_7.xyz;
        u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat1.xxx + u_xlat16_22.xyz;
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
        if(u_xlatb0){
            u_xlat16_22.xy = u_xlat3.xy + (-u_xlat24.xy);
            u_xlat16_22.xy = _throughSkinSpeDir.ww * u_xlat16_22.xy + u_xlat24.xy;
            u_xlat16_22.xy = u_xlat16_22.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_22.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat10_0 = texture2D(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_22.x = u_xlat10_0 * 0.349999994;
            u_xlat16_53 = (-u_xlat16_53) + 1.0;
            u_xlat16_53 = u_xlat16_53 * u_xlat16_22.x;
            u_xlat16_53 = u_xlat16_6.x * u_xlat16_53;
            u_xlat16_12.xyz = vec3(u_xlat16_53) * _SkinEffectCol.xyz + u_xlat16_12.xyz;
        }
    }
    u_xlat16_1.w = u_xlat10_35.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat2.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat2.x + _EmisstionParams.x;
    u_xlat2.xyz = u_xlat16_5.xyz * _EmisstionColor.xyz;
    u_xlat16_5.x = (-u_xlat10_35.y) + 1.0;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat16_12.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3);
    u_xlat3.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
    u_xlat35.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat35.xy = u_xlat35.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_8.xyz = texture2D(_LG_Tex, u_xlat35.xy).xyz;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat3.xy).w;
    u_xlat16_5.xyz = u_xlat10_8.xyz * vec3(_LG_Intensity);
    u_xlat16_5.xyz = vec3(u_xlat10_0) * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat2.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
    if(u_xlatb0){
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
        u_xlat2.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat34.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat2.xy;
        u_xlat34.xy = u_xlat34.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat10_3.xyz = texture2D(_LG_Tex2, u_xlat34.xy).xyz;
        u_xlat10_0 = texture2D(_LG_Tex2, u_xlat2.xy).w;
        u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(_LG_Intensity2);
        u_xlat16_5.xyz = vec3(u_xlat10_0) * u_xlat16_5.xyz;
        u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color2.x, _LG_Color2.y, _LG_Color2.z) + u_xlat16_1.xyz;
    }
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
    u_xlat16_4.w = 1.0;
    u_xlat16_1 = (bool(u_xlatb0)) ? u_xlat16_4 : u_xlat16_1;
    u_xlat2.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat3.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xz = u_xlat16.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat16.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat16.zz + u_xlat0.xy;
    u_xlat32.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat32.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat3.xx + u_xlat32.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat3.zz + u_xlat32.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_37 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_37);
    u_xlat16_5 = u_xlat0 * u_xlat16_5.xxzz;
    u_xlat16_5.x = dot(u_xlat16_5.xy, u_xlat16_5.zw);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _ColorScaleByLightDir;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_21.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_21.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_21.xy + u_xlat0.xy;
    u_xlat16_53 = dot(u_xlat16_21.xy, u_xlat16_21.xy);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_21.xy = vec2(u_xlat16_53) * u_xlat16_21.xy;
    u_xlat16_21.xy = u_xlat16_21.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_21.xy * u_xlat0.xx + u_xlat2.xy;
    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx + u_xlat16_1.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb0 = 0.5<_pointLightOn;
    u_xlat16.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat16.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat16.x = sqrt(u_xlat16.x);
    u_xlat16_53 = u_xlat16.x + 9.99999975e-05;
    u_xlat16_53 = log2(u_xlat16_53);
    u_xlat16_53 = u_xlat16_53 * _pointLightAtten;
    u_xlat16_53 = exp2(u_xlat16_53);
    u_xlat16_53 = float(1.0) / u_xlat16_53;
    u_xlat16_6.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_6.x = u_xlat16.x / u_xlat16_6.x;
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x + -0.800000012;
    u_xlat16_6.x = u_xlat16_6.x * 5.00000048;
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_22.x = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = (-u_xlat16_22.x) * u_xlat16_6.x + 1.0;
    u_xlat16_22.xyz = vec3(u_xlat16_53) * _pointLightColor.xyz;
    u_xlat16_6.xyz = u_xlat16_22.xyz * u_xlat16_6.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat16_5.xyz;
    SV_Target0.w = u_xlat16_1.w;
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
Local Keywords { "_USE_GRADUAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_GRADUAL" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_GRADUAL" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_GRADUAL" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_LG_ON" "_USE_GRADUAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_LG_ON" "_USE_GRADUAL" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_LG_ON" "_USE_GRADUAL" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_LG_ON" "_USE_GRADUAL" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "SHADOWSUPPORT" = "true" }
  GpuProgramID 126650
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
 Pass {
 Name "Outline"
 Cull Front
  GpuProgramID 143479
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _Outline_Width;
uniform lowp sampler2D _LightMapTex;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat16_3 = (-_USE3UV_ON) + 1.0;
    u_xlat2.xy = in_TEXCOORD2.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat2.xy = in_TEXCOORD0.xy * vec2(u_xlat16_3) + u_xlat2.xy;
    u_xlat12 = texture2DLod(_LightMapTex, u_xlat2.xy, 0.0).y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _USE3UV_ON;
uniform 	mediump vec4 _Outline_Color;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
void main()
{
    u_xlat16_0 = (-_USE3UV_ON) + 1.0;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_0) + u_xlat1.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat1.xy);
    SV_Target0 = u_xlat10_0 * _Outline_Color;
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _Outline_Width;
uniform lowp sampler2D _LightMapTex;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat16_3 = (-_USE3UV_ON) + 1.0;
    u_xlat2.xy = in_TEXCOORD2.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat2.xy = in_TEXCOORD0.xy * vec2(u_xlat16_3) + u_xlat2.xy;
    u_xlat12 = texture2DLod(_LightMapTex, u_xlat2.xy, 0.0).y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _USE3UV_ON;
uniform 	mediump vec4 _Outline_Color;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
void main()
{
    u_xlat16_0 = (-_USE3UV_ON) + 1.0;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_0) + u_xlat1.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat1.xy);
    SV_Target0 = u_xlat10_0 * _Outline_Color;
    return;
}

#endif
"
}
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _Outline_Width;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMapTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat16_3 = (-_USE3UV_ON) + 1.0;
    u_xlat2.xy = in_TEXCOORD2.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat2.xy = in_TEXCOORD0.xy * vec2(u_xlat16_3) + u_xlat2.xy;
    u_xlat12 = textureLod(_LightMapTex, u_xlat2.xy, 0.0).y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _USE3UV_ON;
uniform 	mediump vec4 _Outline_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
void main()
{
    u_xlat16_0.x = (-_USE3UV_ON) + 1.0;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat1.xy = vs_TEXCOORD0.xy * u_xlat16_0.xx + u_xlat1.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat1.xy);
    SV_Target0 = u_xlat16_0 * _Outline_Color;
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	mediump float _USE3UV_ON;
uniform 	mediump float _Outline_Width;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMapTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat16_3 = (-_USE3UV_ON) + 1.0;
    u_xlat2.xy = in_TEXCOORD2.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat2.xy = in_TEXCOORD0.xy * vec2(u_xlat16_3) + u_xlat2.xy;
    u_xlat12 = textureLod(_LightMapTex, u_xlat2.xy, 0.0).y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD2.xy;
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
uniform 	mediump float _USE3UV_ON;
uniform 	mediump vec4 _Outline_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
void main()
{
    u_xlat16_0.x = (-_USE3UV_ON) + 1.0;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat1.xy = vs_TEXCOORD0.xy * u_xlat16_0.xx + u_xlat1.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat1.xy);
    SV_Target0 = u_xlat16_0 * _Outline_Color;
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