//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "NPR/Hero_NprV2_Body_ParallaxFlowMap" {
Properties {

[Header(Base Shading___________________________________________________________________________________________________________________________)] [Space(20)] _MainTex ("ColorMap,A:自阴影_0为固定,灰度渐变则变动态", 2D) = "white" { }

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

[Header(FlowMap_Parallax___________________________________________________________________________________________________________________________)] [Space(20)] _FlowMapTex ("RG:FlowMap B:作用区域 A:深度", 2D) = "black" { }

_FlowIntensity ("Flow强度", Float) = 1.0

_FlowSpeed ("Flow流速", Float) = 0.0

_ParallaxTex ("RGB:视差区域纹理 ", 2D) = "black" { }

_ParallaxIntensity ("视差深度", Float) = 0.0

[Header(Rim___________________________________________________________________________________________________________________________)] [Space(20)] _RimWidth ("边缘光粗细", Float) = 1.0

_RimCol ("边缘光颜色", Color) = (1,1,1,1)

_depthSubThreshold ("DepthSubThreshold", Float) = 0.5

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

_LG_Tex_Mask ("流光遮罩", 2D) = "white" { }

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
  GpuProgramID 11447
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
in highp vec2 in_TEXCOORD3;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_VAR_EXPREUV0;
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
    vs_VAR_EXPREUV0.xy = in_TEXCOORD3.xy;
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
uniform 	mediump vec4 _ParallaxTex_ST;
uniform 	mediump float _FlowIntensity;
uniform 	float _FlowSpeed;
uniform 	mediump float _ParallaxIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMapTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ParallaxTex;
UNITY_LOCATION(6) uniform mediump sampler2D _ShadowOffsetTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(8) uniform mediump sampler2D _PBRTexture;
UNITY_LOCATION(9) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ClearCoatTex;
UNITY_LOCATION(11) uniform mediump sampler2D _SkinEffectTex;
UNITY_LOCATION(12) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_VAR_EXPREUV0;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
vec4 u_xlat10;
vec3 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
float u_xlat19;
mediump vec3 u_xlat16_23;
vec2 u_xlat26;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
vec2 u_xlat36;
vec2 u_xlat39;
mediump vec2 u_xlat16_39;
mediump vec2 u_xlat16_41;
vec2 u_xlat44;
bool u_xlatb44;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
float u_xlat55;
float u_xlat56;
mediump float u_xlat16_56;
bool u_xlatb56;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
mediump float u_xlat16_62;
bool u_xlatb62;
bool u_xlatb63;
float u_xlat64;
bool u_xlatb64;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat18.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat55 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat1.xyz = vec3(u_xlat55) * u_xlat1.xyz;
    u_xlat55 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat2.xyz = vec3(u_xlat55) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4.x = (-_USE3UV_ON) + 1.0;
    u_xlat39.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat39.xy = vs_TEXCOORD0.xy * u_xlat16_4.xx + u_xlat39.xy;
    u_xlat16_4 = texture(_MainTex, u_xlat39.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_56 = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_59 = u_xlat16_56 + -1.0;
    u_xlat16_59 = _InSideLineStrength * u_xlat16_59 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_59) * u_xlat16_6.xyz;
    u_xlat56 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_60 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_60 = u_xlat16_59 * u_xlat16_60 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_59) + (-vec3(u_xlat56));
    u_xlat8.xyz = vec3(u_xlat16_60) * u_xlat8.xyz + vec3(u_xlat56);
    u_xlat16_59 = (-u_xlat16_59) + 1.0;
    u_xlat16_7.xyz = u_xlat8.xyz * vec3(u_xlat16_59) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_59) * u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_39.xy = texture(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat44.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat56 = (-u_xlat44.x) * u_xlat44.x + 1.0;
    u_xlat56 = (-u_xlat44.y) * u_xlat44.y + u_xlat56;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat9.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat18.zxy * u_xlat9.yzx;
    u_xlat10.xyz = u_xlat18.yzx * u_xlat9.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat11.xyz = u_xlat44.yyy * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat44.xxx * u_xlat9.xyz + u_xlat11.xyz;
    u_xlat11.xyz = vec3(u_xlat56) * u_xlat18.xyz + u_xlat11.xyz;
    u_xlat16_6 = texture(_FlowMapTex, vs_VAR_EXPREUV0.xy);
    u_xlat7 = u_xlat16_6.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat7 = u_xlat7 * vec4(_FlowIntensity);
    u_xlat56 = _Time.y * _FlowSpeed;
    u_xlat44.x = _Time.y * _FlowSpeed + 0.5;
    u_xlat12.xy = fract(vec2(u_xlat56));
    u_xlat12.zw = fract(u_xlat44.xx);
    u_xlat56 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat10.xyz = vec3(u_xlat56) * u_xlat10.xyz;
    u_xlat9.x = dot(u_xlat9.xyz, u_xlat1.xyz);
    u_xlat9.y = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat44.xy = vs_TEXCOORD0.xy * _ParallaxTex_ST.xy + _ParallaxTex_ST.zw;
    u_xlat16_56 = texture(_FlowMapTex, u_xlat44.xy).w;
    u_xlat56 = u_xlat16_56 + -0.5;
    u_xlat9 = u_xlat9.xyxy * vec4(_ParallaxIntensity);
    u_xlat10 = vs_VAR_EXPREUV0.xyxy * _ParallaxTex_ST.xyxy + _ParallaxTex_ST.zwzw;
    u_xlat9 = (-u_xlat9) * vec4(u_xlat56) + u_xlat10;
    u_xlat7 = u_xlat7 * u_xlat12;
    u_xlat7 = u_xlat7 * u_xlat16_6.zzzz + u_xlat9;
    u_xlat16_9 = texture(_ParallaxTex, u_xlat7.xy);
    u_xlat16_7 = texture(_ParallaxTex, u_xlat7.zw);
    u_xlat56 = (-u_xlat12.y) * 2.0 + 1.0;
    u_xlat7 = (-u_xlat16_9) + u_xlat16_7;
    u_xlat7 = abs(vec4(u_xlat56)) * u_xlat7 + u_xlat16_9;
    u_xlat16_13.xyz = u_xlat7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xyz = u_xlat7.xyz * u_xlat16_13.xyz + (-u_xlat16_5.xyz);
    u_xlat56 = (-u_xlat16_4.w) + u_xlat7.w;
    u_xlat9.xyz = u_xlat16_6.zzz * u_xlat9.xyz + u_xlat16_5.xyz;
    u_xlat56 = u_xlat16_6.z * u_xlat56 + u_xlat16_4.w;
    u_xlat10.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat10.xyz = vec3(_NormalStr) * u_xlat10.xyz + u_xlat18.xyz;
    u_xlat16_5.x = (-u_xlat56) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat10.xyz, u_xlat2.xyz);
    u_xlat16_23.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_41.x = _ShadowThreshold + 0.5;
    u_xlat16_56 = texture(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat56 = u_xlat16_56 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.99000001<u_xlat16_5.x);
#else
    u_xlatb44 = 0.99000001<u_xlat16_5.x;
#endif
    u_xlat16_59 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_59 = (u_xlatb44) ? u_xlat16_59 : 0.0;
    u_xlat16_59 = u_xlat16_59 + _selfShadowAdjust;
    u_xlat56 = u_xlat16_5.x * u_xlat16_59 + u_xlat56;
    u_xlat56 = u_xlat56 + u_xlat16_41.x;
    u_xlat16_41.x = u_xlat56 + (-_ShadowFeather);
    u_xlat16_59 = u_xlat56 + _ShadowFeather;
    u_xlat16_59 = (-u_xlat16_41.x) + u_xlat16_59;
    u_xlat16_41.x = (-u_xlat16_41.x) + u_xlat16_23.x;
    u_xlat16_59 = float(1.0) / u_xlat16_59;
    u_xlat16_41.x = u_xlat16_59 * u_xlat16_41.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_41.x * -2.0 + 3.0;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_59;
    u_xlat16_8 = min(u_xlat16_41.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.96875>=u_xlat8.y);
#else
    u_xlatb56 = 0.96875>=u_xlat8.y;
#endif
    u_xlat8.x = u_xlat16_8;
    u_xlat16_26.xyz = texture(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_26.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_26.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_26.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat9.xyz + (-u_xlat9.xyz);
    u_xlat16_14.xyz = vec3(_RampDifLerpValue) * u_xlat16_14.xyz + u_xlat9.xyz;
    u_xlat16_15.xyz = u_xlat16_14.xyz * _DarkColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _LightAreaColor.xyz + (-u_xlat16_15.xyz);
    u_xlat16_14.xyz = u_xlat8.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat26.xy = u_xlat10.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat26.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat10.xx + u_xlat26.xy;
    u_xlat26.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat10.zz + u_xlat26.xy;
    u_xlat16_41.xy = u_xlat26.xy + vec2(1.0, 1.0);
    u_xlat16_67 = u_xlat3.y * 0.100000001;
    u_xlat11.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat11.y = u_xlat16_67 * _matCapSpeEffectedByLightDir;
    u_xlat16_41.xy = u_xlat16_41.xy * vec2(0.5, 0.5) + (-u_xlat11.xy);
    u_xlat16_4 = texture(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_15.xy = u_xlat16_4.yx * vec2(_metallic, _roughness);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xy = min(max(u_xlat16_15.xy, 0.0), 1.0);
#else
    u_xlat16_15.xy = clamp(u_xlat16_15.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.100000001>=u_xlat16_4.z);
#else
    u_xlatb62 = 0.100000001>=u_xlat16_4.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat));
#else
    u_xlatb63 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
#endif
    u_xlatb62 = u_xlatb62 && u_xlatb63;
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(0.100000001<u_xlat16_4.z);
#else
    u_xlatb63 = 0.100000001<u_xlat16_4.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(u_xlat16_4.z<0.449999988);
#else
    u_xlatb64 = u_xlat16_4.z<0.449999988;
#endif
    u_xlatb63 = u_xlatb63 && u_xlatb64;
    u_xlatb64 = u_xlatb62 || u_xlatb63;
    u_xlat16_67 = u_xlat16_15.y * 6.0;
    u_xlat16_67 = (u_xlatb64) ? 0.0 : u_xlat16_67;
    u_xlat16_7 = textureLod(_MatcapTex, u_xlat16_41.xy, u_xlat16_67);
    u_xlat16_16.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_7.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_7.xyz * u_xlat16_16.xyz;
    u_xlat64 = dot(u_xlat10.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    if(u_xlatb62){
        u_xlat16_41.x = log2(u_xlat64);
        u_xlat16_41.x = u_xlat16_41.x * _ClearNovPow;
        u_xlat16_41.x = exp2(u_xlat16_41.x);
        u_xlat11.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat16_62 = texture(_ClearCoatTex, u_xlat11.xy).x;
        u_xlat16_59 = log2(u_xlat16_62);
        u_xlat16_59 = u_xlat16_59 * _ClearCoatPow;
        u_xlat16_59 = exp2(u_xlat16_59);
        u_xlat16_59 = u_xlat16_59 * _ClearCoatStrength;
        u_xlat16_41.x = u_xlat16_41.x * u_xlat16_59;
        u_xlat16_59 = (-u_xlat16_5.x) + 1.21000004;
        u_xlat16_59 = min(u_xlat16_59, 1.0);
        u_xlat16_41.x = u_xlat16_59 * u_xlat16_41.x;
        u_xlat16_16.xyz = u_xlat16_7.xyz * u_xlat16_16.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_16.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_16.xyz = u_xlat16_41.xxx * u_xlat16_16.xyz;
        u_xlat16_23.xyz = u_xlat16_23.xxx * u_xlat16_16.xyz;
        u_xlat16_23.xyz = u_xlat16_4.www * u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb62 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA));
#else
        u_xlatb62 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
#endif
        u_xlat16_16.xyz = u_xlat16_7.www * u_xlat16_23.xyz;
        u_xlat16_23.xyz = (bool(u_xlatb62)) ? u_xlat16_16.xyz : u_xlat16_23.xyz;
        u_xlat16_23.xyz = u_xlat16_23.xyz + u_xlat16_14.xyz;
    } else {
        u_xlat16_67 = (-u_xlat16_15.x) + 1.0;
        u_xlat16_23.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
    }
    if(u_xlatb56){
        u_xlat16_67 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
        u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
        u_xlat11.xyz = u_xlat9.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat11.xyz = u_xlat16_15.xxx * u_xlat11.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat55) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat10.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat16_14.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_14.y = u_xlat16_15.y * u_xlat16_15.y;
        u_xlat16_14.xz = u_xlat16_14.xy * u_xlat16_14.xy;
        u_xlat16_32 = u_xlat16_14.y * u_xlat16_14.y + -1.0;
        u_xlat16_14.x = u_xlat16_14.x * u_xlat16_32 + 1.0;
        u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
        u_xlat16_14.x = u_xlat16_14.z / u_xlat16_14.x;
        u_xlat16_14.x = u_xlat16_14.x * 0.318309873;
        u_xlat16_32 = (-u_xlat64) * u_xlat16_14.z + u_xlat64;
        u_xlat16_32 = u_xlat64 * u_xlat16_32 + u_xlat16_14.z;
        u_xlat16_32 = sqrt(u_xlat16_32);
        u_xlat16_32 = u_xlat64 + u_xlat16_32;
        u_xlat16_68 = (-u_xlat16_67) * u_xlat16_14.z + u_xlat16_67;
        u_xlat16_50 = u_xlat16_67 * u_xlat16_68 + u_xlat16_14.z;
        u_xlat16_50 = sqrt(u_xlat16_50);
        u_xlat16_50 = u_xlat16_67 + u_xlat16_50;
        u_xlat16_32 = u_xlat16_50 * u_xlat16_32;
        u_xlat16_14.y = float(1.0) / u_xlat16_32;
        u_xlat16_14.z = (-u_xlat1.x) + 1.0;
        u_xlat16_14.xw = u_xlat16_14.xz * u_xlat16_14.yz;
        u_xlat16_68 = u_xlat16_14.w * u_xlat16_14.w;
        u_xlat16_15.x = u_xlat16_14.z * u_xlat16_68;
        u_xlat16_51 = u_xlat11.y * 50.0;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
        u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
        u_xlat16_50 = (-u_xlat16_68) * u_xlat16_14.z + 1.0;
        u_xlat16_16.xyz = u_xlat11.xyz * vec3(u_xlat16_50);
        u_xlat16_15.xzw = vec3(u_xlat16_51) * u_xlat16_15.xxx + u_xlat16_16.xyz;
        u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_15.xzw;
        u_xlat16_14.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
        u_xlat16_14.xyz = u_xlat8.xxx * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
        u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
        u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_speStr, _speStr, _speStr));
        u_xlat0.x = (-u_xlat64) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_68 = (-u_xlat16_15.y) + 1.0;
        u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
        u_xlat16_68 = u_xlat16_68 * 0.899999976 + 0.100000001;
        u_xlat16_15.xyz = u_xlat16_7.www * _customMatcapCol.xyz;
        u_xlat16_15.xyz = (bool(u_xlatb63)) ? u_xlat16_15.xyz : u_xlat16_17.xyz;
        u_xlat1.x = u_xlat64 + _customMatcapFresnelRange;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat19 = u_xlatb63 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat19 * u_xlat1.x + 1.0;
        u_xlat16_69 = (u_xlatb63) ? 1.0 : 0.0;
        u_xlat16_16.x = (-u_xlat0.x) + 1.0;
        u_xlat16_16.x = u_xlat16_69 * u_xlat16_16.x + u_xlat0.x;
        u_xlat16_34 = (-_inDirectSpeStr) + 1.0;
        u_xlat16_69 = u_xlat16_69 * u_xlat16_34 + _inDirectSpeStr;
        u_xlat16_69 = u_xlat16_4.w * u_xlat16_69;
        u_xlat16_15.xyz = vec3(u_xlat16_69) * u_xlat16_15.xyz;
        u_xlat16_15.xyz = u_xlat16_16.xxx * u_xlat16_15.xyz;
        u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat16_15.xyz;
        u_xlat16_68 = (-u_xlat16_5.x) + 1.21000004;
        u_xlat16_68 = min(u_xlat16_68, 1.0);
        u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat16_15.xyz;
        u_xlat0.x = (-u_xlat16_6.w) + 1.0;
        u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
        u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat1.xxx + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn));
#else
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
#endif
        if(u_xlatb0){
            u_xlat16_14.xy = u_xlat3.xy + (-u_xlat26.xy);
            u_xlat16_14.xy = _throughSkinSpeDir.ww * u_xlat16_14.xy + u_xlat26.xy;
            u_xlat16_14.xy = u_xlat16_14.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_14.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat16_0 = texture(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_14.x = u_xlat16_0 * 0.349999994;
            u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
            u_xlat16_5.x = u_xlat16_5.x * u_xlat16_14.x;
            u_xlat16_5.x = u_xlat16_67 * u_xlat16_5.x;
            u_xlat16_23.xyz = u_xlat16_5.xxx * _SkinEffectCol.xyz + u_xlat16_23.xyz;
        }
    }
    u_xlat16_5.x = u_xlat16_39.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat1.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + _EmisstionParams.x;
    u_xlat1.xyz = u_xlat9.xyz * _EmisstionColor.xyz;
    u_xlat16_67 = (-u_xlat16_39.y) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_67);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
