//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/FXScroll" {
Properties {

[Header(CustomDataSettings__________________________________________________________________________________)] [Header(CustomData ... coord1.zw__MainTexUV ... coord2.xy__VertexOffsetStrength DissolveStep... coord2.xy__DissolveUV)] [Toggle(_CUSTOMDATA_ON) ] _CustomDataOn ("开启CustomData", Float) = 0.0

[Header(BaseSettings__________________________________________________________________________________)] [Space(5)] [Enum(Add,1,Blend,10)] _Dst ("混合模式", Float) = 10.0

_Rotate ("旋转角度", Range(0, 360)) = 0.0

_Rate ("百分比", Range(-0.3, 1.3)) = 0.10000000149011612

_MainTex ("MainTex", 2D) = "white" { }

_Range ("轴宽", Range(0, 1)) = 0.20000000298023224

_Shadow ("阴影范围", Range(0, 1)) = 0.5

_ShadowColor ("阴影颜色", Color) = (0.5,0.5,0.5,1)

_BackSpecular ("高光颜色", Color) = (1,1,1,1)

[Toggle(_BACK_TEX_ENABLED)] _UseBackTex ("自定义背面图", Float) = 0.0

_BackTex ("BackTex", 2D) = "white" { }

[Header(DissolveSettings__________________________________________________________________________________)] [Header(Dissolve)] _DissolveTex ("R:溶解纹理 G:溶解扰动", 2D) = "black" { }

[Enum(1U,0,2U,1,ScreenUV,2)] _DisUV_Select ("溶解UV选择", Float) = 0.0

_Dissolve_Dir ("溶解方向旋转", Range(0, 360)) = 0.0

_DisDir_Weight ("溶解方向权重", Range(0, 1)) = 0.5

_DisNoise_TiSp ("溶解扰动 XY:Tiling ZW:Speed", Vector) = (1,1,0,0)

_DisNoise_Intensity ("溶解扰动强度", Float) = 0.0

_SoftSize ("SoftSize", Range(0, 2)) = 0.0

_DissolveStep ("DissolveStep", Range(0, 1)) = 0.0

_DissolveEdgeWidth ("DissolveEdgeWidth", Range(0, 1)) = 0.0

[Toggle] _IS_CUSTOM ("自定义颜色", Float) = 0.0

_DissolveColor ("DissolveColor", Color) = (1,1,1,1)

_DissolveColorPW ("DissolveColorPW", Float) = 1.0

_DissolveEdgeColor ("DissolveEdgeColor", Color) = (1,1,1,1)

[Header(VertexOffsetSettings__________________________________________________________________________________)] [Space(5)] [Toggle(_ENABLE_VERTEX_OFFSET)] _EnableVertexOffset ("开启噪声偏移(禁动画中K开关)", Float) = 0.0

_VertexOffsetNoiseMap ("VertexOffsetNoiseMap R:顶点偏移通道", 2D) = "white" { }

[Enum(Normal,0,Vertex,1)] _MotionDir ("运动方向", Float) = 0.0

_VertexDir ("VertexDir", Vector) = (0,0,0,0)

_VertexScale ("VertexScale", Float) = 1.0

_VertexPower ("VertexPower", Float) = 1.0

_VertexScaleHeightU ("VertexScaleHeightU", Float) = 1.0

_VertexScaleHeightV ("VertexScaleHeightV", Float) = 0.0

_VertexMotionSpeed ("UV流动速度(仅xy生效对应u和v)", Vector) = (0,0,0,0)

[Header(OtherSettings__________________________________________________________________________________)] [Space(10)] [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0.0

[Enum(Off, 0, On, 1)] _MLZWrite ("ZWrite", Float) = 0.0

[Enum(On, 0,Off, 4)] _MLZTest ("总是最前", Float) = 4.0

_StencilRef ("StencilRef", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

}
SubShader {
 Tags { "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
 Pass {
 Name "FORWARD"
  Tags { "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 5986
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
uniform 	mediump float _DisUV_Select;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat16_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
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
uniform 	mediump float _DisUV_Select;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat16_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat10_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat10_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_CUSTOMDATA_ON" }
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
uniform 	mediump float _DisUV_Select;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat16_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_CUSTOMDATA_ON" }
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
uniform 	mediump float _DisUV_Select;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat16_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_CUSTOMDATA_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat10_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_CUSTOMDATA_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat10_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BACK_TEX_ENABLED" }
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
uniform 	mediump float _DisUV_Select;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BackTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BACK_TEX_ENABLED" }
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
uniform 	mediump float _DisUV_Select;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BackTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BACK_TEX_ENABLED" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BackTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture2D(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat10_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BACK_TEX_ENABLED" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BackTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture2D(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat10_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" }
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
uniform 	mediump float _DisUV_Select;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BackTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" }
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
uniform 	mediump float _DisUV_Select;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BackTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BackTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture2D(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat10_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BackTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture2D(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat10_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ENABLE_VERTEX_OFFSET" }
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
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
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
UNITY_LOCATION(2) uniform mediump sampler2D _VertexOffsetNoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _VertexMotionSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = textureLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * _VertexScale;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MotionDir==0.0);
#else
    u_xlatb3 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat16_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ENABLE_VERTEX_OFFSET" }
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
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
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
UNITY_LOCATION(2) uniform mediump sampler2D _VertexOffsetNoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _VertexMotionSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = textureLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * _VertexScale;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MotionDir==0.0);
#else
    u_xlatb3 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat16_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_ENABLE_VERTEX_OFFSET" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
uniform lowp sampler2D _VertexOffsetNoiseMap;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = texture2DLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * _VertexScale;
    u_xlatb3 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat10_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_ENABLE_VERTEX_OFFSET" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
uniform lowp sampler2D _VertexOffsetNoiseMap;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = texture2DLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * _VertexScale;
    u_xlatb3 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat10_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
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
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
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
UNITY_LOCATION(2) uniform mediump sampler2D _VertexOffsetNoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _VertexMotionSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = textureLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3 = in_TEXCOORD2.x + _VertexScale;
    u_xlat0.x = u_xlat0.x * u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MotionDir==0.0);
#else
    u_xlatb3 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat16_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
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
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
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
UNITY_LOCATION(2) uniform mediump sampler2D _VertexOffsetNoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _VertexMotionSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = textureLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3 = in_TEXCOORD2.x + _VertexScale;
    u_xlat0.x = u_xlat0.x * u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MotionDir==0.0);
#else
    u_xlatb3 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat16_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
uniform lowp sampler2D _VertexOffsetNoiseMap;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = texture2DLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3 = in_TEXCOORD2.x + _VertexScale;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlatb3 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat10_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
uniform lowp sampler2D _VertexOffsetNoiseMap;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = texture2DLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3 = in_TEXCOORD2.x + _VertexScale;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlatb3 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat10_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BACK_TEX_ENABLED" "_ENABLE_VERTEX_OFFSET" }
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
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
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
UNITY_LOCATION(3) uniform mediump sampler2D _VertexOffsetNoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _VertexMotionSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = textureLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * _VertexScale;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MotionDir==0.0);
#else
    u_xlatb3 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BackTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BACK_TEX_ENABLED" "_ENABLE_VERTEX_OFFSET" }
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
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
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
UNITY_LOCATION(3) uniform mediump sampler2D _VertexOffsetNoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _VertexMotionSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = textureLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * _VertexScale;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MotionDir==0.0);
#else
    u_xlatb3 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BackTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BACK_TEX_ENABLED" "_ENABLE_VERTEX_OFFSET" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
uniform lowp sampler2D _VertexOffsetNoiseMap;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = texture2DLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * _VertexScale;
    u_xlatb3 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BackTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture2D(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat10_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BACK_TEX_ENABLED" "_ENABLE_VERTEX_OFFSET" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
uniform lowp sampler2D _VertexOffsetNoiseMap;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = texture2DLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * _VertexScale;
    u_xlatb3 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BackTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture2D(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat10_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
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
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
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
UNITY_LOCATION(3) uniform mediump sampler2D _VertexOffsetNoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _VertexMotionSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = textureLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3 = in_TEXCOORD2.x + _VertexScale;
    u_xlat0.x = u_xlat0.x * u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MotionDir==0.0);
#else
    u_xlatb3 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BackTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
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
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
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
UNITY_LOCATION(3) uniform mediump sampler2D _VertexOffsetNoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _VertexMotionSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = textureLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3 = in_TEXCOORD2.x + _VertexScale;
    u_xlat0.x = u_xlat0.x * u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MotionDir==0.0);
#else
    u_xlatb3 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BackTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
uniform lowp sampler2D _VertexOffsetNoiseMap;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = texture2DLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3 = in_TEXCOORD2.x + _VertexScale;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlatb3 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BackTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture2D(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat10_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
uniform lowp sampler2D _VertexOffsetNoiseMap;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = texture2DLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3 = in_TEXCOORD2.x + _VertexScale;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlatb3 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BackTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture2D(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat10_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    u_xlat6.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
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
uniform 	mediump float _DisUV_Select;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat16_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
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
uniform 	mediump float _DisUV_Select;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat16_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat10_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat10_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUSTOMDATA_ON" }
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
uniform 	mediump float _DisUV_Select;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat16_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUSTOMDATA_ON" }
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
uniform 	mediump float _DisUV_Select;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat16_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUSTOMDATA_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat10_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUSTOMDATA_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat10_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" }
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
uniform 	mediump float _DisUV_Select;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BackTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" }
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
uniform 	mediump float _DisUV_Select;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BackTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BackTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture2D(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat10_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BackTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture2D(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat10_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" }
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
uniform 	mediump float _DisUV_Select;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BackTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" }
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
uniform 	mediump float _DisUV_Select;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BackTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BackTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture2D(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat10_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BackTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture2D(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat10_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ENABLE_VERTEX_OFFSET" }
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
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
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
UNITY_LOCATION(2) uniform mediump sampler2D _VertexOffsetNoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _VertexMotionSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = textureLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * _VertexScale;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MotionDir==0.0);
#else
    u_xlatb3 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat16_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ENABLE_VERTEX_OFFSET" }
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
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
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
UNITY_LOCATION(2) uniform mediump sampler2D _VertexOffsetNoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _VertexMotionSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = textureLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * _VertexScale;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MotionDir==0.0);
#else
    u_xlatb3 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat16_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ENABLE_VERTEX_OFFSET" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
uniform lowp sampler2D _VertexOffsetNoiseMap;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = texture2DLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * _VertexScale;
    u_xlatb3 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat10_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ENABLE_VERTEX_OFFSET" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
uniform lowp sampler2D _VertexOffsetNoiseMap;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = texture2DLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * _VertexScale;
    u_xlatb3 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat10_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
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
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
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
UNITY_LOCATION(2) uniform mediump sampler2D _VertexOffsetNoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _VertexMotionSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = textureLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3 = in_TEXCOORD2.x + _VertexScale;
    u_xlat0.x = u_xlat0.x * u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MotionDir==0.0);
#else
    u_xlatb3 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat16_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
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
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
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
UNITY_LOCATION(2) uniform mediump sampler2D _VertexOffsetNoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _VertexMotionSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = textureLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3 = in_TEXCOORD2.x + _VertexScale;
    u_xlat0.x = u_xlat0.x * u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MotionDir==0.0);
#else
    u_xlatb3 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat16_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
uniform lowp sampler2D _VertexOffsetNoiseMap;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = texture2DLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3 = in_TEXCOORD2.x + _VertexScale;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlatb3 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat10_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
uniform lowp sampler2D _VertexOffsetNoiseMap;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = texture2DLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3 = in_TEXCOORD2.x + _VertexScale;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlatb3 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat10_0.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_ENABLE_VERTEX_OFFSET" }
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
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
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
UNITY_LOCATION(3) uniform mediump sampler2D _VertexOffsetNoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _VertexMotionSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = textureLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * _VertexScale;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MotionDir==0.0);
#else
    u_xlatb3 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BackTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_ENABLE_VERTEX_OFFSET" }
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
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
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
UNITY_LOCATION(3) uniform mediump sampler2D _VertexOffsetNoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _VertexMotionSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = textureLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * _VertexScale;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MotionDir==0.0);
#else
    u_xlatb3 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BackTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_ENABLE_VERTEX_OFFSET" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
uniform lowp sampler2D _VertexOffsetNoiseMap;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = texture2DLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * _VertexScale;
    u_xlatb3 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BackTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture2D(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat10_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_ENABLE_VERTEX_OFFSET" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
uniform lowp sampler2D _VertexOffsetNoiseMap;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = texture2DLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * _VertexScale;
    u_xlatb3 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BackTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture2D(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat10_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
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
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
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
UNITY_LOCATION(3) uniform mediump sampler2D _VertexOffsetNoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _VertexMotionSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = textureLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3 = in_TEXCOORD2.x + _VertexScale;
    u_xlat0.x = u_xlat0.x * u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MotionDir==0.0);
#else
    u_xlatb3 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BackTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
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
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
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
UNITY_LOCATION(3) uniform mediump sampler2D _VertexOffsetNoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _VertexMotionSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = textureLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3 = in_TEXCOORD2.x + _VertexScale;
    u_xlat0.x = u_xlat0.x * u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_MotionDir==0.0);
#else
    u_xlatb3 = _MotionDir==0.0;
#endif
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DisUV_Select==1.0);
#else
    u_xlatb0 = _DisUV_Select==1.0;
#endif
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BackTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(_Rate>=u_xlat6.x);
#else
    u_xlatb16 = _Rate>=u_xlat6.x;
#endif
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(u_xlat16_10>=u_xlat6.x);
#else
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DisUV_Select==2.0);
#else
    u_xlatb7 = _DisUV_Select==2.0;
#endif
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat16_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat16_6 = texture(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat16_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat16_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat16_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
uniform lowp sampler2D _VertexOffsetNoiseMap;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = texture2DLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3 = in_TEXCOORD2.x + _VertexScale;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlatb3 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BackTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture2D(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat10_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _DisUV_Select;
uniform 	mediump vec4 _VertexOffsetNoiseMap_ST;
uniform 	mediump vec4 _VertexDir;
uniform 	mediump float _VertexScale;
uniform 	mediump float _VertexPower;
uniform 	mediump float _VertexScaleHeightU;
uniform 	mediump float _VertexScaleHeightV;
uniform 	vec2 _VertexMotionSpeed;
uniform 	float _MotionDir;
uniform lowp sampler2D _VertexOffsetNoiseMap;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec3 in_NORMAL0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat3;
bool u_xlatb3;
void main()
{
    u_xlat0.xy = _Time.yy * _VertexMotionSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _VertexOffsetNoiseMap_ST.xy + _VertexOffsetNoiseMap_ST.zw;
    u_xlat0.x = texture2DLod(_VertexOffsetNoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat0.x = max(u_xlat0.x, 4.99999986e-10);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VertexPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3 = in_TEXCOORD2.x + _VertexScale;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlatb3 = _MotionDir==0.0;
    u_xlat16_1.xyz = (bool(u_xlatb3)) ? in_NORMAL0.xyz : _VertexDir.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlatb2.xy = greaterThanEqual(in_TEXCOORD0.xyxx, vec4(_VertexScaleHeightU, _VertexScaleHeightV, _VertexScaleHeightU, _VertexScaleHeightU)).xy;
    u_xlat16_1.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_1.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat2.xyz = u_xlat16_1.xxx * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * (-u_xlat0.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlatb0 = _DisUV_Select==1.0;
    vs_TEXCOORD1.zw = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.zw;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BackTex_ST;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump vec4 _DisNoise_TiSp;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump vec4 _BackSpecular;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump vec4 _DissolveEdgeColor;
uniform 	mediump float _Rate;
uniform 	mediump float _Range;
uniform 	mediump float _Shadow;
uniform 	mediump float _Rotate;
uniform 	mediump float _DisUV_Select;
uniform 	mediump float _Dissolve_Dir;
uniform 	mediump float _DisDir_Weight;
uniform 	mediump float _DisNoise_Intensity;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _DissolveEdgeWidth;
uniform 	mediump float _DissolveColorPW;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BackTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat9;
mediump float u_xlat16_10;
vec3 u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_20;
vec2 u_xlat26;
mediump float u_xlat16_31;
float u_xlat36;
bool u_xlatb36;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_20 = _Rotate * 0.0174532924;
    u_xlat16_1.x = sin((-u_xlat16_20));
    u_xlat16_2.x = sin(u_xlat16_20);
    u_xlat16_3.x = cos(u_xlat16_20);
    u_xlat16_4 = sin((-u_xlat16_20));
    u_xlat16_5 = cos((-u_xlat16_20));
    u_xlat16_1.y = u_xlat16_3.x;
    u_xlat16_1.z = u_xlat16_2.x;
    u_xlat6.x = dot(u_xlat16_0.xy, u_xlat16_1.xy);
    u_xlat7.x = dot(u_xlat16_0.xy, u_xlat16_1.yz);
    u_xlat6.x = u_xlat6.x + 0.5;
    u_xlatb16 = _Rate>=u_xlat6.x;
    if(u_xlatb16){discard;}
    u_xlat16.x = (-u_xlat6.x) + _Rate;
    u_xlat16.x = u_xlat16.x + _Rate;
    u_xlat16.x = (-u_xlat6.x) + u_xlat16.x;
    u_xlat16_0.x = _Range + 1.0;
    u_xlat16_10 = u_xlat16_0.x * _Rate;
    u_xlat26.x = (-_Rate) * u_xlat16_0.x + u_xlat6.x;
    u_xlatb36 = u_xlat16_10>=u_xlat6.x;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat7.y = u_xlat36 * u_xlat16.x + u_xlat6.x;
    u_xlat16.xz = u_xlat7.xy + vec2(0.0, -0.5);
    u_xlat16_1.x = u_xlat16_4;
    u_xlat16_1.w = u_xlat16_5;
    u_xlat7.x = dot(u_xlat16.zx, u_xlat16_1.xw);
    u_xlat7.y = dot(u_xlat16.xz, u_xlat16_1.zw);
    u_xlat16.xz = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat16.xz * _BackTex_ST.xy + _BackTex_ST.zw;
    u_xlat16.xz = u_xlat16.xz * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16.xz);
    u_xlat7.xyz = texture2D(_BackTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat10_0.xyz : u_xlat7.xyz;
    u_xlat16_1.x = _Range * 0.5 + _Rate;
    u_xlat6.x = u_xlat16_1.x + (-u_xlat6.x);
    u_xlat6.x = abs(u_xlat6.x) / _Range;
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlat6.x = min(abs(u_xlat6.x), 1.0);
    u_xlat16_1.xyz = _BackSpecular.xyz * _BackSpecular.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat6.xxx + u_xlat7.xyz;
    u_xlat6.x = _DissolveEdgeWidth * -999.999939;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_DissolveColorPW, _DissolveColorPW, _DissolveColorPW));
    u_xlat16_3.xyz = _DissolveEdgeColor.xyz * _DissolveEdgeColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat6.xxx * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_31 = _Rate;
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
    u_xlat16_31 = u_xlat16_31 * _Shadow;
    u_xlat6.x = u_xlat26.x / u_xlat16_31;
    u_xlat6.xyz = _ShadowColor.xyz * _ShadowColor.xyz + u_xlat6.xxx;
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = u_xlat6.xyz * u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    u_xlat6.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat6.x>=(-u_xlat6.x);
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb16) ? u_xlat6.x : (-u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 3600.0;
    u_xlat6.xy = u_xlat6.xx * _DisNoise_TiSp.zw;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat26.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlatb7 = _DisUV_Select==2.0;
    u_xlat26.xy = (bool(u_xlatb7)) ? u_xlat26.xy : vs_TEXCOORD1.zw;
    u_xlat26.xy = u_xlat26.xy + vec2(-0.5, -0.5);
    u_xlat16_31 = _Dissolve_Dir * 0.0174532924;
    u_xlat7.x = sin((-u_xlat16_31));
    u_xlat8.x = sin(u_xlat16_31);
    u_xlat9 = cos(u_xlat16_31);
    u_xlat7.y = u_xlat9;
    u_xlat7.z = u_xlat8.x;
    u_xlat8.y = dot(u_xlat7.zy, u_xlat26.xy);
    u_xlat8.x = dot(u_xlat7.yx, u_xlat26.xy);
    u_xlat26.xy = u_xlat8.xy * vec2(0.699999988, 0.699999988) + vec2(0.5, 0.5);
    u_xlat6.xy = u_xlat26.xy * _DisNoise_TiSp.xy + u_xlat6.xy;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).y;
    u_xlat6.xy = vec2(u_xlat10_6) * vec2(vec2(_DisNoise_Intensity, _DisNoise_Intensity)) + u_xlat26.xy;
    u_xlat6.xy = u_xlat6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat6.xy = u_xlat6.xy + vs_TEXCOORD2.zw;
    u_xlat10_6 = texture2D(_DissolveTex, u_xlat6.xy).x;
    u_xlat16.x = (-u_xlat10_6) + u_xlat26.x;
    u_xlat6.x = _DisDir_Weight * u_xlat16.x + u_xlat10_6;
    u_xlat16_31 = u_xlat6.x + (-_DissolveStep);
    u_xlat16_31 = u_xlat16_31 + (-vs_TEXCOORD2.y);
    u_xlat6.x = u_xlat16_31 + (-_SoftSize);
    u_xlat6.x = max(u_xlat6.x, 0.00100000005);
    u_xlat6.x = (-_SoftSize) / u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    SV_Target0.xyz = u_xlat6.xxx * u_xlat16_1.xyz + u_xlat16_2.xyz;
    SV_Target0.w = u_xlat10_0.w * u_xlat6.x;
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
Local Keywords { "_CUSTOMDATA_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_CUSTOMDATA_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_CUSTOMDATA_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_CUSTOMDATA_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BACK_TEX_ENABLED" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BACK_TEX_ENABLED" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BACK_TEX_ENABLED" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BACK_TEX_ENABLED" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BACK_TEX_ENABLED" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BACK_TEX_ENABLED" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BACK_TEX_ENABLED" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BACK_TEX_ENABLED" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUSTOMDATA_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUSTOMDATA_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUSTOMDATA_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUSTOMDATA_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_BACK_TEX_ENABLED" "_CUSTOMDATA_ON" "_ENABLE_VERTEX_OFFSET" }
""
}
}
}
}
}