#endif
    u_xlat16_23.x = 1.0;
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat1.xyz;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_23.x : u_xlat16_5.x;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat2.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.xz = u_xlat18.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat18.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat18.zz + u_xlat0.xy;
    u_xlat36.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat36.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat36.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat36.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_41.x = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_41.x);
    u_xlat16_5 = u_xlat0 * u_xlat16_5.xxzz;
    u_xlat16_5.x = dot(u_xlat16_5.xy, u_xlat16_5.zw);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _ColorScaleByLightDir;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_23.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_23.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_23.xy + u_xlat0.xy;
    u_xlat16_59 = dot(u_xlat16_23.xy, u_xlat16_23.xy);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_23.xy = vec2(u_xlat16_59) * u_xlat16_23.xy;
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
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx + u_xlat16_13.xyz;
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
    u_xlat18.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat18.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat18.x = sqrt(u_xlat18.x);
    u_xlat16_59 = u_xlat18.x + 9.99999975e-05;
    u_xlat16_59 = log2(u_xlat16_59);
    u_xlat16_59 = u_xlat16_59 * _pointLightAtten;
    u_xlat16_59 = exp2(u_xlat16_59);
    u_xlat16_59 = float(1.0) / u_xlat16_59;
    u_xlat16_13.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_13.x = u_xlat18.x / u_xlat16_13.x;
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = u_xlat16_13.x + -0.800000012;
    u_xlat16_13.x = u_xlat16_13.x * 5.00000048;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_31.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = (-u_xlat16_31.x) * u_xlat16_13.x + 1.0;
    u_xlat16_31.xyz = vec3(u_xlat16_59) * _pointLightColor.xyz;
    u_xlat16_13.xyz = u_xlat16_31.xyz * u_xlat16_13.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_5.xyz;
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
in highp vec2 in_TEXCOORD3;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_VAR_EXPREUV0;
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
    vs_VAR_EXPREUV0.xy = in_TEXCOORD3.xy;
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
uniform 	mediump vec4 _ParallaxTex_ST;
uniform 	mediump float _FlowIntensity;
uniform 	float _FlowSpeed;
uniform 	mediump float _ParallaxIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMapTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ParallaxTex;
UNITY_LOCATION(6) uniform mediump sampler2D _ShadowOffsetTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(8) uniform mediump sampler2D _PBRTexture;
UNITY_LOCATION(9) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ClearCoatTex;
UNITY_LOCATION(11) uniform mediump sampler2D _SkinEffectTex;
UNITY_LOCATION(12) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_VAR_EXPREUV0;
in highp vec2 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
vec4 u_xlat10;
vec3 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
float u_xlat19;
mediump vec3 u_xlat16_23;
vec2 u_xlat26;
mediump vec3 u_xlat16_26;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
vec2 u_xlat36;
vec2 u_xlat39;
mediump vec2 u_xlat16_39;
mediump vec2 u_xlat16_41;
vec2 u_xlat44;
bool u_xlatb44;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
float u_xlat55;
float u_xlat56;
mediump float u_xlat16_56;
bool u_xlatb56;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
mediump float u_xlat16_62;
bool u_xlatb62;
bool u_xlatb63;
float u_xlat64;
bool u_xlatb64;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat18.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat55 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat1.xyz = vec3(u_xlat55) * u_xlat1.xyz;
    u_xlat55 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat2.xyz = vec3(u_xlat55) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4.x = (-_USE3UV_ON) + 1.0;
    u_xlat39.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat39.xy = vs_TEXCOORD0.xy * u_xlat16_4.xx + u_xlat39.xy;
    u_xlat16_4 = texture(_MainTex, u_xlat39.xy);
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_56 = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_59 = u_xlat16_56 + -1.0;
    u_xlat16_59 = _InSideLineStrength * u_xlat16_59 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_59 = min(max(u_xlat16_59, 0.0), 1.0);
#else
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_59) * u_xlat16_6.xyz;
    u_xlat56 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_60 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_60 = u_xlat16_59 * u_xlat16_60 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_59) + (-vec3(u_xlat56));
    u_xlat8.xyz = vec3(u_xlat16_60) * u_xlat8.xyz + vec3(u_xlat56);
    u_xlat16_59 = (-u_xlat16_59) + 1.0;
    u_xlat16_7.xyz = u_xlat8.xyz * vec3(u_xlat16_59) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_59) * u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_39.xy = texture(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat44.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat56 = (-u_xlat44.x) * u_xlat44.x + 1.0;
    u_xlat56 = (-u_xlat44.y) * u_xlat44.y + u_xlat56;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat9.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat18.zxy * u_xlat9.yzx;
    u_xlat10.xyz = u_xlat18.yzx * u_xlat9.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat11.xyz = u_xlat44.yyy * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat44.xxx * u_xlat9.xyz + u_xlat11.xyz;
    u_xlat11.xyz = vec3(u_xlat56) * u_xlat18.xyz + u_xlat11.xyz;
    u_xlat16_6 = texture(_FlowMapTex, vs_VAR_EXPREUV0.xy);
    u_xlat7 = u_xlat16_6.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat7 = u_xlat7 * vec4(_FlowIntensity);
    u_xlat56 = _Time.y * _FlowSpeed;
    u_xlat44.x = _Time.y * _FlowSpeed + 0.5;
    u_xlat12.xy = fract(vec2(u_xlat56));
    u_xlat12.zw = fract(u_xlat44.xx);
    u_xlat56 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat10.xyz = vec3(u_xlat56) * u_xlat10.xyz;
    u_xlat9.x = dot(u_xlat9.xyz, u_xlat1.xyz);
    u_xlat9.y = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat44.xy = vs_TEXCOORD0.xy * _ParallaxTex_ST.xy + _ParallaxTex_ST.zw;
    u_xlat16_56 = texture(_FlowMapTex, u_xlat44.xy).w;
    u_xlat56 = u_xlat16_56 + -0.5;
    u_xlat9 = u_xlat9.xyxy * vec4(_ParallaxIntensity);
    u_xlat10 = vs_VAR_EXPREUV0.xyxy * _ParallaxTex_ST.xyxy + _ParallaxTex_ST.zwzw;
    u_xlat9 = (-u_xlat9) * vec4(u_xlat56) + u_xlat10;
    u_xlat7 = u_xlat7 * u_xlat12;
    u_xlat7 = u_xlat7 * u_xlat16_6.zzzz + u_xlat9;
    u_xlat16_9 = texture(_ParallaxTex, u_xlat7.xy);
    u_xlat16_7 = texture(_ParallaxTex, u_xlat7.zw);
    u_xlat56 = (-u_xlat12.y) * 2.0 + 1.0;
    u_xlat7 = (-u_xlat16_9) + u_xlat16_7;
    u_xlat7 = abs(vec4(u_xlat56)) * u_xlat7 + u_xlat16_9;
    u_xlat16_13.xyz = u_xlat7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xyz = u_xlat7.xyz * u_xlat16_13.xyz + (-u_xlat16_5.xyz);
    u_xlat56 = (-u_xlat16_4.w) + u_xlat7.w;
    u_xlat9.xyz = u_xlat16_6.zzz * u_xlat9.xyz + u_xlat16_5.xyz;
    u_xlat56 = u_xlat16_6.z * u_xlat56 + u_xlat16_4.w;
    u_xlat10.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat10.xyz = vec3(_NormalStr) * u_xlat10.xyz + u_xlat18.xyz;
    u_xlat16_5.x = (-u_xlat56) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat10.xyz, u_xlat2.xyz);
    u_xlat16_23.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_41.x = _ShadowThreshold + 0.5;
    u_xlat16_56 = texture(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat56 = u_xlat16_56 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(0.99000001<u_xlat16_5.x);
#else
    u_xlatb44 = 0.99000001<u_xlat16_5.x;
#endif
    u_xlat16_59 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_59 = (u_xlatb44) ? u_xlat16_59 : 0.0;
    u_xlat16_59 = u_xlat16_59 + _selfShadowAdjust;
    u_xlat56 = u_xlat16_5.x * u_xlat16_59 + u_xlat56;
    u_xlat56 = u_xlat56 + u_xlat16_41.x;
    u_xlat16_41.x = u_xlat56 + (-_ShadowFeather);
    u_xlat16_59 = u_xlat56 + _ShadowFeather;
    u_xlat16_59 = (-u_xlat16_41.x) + u_xlat16_59;
    u_xlat16_41.x = (-u_xlat16_41.x) + u_xlat16_23.x;
    u_xlat16_59 = float(1.0) / u_xlat16_59;
    u_xlat16_41.x = u_xlat16_59 * u_xlat16_41.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_41.x = min(max(u_xlat16_41.x, 0.0), 1.0);
#else
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
#endif
    u_xlat16_59 = u_xlat16_41.x * -2.0 + 3.0;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_59;
    u_xlat16_8 = min(u_xlat16_41.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.96875>=u_xlat8.y);
#else
    u_xlatb56 = 0.96875>=u_xlat8.y;
#endif
    u_xlat8.x = u_xlat16_8;
    u_xlat16_26.xyz = texture(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_26.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_26.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_26.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat9.xyz + (-u_xlat9.xyz);
    u_xlat16_14.xyz = vec3(_RampDifLerpValue) * u_xlat16_14.xyz + u_xlat9.xyz;
    u_xlat16_15.xyz = u_xlat16_14.xyz * _DarkColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _LightAreaColor.xyz + (-u_xlat16_15.xyz);
    u_xlat16_14.xyz = u_xlat8.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat26.xy = u_xlat10.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat26.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat10.xx + u_xlat26.xy;
    u_xlat26.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat10.zz + u_xlat26.xy;
    u_xlat16_41.xy = u_xlat26.xy + vec2(1.0, 1.0);
    u_xlat16_67 = u_xlat3.y * 0.100000001;
    u_xlat11.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat11.y = u_xlat16_67 * _matCapSpeEffectedByLightDir;
    u_xlat16_41.xy = u_xlat16_41.xy * vec2(0.5, 0.5) + (-u_xlat11.xy);
    u_xlat16_4 = texture(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_15.xy = u_xlat16_4.yx * vec2(_metallic, _roughness);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15.xy = min(max(u_xlat16_15.xy, 0.0), 1.0);
#else
    u_xlat16_15.xy = clamp(u_xlat16_15.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(0.100000001>=u_xlat16_4.z);
#else
    u_xlatb62 = 0.100000001>=u_xlat16_4.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat));
#else
    u_xlatb63 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
#endif
    u_xlatb62 = u_xlatb62 && u_xlatb63;
#ifdef UNITY_ADRENO_ES3
    u_xlatb63 = !!(0.100000001<u_xlat16_4.z);
#else
    u_xlatb63 = 0.100000001<u_xlat16_4.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb64 = !!(u_xlat16_4.z<0.449999988);
#else
    u_xlatb64 = u_xlat16_4.z<0.449999988;
#endif
    u_xlatb63 = u_xlatb63 && u_xlatb64;
    u_xlatb64 = u_xlatb62 || u_xlatb63;
    u_xlat16_67 = u_xlat16_15.y * 6.0;
    u_xlat16_67 = (u_xlatb64) ? 0.0 : u_xlat16_67;
    u_xlat16_7 = textureLod(_MatcapTex, u_xlat16_41.xy, u_xlat16_67);
    u_xlat16_16.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat16_7.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_7.xyz * u_xlat16_16.xyz;
    u_xlat64 = dot(u_xlat10.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    if(u_xlatb62){
        u_xlat16_41.x = log2(u_xlat64);
        u_xlat16_41.x = u_xlat16_41.x * _ClearNovPow;
        u_xlat16_41.x = exp2(u_xlat16_41.x);
        u_xlat11.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat16_62 = texture(_ClearCoatTex, u_xlat11.xy).x;
        u_xlat16_59 = log2(u_xlat16_62);
        u_xlat16_59 = u_xlat16_59 * _ClearCoatPow;
        u_xlat16_59 = exp2(u_xlat16_59);
        u_xlat16_59 = u_xlat16_59 * _ClearCoatStrength;
        u_xlat16_41.x = u_xlat16_41.x * u_xlat16_59;
        u_xlat16_59 = (-u_xlat16_5.x) + 1.21000004;
        u_xlat16_59 = min(u_xlat16_59, 1.0);
        u_xlat16_41.x = u_xlat16_59 * u_xlat16_41.x;
        u_xlat16_16.xyz = u_xlat16_7.xyz * u_xlat16_16.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_16.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_16.xyz = u_xlat16_41.xxx * u_xlat16_16.xyz;
        u_xlat16_23.xyz = u_xlat16_23.xxx * u_xlat16_16.xyz;
        u_xlat16_23.xyz = u_xlat16_4.www * u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb62 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA));
#else
        u_xlatb62 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
#endif
        u_xlat16_16.xyz = u_xlat16_7.www * u_xlat16_23.xyz;
        u_xlat16_23.xyz = (bool(u_xlatb62)) ? u_xlat16_16.xyz : u_xlat16_23.xyz;
        u_xlat16_23.xyz = u_xlat16_23.xyz + u_xlat16_14.xyz;
    } else {
        u_xlat16_67 = (-u_xlat16_15.x) + 1.0;
        u_xlat16_23.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
    }
    if(u_xlatb56){
        u_xlat16_67 = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
        u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
        u_xlat11.xyz = u_xlat9.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat11.xyz = u_xlat16_15.xxx * u_xlat11.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat55) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat10.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat16_14.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_14.y = u_xlat16_15.y * u_xlat16_15.y;
        u_xlat16_14.xz = u_xlat16_14.xy * u_xlat16_14.xy;
        u_xlat16_32 = u_xlat16_14.y * u_xlat16_14.y + -1.0;
        u_xlat16_14.x = u_xlat16_14.x * u_xlat16_32 + 1.0;
        u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
        u_xlat16_14.x = u_xlat16_14.z / u_xlat16_14.x;
        u_xlat16_14.x = u_xlat16_14.x * 0.318309873;
        u_xlat16_32 = (-u_xlat64) * u_xlat16_14.z + u_xlat64;
        u_xlat16_32 = u_xlat64 * u_xlat16_32 + u_xlat16_14.z;
        u_xlat16_32 = sqrt(u_xlat16_32);
        u_xlat16_32 = u_xlat64 + u_xlat16_32;
        u_xlat16_68 = (-u_xlat16_67) * u_xlat16_14.z + u_xlat16_67;
        u_xlat16_50 = u_xlat16_67 * u_xlat16_68 + u_xlat16_14.z;
        u_xlat16_50 = sqrt(u_xlat16_50);
        u_xlat16_50 = u_xlat16_67 + u_xlat16_50;
        u_xlat16_32 = u_xlat16_50 * u_xlat16_32;
        u_xlat16_14.y = float(1.0) / u_xlat16_32;
        u_xlat16_14.z = (-u_xlat1.x) + 1.0;
        u_xlat16_14.xw = u_xlat16_14.xz * u_xlat16_14.yz;
        u_xlat16_68 = u_xlat16_14.w * u_xlat16_14.w;
        u_xlat16_15.x = u_xlat16_14.z * u_xlat16_68;
        u_xlat16_51 = u_xlat11.y * 50.0;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
        u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
        u_xlat16_50 = (-u_xlat16_68) * u_xlat16_14.z + 1.0;
        u_xlat16_16.xyz = u_xlat11.xyz * vec3(u_xlat16_50);
        u_xlat16_15.xzw = vec3(u_xlat16_51) * u_xlat16_15.xxx + u_xlat16_16.xyz;
        u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_15.xzw;
        u_xlat16_14.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
        u_xlat16_14.xyz = u_xlat8.xxx * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
        u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
        u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_speStr, _speStr, _speStr));
        u_xlat0.x = (-u_xlat64) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_68 = (-u_xlat16_15.y) + 1.0;
        u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
        u_xlat16_68 = u_xlat16_68 * 0.899999976 + 0.100000001;
        u_xlat16_15.xyz = u_xlat16_7.www * _customMatcapCol.xyz;
        u_xlat16_15.xyz = (bool(u_xlatb63)) ? u_xlat16_15.xyz : u_xlat16_17.xyz;
        u_xlat1.x = u_xlat64 + _customMatcapFresnelRange;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat19 = u_xlatb63 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat19 * u_xlat1.x + 1.0;
        u_xlat16_69 = (u_xlatb63) ? 1.0 : 0.0;
        u_xlat16_16.x = (-u_xlat0.x) + 1.0;
        u_xlat16_16.x = u_xlat16_69 * u_xlat16_16.x + u_xlat0.x;
        u_xlat16_34 = (-_inDirectSpeStr) + 1.0;
        u_xlat16_69 = u_xlat16_69 * u_xlat16_34 + _inDirectSpeStr;
        u_xlat16_69 = u_xlat16_4.w * u_xlat16_69;
        u_xlat16_15.xyz = vec3(u_xlat16_69) * u_xlat16_15.xyz;
        u_xlat16_15.xyz = u_xlat16_16.xxx * u_xlat16_15.xyz;
        u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat16_15.xyz;
        u_xlat16_68 = (-u_xlat16_5.x) + 1.21000004;
        u_xlat16_68 = min(u_xlat16_68, 1.0);
        u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat16_15.xyz;
        u_xlat0.x = (-u_xlat16_6.w) + 1.0;
        u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
        u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat1.xxx + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn));
#else
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
#endif
        if(u_xlatb0){
            u_xlat16_14.xy = u_xlat3.xy + (-u_xlat26.xy);
            u_xlat16_14.xy = _throughSkinSpeDir.ww * u_xlat16_14.xy + u_xlat26.xy;
            u_xlat16_14.xy = u_xlat16_14.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_14.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat16_0 = texture(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_14.x = u_xlat16_0 * 0.349999994;
            u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
            u_xlat16_5.x = u_xlat16_5.x * u_xlat16_14.x;
            u_xlat16_5.x = u_xlat16_67 * u_xlat16_5.x;
            u_xlat16_23.xyz = u_xlat16_5.xxx * _SkinEffectCol.xyz + u_xlat16_23.xyz;
        }
    }
    u_xlat16_5.x = u_xlat16_39.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat1.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + _EmisstionParams.x;
    u_xlat1.xyz = u_xlat9.xyz * _EmisstionColor.xyz;
    u_xlat16_67 = (-u_xlat16_39.y) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_67);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
#endif
    u_xlat16_23.x = 1.0;
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat1.xyz;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_23.x : u_xlat16_5.x;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat2.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.xz = u_xlat18.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat18.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat18.zz + u_xlat0.xy;
    u_xlat36.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat36.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat36.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat36.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_41.x = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_41.x);
    u_xlat16_5 = u_xlat0 * u_xlat16_5.xxzz;
    u_xlat16_5.x = dot(u_xlat16_5.xy, u_xlat16_5.zw);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _ColorScaleByLightDir;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_23.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_23.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_23.xy + u_xlat0.xy;
    u_xlat16_59 = dot(u_xlat16_23.xy, u_xlat16_23.xy);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_23.xy = vec2(u_xlat16_59) * u_xlat16_23.xy;
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
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx + u_xlat16_13.xyz;
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
    u_xlat18.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat18.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat18.x = sqrt(u_xlat18.x);
    u_xlat16_59 = u_xlat18.x + 9.99999975e-05;
    u_xlat16_59 = log2(u_xlat16_59);
    u_xlat16_59 = u_xlat16_59 * _pointLightAtten;
    u_xlat16_59 = exp2(u_xlat16_59);
    u_xlat16_59 = float(1.0) / u_xlat16_59;
    u_xlat16_13.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_13.x = u_xlat18.x / u_xlat16_13.x;
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = u_xlat16_13.x + -0.800000012;
    u_xlat16_13.x = u_xlat16_13.x * 5.00000048;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_31.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = (-u_xlat16_31.x) * u_xlat16_13.x + 1.0;
    u_xlat16_31.xyz = vec3(u_xlat16_59) * _pointLightColor.xyz;
    u_xlat16_13.xyz = u_xlat16_31.xyz * u_xlat16_13.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_5.xyz;
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
attribute highp vec2 in_TEXCOORD3;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_EXPREUV0;
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
    vs_VAR_EXPREUV0.xy = in_TEXCOORD3.xy;
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
uniform 	mediump vec4 _ParallaxTex_ST;
uniform 	mediump float _FlowIntensity;
uniform 	float _FlowSpeed;
uniform 	mediump float _ParallaxIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _FlowMapTex;
uniform lowp sampler2D _ParallaxTex;
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
varying highp vec2 vs_VAR_EXPREUV0;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
lowp vec4 u_xlat10_6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec4 u_xlat9;
lowp vec4 u_xlat10_9;
vec4 u_xlat10;
vec3 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
float u_xlat19;
mediump vec3 u_xlat16_23;
vec2 u_xlat26;
lowp vec3 u_xlat10_26;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
vec2 u_xlat36;
vec2 u_xlat39;
lowp vec2 u_xlat10_39;
mediump vec2 u_xlat16_41;
vec2 u_xlat44;
bool u_xlatb44;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
float u_xlat55;
float u_xlat56;
lowp float u_xlat10_56;
bool u_xlatb56;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
lowp float u_xlat10_62;
bool u_xlatb62;
bool u_xlatb63;
float u_xlat64;
bool u_xlatb64;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat18.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat55 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat1.xyz = vec3(u_xlat55) * u_xlat1.xyz;
    u_xlat55 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat2.xyz = vec3(u_xlat55) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4 = (-_USE3UV_ON) + 1.0;
    u_xlat39.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat39.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_4) + u_xlat39.xy;
    u_xlat10_4 = texture2D(_MainTex, u_xlat39.xy);
    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz;
    u_xlat10_56 = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_59 = u_xlat10_56 + -1.0;
    u_xlat16_59 = _InSideLineStrength * u_xlat16_59 + 1.0;
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_59) * u_xlat16_6.xyz;
    u_xlat56 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_60 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_60 = u_xlat16_59 * u_xlat16_60 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_59) + (-vec3(u_xlat56));
    u_xlat8.xyz = vec3(u_xlat16_60) * u_xlat8.xyz + vec3(u_xlat56);
    u_xlat16_59 = (-u_xlat16_59) + 1.0;
    u_xlat16_7.xyz = u_xlat8.xyz * vec3(u_xlat16_59) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_59) * u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat10_39.xy = texture2D(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture2D(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat44.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat56 = (-u_xlat44.x) * u_xlat44.x + 1.0;
    u_xlat56 = (-u_xlat44.y) * u_xlat44.y + u_xlat56;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat9.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat18.zxy * u_xlat9.yzx;
    u_xlat10.xyz = u_xlat18.yzx * u_xlat9.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat11.xyz = u_xlat44.yyy * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat44.xxx * u_xlat9.xyz + u_xlat11.xyz;
    u_xlat11.xyz = vec3(u_xlat56) * u_xlat18.xyz + u_xlat11.xyz;
    u_xlat10_6 = texture2D(_FlowMapTex, vs_VAR_EXPREUV0.xy);
    u_xlat7 = u_xlat10_6.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat7 = u_xlat7 * vec4(_FlowIntensity);
    u_xlat56 = _Time.y * _FlowSpeed;
    u_xlat44.x = _Time.y * _FlowSpeed + 0.5;
    u_xlat12.xy = fract(vec2(u_xlat56));
    u_xlat12.zw = fract(u_xlat44.xx);
    u_xlat56 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat10.xyz = vec3(u_xlat56) * u_xlat10.xyz;
    u_xlat9.x = dot(u_xlat9.xyz, u_xlat1.xyz);
    u_xlat9.y = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat44.xy = vs_TEXCOORD0.xy * _ParallaxTex_ST.xy + _ParallaxTex_ST.zw;
    u_xlat10_56 = texture2D(_FlowMapTex, u_xlat44.xy).w;
    u_xlat56 = u_xlat10_56 + -0.5;
    u_xlat9 = u_xlat9.xyxy * vec4(_ParallaxIntensity);
    u_xlat10 = vs_VAR_EXPREUV0.xyxy * _ParallaxTex_ST.xyxy + _ParallaxTex_ST.zwzw;
    u_xlat9 = (-u_xlat9) * vec4(u_xlat56) + u_xlat10;
    u_xlat7 = u_xlat7 * u_xlat12;
    u_xlat7 = u_xlat7 * u_xlat10_6.zzzz + u_xlat9;
    u_xlat10_9 = texture2D(_ParallaxTex, u_xlat7.xy);
    u_xlat10_7 = texture2D(_ParallaxTex, u_xlat7.zw);
    u_xlat56 = (-u_xlat12.y) * 2.0 + 1.0;
    u_xlat7 = (-u_xlat10_9) + u_xlat10_7;
    u_xlat7 = abs(vec4(u_xlat56)) * u_xlat7 + u_xlat10_9;
    u_xlat16_13.xyz = u_xlat7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xyz = u_xlat7.xyz * u_xlat16_13.xyz + (-u_xlat16_5.xyz);
    u_xlat56 = (-u_xlat10_4.w) + u_xlat7.w;
    u_xlat9.xyz = u_xlat10_6.zzz * u_xlat9.xyz + u_xlat16_5.xyz;
    u_xlat56 = u_xlat10_6.z * u_xlat56 + u_xlat10_4.w;
    u_xlat10.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat10.xyz = vec3(_NormalStr) * u_xlat10.xyz + u_xlat18.xyz;
    u_xlat16_5.x = (-u_xlat56) + 1.0;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat10.xyz, u_xlat2.xyz);
    u_xlat16_23.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_41.x = _ShadowThreshold + 0.5;
    u_xlat10_56 = texture2D(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat56 = u_xlat10_56 + -0.5;
    u_xlatb44 = 0.99000001<u_xlat16_5.x;
    u_xlat16_59 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_59 = (u_xlatb44) ? u_xlat16_59 : 0.0;
    u_xlat16_59 = u_xlat16_59 + _selfShadowAdjust;
    u_xlat56 = u_xlat16_5.x * u_xlat16_59 + u_xlat56;
    u_xlat56 = u_xlat56 + u_xlat16_41.x;
    u_xlat16_41.x = u_xlat56 + (-_ShadowFeather);
    u_xlat16_59 = u_xlat56 + _ShadowFeather;
    u_xlat16_59 = (-u_xlat16_41.x) + u_xlat16_59;
    u_xlat16_41.x = (-u_xlat16_41.x) + u_xlat16_23.x;
    u_xlat16_59 = float(1.0) / u_xlat16_59;
    u_xlat16_41.x = u_xlat16_59 * u_xlat16_41.x;
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
    u_xlat16_59 = u_xlat16_41.x * -2.0 + 3.0;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_59;
    u_xlat16_8 = min(u_xlat16_41.x, 1.0);
    u_xlatb56 = 0.96875>=u_xlat8.y;
    u_xlat8.x = u_xlat16_8;
    u_xlat10_26.xyz = texture2D(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_13.xyz = u_xlat10_26.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat10_26.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat10_26.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat9.xyz + (-u_xlat9.xyz);
    u_xlat16_14.xyz = vec3(_RampDifLerpValue) * u_xlat16_14.xyz + u_xlat9.xyz;
    u_xlat16_15.xyz = u_xlat16_14.xyz * _DarkColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _LightAreaColor.xyz + (-u_xlat16_15.xyz);
    u_xlat16_14.xyz = u_xlat8.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat26.xy = u_xlat10.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat26.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat10.xx + u_xlat26.xy;
    u_xlat26.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat10.zz + u_xlat26.xy;
    u_xlat16_41.xy = u_xlat26.xy + vec2(1.0, 1.0);
    u_xlat16_67 = u_xlat3.y * 0.100000001;
    u_xlat11.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat11.y = u_xlat16_67 * _matCapSpeEffectedByLightDir;
    u_xlat16_41.xy = u_xlat16_41.xy * vec2(0.5, 0.5) + (-u_xlat11.xy);
    u_xlat10_4 = texture2D(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_15.xy = u_xlat10_4.yx * vec2(_metallic, _roughness);
    u_xlat16_15.xy = clamp(u_xlat16_15.xy, 0.0, 1.0);
    u_xlatb62 = 0.100000001>=u_xlat10_4.z;
    u_xlatb63 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
    u_xlatb62 = u_xlatb62 && u_xlatb63;
    u_xlatb63 = 0.100000001<u_xlat10_4.z;
    u_xlatb64 = u_xlat10_4.z<0.449999988;
    u_xlatb63 = u_xlatb63 && u_xlatb64;
    u_xlatb64 = u_xlatb62 || u_xlatb63;
    u_xlat16_67 = u_xlat16_15.y * 6.0;
    u_xlat16_67 = (u_xlatb64) ? 0.0 : u_xlat16_67;
    u_xlat10_7 = texture2DLodEXT(_MatcapTex, u_xlat16_41.xy, u_xlat16_67);
    u_xlat16_16.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat10_7.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat10_7.xyz * u_xlat16_16.xyz;
    u_xlat64 = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
    if(u_xlatb62){
        u_xlat16_41.x = log2(u_xlat64);
        u_xlat16_41.x = u_xlat16_41.x * _ClearNovPow;
        u_xlat16_41.x = exp2(u_xlat16_41.x);
        u_xlat11.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat10_62 = texture2D(_ClearCoatTex, u_xlat11.xy).x;
        u_xlat16_59 = log2(u_xlat10_62);
        u_xlat16_59 = u_xlat16_59 * _ClearCoatPow;
        u_xlat16_59 = exp2(u_xlat16_59);
        u_xlat16_59 = u_xlat16_59 * _ClearCoatStrength;
        u_xlat16_41.x = u_xlat16_41.x * u_xlat16_59;
        u_xlat16_59 = (-u_xlat16_5.x) + 1.21000004;
        u_xlat16_59 = min(u_xlat16_59, 1.0);
        u_xlat16_41.x = u_xlat16_59 * u_xlat16_41.x;
        u_xlat16_16.xyz = u_xlat10_7.xyz * u_xlat16_16.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_16.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_16.xyz = u_xlat16_41.xxx * u_xlat16_16.xyz;
        u_xlat16_23.xyz = u_xlat16_23.xxx * u_xlat16_16.xyz;
        u_xlat16_23.xyz = u_xlat10_4.www * u_xlat16_23.xyz;
        u_xlatb62 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
        u_xlat16_16.xyz = u_xlat10_7.www * u_xlat16_23.xyz;
        u_xlat16_23.xyz = (bool(u_xlatb62)) ? u_xlat16_16.xyz : u_xlat16_23.xyz;
        u_xlat16_23.xyz = u_xlat16_23.xyz + u_xlat16_14.xyz;
    } else {
        u_xlat16_67 = (-u_xlat16_15.x) + 1.0;
        u_xlat16_23.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
    }
    if(u_xlatb56){
        u_xlat16_67 = u_xlat0.x;
        u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
        u_xlat11.xyz = u_xlat9.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat11.xyz = u_xlat16_15.xxx * u_xlat11.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat55) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat10.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat16_14.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_14.y = u_xlat16_15.y * u_xlat16_15.y;
        u_xlat16_14.xz = u_xlat16_14.xy * u_xlat16_14.xy;
        u_xlat16_32 = u_xlat16_14.y * u_xlat16_14.y + -1.0;
        u_xlat16_14.x = u_xlat16_14.x * u_xlat16_32 + 1.0;
        u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
        u_xlat16_14.x = u_xlat16_14.z / u_xlat16_14.x;
        u_xlat16_14.x = u_xlat16_14.x * 0.318309873;
        u_xlat16_32 = (-u_xlat64) * u_xlat16_14.z + u_xlat64;
        u_xlat16_32 = u_xlat64 * u_xlat16_32 + u_xlat16_14.z;
        u_xlat16_32 = sqrt(u_xlat16_32);
        u_xlat16_32 = u_xlat64 + u_xlat16_32;
        u_xlat16_68 = (-u_xlat16_67) * u_xlat16_14.z + u_xlat16_67;
        u_xlat16_50 = u_xlat16_67 * u_xlat16_68 + u_xlat16_14.z;
        u_xlat16_50 = sqrt(u_xlat16_50);
        u_xlat16_50 = u_xlat16_67 + u_xlat16_50;
        u_xlat16_32 = u_xlat16_50 * u_xlat16_32;
        u_xlat16_14.y = float(1.0) / u_xlat16_32;
        u_xlat16_14.z = (-u_xlat1.x) + 1.0;
        u_xlat16_14.xw = u_xlat16_14.xz * u_xlat16_14.yz;
        u_xlat16_68 = u_xlat16_14.w * u_xlat16_14.w;
        u_xlat16_15.x = u_xlat16_14.z * u_xlat16_68;
        u_xlat16_51 = u_xlat11.y * 50.0;
        u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
        u_xlat16_50 = (-u_xlat16_68) * u_xlat16_14.z + 1.0;
        u_xlat16_16.xyz = u_xlat11.xyz * vec3(u_xlat16_50);
        u_xlat16_15.xzw = vec3(u_xlat16_51) * u_xlat16_15.xxx + u_xlat16_16.xyz;
        u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_15.xzw;
        u_xlat16_14.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
        u_xlat16_14.xyz = u_xlat8.xxx * u_xlat16_14.xyz;
        u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
        u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_speStr, _speStr, _speStr));
        u_xlat0.x = (-u_xlat64) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_68 = (-u_xlat16_15.y) + 1.0;
        u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
        u_xlat16_68 = u_xlat16_68 * 0.899999976 + 0.100000001;
        u_xlat16_15.xyz = u_xlat10_7.www * _customMatcapCol.xyz;
        u_xlat16_15.xyz = (bool(u_xlatb63)) ? u_xlat16_15.xyz : u_xlat16_17.xyz;
        u_xlat1.x = u_xlat64 + _customMatcapFresnelRange;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat19 = u_xlatb63 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat19 * u_xlat1.x + 1.0;
        u_xlat16_69 = (u_xlatb63) ? 1.0 : 0.0;
        u_xlat16_16.x = (-u_xlat0.x) + 1.0;
        u_xlat16_16.x = u_xlat16_69 * u_xlat16_16.x + u_xlat0.x;
        u_xlat16_34 = (-_inDirectSpeStr) + 1.0;
        u_xlat16_69 = u_xlat16_69 * u_xlat16_34 + _inDirectSpeStr;
        u_xlat16_69 = u_xlat10_4.w * u_xlat16_69;
        u_xlat16_15.xyz = vec3(u_xlat16_69) * u_xlat16_15.xyz;
        u_xlat16_15.xyz = u_xlat16_16.xxx * u_xlat16_15.xyz;
        u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat16_15.xyz;
        u_xlat16_68 = (-u_xlat16_5.x) + 1.21000004;
        u_xlat16_68 = min(u_xlat16_68, 1.0);
        u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat16_15.xyz;
        u_xlat0.x = (-u_xlat10_6.w) + 1.0;
        u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
        u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat1.xxx + u_xlat16_14.xyz;
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
        if(u_xlatb0){
            u_xlat16_14.xy = u_xlat3.xy + (-u_xlat26.xy);
            u_xlat16_14.xy = _throughSkinSpeDir.ww * u_xlat16_14.xy + u_xlat26.xy;
            u_xlat16_14.xy = u_xlat16_14.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_14.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat10_0 = texture2D(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_14.x = u_xlat10_0 * 0.349999994;
            u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
            u_xlat16_5.x = u_xlat16_5.x * u_xlat16_14.x;
            u_xlat16_5.x = u_xlat16_67 * u_xlat16_5.x;
            u_xlat16_23.xyz = u_xlat16_5.xxx * _SkinEffectCol.xyz + u_xlat16_23.xyz;
        }
    }
    u_xlat16_5.x = u_xlat10_39.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat1.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + _EmisstionParams.x;
    u_xlat1.xyz = u_xlat9.xyz * _EmisstionColor.xyz;
    u_xlat16_67 = (-u_xlat10_39.y) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_67);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat16_23.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
    u_xlat16_23.x = 1.0;
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat1.xyz;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_23.x : u_xlat16_5.x;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat2.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.xz = u_xlat18.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat18.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat18.zz + u_xlat0.xy;
    u_xlat36.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat36.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat36.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat36.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_41.x = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_41.x);
    u_xlat16_5 = u_xlat0 * u_xlat16_5.xxzz;
    u_xlat16_5.x = dot(u_xlat16_5.xy, u_xlat16_5.zw);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _ColorScaleByLightDir;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_23.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_23.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_23.xy + u_xlat0.xy;
    u_xlat16_59 = dot(u_xlat16_23.xy, u_xlat16_23.xy);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_23.xy = vec2(u_xlat16_59) * u_xlat16_23.xy;
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
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx + u_xlat16_13.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb0 = 0.5<_pointLightOn;
    u_xlat18.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat18.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat18.x = sqrt(u_xlat18.x);
    u_xlat16_59 = u_xlat18.x + 9.99999975e-05;
    u_xlat16_59 = log2(u_xlat16_59);
    u_xlat16_59 = u_xlat16_59 * _pointLightAtten;
    u_xlat16_59 = exp2(u_xlat16_59);
    u_xlat16_59 = float(1.0) / u_xlat16_59;
    u_xlat16_13.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_13.x = u_xlat18.x / u_xlat16_13.x;
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = u_xlat16_13.x + -0.800000012;
    u_xlat16_13.x = u_xlat16_13.x * 5.00000048;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_31.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = (-u_xlat16_31.x) * u_xlat16_13.x + 1.0;
    u_xlat16_31.xyz = vec3(u_xlat16_59) * _pointLightColor.xyz;
    u_xlat16_13.xyz = u_xlat16_31.xyz * u_xlat16_13.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_5.xyz;
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
attribute highp vec2 in_TEXCOORD3;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_EXPREUV0;
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
    vs_VAR_EXPREUV0.xy = in_TEXCOORD3.xy;
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
uniform 	mediump vec4 _ParallaxTex_ST;
uniform 	mediump float _FlowIntensity;
uniform 	float _FlowSpeed;
uniform 	mediump float _ParallaxIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _FlowMapTex;
uniform lowp sampler2D _ParallaxTex;
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
varying highp vec2 vs_VAR_EXPREUV0;
varying highp vec2 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
lowp vec4 u_xlat10_6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec4 u_xlat9;
lowp vec4 u_xlat10_9;
vec4 u_xlat10;
vec3 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
float u_xlat19;
mediump vec3 u_xlat16_23;
vec2 u_xlat26;
lowp vec3 u_xlat10_26;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_32;
mediump float u_xlat16_34;
vec2 u_xlat36;
vec2 u_xlat39;
lowp vec2 u_xlat10_39;
mediump vec2 u_xlat16_41;
vec2 u_xlat44;
bool u_xlatb44;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
float u_xlat55;
float u_xlat56;
lowp float u_xlat10_56;
bool u_xlatb56;
mediump float u_xlat16_59;
mediump float u_xlat16_60;
lowp float u_xlat10_62;
bool u_xlatb62;
bool u_xlatb63;
float u_xlat64;
bool u_xlatb64;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
mediump float u_xlat16_69;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat18.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat55 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat1.xyz = vec3(u_xlat55) * u_xlat1.xyz;
    u_xlat55 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat2.xyz = vec3(u_xlat55) * _WorldSpaceLightPos0.xyz;
    u_xlat3.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat3.xy;
    u_xlat3.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat3.xy;
    u_xlat16_4 = (-_USE3UV_ON) + 1.0;
    u_xlat39.xy = vs_TEXCOORD9.xy * vec2(vec2(_USE3UV_ON, _USE3UV_ON));
    u_xlat39.xy = vs_TEXCOORD0.xy * vec2(u_xlat16_4) + u_xlat39.xy;
    u_xlat10_4 = texture2D(_MainTex, u_xlat39.xy);
    u_xlat16_5.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat10_4.xyz * u_xlat16_5.xyz;
    u_xlat10_56 = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).x;
    u_xlat16_59 = u_xlat10_56 + -1.0;
    u_xlat16_59 = _InSideLineStrength * u_xlat16_59 + 1.0;
    u_xlat16_59 = clamp(u_xlat16_59, 0.0, 1.0);
    u_xlat16_6.xyz = u_xlat16_5.xyz * _InSideLineColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_59) * u_xlat16_6.xyz;
    u_xlat56 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_60 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_60 = u_xlat16_59 * u_xlat16_60 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_59) + (-vec3(u_xlat56));
    u_xlat8.xyz = vec3(u_xlat16_60) * u_xlat8.xyz + vec3(u_xlat56);
    u_xlat16_59 = (-u_xlat16_59) + 1.0;
    u_xlat16_7.xyz = u_xlat8.xyz * vec3(u_xlat16_59) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_59) * u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat10_39.xy = texture2D(_LightMapTex, vs_TEXCOORD0.xy).xz;
    u_xlat8.xyz = texture2D(_NormalTex, vs_TEXCOORD0.xy).xzy;
    u_xlat44.xy = u_xlat8.xz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat56 = (-u_xlat44.x) * u_xlat44.x + 1.0;
    u_xlat56 = (-u_xlat44.y) * u_xlat44.y + u_xlat56;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat9.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat9.xyz = u_xlat9.xxx * vs_TEXCOORD5.xyz;
    u_xlat10.xyz = u_xlat18.zxy * u_xlat9.yzx;
    u_xlat10.xyz = u_xlat18.yzx * u_xlat9.zxy + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vs_TEXCOORD5.www;
    u_xlat11.xyz = u_xlat44.yyy * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat44.xxx * u_xlat9.xyz + u_xlat11.xyz;
    u_xlat11.xyz = vec3(u_xlat56) * u_xlat18.xyz + u_xlat11.xyz;
    u_xlat10_6 = texture2D(_FlowMapTex, vs_VAR_EXPREUV0.xy);
    u_xlat7 = u_xlat10_6.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat7 = u_xlat7 * vec4(_FlowIntensity);
    u_xlat56 = _Time.y * _FlowSpeed;
    u_xlat44.x = _Time.y * _FlowSpeed + 0.5;
    u_xlat12.xy = fract(vec2(u_xlat56));
    u_xlat12.zw = fract(u_xlat44.xx);
    u_xlat56 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat10.xyz = vec3(u_xlat56) * u_xlat10.xyz;
    u_xlat9.x = dot(u_xlat9.xyz, u_xlat1.xyz);
    u_xlat9.y = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat44.xy = vs_TEXCOORD0.xy * _ParallaxTex_ST.xy + _ParallaxTex_ST.zw;
    u_xlat10_56 = texture2D(_FlowMapTex, u_xlat44.xy).w;
    u_xlat56 = u_xlat10_56 + -0.5;
    u_xlat9 = u_xlat9.xyxy * vec4(_ParallaxIntensity);
    u_xlat10 = vs_VAR_EXPREUV0.xyxy * _ParallaxTex_ST.xyxy + _ParallaxTex_ST.zwzw;
    u_xlat9 = (-u_xlat9) * vec4(u_xlat56) + u_xlat10;
    u_xlat7 = u_xlat7 * u_xlat12;
    u_xlat7 = u_xlat7 * u_xlat10_6.zzzz + u_xlat9;
    u_xlat10_9 = texture2D(_ParallaxTex, u_xlat7.xy);
    u_xlat10_7 = texture2D(_ParallaxTex, u_xlat7.zw);
    u_xlat56 = (-u_xlat12.y) * 2.0 + 1.0;
    u_xlat7 = (-u_xlat10_9) + u_xlat10_7;
    u_xlat7 = abs(vec4(u_xlat56)) * u_xlat7 + u_xlat10_9;
    u_xlat16_13.xyz = u_xlat7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xyz = u_xlat7.xyz * u_xlat16_13.xyz + (-u_xlat16_5.xyz);
    u_xlat56 = (-u_xlat10_4.w) + u_xlat7.w;
    u_xlat9.xyz = u_xlat10_6.zzz * u_xlat9.xyz + u_xlat16_5.xyz;
    u_xlat56 = u_xlat10_6.z * u_xlat56 + u_xlat10_4.w;
    u_xlat10.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat10.xyz = vec3(_NormalStr) * u_xlat10.xyz + u_xlat18.xyz;
    u_xlat16_5.x = (-u_xlat56) + 1.0;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat10.xyz, u_xlat2.xyz);
    u_xlat16_23.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_41.x = _ShadowThreshold + 0.5;
    u_xlat10_56 = texture2D(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat56 = u_xlat10_56 + -0.5;
    u_xlatb44 = 0.99000001<u_xlat16_5.x;
    u_xlat16_59 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_59 = (u_xlatb44) ? u_xlat16_59 : 0.0;
    u_xlat16_59 = u_xlat16_59 + _selfShadowAdjust;
    u_xlat56 = u_xlat16_5.x * u_xlat16_59 + u_xlat56;
    u_xlat56 = u_xlat56 + u_xlat16_41.x;
    u_xlat16_41.x = u_xlat56 + (-_ShadowFeather);
    u_xlat16_59 = u_xlat56 + _ShadowFeather;
    u_xlat16_59 = (-u_xlat16_41.x) + u_xlat16_59;
    u_xlat16_41.x = (-u_xlat16_41.x) + u_xlat16_23.x;
    u_xlat16_59 = float(1.0) / u_xlat16_59;
    u_xlat16_41.x = u_xlat16_59 * u_xlat16_41.x;
    u_xlat16_41.x = clamp(u_xlat16_41.x, 0.0, 1.0);
    u_xlat16_59 = u_xlat16_41.x * -2.0 + 3.0;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_41.x;
    u_xlat16_41.x = u_xlat16_41.x * u_xlat16_59;
    u_xlat16_8 = min(u_xlat16_41.x, 1.0);
    u_xlatb56 = 0.96875>=u_xlat8.y;
    u_xlat8.x = u_xlat16_8;
    u_xlat10_26.xyz = texture2D(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_13.xyz = u_xlat10_26.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat10_26.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat10_26.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat9.xyz + (-u_xlat9.xyz);
    u_xlat16_14.xyz = vec3(_RampDifLerpValue) * u_xlat16_14.xyz + u_xlat9.xyz;
    u_xlat16_15.xyz = u_xlat16_14.xyz * _DarkColor.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _LightAreaColor.xyz + (-u_xlat16_15.xyz);
    u_xlat16_14.xyz = u_xlat8.xxx * u_xlat16_14.xyz + u_xlat16_15.xyz;
    u_xlat26.xy = u_xlat10.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat26.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat10.xx + u_xlat26.xy;
    u_xlat26.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat10.zz + u_xlat26.xy;
    u_xlat16_41.xy = u_xlat26.xy + vec2(1.0, 1.0);
    u_xlat16_67 = u_xlat3.y * 0.100000001;
    u_xlat11.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat11.y = u_xlat16_67 * _matCapSpeEffectedByLightDir;
    u_xlat16_41.xy = u_xlat16_41.xy * vec2(0.5, 0.5) + (-u_xlat11.xy);
    u_xlat10_4 = texture2D(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_15.xy = u_xlat10_4.yx * vec2(_metallic, _roughness);
    u_xlat16_15.xy = clamp(u_xlat16_15.xy, 0.0, 1.0);
    u_xlatb62 = 0.100000001>=u_xlat10_4.z;
    u_xlatb63 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
    u_xlatb62 = u_xlatb62 && u_xlatb63;
    u_xlatb63 = 0.100000001<u_xlat10_4.z;
    u_xlatb64 = u_xlat10_4.z<0.449999988;
    u_xlatb63 = u_xlatb63 && u_xlatb64;
    u_xlatb64 = u_xlatb62 || u_xlatb63;
    u_xlat16_67 = u_xlat16_15.y * 6.0;
    u_xlat16_67 = (u_xlatb64) ? 0.0 : u_xlat16_67;
    u_xlat10_7 = texture2DLodEXT(_MatcapTex, u_xlat16_41.xy, u_xlat16_67);
    u_xlat16_16.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_16.xyz = u_xlat10_7.xyz * u_xlat16_16.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat10_7.xyz * u_xlat16_16.xyz;
    u_xlat64 = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
    if(u_xlatb62){
        u_xlat16_41.x = log2(u_xlat64);
        u_xlat16_41.x = u_xlat16_41.x * _ClearNovPow;
        u_xlat16_41.x = exp2(u_xlat16_41.x);
        u_xlat11.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat10_62 = texture2D(_ClearCoatTex, u_xlat11.xy).x;
        u_xlat16_59 = log2(u_xlat10_62);
        u_xlat16_59 = u_xlat16_59 * _ClearCoatPow;
        u_xlat16_59 = exp2(u_xlat16_59);
        u_xlat16_59 = u_xlat16_59 * _ClearCoatStrength;
        u_xlat16_41.x = u_xlat16_41.x * u_xlat16_59;
        u_xlat16_59 = (-u_xlat16_5.x) + 1.21000004;
        u_xlat16_59 = min(u_xlat16_59, 1.0);
        u_xlat16_41.x = u_xlat16_59 * u_xlat16_41.x;
        u_xlat16_16.xyz = u_xlat10_7.xyz * u_xlat16_16.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_16.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_16.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_16.xyz = u_xlat16_41.xxx * u_xlat16_16.xyz;
        u_xlat16_23.xyz = u_xlat16_23.xxx * u_xlat16_16.xyz;
        u_xlat16_23.xyz = u_xlat10_4.www * u_xlat16_23.xyz;
        u_xlatb62 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
        u_xlat16_16.xyz = u_xlat10_7.www * u_xlat16_23.xyz;
        u_xlat16_23.xyz = (bool(u_xlatb62)) ? u_xlat16_16.xyz : u_xlat16_23.xyz;
        u_xlat16_23.xyz = u_xlat16_23.xyz + u_xlat16_14.xyz;
    } else {
        u_xlat16_67 = (-u_xlat16_15.x) + 1.0;
        u_xlat16_23.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
    }
    if(u_xlatb56){
        u_xlat16_67 = u_xlat0.x;
        u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
        u_xlat11.xyz = u_xlat9.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat11.xyz = u_xlat16_15.xxx * u_xlat11.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat55) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat10.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat16_14.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_14.y = u_xlat16_15.y * u_xlat16_15.y;
        u_xlat16_14.xz = u_xlat16_14.xy * u_xlat16_14.xy;
        u_xlat16_32 = u_xlat16_14.y * u_xlat16_14.y + -1.0;
        u_xlat16_14.x = u_xlat16_14.x * u_xlat16_32 + 1.0;
        u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
        u_xlat16_14.x = u_xlat16_14.z / u_xlat16_14.x;
        u_xlat16_14.x = u_xlat16_14.x * 0.318309873;
        u_xlat16_32 = (-u_xlat64) * u_xlat16_14.z + u_xlat64;
        u_xlat16_32 = u_xlat64 * u_xlat16_32 + u_xlat16_14.z;
        u_xlat16_32 = sqrt(u_xlat16_32);
        u_xlat16_32 = u_xlat64 + u_xlat16_32;
        u_xlat16_68 = (-u_xlat16_67) * u_xlat16_14.z + u_xlat16_67;
        u_xlat16_50 = u_xlat16_67 * u_xlat16_68 + u_xlat16_14.z;
        u_xlat16_50 = sqrt(u_xlat16_50);
        u_xlat16_50 = u_xlat16_67 + u_xlat16_50;
        u_xlat16_32 = u_xlat16_50 * u_xlat16_32;
        u_xlat16_14.y = float(1.0) / u_xlat16_32;
        u_xlat16_14.z = (-u_xlat1.x) + 1.0;
        u_xlat16_14.xw = u_xlat16_14.xz * u_xlat16_14.yz;
        u_xlat16_68 = u_xlat16_14.w * u_xlat16_14.w;
        u_xlat16_15.x = u_xlat16_14.z * u_xlat16_68;
        u_xlat16_51 = u_xlat11.y * 50.0;
        u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
        u_xlat16_50 = (-u_xlat16_68) * u_xlat16_14.z + 1.0;
        u_xlat16_16.xyz = u_xlat11.xyz * vec3(u_xlat16_50);
        u_xlat16_15.xzw = vec3(u_xlat16_51) * u_xlat16_15.xxx + u_xlat16_16.xyz;
        u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_15.xzw;
        u_xlat16_14.xyz = vec3(u_xlat16_67) * u_xlat16_14.xyz;
        u_xlat16_14.xyz = u_xlat8.xxx * u_xlat16_14.xyz;
        u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
        u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_speStr, _speStr, _speStr));
        u_xlat0.x = (-u_xlat64) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_68 = (-u_xlat16_15.y) + 1.0;
        u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
        u_xlat16_68 = u_xlat16_68 * 0.899999976 + 0.100000001;
        u_xlat16_15.xyz = u_xlat10_7.www * _customMatcapCol.xyz;
        u_xlat16_15.xyz = (bool(u_xlatb63)) ? u_xlat16_15.xyz : u_xlat16_17.xyz;
        u_xlat1.x = u_xlat64 + _customMatcapFresnelRange;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat19 = u_xlatb63 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat19 * u_xlat1.x + 1.0;
        u_xlat16_69 = (u_xlatb63) ? 1.0 : 0.0;
        u_xlat16_16.x = (-u_xlat0.x) + 1.0;
        u_xlat16_16.x = u_xlat16_69 * u_xlat16_16.x + u_xlat0.x;
        u_xlat16_34 = (-_inDirectSpeStr) + 1.0;
        u_xlat16_69 = u_xlat16_69 * u_xlat16_34 + _inDirectSpeStr;
        u_xlat16_69 = u_xlat10_4.w * u_xlat16_69;
        u_xlat16_15.xyz = vec3(u_xlat16_69) * u_xlat16_15.xyz;
        u_xlat16_15.xyz = u_xlat16_16.xxx * u_xlat16_15.xyz;
        u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat16_15.xyz;
        u_xlat16_68 = (-u_xlat16_5.x) + 1.21000004;
        u_xlat16_68 = min(u_xlat16_68, 1.0);
        u_xlat16_15.xyz = vec3(u_xlat16_68) * u_xlat16_15.xyz;
        u_xlat0.x = (-u_xlat10_6.w) + 1.0;
        u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
        u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat1.xxx + u_xlat16_14.xyz;
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
        if(u_xlatb0){
            u_xlat16_14.xy = u_xlat3.xy + (-u_xlat26.xy);
            u_xlat16_14.xy = _throughSkinSpeDir.ww * u_xlat16_14.xy + u_xlat26.xy;
            u_xlat16_14.xy = u_xlat16_14.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_14.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat10_0 = texture2D(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_14.x = u_xlat10_0 * 0.349999994;
            u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
            u_xlat16_5.x = u_xlat16_5.x * u_xlat16_14.x;
            u_xlat16_5.x = u_xlat16_67 * u_xlat16_5.x;
            u_xlat16_23.xyz = u_xlat16_5.xxx * _SkinEffectCol.xyz + u_xlat16_23.xyz;
        }
    }
    u_xlat16_5.x = u_xlat10_39.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat1.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat1.x + _EmisstionParams.x;
    u_xlat1.xyz = u_xlat9.xyz * _EmisstionColor.xyz;
    u_xlat16_67 = (-u_xlat10_39.y) + 1.0;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_67);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat0.xxx + u_xlat16_23.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowRamp);
    u_xlat16_23.x = 1.0;
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat1.xyz;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_23.x : u_xlat16_5.x;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat2.xyz = _WorldSpaceLightPos0.xyz + _depthRimOffset.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.xz = u_xlat18.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat18.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat18.zz + u_xlat0.xy;
    u_xlat36.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat36.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat36.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat36.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_41.x = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_41.x);
    u_xlat16_5 = u_xlat0 * u_xlat16_5.xxzz;
    u_xlat16_5.x = dot(u_xlat16_5.xy, u_xlat16_5.zw);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _ColorScaleByLightDir;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.x = min(u_xlat16_5.x, 1.0);
    u_xlat16_23.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat16_23.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_23.xy + u_xlat0.xy;
    u_xlat16_59 = dot(u_xlat16_23.xy, u_xlat16_23.xy);
    u_xlat16_59 = inversesqrt(u_xlat16_59);
    u_xlat16_23.xy = vec2(u_xlat16_59) * u_xlat16_23.xy;
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
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx + u_xlat16_13.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlatb0 = 0.5<_pointLightOn;
    u_xlat18.xyz = (-vs_TEXCOORD6.xyz) + _pointLightPos.xyz;
    u_xlat18.x = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat18.x = sqrt(u_xlat18.x);
    u_xlat16_59 = u_xlat18.x + 9.99999975e-05;
    u_xlat16_59 = log2(u_xlat16_59);
    u_xlat16_59 = u_xlat16_59 * _pointLightAtten;
    u_xlat16_59 = exp2(u_xlat16_59);
    u_xlat16_59 = float(1.0) / u_xlat16_59;
    u_xlat16_13.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_13.x = u_xlat18.x / u_xlat16_13.x;
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = u_xlat16_13.x + -0.800000012;
    u_xlat16_13.x = u_xlat16_13.x * 5.00000048;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_31.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = (-u_xlat16_31.x) * u_xlat16_13.x + 1.0;
    u_xlat16_31.xyz = vec3(u_xlat16_59) * _pointLightColor.xyz;
    u_xlat16_13.xyz = u_xlat16_31.xyz * u_xlat16_13.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_5.xyz;
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
in highp vec2 in_TEXCOORD3;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_VAR_LIUUV0;
out highp vec2 vs_VAR_EXPREUV0;
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
    vs_VAR_LIUUV0.xy = in_TEXCOORD2.xy;
    vs_VAR_EXPREUV0.xy = in_TEXCOORD3.xy;
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
uniform 	mediump vec4 _ParallaxTex_ST;
uniform 	mediump float _FlowIntensity;
uniform 	float _FlowSpeed;
uniform 	mediump float _ParallaxIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMapTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ParallaxTex;
UNITY_LOCATION(6) uniform mediump sampler2D _ShadowOffsetTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(8) uniform mediump sampler2D _PBRTexture;
UNITY_LOCATION(9) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ClearCoatTex;
UNITY_LOCATION(11) uniform mediump sampler2D _SkinEffectTex;
UNITY_LOCATION(12) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(13) uniform mediump sampler2D _LG_Tex2;
UNITY_LOCATION(14) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_VAR_LIUUV0;
in highp vec2 vs_VAR_EXPREUV0;
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
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
vec4 u_xlat10;
vec3 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
float u_xlat18;
mediump vec3 u_xlat16_22;
vec2 u_xlat25;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_32;
vec2 u_xlat34;
vec2 u_xlat36;
vec2 u_xlat37;
mediump vec2 u_xlat16_37;
mediump vec2 u_xlat16_39;
vec2 u_xlat42;
bool u_xlatb42;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
float u_xlat52;
float u_xlat53;
mediump float u_xlat16_53;
bool u_xlatb53;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump float u_xlat16_59;
bool u_xlatb59;
bool u_xlatb61;
float u_xlat62;
bool u_xlatb62;
mediump float u_xlat16_64;
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
    u_xlat53 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_57 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_57 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_56) + (-vec3(u_xlat53));
    u_xlat8.xyz = vec3(u_xlat16_57) * u_xlat8.xyz + vec3(u_xlat53);
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_7.xyz = u_xlat8.xyz * vec3(u_xlat16_56) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_56) * u_xlat16_7.xyz + u_xlat16_5.xyz;
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
    u_xlat11.xyz = u_xlat42.yyy * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat42.xxx * u_xlat9.xyz + u_xlat11.xyz;
    u_xlat11.xyz = vec3(u_xlat53) * u_xlat17.xyz + u_xlat11.xyz;
    u_xlat16_6 = texture(_FlowMapTex, vs_VAR_EXPREUV0.xy);
    u_xlat7 = u_xlat16_6.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat7 = u_xlat7 * vec4(_FlowIntensity);
    u_xlat53 = _Time.y * _FlowSpeed;
    u_xlat42.x = _Time.y * _FlowSpeed + 0.5;
    u_xlat12.xy = fract(vec2(u_xlat53));
    u_xlat12.zw = fract(u_xlat42.xx);
    u_xlat53 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat10.xyz = vec3(u_xlat53) * u_xlat10.xyz;
    u_xlat9.x = dot(u_xlat9.xyz, u_xlat1.xyz);
    u_xlat9.y = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat42.xy = vs_TEXCOORD0.xy * _ParallaxTex_ST.xy + _ParallaxTex_ST.zw;
    u_xlat16_53 = texture(_FlowMapTex, u_xlat42.xy).w;
    u_xlat53 = u_xlat16_53 + -0.5;
    u_xlat9 = u_xlat9.xyxy * vec4(_ParallaxIntensity);
    u_xlat10 = vs_VAR_EXPREUV0.xyxy * _ParallaxTex_ST.xyxy + _ParallaxTex_ST.zwzw;
    u_xlat9 = (-u_xlat9) * vec4(u_xlat53) + u_xlat10;
    u_xlat7 = u_xlat7 * u_xlat12;
    u_xlat7 = u_xlat7 * u_xlat16_6.zzzz + u_xlat9;
    u_xlat16_9 = texture(_ParallaxTex, u_xlat7.xy);
    u_xlat16_7 = texture(_ParallaxTex, u_xlat7.zw);
    u_xlat53 = (-u_xlat12.y) * 2.0 + 1.0;
    u_xlat7 = (-u_xlat16_9) + u_xlat16_7;
    u_xlat7 = abs(vec4(u_xlat53)) * u_xlat7 + u_xlat16_9;
    u_xlat16_13.xyz = u_xlat7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xyz = u_xlat7.xyz * u_xlat16_13.xyz + (-u_xlat16_5.xyz);
    u_xlat53 = (-u_xlat16_4.w) + u_xlat7.w;
    u_xlat10.xyz = u_xlat16_6.zzz * u_xlat9.xyz + u_xlat16_5.xyz;
    u_xlat53 = u_xlat16_6.z * u_xlat53 + u_xlat16_4.w;
    u_xlat11.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat11.xyz = vec3(_NormalStr) * u_xlat11.xyz + u_xlat17.xyz;
    u_xlat16_5.x = (-u_xlat53) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat2.xyz);
    u_xlat16_22.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_39.x = _ShadowThreshold + 0.5;
    u_xlat16_53 = texture(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat53 = u_xlat16_53 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.99000001<u_xlat16_5.x);
#else
    u_xlatb42 = 0.99000001<u_xlat16_5.x;
#endif
    u_xlat16_56 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_56 = (u_xlatb42) ? u_xlat16_56 : 0.0;
    u_xlat16_56 = u_xlat16_56 + _selfShadowAdjust;
    u_xlat53 = u_xlat16_5.x * u_xlat16_56 + u_xlat53;
    u_xlat53 = u_xlat53 + u_xlat16_39.x;
    u_xlat16_39.x = u_xlat53 + (-_ShadowFeather);
    u_xlat16_56 = u_xlat53 + _ShadowFeather;
    u_xlat16_56 = (-u_xlat16_39.x) + u_xlat16_56;
    u_xlat16_39.x = (-u_xlat16_39.x) + u_xlat16_22.x;
    u_xlat16_56 = float(1.0) / u_xlat16_56;
    u_xlat16_39.x = u_xlat16_56 * u_xlat16_39.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39.x = min(max(u_xlat16_39.x, 0.0), 1.0);
#else
    u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
#endif
    u_xlat16_56 = u_xlat16_39.x * -2.0 + 3.0;
    u_xlat16_39.x = u_xlat16_39.x * u_xlat16_39.x;
    u_xlat16_39.x = u_xlat16_39.x * u_xlat16_56;
    u_xlat16_8.x = min(u_xlat16_39.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(0.96875>=u_xlat8.y);
#else
    u_xlatb53 = 0.96875>=u_xlat8.y;
#endif
    u_xlat8.x = u_xlat16_8.x;
    u_xlat16_25.xyz = texture(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_25.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_25.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_25.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * u_xlat10.xyz + (-u_xlat10.xyz);
    u_xlat16_13.xyz = vec3(_RampDifLerpValue) * u_xlat16_13.xyz + u_xlat10.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * _DarkColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _LightAreaColor.xyz + (-u_xlat16_14.xyz);
    u_xlat16_13.xyz = u_xlat8.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat25.xy = u_xlat11.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat25.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat11.xx + u_xlat25.xy;
    u_xlat25.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat11.zz + u_xlat25.xy;
    u_xlat16_39.xy = u_xlat25.xy + vec2(1.0, 1.0);
    u_xlat16_64 = u_xlat3.y * 0.100000001;
    u_xlat12.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat12.y = u_xlat16_64 * _matCapSpeEffectedByLightDir;
    u_xlat16_39.xy = u_xlat16_39.xy * vec2(0.5, 0.5) + (-u_xlat12.xy);
    u_xlat16_7 = texture(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_14.xy = u_xlat16_7.yx * vec2(_metallic, _roughness);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xy = min(max(u_xlat16_14.xy, 0.0), 1.0);
#else
    u_xlat16_14.xy = clamp(u_xlat16_14.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.100000001>=u_xlat16_7.z);
#else
    u_xlatb59 = 0.100000001>=u_xlat16_7.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat));
#else
    u_xlatb61 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
#endif
    u_xlatb59 = u_xlatb59 && u_xlatb61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(0.100000001<u_xlat16_7.z);
#else
    u_xlatb61 = 0.100000001<u_xlat16_7.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(u_xlat16_7.z<0.449999988);
#else
    u_xlatb62 = u_xlat16_7.z<0.449999988;
#endif
    u_xlatb61 = u_xlatb61 && u_xlatb62;
    u_xlatb62 = u_xlatb59 || u_xlatb61;
    u_xlat16_64 = u_xlat16_14.y * 6.0;
    u_xlat16_64 = (u_xlatb62) ? 0.0 : u_xlat16_64;
    u_xlat16_9 = textureLod(_MatcapTex, u_xlat16_39.xy, u_xlat16_64);
    u_xlat16_15.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz;
    u_xlat62 = dot(u_xlat11.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    if(u_xlatb59){
        u_xlat16_39.x = log2(u_xlat62);
        u_xlat16_39.x = u_xlat16_39.x * _ClearNovPow;
        u_xlat16_39.x = exp2(u_xlat16_39.x);
        u_xlat12.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat16_59 = texture(_ClearCoatTex, u_xlat12.xy).x;
        u_xlat16_56 = log2(u_xlat16_59);
        u_xlat16_56 = u_xlat16_56 * _ClearCoatPow;
        u_xlat16_56 = exp2(u_xlat16_56);
        u_xlat16_56 = u_xlat16_56 * _ClearCoatStrength;
        u_xlat16_39.x = u_xlat16_39.x * u_xlat16_56;
        u_xlat16_56 = (-u_xlat16_5.x) + 1.21000004;
        u_xlat16_56 = min(u_xlat16_56, 1.0);
        u_xlat16_39.x = u_xlat16_56 * u_xlat16_39.x;
        u_xlat16_15.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_15.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_15.xyz = u_xlat16_39.xxx * u_xlat16_15.xyz;
        u_xlat16_22.xyz = u_xlat16_22.xxx * u_xlat16_15.xyz;
        u_xlat16_22.xyz = u_xlat16_7.www * u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb59 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA));
#else
        u_xlatb59 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
#endif
        u_xlat16_15.xyz = u_xlat16_9.www * u_xlat16_22.xyz;
        u_xlat16_22.xyz = (bool(u_xlatb59)) ? u_xlat16_15.xyz : u_xlat16_22.xyz;
        u_xlat16_22.xyz = u_xlat16_22.xyz + u_xlat16_13.xyz;
    } else {
        u_xlat16_64 = (-u_xlat16_14.x) + 1.0;
        u_xlat16_22.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    }
    if(u_xlatb53){
        u_xlat16_13.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
        u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
        u_xlat12.xyz = u_xlat10.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat12.xyz = u_xlat16_14.xxx * u_xlat12.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat52) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat11.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat16_30.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_30.y = u_xlat16_14.y * u_xlat16_14.y;
        u_xlat16_30.xz = u_xlat16_30.xy * u_xlat16_30.xy;
        u_xlat16_47 = u_xlat16_30.y * u_xlat16_30.y + -1.0;
        u_xlat16_30.x = u_xlat16_30.x * u_xlat16_47 + 1.0;
        u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
        u_xlat16_30.x = u_xlat16_30.z / u_xlat16_30.x;
        u_xlat16_30.x = u_xlat16_30.x * 0.318309873;
        u_xlat16_47 = (-u_xlat62) * u_xlat16_30.z + u_xlat62;
        u_xlat16_47 = u_xlat62 * u_xlat16_47 + u_xlat16_30.z;
        u_xlat16_47 = sqrt(u_xlat16_47);
        u_xlat16_47 = u_xlat62 + u_xlat16_47;
        u_xlat16_14.x = (-u_xlat16_13.x) * u_xlat16_30.z + u_xlat16_13.x;
        u_xlat16_64 = u_xlat16_13.x * u_xlat16_14.x + u_xlat16_30.z;
        u_xlat16_64 = sqrt(u_xlat16_64);
        u_xlat16_64 = u_xlat16_64 + u_xlat16_13.x;
        u_xlat16_47 = u_xlat16_64 * u_xlat16_47;
        u_xlat16_47 = float(1.0) / u_xlat16_47;
        u_xlat16_64 = (-u_xlat1.x) + 1.0;
        u_xlat16_14.x = u_xlat16_64 * u_xlat16_64;
        u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
        u_xlat16_48 = u_xlat16_64 * u_xlat16_14.x;
        u_xlat16_65 = u_xlat12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
        u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
        u_xlat16_64 = (-u_xlat16_14.x) * u_xlat16_64 + 1.0;
        u_xlat16_15.xyz = u_xlat12.xyz * vec3(u_xlat16_64);
        u_xlat16_14.xzw = vec3(u_xlat16_65) * vec3(u_xlat16_48) + u_xlat16_15.xyz;
        u_xlat16_30.x = u_xlat16_30.x * u_xlat16_47;
        u_xlat16_30.xyz = u_xlat16_14.xzw * u_xlat16_30.xxx;
        u_xlat16_30.xyz = u_xlat16_13.xxx * u_xlat16_30.xyz;
        u_xlat16_30.xyz = u_xlat8.xxx * u_xlat16_30.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_30.xyz = min(max(u_xlat16_30.xyz, 0.0), 1.0);
#else
        u_xlat16_30.xyz = clamp(u_xlat16_30.xyz, 0.0, 1.0);
#endif
        u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(vec3(_speStr, _speStr, _speStr));
        u_xlat0.x = (-u_xlat62) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_14.x = (-u_xlat16_14.y) + 1.0;
        u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
        u_xlat16_14.x = u_xlat16_14.x * 0.899999976 + 0.100000001;
        u_xlat16_31.xyz = u_xlat16_9.www * _customMatcapCol.xyz;
        u_xlat16_31.xyz = (bool(u_xlatb61)) ? u_xlat16_31.xyz : u_xlat16_16.xyz;
        u_xlat1.x = u_xlat62 + _customMatcapFresnelRange;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat18 = u_xlatb61 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat18 * u_xlat1.x + 1.0;
        u_xlat16_15.x = (u_xlatb61) ? 1.0 : 0.0;
        u_xlat16_32 = (-u_xlat0.x) + 1.0;
        u_xlat16_32 = u_xlat16_15.x * u_xlat16_32 + u_xlat0.x;
        u_xlat16_49 = (-_inDirectSpeStr) + 1.0;
        u_xlat16_15.x = u_xlat16_15.x * u_xlat16_49 + _inDirectSpeStr;
        u_xlat16_15.x = u_xlat16_7.w * u_xlat16_15.x;
        u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_15.xxx;
        u_xlat16_31.xyz = vec3(u_xlat16_32) * u_xlat16_31.xyz;
        u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_31.xyz;
        u_xlat16_65 = (-u_xlat16_5.x) + 1.21000004;
        u_xlat16_65 = min(u_xlat16_65, 1.0);
        u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
        u_xlat0.x = (-u_xlat16_6.w) + 1.0;
        u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
        u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat1.xxx + u_xlat16_30.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn));
#else
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
#endif
        if(u_xlatb0){
            u_xlat16_30.xy = u_xlat3.xy + (-u_xlat25.xy);
            u_xlat16_30.xy = _throughSkinSpeDir.ww * u_xlat16_30.xy + u_xlat25.xy;
            u_xlat16_30.xy = u_xlat16_30.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_30.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat16_0 = texture(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_30.x = u_xlat16_0 * 0.349999994;
            u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
            u_xlat16_5.x = u_xlat16_5.x * u_xlat16_30.x;
            u_xlat16_5.x = u_xlat16_13.x * u_xlat16_5.x;
            u_xlat16_22.xyz = u_xlat16_5.xxx * _SkinEffectCol.xyz + u_xlat16_22.xyz;
        }
    }
    u_xlat16_1.w = u_xlat16_37.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat2.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat2.x + _EmisstionParams.x;
    u_xlat2.xyz = u_xlat10.xyz * _EmisstionColor.xyz;
    u_xlat16_5.x = (-u_xlat16_37.y) + 1.0;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3);
#endif
    u_xlat3.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
    u_xlat37.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_8.xyz = texture(_LG_Tex, u_xlat37.xy).xyz;
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
        u_xlat36.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat2.xy;
        u_xlat36.xy = u_xlat36.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat16_3.xyz = texture(_LG_Tex2, u_xlat36.xy).xyz;
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
    u_xlat0.xz = u_xlat17.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat17.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat17.zz + u_xlat0.xy;
    u_xlat34.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat34.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat3.xx + u_xlat34.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat3.zz + u_xlat34.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_39.x = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_39.x);
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
    u_xlat0.xy = u_xlat16_22.xy * u_xlat0.xx + u_xlat2.xy;
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
    u_xlat16_13.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_13.x = u_xlat17.x / u_xlat16_13.x;
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = u_xlat16_13.x + -0.800000012;
    u_xlat16_13.x = u_xlat16_13.x * 5.00000048;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_30.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = (-u_xlat16_30.x) * u_xlat16_13.x + 1.0;
    u_xlat16_30.xyz = vec3(u_xlat16_56) * _pointLightColor.xyz;
    u_xlat16_13.xyz = u_xlat16_30.xyz * u_xlat16_13.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_5.xyz;
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
in highp vec2 in_TEXCOORD3;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_VAR_LIUUV0;
out highp vec2 vs_VAR_EXPREUV0;
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
    vs_VAR_LIUUV0.xy = in_TEXCOORD2.xy;
    vs_VAR_EXPREUV0.xy = in_TEXCOORD3.xy;
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
uniform 	mediump vec4 _ParallaxTex_ST;
uniform 	mediump float _FlowIntensity;
uniform 	float _FlowSpeed;
uniform 	mediump float _ParallaxIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMapTex;
UNITY_LOCATION(5) uniform mediump sampler2D _ParallaxTex;
UNITY_LOCATION(6) uniform mediump sampler2D _ShadowOffsetTex;
UNITY_LOCATION(7) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(8) uniform mediump sampler2D _PBRTexture;
UNITY_LOCATION(9) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(10) uniform mediump sampler2D _ClearCoatTex;
UNITY_LOCATION(11) uniform mediump sampler2D _SkinEffectTex;
UNITY_LOCATION(12) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(13) uniform mediump sampler2D _LG_Tex2;
UNITY_LOCATION(14) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_VAR_LIUUV0;
in highp vec2 vs_VAR_EXPREUV0;
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
mediump vec4 u_xlat16_6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
vec4 u_xlat10;
vec3 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
float u_xlat18;
mediump vec3 u_xlat16_22;
vec2 u_xlat25;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_32;
vec2 u_xlat34;
vec2 u_xlat36;
vec2 u_xlat37;
mediump vec2 u_xlat16_37;
mediump vec2 u_xlat16_39;
vec2 u_xlat42;
bool u_xlatb42;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
float u_xlat52;
float u_xlat53;
mediump float u_xlat16_53;
bool u_xlatb53;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
mediump float u_xlat16_59;
bool u_xlatb59;
bool u_xlatb61;
float u_xlat62;
bool u_xlatb62;
mediump float u_xlat16_64;
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
    u_xlat53 = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat16_57 = (-_InSideLineSaturation) + 1.0;
    u_xlat16_57 = u_xlat16_56 * u_xlat16_57 + _InSideLineSaturation;
    u_xlat8.xyz = u_xlat16_6.xyz * vec3(u_xlat16_56) + (-vec3(u_xlat53));
    u_xlat8.xyz = vec3(u_xlat16_57) * u_xlat8.xyz + vec3(u_xlat53);
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_7.xyz = u_xlat8.xyz * vec3(u_xlat16_56) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_56) * u_xlat16_7.xyz + u_xlat16_5.xyz;
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
    u_xlat11.xyz = u_xlat42.yyy * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat42.xxx * u_xlat9.xyz + u_xlat11.xyz;
    u_xlat11.xyz = vec3(u_xlat53) * u_xlat17.xyz + u_xlat11.xyz;
    u_xlat16_6 = texture(_FlowMapTex, vs_VAR_EXPREUV0.xy);
    u_xlat7 = u_xlat16_6.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat7 = u_xlat7 * vec4(_FlowIntensity);
    u_xlat53 = _Time.y * _FlowSpeed;
    u_xlat42.x = _Time.y * _FlowSpeed + 0.5;
    u_xlat12.xy = fract(vec2(u_xlat53));
    u_xlat12.zw = fract(u_xlat42.xx);
    u_xlat53 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat10.xyz = vec3(u_xlat53) * u_xlat10.xyz;
    u_xlat9.x = dot(u_xlat9.xyz, u_xlat1.xyz);
    u_xlat9.y = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat42.xy = vs_TEXCOORD0.xy * _ParallaxTex_ST.xy + _ParallaxTex_ST.zw;
    u_xlat16_53 = texture(_FlowMapTex, u_xlat42.xy).w;
    u_xlat53 = u_xlat16_53 + -0.5;
    u_xlat9 = u_xlat9.xyxy * vec4(_ParallaxIntensity);
    u_xlat10 = vs_VAR_EXPREUV0.xyxy * _ParallaxTex_ST.xyxy + _ParallaxTex_ST.zwzw;
    u_xlat9 = (-u_xlat9) * vec4(u_xlat53) + u_xlat10;
    u_xlat7 = u_xlat7 * u_xlat12;
    u_xlat7 = u_xlat7 * u_xlat16_6.zzzz + u_xlat9;
    u_xlat16_9 = texture(_ParallaxTex, u_xlat7.xy);
    u_xlat16_7 = texture(_ParallaxTex, u_xlat7.zw);
    u_xlat53 = (-u_xlat12.y) * 2.0 + 1.0;
    u_xlat7 = (-u_xlat16_9) + u_xlat16_7;
    u_xlat7 = abs(vec4(u_xlat53)) * u_xlat7 + u_xlat16_9;
    u_xlat16_13.xyz = u_xlat7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xyz = u_xlat7.xyz * u_xlat16_13.xyz + (-u_xlat16_5.xyz);
    u_xlat53 = (-u_xlat16_4.w) + u_xlat7.w;
    u_xlat10.xyz = u_xlat16_6.zzz * u_xlat9.xyz + u_xlat16_5.xyz;
    u_xlat53 = u_xlat16_6.z * u_xlat53 + u_xlat16_4.w;
    u_xlat11.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat11.xyz = vec3(_NormalStr) * u_xlat11.xyz + u_xlat17.xyz;
    u_xlat16_5.x = (-u_xlat53) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat2.xyz);
    u_xlat16_22.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_39.x = _ShadowThreshold + 0.5;
    u_xlat16_53 = texture(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat53 = u_xlat16_53 + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb42 = !!(0.99000001<u_xlat16_5.x);
#else
    u_xlatb42 = 0.99000001<u_xlat16_5.x;
#endif
    u_xlat16_56 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_56 = (u_xlatb42) ? u_xlat16_56 : 0.0;
    u_xlat16_56 = u_xlat16_56 + _selfShadowAdjust;
    u_xlat53 = u_xlat16_5.x * u_xlat16_56 + u_xlat53;
    u_xlat53 = u_xlat53 + u_xlat16_39.x;
    u_xlat16_39.x = u_xlat53 + (-_ShadowFeather);
    u_xlat16_56 = u_xlat53 + _ShadowFeather;
    u_xlat16_56 = (-u_xlat16_39.x) + u_xlat16_56;
    u_xlat16_39.x = (-u_xlat16_39.x) + u_xlat16_22.x;
    u_xlat16_56 = float(1.0) / u_xlat16_56;
    u_xlat16_39.x = u_xlat16_56 * u_xlat16_39.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_39.x = min(max(u_xlat16_39.x, 0.0), 1.0);
#else
    u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
#endif
    u_xlat16_56 = u_xlat16_39.x * -2.0 + 3.0;
    u_xlat16_39.x = u_xlat16_39.x * u_xlat16_39.x;
    u_xlat16_39.x = u_xlat16_39.x * u_xlat16_56;
    u_xlat16_8.x = min(u_xlat16_39.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(0.96875>=u_xlat8.y);
#else
    u_xlatb53 = 0.96875>=u_xlat8.y;
#endif
    u_xlat8.x = u_xlat16_8.x;
    u_xlat16_25.xyz = texture(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_25.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_25.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_25.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * u_xlat10.xyz + (-u_xlat10.xyz);
    u_xlat16_13.xyz = vec3(_RampDifLerpValue) * u_xlat16_13.xyz + u_xlat10.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * _DarkColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _LightAreaColor.xyz + (-u_xlat16_14.xyz);
    u_xlat16_13.xyz = u_xlat8.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat25.xy = u_xlat11.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat25.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat11.xx + u_xlat25.xy;
    u_xlat25.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat11.zz + u_xlat25.xy;
    u_xlat16_39.xy = u_xlat25.xy + vec2(1.0, 1.0);
    u_xlat16_64 = u_xlat3.y * 0.100000001;
    u_xlat12.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat12.y = u_xlat16_64 * _matCapSpeEffectedByLightDir;
    u_xlat16_39.xy = u_xlat16_39.xy * vec2(0.5, 0.5) + (-u_xlat12.xy);
    u_xlat16_7 = texture(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_14.xy = u_xlat16_7.yx * vec2(_metallic, _roughness);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xy = min(max(u_xlat16_14.xy, 0.0), 1.0);
#else
    u_xlat16_14.xy = clamp(u_xlat16_14.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb59 = !!(0.100000001>=u_xlat16_7.z);
#else
    u_xlatb59 = 0.100000001>=u_xlat16_7.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat));
#else
    u_xlatb61 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
#endif
    u_xlatb59 = u_xlatb59 && u_xlatb61;
#ifdef UNITY_ADRENO_ES3
    u_xlatb61 = !!(0.100000001<u_xlat16_7.z);
#else
    u_xlatb61 = 0.100000001<u_xlat16_7.z;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb62 = !!(u_xlat16_7.z<0.449999988);
#else
    u_xlatb62 = u_xlat16_7.z<0.449999988;
#endif
    u_xlatb61 = u_xlatb61 && u_xlatb62;
    u_xlatb62 = u_xlatb59 || u_xlatb61;
    u_xlat16_64 = u_xlat16_14.y * 6.0;
    u_xlat16_64 = (u_xlatb62) ? 0.0 : u_xlat16_64;
    u_xlat16_9 = textureLod(_MatcapTex, u_xlat16_39.xy, u_xlat16_64);
    u_xlat16_15.xyz = u_xlat16_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz;
    u_xlat62 = dot(u_xlat11.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    if(u_xlatb59){
        u_xlat16_39.x = log2(u_xlat62);
        u_xlat16_39.x = u_xlat16_39.x * _ClearNovPow;
        u_xlat16_39.x = exp2(u_xlat16_39.x);
        u_xlat12.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat16_59 = texture(_ClearCoatTex, u_xlat12.xy).x;
        u_xlat16_56 = log2(u_xlat16_59);
        u_xlat16_56 = u_xlat16_56 * _ClearCoatPow;
        u_xlat16_56 = exp2(u_xlat16_56);
        u_xlat16_56 = u_xlat16_56 * _ClearCoatStrength;
        u_xlat16_39.x = u_xlat16_39.x * u_xlat16_56;
        u_xlat16_56 = (-u_xlat16_5.x) + 1.21000004;
        u_xlat16_56 = min(u_xlat16_56, 1.0);
        u_xlat16_39.x = u_xlat16_56 * u_xlat16_39.x;
        u_xlat16_15.xyz = u_xlat16_9.xyz * u_xlat16_15.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_15.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_15.xyz = u_xlat16_39.xxx * u_xlat16_15.xyz;
        u_xlat16_22.xyz = u_xlat16_22.xxx * u_xlat16_15.xyz;
        u_xlat16_22.xyz = u_xlat16_7.www * u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb59 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA));
#else
        u_xlatb59 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
#endif
        u_xlat16_15.xyz = u_xlat16_9.www * u_xlat16_22.xyz;
        u_xlat16_22.xyz = (bool(u_xlatb59)) ? u_xlat16_15.xyz : u_xlat16_22.xyz;
        u_xlat16_22.xyz = u_xlat16_22.xyz + u_xlat16_13.xyz;
    } else {
        u_xlat16_64 = (-u_xlat16_14.x) + 1.0;
        u_xlat16_22.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    }
    if(u_xlatb53){
        u_xlat16_13.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_13.x = min(max(u_xlat16_13.x, 0.0), 1.0);
#else
        u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
#endif
        u_xlat12.xyz = u_xlat10.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat12.xyz = u_xlat16_14.xxx * u_xlat12.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat52) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat11.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat16_30.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_30.y = u_xlat16_14.y * u_xlat16_14.y;
        u_xlat16_30.xz = u_xlat16_30.xy * u_xlat16_30.xy;
        u_xlat16_47 = u_xlat16_30.y * u_xlat16_30.y + -1.0;
        u_xlat16_30.x = u_xlat16_30.x * u_xlat16_47 + 1.0;
        u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
        u_xlat16_30.x = u_xlat16_30.z / u_xlat16_30.x;
        u_xlat16_30.x = u_xlat16_30.x * 0.318309873;
        u_xlat16_47 = (-u_xlat62) * u_xlat16_30.z + u_xlat62;
        u_xlat16_47 = u_xlat62 * u_xlat16_47 + u_xlat16_30.z;
        u_xlat16_47 = sqrt(u_xlat16_47);
        u_xlat16_47 = u_xlat62 + u_xlat16_47;
        u_xlat16_14.x = (-u_xlat16_13.x) * u_xlat16_30.z + u_xlat16_13.x;
        u_xlat16_64 = u_xlat16_13.x * u_xlat16_14.x + u_xlat16_30.z;
        u_xlat16_64 = sqrt(u_xlat16_64);
        u_xlat16_64 = u_xlat16_64 + u_xlat16_13.x;
        u_xlat16_47 = u_xlat16_64 * u_xlat16_47;
        u_xlat16_47 = float(1.0) / u_xlat16_47;
        u_xlat16_64 = (-u_xlat1.x) + 1.0;
        u_xlat16_14.x = u_xlat16_64 * u_xlat16_64;
        u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
        u_xlat16_48 = u_xlat16_64 * u_xlat16_14.x;
        u_xlat16_65 = u_xlat12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
        u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
        u_xlat16_64 = (-u_xlat16_14.x) * u_xlat16_64 + 1.0;
        u_xlat16_15.xyz = u_xlat12.xyz * vec3(u_xlat16_64);
        u_xlat16_14.xzw = vec3(u_xlat16_65) * vec3(u_xlat16_48) + u_xlat16_15.xyz;
        u_xlat16_30.x = u_xlat16_30.x * u_xlat16_47;
        u_xlat16_30.xyz = u_xlat16_14.xzw * u_xlat16_30.xxx;
        u_xlat16_30.xyz = u_xlat16_13.xxx * u_xlat16_30.xyz;
        u_xlat16_30.xyz = u_xlat8.xxx * u_xlat16_30.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_30.xyz = min(max(u_xlat16_30.xyz, 0.0), 1.0);
#else
        u_xlat16_30.xyz = clamp(u_xlat16_30.xyz, 0.0, 1.0);
#endif
        u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(vec3(_speStr, _speStr, _speStr));
        u_xlat0.x = (-u_xlat62) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_14.x = (-u_xlat16_14.y) + 1.0;
        u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
        u_xlat16_14.x = u_xlat16_14.x * 0.899999976 + 0.100000001;
        u_xlat16_31.xyz = u_xlat16_9.www * _customMatcapCol.xyz;
        u_xlat16_31.xyz = (bool(u_xlatb61)) ? u_xlat16_31.xyz : u_xlat16_16.xyz;
        u_xlat1.x = u_xlat62 + _customMatcapFresnelRange;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat18 = u_xlatb61 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat18 * u_xlat1.x + 1.0;
        u_xlat16_15.x = (u_xlatb61) ? 1.0 : 0.0;
        u_xlat16_32 = (-u_xlat0.x) + 1.0;
        u_xlat16_32 = u_xlat16_15.x * u_xlat16_32 + u_xlat0.x;
        u_xlat16_49 = (-_inDirectSpeStr) + 1.0;
        u_xlat16_15.x = u_xlat16_15.x * u_xlat16_49 + _inDirectSpeStr;
        u_xlat16_15.x = u_xlat16_7.w * u_xlat16_15.x;
        u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_15.xxx;
        u_xlat16_31.xyz = vec3(u_xlat16_32) * u_xlat16_31.xyz;
        u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_31.xyz;
        u_xlat16_65 = (-u_xlat16_5.x) + 1.21000004;
        u_xlat16_65 = min(u_xlat16_65, 1.0);
        u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
        u_xlat0.x = (-u_xlat16_6.w) + 1.0;
        u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
        u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat1.xxx + u_xlat16_30.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn));
#else
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
#endif
        if(u_xlatb0){
            u_xlat16_30.xy = u_xlat3.xy + (-u_xlat25.xy);
            u_xlat16_30.xy = _throughSkinSpeDir.ww * u_xlat16_30.xy + u_xlat25.xy;
            u_xlat16_30.xy = u_xlat16_30.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_30.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat16_0 = texture(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_30.x = u_xlat16_0 * 0.349999994;
            u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
            u_xlat16_5.x = u_xlat16_5.x * u_xlat16_30.x;
            u_xlat16_5.x = u_xlat16_13.x * u_xlat16_5.x;
            u_xlat16_22.xyz = u_xlat16_5.xxx * _SkinEffectCol.xyz + u_xlat16_22.xyz;
        }
    }
    u_xlat16_1.w = u_xlat16_37.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat2.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat2.x + _EmisstionParams.x;
    u_xlat2.xyz = u_xlat10.xyz * _EmisstionColor.xyz;
    u_xlat16_5.x = (-u_xlat16_37.y) + 1.0;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3);
#endif
    u_xlat3.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
    u_xlat37.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_8.xyz = texture(_LG_Tex, u_xlat37.xy).xyz;
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
        u_xlat36.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat2.xy;
        u_xlat36.xy = u_xlat36.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat16_3.xyz = texture(_LG_Tex2, u_xlat36.xy).xyz;
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
    u_xlat0.xz = u_xlat17.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat17.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat17.zz + u_xlat0.xy;
    u_xlat34.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat34.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat3.xx + u_xlat34.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat3.zz + u_xlat34.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_39.x = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_39.x);
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
    u_xlat0.xy = u_xlat16_22.xy * u_xlat0.xx + u_xlat2.xy;
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
    u_xlat16_13.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_13.x = u_xlat17.x / u_xlat16_13.x;
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = u_xlat16_13.x + -0.800000012;
    u_xlat16_13.x = u_xlat16_13.x * 5.00000048;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_30.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = (-u_xlat16_30.x) * u_xlat16_13.x + 1.0;
    u_xlat16_30.xyz = vec3(u_xlat16_56) * _pointLightColor.xyz;
    u_xlat16_13.xyz = u_xlat16_30.xyz * u_xlat16_13.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_5.xyz;
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
attribute highp vec2 in_TEXCOORD3;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
varying highp vec2 vs_VAR_EXPREUV0;
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
    vs_VAR_LIUUV0.xy = in_TEXCOORD2.xy;
    vs_VAR_EXPREUV0.xy = in_TEXCOORD3.xy;
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
uniform 	mediump vec4 _ParallaxTex_ST;
uniform 	mediump float _FlowIntensity;
uniform 	float _FlowSpeed;
uniform 	mediump float _ParallaxIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _FlowMapTex;
uniform lowp sampler2D _ParallaxTex;
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
varying highp vec2 vs_VAR_EXPREUV0;
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
lowp vec4 u_xlat10_6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp vec3 u_xlat10_8;
vec4 u_xlat9;
lowp vec4 u_xlat10_9;
vec4 u_xlat10;
vec3 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
float u_xlat18;
mediump vec3 u_xlat16_22;
vec2 u_xlat25;
lowp vec3 u_xlat10_25;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_32;
vec2 u_xlat34;
vec2 u_xlat36;
vec2 u_xlat37;
lowp vec2 u_xlat10_37;
mediump vec2 u_xlat16_39;
vec2 u_xlat42;
bool u_xlatb42;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
float u_xlat52;
float u_xlat53;
lowp float u_xlat10_53;
bool u_xlatb53;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
lowp float u_xlat10_59;
bool u_xlatb59;
bool u_xlatb61;
float u_xlat62;
bool u_xlatb62;
mediump float u_xlat16_64;
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
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_7.xyz = u_xlat8.xyz * vec3(u_xlat16_56) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_56) * u_xlat16_7.xyz + u_xlat16_5.xyz;
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
    u_xlat11.xyz = u_xlat42.yyy * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat42.xxx * u_xlat9.xyz + u_xlat11.xyz;
    u_xlat11.xyz = vec3(u_xlat53) * u_xlat17.xyz + u_xlat11.xyz;
    u_xlat10_6 = texture2D(_FlowMapTex, vs_VAR_EXPREUV0.xy);
    u_xlat7 = u_xlat10_6.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat7 = u_xlat7 * vec4(_FlowIntensity);
    u_xlat53 = _Time.y * _FlowSpeed;
    u_xlat42.x = _Time.y * _FlowSpeed + 0.5;
    u_xlat12.xy = fract(vec2(u_xlat53));
    u_xlat12.zw = fract(u_xlat42.xx);
    u_xlat53 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat10.xyz = vec3(u_xlat53) * u_xlat10.xyz;
    u_xlat9.x = dot(u_xlat9.xyz, u_xlat1.xyz);
    u_xlat9.y = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat42.xy = vs_TEXCOORD0.xy * _ParallaxTex_ST.xy + _ParallaxTex_ST.zw;
    u_xlat10_53 = texture2D(_FlowMapTex, u_xlat42.xy).w;
    u_xlat53 = u_xlat10_53 + -0.5;
    u_xlat9 = u_xlat9.xyxy * vec4(_ParallaxIntensity);
    u_xlat10 = vs_VAR_EXPREUV0.xyxy * _ParallaxTex_ST.xyxy + _ParallaxTex_ST.zwzw;
    u_xlat9 = (-u_xlat9) * vec4(u_xlat53) + u_xlat10;
    u_xlat7 = u_xlat7 * u_xlat12;
    u_xlat7 = u_xlat7 * u_xlat10_6.zzzz + u_xlat9;
    u_xlat10_9 = texture2D(_ParallaxTex, u_xlat7.xy);
    u_xlat10_7 = texture2D(_ParallaxTex, u_xlat7.zw);
    u_xlat53 = (-u_xlat12.y) * 2.0 + 1.0;
    u_xlat7 = (-u_xlat10_9) + u_xlat10_7;
    u_xlat7 = abs(vec4(u_xlat53)) * u_xlat7 + u_xlat10_9;
    u_xlat16_13.xyz = u_xlat7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xyz = u_xlat7.xyz * u_xlat16_13.xyz + (-u_xlat16_5.xyz);
    u_xlat53 = (-u_xlat10_4.w) + u_xlat7.w;
    u_xlat10.xyz = u_xlat10_6.zzz * u_xlat9.xyz + u_xlat16_5.xyz;
    u_xlat53 = u_xlat10_6.z * u_xlat53 + u_xlat10_4.w;
    u_xlat11.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat11.xyz = vec3(_NormalStr) * u_xlat11.xyz + u_xlat17.xyz;
    u_xlat16_5.x = (-u_xlat53) + 1.0;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat2.xyz);
    u_xlat16_22.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_39.x = _ShadowThreshold + 0.5;
    u_xlat10_53 = texture2D(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat53 = u_xlat10_53 + -0.5;
    u_xlatb42 = 0.99000001<u_xlat16_5.x;
    u_xlat16_56 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_56 = (u_xlatb42) ? u_xlat16_56 : 0.0;
    u_xlat16_56 = u_xlat16_56 + _selfShadowAdjust;
    u_xlat53 = u_xlat16_5.x * u_xlat16_56 + u_xlat53;
    u_xlat53 = u_xlat53 + u_xlat16_39.x;
    u_xlat16_39.x = u_xlat53 + (-_ShadowFeather);
    u_xlat16_56 = u_xlat53 + _ShadowFeather;
    u_xlat16_56 = (-u_xlat16_39.x) + u_xlat16_56;
    u_xlat16_39.x = (-u_xlat16_39.x) + u_xlat16_22.x;
    u_xlat16_56 = float(1.0) / u_xlat16_56;
    u_xlat16_39.x = u_xlat16_56 * u_xlat16_39.x;
    u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
    u_xlat16_56 = u_xlat16_39.x * -2.0 + 3.0;
    u_xlat16_39.x = u_xlat16_39.x * u_xlat16_39.x;
    u_xlat16_39.x = u_xlat16_39.x * u_xlat16_56;
    u_xlat16_8 = min(u_xlat16_39.x, 1.0);
    u_xlatb53 = 0.96875>=u_xlat8.y;
    u_xlat8.x = u_xlat16_8;
    u_xlat10_25.xyz = texture2D(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_13.xyz = u_xlat10_25.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat10_25.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_25.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * u_xlat10.xyz + (-u_xlat10.xyz);
    u_xlat16_13.xyz = vec3(_RampDifLerpValue) * u_xlat16_13.xyz + u_xlat10.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * _DarkColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _LightAreaColor.xyz + (-u_xlat16_14.xyz);
    u_xlat16_13.xyz = u_xlat8.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat25.xy = u_xlat11.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat25.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat11.xx + u_xlat25.xy;
    u_xlat25.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat11.zz + u_xlat25.xy;
    u_xlat16_39.xy = u_xlat25.xy + vec2(1.0, 1.0);
    u_xlat16_64 = u_xlat3.y * 0.100000001;
    u_xlat12.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat12.y = u_xlat16_64 * _matCapSpeEffectedByLightDir;
    u_xlat16_39.xy = u_xlat16_39.xy * vec2(0.5, 0.5) + (-u_xlat12.xy);
    u_xlat10_7 = texture2D(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_14.xy = u_xlat10_7.yx * vec2(_metallic, _roughness);
    u_xlat16_14.xy = clamp(u_xlat16_14.xy, 0.0, 1.0);
    u_xlatb59 = 0.100000001>=u_xlat10_7.z;
    u_xlatb61 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
    u_xlatb59 = u_xlatb59 && u_xlatb61;
    u_xlatb61 = 0.100000001<u_xlat10_7.z;
    u_xlatb62 = u_xlat10_7.z<0.449999988;
    u_xlatb61 = u_xlatb61 && u_xlatb62;
    u_xlatb62 = u_xlatb59 || u_xlatb61;
    u_xlat16_64 = u_xlat16_14.y * 6.0;
    u_xlat16_64 = (u_xlatb62) ? 0.0 : u_xlat16_64;
    u_xlat10_9 = texture2DLodEXT(_MatcapTex, u_xlat16_39.xy, u_xlat16_64);
    u_xlat16_15.xyz = u_xlat10_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat10_9.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat10_9.xyz * u_xlat16_15.xyz;
    u_xlat62 = dot(u_xlat11.xyz, u_xlat1.xyz);
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
    if(u_xlatb59){
        u_xlat16_39.x = log2(u_xlat62);
        u_xlat16_39.x = u_xlat16_39.x * _ClearNovPow;
        u_xlat16_39.x = exp2(u_xlat16_39.x);
        u_xlat12.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat10_59 = texture2D(_ClearCoatTex, u_xlat12.xy).x;
        u_xlat16_56 = log2(u_xlat10_59);
        u_xlat16_56 = u_xlat16_56 * _ClearCoatPow;
        u_xlat16_56 = exp2(u_xlat16_56);
        u_xlat16_56 = u_xlat16_56 * _ClearCoatStrength;
        u_xlat16_39.x = u_xlat16_39.x * u_xlat16_56;
        u_xlat16_56 = (-u_xlat16_5.x) + 1.21000004;
        u_xlat16_56 = min(u_xlat16_56, 1.0);
        u_xlat16_39.x = u_xlat16_56 * u_xlat16_39.x;
        u_xlat16_15.xyz = u_xlat10_9.xyz * u_xlat16_15.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_15.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_15.xyz = u_xlat16_39.xxx * u_xlat16_15.xyz;
        u_xlat16_22.xyz = u_xlat16_22.xxx * u_xlat16_15.xyz;
        u_xlat16_22.xyz = u_xlat10_7.www * u_xlat16_22.xyz;
        u_xlatb59 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
        u_xlat16_15.xyz = u_xlat10_9.www * u_xlat16_22.xyz;
        u_xlat16_22.xyz = (bool(u_xlatb59)) ? u_xlat16_15.xyz : u_xlat16_22.xyz;
        u_xlat16_22.xyz = u_xlat16_22.xyz + u_xlat16_13.xyz;
    } else {
        u_xlat16_64 = (-u_xlat16_14.x) + 1.0;
        u_xlat16_22.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    }
    if(u_xlatb53){
        u_xlat16_13.x = u_xlat0.x;
        u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
        u_xlat12.xyz = u_xlat10.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat12.xyz = u_xlat16_14.xxx * u_xlat12.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat52) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat11.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat16_30.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_30.y = u_xlat16_14.y * u_xlat16_14.y;
        u_xlat16_30.xz = u_xlat16_30.xy * u_xlat16_30.xy;
        u_xlat16_47 = u_xlat16_30.y * u_xlat16_30.y + -1.0;
        u_xlat16_30.x = u_xlat16_30.x * u_xlat16_47 + 1.0;
        u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
        u_xlat16_30.x = u_xlat16_30.z / u_xlat16_30.x;
        u_xlat16_30.x = u_xlat16_30.x * 0.318309873;
        u_xlat16_47 = (-u_xlat62) * u_xlat16_30.z + u_xlat62;
        u_xlat16_47 = u_xlat62 * u_xlat16_47 + u_xlat16_30.z;
        u_xlat16_47 = sqrt(u_xlat16_47);
        u_xlat16_47 = u_xlat62 + u_xlat16_47;
        u_xlat16_14.x = (-u_xlat16_13.x) * u_xlat16_30.z + u_xlat16_13.x;
        u_xlat16_64 = u_xlat16_13.x * u_xlat16_14.x + u_xlat16_30.z;
        u_xlat16_64 = sqrt(u_xlat16_64);
        u_xlat16_64 = u_xlat16_64 + u_xlat16_13.x;
        u_xlat16_47 = u_xlat16_64 * u_xlat16_47;
        u_xlat16_47 = float(1.0) / u_xlat16_47;
        u_xlat16_64 = (-u_xlat1.x) + 1.0;
        u_xlat16_14.x = u_xlat16_64 * u_xlat16_64;
        u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
        u_xlat16_48 = u_xlat16_64 * u_xlat16_14.x;
        u_xlat16_65 = u_xlat12.y * 50.0;
        u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
        u_xlat16_64 = (-u_xlat16_14.x) * u_xlat16_64 + 1.0;
        u_xlat16_15.xyz = u_xlat12.xyz * vec3(u_xlat16_64);
        u_xlat16_14.xzw = vec3(u_xlat16_65) * vec3(u_xlat16_48) + u_xlat16_15.xyz;
        u_xlat16_30.x = u_xlat16_30.x * u_xlat16_47;
        u_xlat16_30.xyz = u_xlat16_14.xzw * u_xlat16_30.xxx;
        u_xlat16_30.xyz = u_xlat16_13.xxx * u_xlat16_30.xyz;
        u_xlat16_30.xyz = u_xlat8.xxx * u_xlat16_30.xyz;
        u_xlat16_30.xyz = clamp(u_xlat16_30.xyz, 0.0, 1.0);
        u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(vec3(_speStr, _speStr, _speStr));
        u_xlat0.x = (-u_xlat62) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_14.x = (-u_xlat16_14.y) + 1.0;
        u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
        u_xlat16_14.x = u_xlat16_14.x * 0.899999976 + 0.100000001;
        u_xlat16_31.xyz = u_xlat10_9.www * _customMatcapCol.xyz;
        u_xlat16_31.xyz = (bool(u_xlatb61)) ? u_xlat16_31.xyz : u_xlat16_16.xyz;
        u_xlat1.x = u_xlat62 + _customMatcapFresnelRange;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat18 = u_xlatb61 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat18 * u_xlat1.x + 1.0;
        u_xlat16_15.x = (u_xlatb61) ? 1.0 : 0.0;
        u_xlat16_32 = (-u_xlat0.x) + 1.0;
        u_xlat16_32 = u_xlat16_15.x * u_xlat16_32 + u_xlat0.x;
        u_xlat16_49 = (-_inDirectSpeStr) + 1.0;
        u_xlat16_15.x = u_xlat16_15.x * u_xlat16_49 + _inDirectSpeStr;
        u_xlat16_15.x = u_xlat10_7.w * u_xlat16_15.x;
        u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_15.xxx;
        u_xlat16_31.xyz = vec3(u_xlat16_32) * u_xlat16_31.xyz;
        u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_31.xyz;
        u_xlat16_65 = (-u_xlat16_5.x) + 1.21000004;
        u_xlat16_65 = min(u_xlat16_65, 1.0);
        u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
        u_xlat0.x = (-u_xlat10_6.w) + 1.0;
        u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
        u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat1.xxx + u_xlat16_30.xyz;
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
        if(u_xlatb0){
            u_xlat16_30.xy = u_xlat3.xy + (-u_xlat25.xy);
            u_xlat16_30.xy = _throughSkinSpeDir.ww * u_xlat16_30.xy + u_xlat25.xy;
            u_xlat16_30.xy = u_xlat16_30.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_30.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat10_0 = texture2D(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_30.x = u_xlat10_0 * 0.349999994;
            u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
            u_xlat16_5.x = u_xlat16_5.x * u_xlat16_30.x;
            u_xlat16_5.x = u_xlat16_13.x * u_xlat16_5.x;
            u_xlat16_22.xyz = u_xlat16_5.xxx * _SkinEffectCol.xyz + u_xlat16_22.xyz;
        }
    }
    u_xlat16_1.w = u_xlat10_37.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat2.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat2.x + _EmisstionParams.x;
    u_xlat2.xyz = u_xlat10.xyz * _EmisstionColor.xyz;
    u_xlat16_5.x = (-u_xlat10_37.y) + 1.0;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat16_22.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3);
    u_xlat3.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
    u_xlat37.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_8.xyz = texture2D(_LG_Tex, u_xlat37.xy).xyz;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat3.xy).w;
    u_xlat16_5.xyz = u_xlat10_8.xyz * vec3(_LG_Intensity);
    u_xlat16_5.xyz = vec3(u_xlat10_0) * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat2.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
    if(u_xlatb0){
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
        u_xlat2.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat36.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat2.xy;
        u_xlat36.xy = u_xlat36.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat10_3.xyz = texture2D(_LG_Tex2, u_xlat36.xy).xyz;
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
    u_xlat0.xz = u_xlat17.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat17.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat17.zz + u_xlat0.xy;
    u_xlat34.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat34.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat3.xx + u_xlat34.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat3.zz + u_xlat34.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_39.x = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_39.x);
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
    u_xlat0.xy = u_xlat16_22.xy * u_xlat0.xx + u_xlat2.xy;
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
    u_xlat16_13.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_13.x = u_xlat17.x / u_xlat16_13.x;
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = u_xlat16_13.x + -0.800000012;
    u_xlat16_13.x = u_xlat16_13.x * 5.00000048;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_30.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = (-u_xlat16_30.x) * u_xlat16_13.x + 1.0;
    u_xlat16_30.xyz = vec3(u_xlat16_56) * _pointLightColor.xyz;
    u_xlat16_13.xyz = u_xlat16_30.xyz * u_xlat16_13.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_5.xyz;
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
attribute highp vec2 in_TEXCOORD3;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
varying highp vec2 vs_VAR_EXPREUV0;
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
    vs_VAR_LIUUV0.xy = in_TEXCOORD2.xy;
    vs_VAR_EXPREUV0.xy = in_TEXCOORD3.xy;
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
uniform 	mediump vec4 _ParallaxTex_ST;
uniform 	mediump float _FlowIntensity;
uniform 	float _FlowSpeed;
uniform 	mediump float _ParallaxIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _FlowMapTex;
uniform lowp sampler2D _ParallaxTex;
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
varying highp vec2 vs_VAR_EXPREUV0;
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
lowp vec4 u_xlat10_6;
vec4 u_xlat7;
mediump vec3 u_xlat16_7;
lowp vec4 u_xlat10_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
lowp vec3 u_xlat10_8;
vec4 u_xlat9;
lowp vec4 u_xlat10_9;
vec4 u_xlat10;
vec3 u_xlat11;
vec4 u_xlat12;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec3 u_xlat17;
float u_xlat18;
mediump vec3 u_xlat16_22;
vec2 u_xlat25;
lowp vec3 u_xlat10_25;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
mediump float u_xlat16_32;
vec2 u_xlat34;
vec2 u_xlat36;
vec2 u_xlat37;
lowp vec2 u_xlat10_37;
mediump vec2 u_xlat16_39;
vec2 u_xlat42;
bool u_xlatb42;
mediump float u_xlat16_47;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
float u_xlat52;
float u_xlat53;
lowp float u_xlat10_53;
bool u_xlatb53;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
lowp float u_xlat10_59;
bool u_xlatb59;
bool u_xlatb61;
float u_xlat62;
bool u_xlatb62;
mediump float u_xlat16_64;
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
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_7.xyz = u_xlat8.xyz * vec3(u_xlat16_56) + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(u_xlat16_56) * u_xlat16_7.xyz + u_xlat16_5.xyz;
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
    u_xlat11.xyz = u_xlat42.yyy * u_xlat10.xyz;
    u_xlat11.xyz = u_xlat42.xxx * u_xlat9.xyz + u_xlat11.xyz;
    u_xlat11.xyz = vec3(u_xlat53) * u_xlat17.xyz + u_xlat11.xyz;
    u_xlat10_6 = texture2D(_FlowMapTex, vs_VAR_EXPREUV0.xy);
    u_xlat7 = u_xlat10_6.xyxy * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat7 = u_xlat7 * vec4(_FlowIntensity);
    u_xlat53 = _Time.y * _FlowSpeed;
    u_xlat42.x = _Time.y * _FlowSpeed + 0.5;
    u_xlat12.xy = fract(vec2(u_xlat53));
    u_xlat12.zw = fract(u_xlat42.xx);
    u_xlat53 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat10.xyz = vec3(u_xlat53) * u_xlat10.xyz;
    u_xlat9.x = dot(u_xlat9.xyz, u_xlat1.xyz);
    u_xlat9.y = dot(u_xlat10.xyz, u_xlat1.xyz);
    u_xlat42.xy = vs_TEXCOORD0.xy * _ParallaxTex_ST.xy + _ParallaxTex_ST.zw;
    u_xlat10_53 = texture2D(_FlowMapTex, u_xlat42.xy).w;
    u_xlat53 = u_xlat10_53 + -0.5;
    u_xlat9 = u_xlat9.xyxy * vec4(_ParallaxIntensity);
    u_xlat10 = vs_VAR_EXPREUV0.xyxy * _ParallaxTex_ST.xyxy + _ParallaxTex_ST.zwzw;
    u_xlat9 = (-u_xlat9) * vec4(u_xlat53) + u_xlat10;
    u_xlat7 = u_xlat7 * u_xlat12;
    u_xlat7 = u_xlat7 * u_xlat10_6.zzzz + u_xlat9;
    u_xlat10_9 = texture2D(_ParallaxTex, u_xlat7.xy);
    u_xlat10_7 = texture2D(_ParallaxTex, u_xlat7.zw);
    u_xlat53 = (-u_xlat12.y) * 2.0 + 1.0;
    u_xlat7 = (-u_xlat10_9) + u_xlat10_7;
    u_xlat7 = abs(vec4(u_xlat53)) * u_xlat7 + u_xlat10_9;
    u_xlat16_13.xyz = u_xlat7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat7.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xyz = u_xlat7.xyz * u_xlat16_13.xyz + (-u_xlat16_5.xyz);
    u_xlat53 = (-u_xlat10_4.w) + u_xlat7.w;
    u_xlat10.xyz = u_xlat10_6.zzz * u_xlat9.xyz + u_xlat16_5.xyz;
    u_xlat53 = u_xlat10_6.z * u_xlat53 + u_xlat10_4.w;
    u_xlat11.xyz = (-vs_TEXCOORD3.xyz) * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat11.xyz = vec3(_NormalStr) * u_xlat11.xyz + u_xlat17.xyz;
    u_xlat16_5.x = (-u_xlat53) + 1.0;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat2.xyz);
    u_xlat16_22.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_39.x = _ShadowThreshold + 0.5;
    u_xlat10_53 = texture2D(_ShadowOffsetTex, vs_TEXCOORD0.xy).x;
    u_xlat53 = u_xlat10_53 + -0.5;
    u_xlatb42 = 0.99000001<u_xlat16_5.x;
    u_xlat16_56 = (-_selfShadowAdjust) + 1.0;
    u_xlat16_56 = (u_xlatb42) ? u_xlat16_56 : 0.0;
    u_xlat16_56 = u_xlat16_56 + _selfShadowAdjust;
    u_xlat53 = u_xlat16_5.x * u_xlat16_56 + u_xlat53;
    u_xlat53 = u_xlat53 + u_xlat16_39.x;
    u_xlat16_39.x = u_xlat53 + (-_ShadowFeather);
    u_xlat16_56 = u_xlat53 + _ShadowFeather;
    u_xlat16_56 = (-u_xlat16_39.x) + u_xlat16_56;
    u_xlat16_39.x = (-u_xlat16_39.x) + u_xlat16_22.x;
    u_xlat16_56 = float(1.0) / u_xlat16_56;
    u_xlat16_39.x = u_xlat16_56 * u_xlat16_39.x;
    u_xlat16_39.x = clamp(u_xlat16_39.x, 0.0, 1.0);
    u_xlat16_56 = u_xlat16_39.x * -2.0 + 3.0;
    u_xlat16_39.x = u_xlat16_39.x * u_xlat16_39.x;
    u_xlat16_39.x = u_xlat16_39.x * u_xlat16_56;
    u_xlat16_8 = min(u_xlat16_39.x, 1.0);
    u_xlatb53 = 0.96875>=u_xlat8.y;
    u_xlat8.x = u_xlat16_8;
    u_xlat10_25.xyz = texture2D(_RampTex, u_xlat8.xy).xyz;
    u_xlat16_13.xyz = u_xlat10_25.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat10_25.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_25.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_4.xyz * u_xlat10.xyz + (-u_xlat10.xyz);
    u_xlat16_13.xyz = vec3(_RampDifLerpValue) * u_xlat16_13.xyz + u_xlat10.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * _DarkColor.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _LightAreaColor.xyz + (-u_xlat16_14.xyz);
    u_xlat16_13.xyz = u_xlat8.xxx * u_xlat16_13.xyz + u_xlat16_14.xyz;
    u_xlat25.xy = u_xlat11.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat25.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat11.xx + u_xlat25.xy;
    u_xlat25.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat11.zz + u_xlat25.xy;
    u_xlat16_39.xy = u_xlat25.xy + vec2(1.0, 1.0);
    u_xlat16_64 = u_xlat3.y * 0.100000001;
    u_xlat12.x = u_xlat3.x * _matCapSpeEffectedByLightDir;
    u_xlat12.y = u_xlat16_64 * _matCapSpeEffectedByLightDir;
    u_xlat16_39.xy = u_xlat16_39.xy * vec2(0.5, 0.5) + (-u_xlat12.xy);
    u_xlat10_7 = texture2D(_PBRTexture, vs_TEXCOORD0.xy);
    u_xlat16_14.xy = u_xlat10_7.yx * vec2(_metallic, _roughness);
    u_xlat16_14.xy = clamp(u_xlat16_14.xy, 0.0, 1.0);
    u_xlatb59 = 0.100000001>=u_xlat10_7.z;
    u_xlatb61 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoat);
    u_xlatb59 = u_xlatb59 && u_xlatb61;
    u_xlatb61 = 0.100000001<u_xlat10_7.z;
    u_xlatb62 = u_xlat10_7.z<0.449999988;
    u_xlatb61 = u_xlatb61 && u_xlatb62;
    u_xlatb62 = u_xlatb59 || u_xlatb61;
    u_xlat16_64 = u_xlat16_14.y * 6.0;
    u_xlat16_64 = (u_xlatb62) ? 0.0 : u_xlat16_64;
    u_xlat10_9 = texture2DLodEXT(_MatcapTex, u_xlat16_39.xy, u_xlat16_64);
    u_xlat16_15.xyz = u_xlat10_9.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_15.xyz = u_xlat10_9.xyz * u_xlat16_15.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_16.xyz = u_xlat10_9.xyz * u_xlat16_15.xyz;
    u_xlat62 = dot(u_xlat11.xyz, u_xlat1.xyz);
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
    if(u_xlatb59){
        u_xlat16_39.x = log2(u_xlat62);
        u_xlat16_39.x = u_xlat16_39.x * _ClearNovPow;
        u_xlat16_39.x = exp2(u_xlat16_39.x);
        u_xlat12.xy = vs_TEXCOORD0.xy * vec2(vec2(_ClearCoatTileScale, _ClearCoatTileScale));
        u_xlat10_59 = texture2D(_ClearCoatTex, u_xlat12.xy).x;
        u_xlat16_56 = log2(u_xlat10_59);
        u_xlat16_56 = u_xlat16_56 * _ClearCoatPow;
        u_xlat16_56 = exp2(u_xlat16_56);
        u_xlat16_56 = u_xlat16_56 * _ClearCoatStrength;
        u_xlat16_39.x = u_xlat16_39.x * u_xlat16_56;
        u_xlat16_56 = (-u_xlat16_5.x) + 1.21000004;
        u_xlat16_56 = min(u_xlat16_56, 1.0);
        u_xlat16_39.x = u_xlat16_56 * u_xlat16_39.x;
        u_xlat16_15.xyz = u_xlat10_9.xyz * u_xlat16_15.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat16_15.xyz = vec3(vec3(_ClearCoatMatcapStr, _ClearCoatMatcapStr, _ClearCoatMatcapStr)) * u_xlat16_15.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat16_15.xyz = u_xlat16_39.xxx * u_xlat16_15.xyz;
        u_xlat16_22.xyz = u_xlat16_22.xxx * u_xlat16_15.xyz;
        u_xlat16_22.xyz = u_xlat10_7.www * u_xlat16_22.xyz;
        u_xlatb59 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ClearCoatMatcapA);
        u_xlat16_15.xyz = u_xlat10_9.www * u_xlat16_22.xyz;
        u_xlat16_22.xyz = (bool(u_xlatb59)) ? u_xlat16_15.xyz : u_xlat16_22.xyz;
        u_xlat16_22.xyz = u_xlat16_22.xyz + u_xlat16_13.xyz;
    } else {
        u_xlat16_64 = (-u_xlat16_14.x) + 1.0;
        u_xlat16_22.xyz = vec3(u_xlat16_64) * u_xlat16_13.xyz;
    }
    if(u_xlatb53){
        u_xlat16_13.x = u_xlat0.x;
        u_xlat16_13.x = clamp(u_xlat16_13.x, 0.0, 1.0);
        u_xlat12.xyz = u_xlat10.xyz + vec3(-0.0400000028, -0.0400000028, -0.0400000028);
        u_xlat12.xyz = u_xlat16_14.xxx * u_xlat12.xyz + vec3(0.0400000028, 0.0400000028, 0.0400000028);
        u_xlat1.xyz = _WorldSpaceLightPos0.xyz * vec3(u_xlat52) + u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
        u_xlat0.x = dot(u_xlat11.xyz, u_xlat1.xyz);
        u_xlat0.x = max(u_xlat0.x, 0.0);
        u_xlat1.x = dot(u_xlat2.xyz, u_xlat1.xyz);
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat16_30.x = min(u_xlat0.x, 0.999322593);
        u_xlat16_30.y = u_xlat16_14.y * u_xlat16_14.y;
        u_xlat16_30.xz = u_xlat16_30.xy * u_xlat16_30.xy;
        u_xlat16_47 = u_xlat16_30.y * u_xlat16_30.y + -1.0;
        u_xlat16_30.x = u_xlat16_30.x * u_xlat16_47 + 1.0;
        u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
        u_xlat16_30.x = u_xlat16_30.z / u_xlat16_30.x;
        u_xlat16_30.x = u_xlat16_30.x * 0.318309873;
        u_xlat16_47 = (-u_xlat62) * u_xlat16_30.z + u_xlat62;
        u_xlat16_47 = u_xlat62 * u_xlat16_47 + u_xlat16_30.z;
        u_xlat16_47 = sqrt(u_xlat16_47);
        u_xlat16_47 = u_xlat62 + u_xlat16_47;
        u_xlat16_14.x = (-u_xlat16_13.x) * u_xlat16_30.z + u_xlat16_13.x;
        u_xlat16_64 = u_xlat16_13.x * u_xlat16_14.x + u_xlat16_30.z;
        u_xlat16_64 = sqrt(u_xlat16_64);
        u_xlat16_64 = u_xlat16_64 + u_xlat16_13.x;
        u_xlat16_47 = u_xlat16_64 * u_xlat16_47;
        u_xlat16_47 = float(1.0) / u_xlat16_47;
        u_xlat16_64 = (-u_xlat1.x) + 1.0;
        u_xlat16_14.x = u_xlat16_64 * u_xlat16_64;
        u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
        u_xlat16_48 = u_xlat16_64 * u_xlat16_14.x;
        u_xlat16_65 = u_xlat12.y * 50.0;
        u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
        u_xlat16_64 = (-u_xlat16_14.x) * u_xlat16_64 + 1.0;
        u_xlat16_15.xyz = u_xlat12.xyz * vec3(u_xlat16_64);
        u_xlat16_14.xzw = vec3(u_xlat16_65) * vec3(u_xlat16_48) + u_xlat16_15.xyz;
        u_xlat16_30.x = u_xlat16_30.x * u_xlat16_47;
        u_xlat16_30.xyz = u_xlat16_14.xzw * u_xlat16_30.xxx;
        u_xlat16_30.xyz = u_xlat16_13.xxx * u_xlat16_30.xyz;
        u_xlat16_30.xyz = u_xlat8.xxx * u_xlat16_30.xyz;
        u_xlat16_30.xyz = clamp(u_xlat16_30.xyz, 0.0, 1.0);
        u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(vec3(_speStr, _speStr, _speStr));
        u_xlat0.x = (-u_xlat62) + 1.0;
        u_xlat0.x = u_xlat0.x * u_xlat0.x;
        u_xlat0.x = u_xlat0.x * 0.899999976 + 0.100000001;
        u_xlat16_14.x = (-u_xlat16_14.y) + 1.0;
        u_xlat16_14.x = u_xlat16_14.x * u_xlat16_14.x;
        u_xlat16_14.x = u_xlat16_14.x * 0.899999976 + 0.100000001;
        u_xlat16_31.xyz = u_xlat10_9.www * _customMatcapCol.xyz;
        u_xlat16_31.xyz = (bool(u_xlatb61)) ? u_xlat16_31.xyz : u_xlat16_16.xyz;
        u_xlat1.x = u_xlat62 + _customMatcapFresnelRange;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat18 = u_xlatb61 ? 1.0 : float(0.0);
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat1.x = u_xlat18 * u_xlat1.x + 1.0;
        u_xlat16_15.x = (u_xlatb61) ? 1.0 : 0.0;
        u_xlat16_32 = (-u_xlat0.x) + 1.0;
        u_xlat16_32 = u_xlat16_15.x * u_xlat16_32 + u_xlat0.x;
        u_xlat16_49 = (-_inDirectSpeStr) + 1.0;
        u_xlat16_15.x = u_xlat16_15.x * u_xlat16_49 + _inDirectSpeStr;
        u_xlat16_15.x = u_xlat10_7.w * u_xlat16_15.x;
        u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_15.xxx;
        u_xlat16_31.xyz = vec3(u_xlat16_32) * u_xlat16_31.xyz;
        u_xlat16_14.xyz = u_xlat16_14.xxx * u_xlat16_31.xyz;
        u_xlat16_65 = (-u_xlat16_5.x) + 1.21000004;
        u_xlat16_65 = min(u_xlat16_65, 1.0);
        u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
        u_xlat0.x = (-u_xlat10_6.w) + 1.0;
        u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
        u_xlat16_22.xyz = u_xlat16_22.xyz * u_xlat1.xxx + u_xlat16_30.xyz;
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_SkinThroughOn);
        if(u_xlatb0){
            u_xlat16_30.xy = u_xlat3.xy + (-u_xlat25.xy);
            u_xlat16_30.xy = _throughSkinSpeDir.ww * u_xlat16_30.xy + u_xlat25.xy;
            u_xlat16_30.xy = u_xlat16_30.xy * _throughSkinSpeDir.xy;
            u_xlat1.xy = u_xlat16_30.xy * vec2(0.00999999978, 0.00999999978) + vs_TEXCOORD0.xy;
            u_xlat10_0 = texture2D(_SkinEffectTex, u_xlat1.xy).x;
            u_xlat16_30.x = u_xlat10_0 * 0.349999994;
            u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
            u_xlat16_5.x = u_xlat16_5.x * u_xlat16_30.x;
            u_xlat16_5.x = u_xlat16_13.x * u_xlat16_5.x;
            u_xlat16_22.xyz = u_xlat16_5.xxx * _SkinEffectCol.xyz + u_xlat16_22.xyz;
        }
    }
    u_xlat16_1.w = u_xlat10_37.x * _LightAreaColor.w;
    u_xlat0.x = _Time.y * _EmisstionParams.z;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat2.x = (-_EmisstionParams.x) + _EmisstionParams.y;
    u_xlat0.x = u_xlat0.x * u_xlat2.x + _EmisstionParams.x;
    u_xlat2.xyz = u_xlat10.xyz * _EmisstionColor.xyz;
    u_xlat16_5.x = (-u_xlat10_37.y) + 1.0;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_5.xxx;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat16_22.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3);
    u_xlat3.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
    u_xlat37.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat3.xy;
    u_xlat37.xy = u_xlat37.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_8.xyz = texture2D(_LG_Tex, u_xlat37.xy).xyz;
    u_xlat10_0 = texture2D(_LG_Tex, u_xlat3.xy).w;
    u_xlat16_5.xyz = u_xlat10_8.xyz * vec3(_LG_Intensity);
    u_xlat16_5.xyz = vec3(u_xlat10_0) * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_5.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat2.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
    if(u_xlatb0){
        u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
        u_xlat2.xy = (bool(u_xlatb0)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat36.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat2.xy;
        u_xlat36.xy = u_xlat36.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat10_3.xyz = texture2D(_LG_Tex2, u_xlat36.xy).xyz;
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
    u_xlat0.xz = u_xlat17.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat17.xx + u_xlat0.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat17.zz + u_xlat0.xy;
    u_xlat34.xy = u_xlat3.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat34.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat3.xx + u_xlat34.xy;
    u_xlat0.zw = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat3.zz + u_xlat34.xy;
    u_xlat16_5.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_39.x = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat16_5.z = inversesqrt(u_xlat16_39.x);
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
    u_xlat0.xy = u_xlat16_22.xy * u_xlat0.xx + u_xlat2.xy;
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
    u_xlat16_13.x = max(_pointLightRange, 9.99999975e-05);
    u_xlat16_13.x = u_xlat17.x / u_xlat16_13.x;
    u_xlat16_13.x = min(u_xlat16_13.x, 1.0);
    u_xlat16_13.x = u_xlat16_13.x + -0.800000012;
    u_xlat16_13.x = u_xlat16_13.x * 5.00000048;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_30.x = u_xlat16_13.x * -2.0 + 3.0;
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_13.x = (-u_xlat16_30.x) * u_xlat16_13.x + 1.0;
    u_xlat16_30.xyz = vec3(u_xlat16_56) * _pointLightColor.xyz;
    u_xlat16_13.xyz = u_xlat16_30.xyz * u_xlat16_13.xxx + u_xlat16_5.xyz;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_13.xyz : u_xlat16_5.xyz;
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
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "SHADOWSUPPORT" = "true" }
  GpuProgramID 130623
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
  GpuProgramID 152058
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