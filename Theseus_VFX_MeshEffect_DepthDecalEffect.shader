//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/VFX/MeshEffect_DepthDecalEffect" {
Properties {

[ModuleBegin(1)] _ModuleBegin_MergeStage ("合并阶段设置", Float) = 0.0

[CommonBlendModePreset] _BlendPreset ("混合模式", Float) = 0.0

_SrcBlend ("SrcBlend", Float) = 5.0

_DstBlend ("DstBlend", Float) = 10.0

[Enum(UnityEngine.Rendering.CullMode)] _CullMode ("剔除模式", Float) = 0.0

[Enum(Off, 0, On, 1)] _ZWrite ("深度测试", Float) = 0.0

[ModuleEnd] [Enum(On, 0, Off, 4)] _ZTest ("总是最前", Float) = 4.0

[ModuleBegin(0)] _ModuleBegin_Stencil ("模板缓存设置", Float) = 0.0

_StencilRef ("模板参考值", Range(0, 255)) = 0.0

_StencilReadMask ("读取遮罩", Range(0, 255)) = 255.0

_StencilWriteMask ("写入遮罩", Range(0, 255)) = 255.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("比较方式", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("通过运算", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("深度失败运算", Float) = 0.0

[ModuleEnd] [Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("失败运算", Float) = 0.0

[ModuleBegin(0)] _ModuleBegin_Main ("主贴图设置", Float) = 0.0

_BaseMap ("主贴图", 2D) = "white" { }

[Vector4Split(Toggle, Toggle, Toggle, Hidden)] _BaseMapToggles ("主贴图开关 ## 开启预乘Alpha(禁动画中K开关) | 去黑底(禁动画中K开关) | 开启极坐标(禁动画中K开关) | 切换为2U(禁动画中K开关)", Vector) = (0,0,0,0)

_BaseColor ("整体叠色", Color) = (1,1,1,1)

[Vector4Split(Range, Range, Hidden, Hidden)] _BaseIntensityParams ("主贴图强度参数 ## 整体强度(0, 10) | 整体Alpha强度(0, 10) | 开启双面渲染(禁动画中K开关) | 背面颜色强度(0, 10) ", Vector) = (0,1,0,0)

[Vector4Split(Float, Float, Float, Hidden)] _RingUVParams ("环形贴图UV参数 ## U方向流速 | V方向流速 | 环形重复次数 | _", Vector) = (0,0,4,0)

[ModuleEnd] [ModuleBegin(_ENABLE_TRIPLANAR)] _ModuleBegin_Triplanar ("Triplanar采样设置", Float) = 0.0

[Enum(All, 0, XY, 1, YZ, 2, ZX, 3)] _TriplanarMode ("采样模式(全部平面混合/单一平面XY/YZ/ZX)", Float) = 0.0

[ModuleEnd] [Vector4Split(Float, Range, Hidden, Hidden)] _TriplanarParams ("Triplanar参数 ## 世界空间UV缩放 | 混合锐度(1, 32) | _ | _", Vector) = (1,4,0,0)

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 34277
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
UNITY_BINDING(3) uniform UnityPerDraw {
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
in highp vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _RingUVParams;
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
UNITY_BINDING(1) uniform UnityPerCameraRare {
#endif
	UNITY_UNIFORM vec4 unity_CameraWorldClipPlanes[6];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraProjection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec3 u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_9;
float u_xlat10;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat10 = texture(_CameraDepthTexture, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.999899983<u_xlat10);
#else
    u_xlatb15 = 0.999899983<u_xlat10;
#endif
    if(u_xlatb15){discard;}
    u_xlat16_1.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat15 = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat15>=(-u_xlat15));
#else
    u_xlatb2.x = u_xlat15>=(-u_xlat15);
#endif
    u_xlat15 = fract(abs(u_xlat15));
    u_xlat15 = (u_xlatb2.x) ? u_xlat15 : (-u_xlat15);
    u_xlat15 = u_xlat15 * 3600.0;
    u_xlat10 = _ZBufferParams.x * u_xlat10 + _ZBufferParams.y;
    u_xlat10 = float(1.0) / u_xlat10;
    u_xlat2.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.z = 1.0;
    u_xlat2.xyz = u_xlat2.xyz * _ProjectionParams.zzz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraInvProjection[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyz = hlslcc_mtx4x4unity_CameraInvProjection[3].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixInvV[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixInvV[0].xz * u_xlat0.xx + u_xlat2.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixInvV[2].xz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_MatrixInvV[3].xz;
    u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD2.xz);
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _BaseMapToggles.zyxz).xyz;
    u_xlat16_16 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_16 = sqrt(u_xlat16_16);
    u_xlat16_4.x = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat16_9 = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat16_9 = float(1.0) / u_xlat16_9;
    u_xlat16_4.x = u_xlat16_9 * u_xlat16_4.x;
    u_xlat16_9 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat10 = u_xlat16_9 * 0.0208350997 + -0.0851330012;
    u_xlat10 = u_xlat16_9 * u_xlat10 + 0.180141002;
    u_xlat10 = u_xlat16_9 * u_xlat10 + -0.330299497;
    u_xlat10 = u_xlat16_9 * u_xlat10 + 0.999866009;
    u_xlat17 = u_xlat10 * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(abs(u_xlat0.x)<abs(u_xlat0.y));
#else
    u_xlatb3 = abs(u_xlat0.x)<abs(u_xlat0.y);
#endif
    u_xlat17 = u_xlat17 * -2.0 + 1.57079637;
    u_xlat17 = u_xlatb3 ? u_xlat17 : float(0.0);
    u_xlat10 = u_xlat16_4.x * u_xlat10 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat0.x<(-u_xlat0.x));
#else
    u_xlatb17 = u_xlat0.x<(-u_xlat0.x);
#endif
    u_xlat17 = u_xlatb17 ? -3.14159274 : float(0.0);
    u_xlat10 = u_xlat10 + u_xlat17;
    u_xlat16_4.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat16_9 = max(u_xlat0.x, u_xlat0.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat16_4.x<(-u_xlat16_4.x));
#else
    u_xlatb17 = u_xlat16_4.x<(-u_xlat16_4.x);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat16_9>=(-u_xlat16_9));
#else
    u_xlatb3 = u_xlat16_9>=(-u_xlat16_9);
#endif
    u_xlatb17 = u_xlatb17 && u_xlatb3;
    u_xlat10 = (u_xlatb17) ? (-u_xlat10) : u_xlat10;
    u_xlat3.x = u_xlat10 * 0.159154937 + 0.5;
    u_xlat10 = u_xlat16_16 * _RingUVParams.z;
    u_xlat3.y = fract(u_xlat10);
    u_xlat16_4.xy = (u_xlatb2.x) ? u_xlat3.xy : u_xlat0.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xy = vec2(u_xlat15) * _RingUVParams.xy + u_xlat16_4.xy;
    u_xlat16_0 = texture(_BaseMap, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_16 = u_xlat16_0.w * u_xlat16_4.y;
    u_xlat16_16 = (u_xlatb2.y) ? u_xlat16_16 : u_xlat16_0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_16) * u_xlat16_1.xyz;
    u_xlat16_1.xyz = (u_xlatb2.z) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_16 = u_xlat16_16 * _BaseColor.w;
    SV_Target0.w = u_xlat16_16 * _BaseIntensityParams.y;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
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
UNITY_BINDING(3) uniform UnityPerDraw {
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
in highp vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _RingUVParams;
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
UNITY_BINDING(1) uniform UnityPerCameraRare {
#endif
	UNITY_UNIFORM vec4 unity_CameraWorldClipPlanes[6];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraProjection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec3 u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_9;
float u_xlat10;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat10 = texture(_CameraDepthTexture, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.999899983<u_xlat10);
#else
    u_xlatb15 = 0.999899983<u_xlat10;
#endif
    if(u_xlatb15){discard;}
    u_xlat16_1.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat15 = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat15>=(-u_xlat15));
#else
    u_xlatb2.x = u_xlat15>=(-u_xlat15);
#endif
    u_xlat15 = fract(abs(u_xlat15));
    u_xlat15 = (u_xlatb2.x) ? u_xlat15 : (-u_xlat15);
    u_xlat15 = u_xlat15 * 3600.0;
    u_xlat10 = _ZBufferParams.x * u_xlat10 + _ZBufferParams.y;
    u_xlat10 = float(1.0) / u_xlat10;
    u_xlat2.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.z = 1.0;
    u_xlat2.xyz = u_xlat2.xyz * _ProjectionParams.zzz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraInvProjection[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyz = hlslcc_mtx4x4unity_CameraInvProjection[3].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixInvV[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixInvV[0].xz * u_xlat0.xx + u_xlat2.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixInvV[2].xz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_MatrixInvV[3].xz;
    u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD2.xz);
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _BaseMapToggles.zyxz).xyz;
    u_xlat16_16 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_16 = sqrt(u_xlat16_16);
    u_xlat16_4.x = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat16_9 = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat16_9 = float(1.0) / u_xlat16_9;
    u_xlat16_4.x = u_xlat16_9 * u_xlat16_4.x;
    u_xlat16_9 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat10 = u_xlat16_9 * 0.0208350997 + -0.0851330012;
    u_xlat10 = u_xlat16_9 * u_xlat10 + 0.180141002;
    u_xlat10 = u_xlat16_9 * u_xlat10 + -0.330299497;
    u_xlat10 = u_xlat16_9 * u_xlat10 + 0.999866009;
    u_xlat17 = u_xlat10 * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(abs(u_xlat0.x)<abs(u_xlat0.y));
#else
    u_xlatb3 = abs(u_xlat0.x)<abs(u_xlat0.y);
#endif
    u_xlat17 = u_xlat17 * -2.0 + 1.57079637;
    u_xlat17 = u_xlatb3 ? u_xlat17 : float(0.0);
    u_xlat10 = u_xlat16_4.x * u_xlat10 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat0.x<(-u_xlat0.x));
#else
    u_xlatb17 = u_xlat0.x<(-u_xlat0.x);
#endif
    u_xlat17 = u_xlatb17 ? -3.14159274 : float(0.0);
    u_xlat10 = u_xlat10 + u_xlat17;
    u_xlat16_4.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat16_9 = max(u_xlat0.x, u_xlat0.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat16_4.x<(-u_xlat16_4.x));
#else
    u_xlatb17 = u_xlat16_4.x<(-u_xlat16_4.x);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat16_9>=(-u_xlat16_9));
#else
    u_xlatb3 = u_xlat16_9>=(-u_xlat16_9);
#endif
    u_xlatb17 = u_xlatb17 && u_xlatb3;
    u_xlat10 = (u_xlatb17) ? (-u_xlat10) : u_xlat10;
    u_xlat3.x = u_xlat10 * 0.159154937 + 0.5;
    u_xlat10 = u_xlat16_16 * _RingUVParams.z;
    u_xlat3.y = fract(u_xlat10);
    u_xlat16_4.xy = (u_xlatb2.x) ? u_xlat3.xy : u_xlat0.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xy = vec2(u_xlat15) * _RingUVParams.xy + u_xlat16_4.xy;
    u_xlat16_0 = texture(_BaseMap, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_16 = u_xlat16_0.w * u_xlat16_4.y;
    u_xlat16_16 = (u_xlatb2.y) ? u_xlat16_16 : u_xlat16_0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_16) * u_xlat16_1.xyz;
    u_xlat16_1.xyz = (u_xlatb2.z) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_16 = u_xlat16_16 * _BaseColor.w;
    SV_Target0.w = u_xlat16_16 * _BaseIntensityParams.y;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _RingUVParams;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _BaseMap;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec3 u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_9;
float u_xlat10;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat10 = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlatb15 = 0.999899983<u_xlat10;
    if(u_xlatb15){discard;}
    u_xlat16_1.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat15 = _Time.y * 0.000277777785;
    u_xlatb2.x = u_xlat15>=(-u_xlat15);
    u_xlat15 = fract(abs(u_xlat15));
    u_xlat15 = (u_xlatb2.x) ? u_xlat15 : (-u_xlat15);
    u_xlat15 = u_xlat15 * 3600.0;
    u_xlat10 = _ZBufferParams.x * u_xlat10 + _ZBufferParams.y;
    u_xlat10 = float(1.0) / u_xlat10;
    u_xlat2.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.z = 1.0;
    u_xlat2.xyz = u_xlat2.xyz * _ProjectionParams.zzz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraInvProjection[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyz = hlslcc_mtx4x4unity_CameraInvProjection[3].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixInvV[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixInvV[0].xz * u_xlat0.xx + u_xlat2.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixInvV[2].xz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_MatrixInvV[3].xz;
    u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD2.xz);
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _BaseMapToggles.zyxz).xyz;
    u_xlat16_16 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_16 = sqrt(u_xlat16_16);
    u_xlat16_4.x = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat16_9 = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat16_9 = float(1.0) / u_xlat16_9;
    u_xlat16_4.x = u_xlat16_9 * u_xlat16_4.x;
    u_xlat16_9 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat10 = u_xlat16_9 * 0.0208350997 + -0.0851330012;
    u_xlat10 = u_xlat16_9 * u_xlat10 + 0.180141002;
    u_xlat10 = u_xlat16_9 * u_xlat10 + -0.330299497;
    u_xlat10 = u_xlat16_9 * u_xlat10 + 0.999866009;
    u_xlat17 = u_xlat10 * u_xlat16_4.x;
    u_xlatb3 = abs(u_xlat0.x)<abs(u_xlat0.y);
    u_xlat17 = u_xlat17 * -2.0 + 1.57079637;
    u_xlat17 = u_xlatb3 ? u_xlat17 : float(0.0);
    u_xlat10 = u_xlat16_4.x * u_xlat10 + u_xlat17;
    u_xlatb17 = u_xlat0.x<(-u_xlat0.x);
    u_xlat17 = u_xlatb17 ? -3.14159274 : float(0.0);
    u_xlat10 = u_xlat10 + u_xlat17;
    u_xlat16_4.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat16_9 = max(u_xlat0.x, u_xlat0.y);
    u_xlatb17 = u_xlat16_4.x<(-u_xlat16_4.x);
    u_xlatb3 = u_xlat16_9>=(-u_xlat16_9);
    u_xlatb17 = u_xlatb17 && u_xlatb3;
    u_xlat10 = (u_xlatb17) ? (-u_xlat10) : u_xlat10;
    u_xlat3.x = u_xlat10 * 0.159154937 + 0.5;
    u_xlat10 = u_xlat16_16 * _RingUVParams.z;
    u_xlat3.y = fract(u_xlat10);
    u_xlat16_4.xy = (u_xlatb2.x) ? u_xlat3.xy : u_xlat0.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xy = vec2(u_xlat15) * _RingUVParams.xy + u_xlat16_4.xy;
    u_xlat10_0 = texture2D(_BaseMap, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz;
    u_xlat16_16 = u_xlat10_0.w * u_xlat16_4.y;
    u_xlat16_16 = (u_xlatb2.y) ? u_xlat16_16 : u_xlat10_0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_16) * u_xlat16_1.xyz;
    u_xlat16_1.xyz = (u_xlatb2.z) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_16 = u_xlat16_16 * _BaseColor.w;
    SV_Target0.w = u_xlat16_16 * _BaseIntensityParams.y;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _RingUVParams;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _BaseMap;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec3 u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_9;
float u_xlat10;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat10 = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlatb15 = 0.999899983<u_xlat10;
    if(u_xlatb15){discard;}
    u_xlat16_1.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat15 = _Time.y * 0.000277777785;
    u_xlatb2.x = u_xlat15>=(-u_xlat15);
    u_xlat15 = fract(abs(u_xlat15));
    u_xlat15 = (u_xlatb2.x) ? u_xlat15 : (-u_xlat15);
    u_xlat15 = u_xlat15 * 3600.0;
    u_xlat10 = _ZBufferParams.x * u_xlat10 + _ZBufferParams.y;
    u_xlat10 = float(1.0) / u_xlat10;
    u_xlat2.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.z = 1.0;
    u_xlat2.xyz = u_xlat2.xyz * _ProjectionParams.zzz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraInvProjection[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyz = hlslcc_mtx4x4unity_CameraInvProjection[3].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixInvV[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixInvV[0].xz * u_xlat0.xx + u_xlat2.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixInvV[2].xz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_MatrixInvV[3].xz;
    u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD2.xz);
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _BaseMapToggles.zyxz).xyz;
    u_xlat16_16 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_16 = sqrt(u_xlat16_16);
    u_xlat16_4.x = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat16_9 = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat16_9 = float(1.0) / u_xlat16_9;
    u_xlat16_4.x = u_xlat16_9 * u_xlat16_4.x;
    u_xlat16_9 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat10 = u_xlat16_9 * 0.0208350997 + -0.0851330012;
    u_xlat10 = u_xlat16_9 * u_xlat10 + 0.180141002;
    u_xlat10 = u_xlat16_9 * u_xlat10 + -0.330299497;
    u_xlat10 = u_xlat16_9 * u_xlat10 + 0.999866009;
    u_xlat17 = u_xlat10 * u_xlat16_4.x;
    u_xlatb3 = abs(u_xlat0.x)<abs(u_xlat0.y);
    u_xlat17 = u_xlat17 * -2.0 + 1.57079637;
    u_xlat17 = u_xlatb3 ? u_xlat17 : float(0.0);
    u_xlat10 = u_xlat16_4.x * u_xlat10 + u_xlat17;
    u_xlatb17 = u_xlat0.x<(-u_xlat0.x);
    u_xlat17 = u_xlatb17 ? -3.14159274 : float(0.0);
    u_xlat10 = u_xlat10 + u_xlat17;
    u_xlat16_4.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat16_9 = max(u_xlat0.x, u_xlat0.y);
    u_xlatb17 = u_xlat16_4.x<(-u_xlat16_4.x);
    u_xlatb3 = u_xlat16_9>=(-u_xlat16_9);
    u_xlatb17 = u_xlatb17 && u_xlatb3;
    u_xlat10 = (u_xlatb17) ? (-u_xlat10) : u_xlat10;
    u_xlat3.x = u_xlat10 * 0.159154937 + 0.5;
    u_xlat10 = u_xlat16_16 * _RingUVParams.z;
    u_xlat3.y = fract(u_xlat10);
    u_xlat16_4.xy = (u_xlatb2.x) ? u_xlat3.xy : u_xlat0.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xy = vec2(u_xlat15) * _RingUVParams.xy + u_xlat16_4.xy;
    u_xlat10_0 = texture2D(_BaseMap, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz;
    u_xlat16_16 = u_xlat10_0.w * u_xlat16_4.y;
    u_xlat16_16 = (u_xlatb2.y) ? u_xlat16_16 : u_xlat10_0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_16) * u_xlat16_1.xyz;
    u_xlat16_1.xyz = (u_xlatb2.z) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_16 = u_xlat16_16 * _BaseColor.w;
    SV_Target0.w = u_xlat16_16 * _BaseIntensityParams.y;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
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
UNITY_BINDING(3) uniform UnityPerDraw {
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
in highp vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _RingUVParams;
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
UNITY_BINDING(1) uniform UnityPerCameraRare {
#endif
	UNITY_UNIFORM vec4 unity_CameraWorldClipPlanes[6];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraProjection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec3 u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_9;
float u_xlat10;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat10 = texture(_CameraDepthTexture, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.999899983<u_xlat10);
#else
    u_xlatb15 = 0.999899983<u_xlat10;
#endif
    if(u_xlatb15){discard;}
    u_xlat16_1.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat15 = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat15>=(-u_xlat15));
#else
    u_xlatb2.x = u_xlat15>=(-u_xlat15);
#endif
    u_xlat15 = fract(abs(u_xlat15));
    u_xlat15 = (u_xlatb2.x) ? u_xlat15 : (-u_xlat15);
    u_xlat15 = u_xlat15 * 3600.0;
    u_xlat10 = _ZBufferParams.x * u_xlat10 + _ZBufferParams.y;
    u_xlat10 = float(1.0) / u_xlat10;
    u_xlat2.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.z = 1.0;
    u_xlat2.xyz = u_xlat2.xyz * _ProjectionParams.zzz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraInvProjection[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyz = hlslcc_mtx4x4unity_CameraInvProjection[3].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixInvV[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixInvV[0].xz * u_xlat0.xx + u_xlat2.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixInvV[2].xz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_MatrixInvV[3].xz;
    u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD2.xz);
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _BaseMapToggles.zyxz).xyz;
    u_xlat16_16 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_16 = sqrt(u_xlat16_16);
    u_xlat16_4.x = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat16_9 = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat16_9 = float(1.0) / u_xlat16_9;
    u_xlat16_4.x = u_xlat16_9 * u_xlat16_4.x;
    u_xlat16_9 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat10 = u_xlat16_9 * 0.0208350997 + -0.0851330012;
    u_xlat10 = u_xlat16_9 * u_xlat10 + 0.180141002;
    u_xlat10 = u_xlat16_9 * u_xlat10 + -0.330299497;
    u_xlat10 = u_xlat16_9 * u_xlat10 + 0.999866009;
    u_xlat17 = u_xlat10 * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(abs(u_xlat0.x)<abs(u_xlat0.y));
#else
    u_xlatb3 = abs(u_xlat0.x)<abs(u_xlat0.y);
#endif
    u_xlat17 = u_xlat17 * -2.0 + 1.57079637;
    u_xlat17 = u_xlatb3 ? u_xlat17 : float(0.0);
    u_xlat10 = u_xlat16_4.x * u_xlat10 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat0.x<(-u_xlat0.x));
#else
    u_xlatb17 = u_xlat0.x<(-u_xlat0.x);
#endif
    u_xlat17 = u_xlatb17 ? -3.14159274 : float(0.0);
    u_xlat10 = u_xlat10 + u_xlat17;
    u_xlat16_4.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat16_9 = max(u_xlat0.x, u_xlat0.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat16_4.x<(-u_xlat16_4.x));
#else
    u_xlatb17 = u_xlat16_4.x<(-u_xlat16_4.x);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat16_9>=(-u_xlat16_9));
#else
    u_xlatb3 = u_xlat16_9>=(-u_xlat16_9);
#endif
    u_xlatb17 = u_xlatb17 && u_xlatb3;
    u_xlat10 = (u_xlatb17) ? (-u_xlat10) : u_xlat10;
    u_xlat3.x = u_xlat10 * 0.159154937 + 0.5;
    u_xlat10 = u_xlat16_16 * _RingUVParams.z;
    u_xlat3.y = fract(u_xlat10);
    u_xlat16_4.xy = (u_xlatb2.x) ? u_xlat3.xy : u_xlat0.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xy = vec2(u_xlat15) * _RingUVParams.xy + u_xlat16_4.xy;
    u_xlat16_0 = texture(_BaseMap, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_16 = u_xlat16_0.w * u_xlat16_4.y;
    u_xlat16_16 = (u_xlatb2.y) ? u_xlat16_16 : u_xlat16_0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_16) * u_xlat16_1.xyz;
    SV_Target0.xyz = (u_xlatb2.z) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_1.x = u_xlat16_16 * _BaseColor.w;
    SV_Target0.w = u_xlat16_1.x * _BaseIntensityParams.y;
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
UNITY_BINDING(3) uniform UnityPerDraw {
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
in highp vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _RingUVParams;
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
UNITY_BINDING(1) uniform UnityPerCameraRare {
#endif
	UNITY_UNIFORM vec4 unity_CameraWorldClipPlanes[6];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraProjection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec3 u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_9;
float u_xlat10;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat10 = texture(_CameraDepthTexture, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.999899983<u_xlat10);
#else
    u_xlatb15 = 0.999899983<u_xlat10;
#endif
    if(u_xlatb15){discard;}
    u_xlat16_1.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat15 = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat15>=(-u_xlat15));
#else
    u_xlatb2.x = u_xlat15>=(-u_xlat15);
#endif
    u_xlat15 = fract(abs(u_xlat15));
    u_xlat15 = (u_xlatb2.x) ? u_xlat15 : (-u_xlat15);
    u_xlat15 = u_xlat15 * 3600.0;
    u_xlat10 = _ZBufferParams.x * u_xlat10 + _ZBufferParams.y;
    u_xlat10 = float(1.0) / u_xlat10;
    u_xlat2.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.z = 1.0;
    u_xlat2.xyz = u_xlat2.xyz * _ProjectionParams.zzz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraInvProjection[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyz = hlslcc_mtx4x4unity_CameraInvProjection[3].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixInvV[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixInvV[0].xz * u_xlat0.xx + u_xlat2.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixInvV[2].xz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_MatrixInvV[3].xz;
    u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD2.xz);
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _BaseMapToggles.zyxz).xyz;
    u_xlat16_16 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_16 = sqrt(u_xlat16_16);
    u_xlat16_4.x = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat16_9 = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat16_9 = float(1.0) / u_xlat16_9;
    u_xlat16_4.x = u_xlat16_9 * u_xlat16_4.x;
    u_xlat16_9 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat10 = u_xlat16_9 * 0.0208350997 + -0.0851330012;
    u_xlat10 = u_xlat16_9 * u_xlat10 + 0.180141002;
    u_xlat10 = u_xlat16_9 * u_xlat10 + -0.330299497;
    u_xlat10 = u_xlat16_9 * u_xlat10 + 0.999866009;
    u_xlat17 = u_xlat10 * u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(abs(u_xlat0.x)<abs(u_xlat0.y));
#else
    u_xlatb3 = abs(u_xlat0.x)<abs(u_xlat0.y);
#endif
    u_xlat17 = u_xlat17 * -2.0 + 1.57079637;
    u_xlat17 = u_xlatb3 ? u_xlat17 : float(0.0);
    u_xlat10 = u_xlat16_4.x * u_xlat10 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat0.x<(-u_xlat0.x));
#else
    u_xlatb17 = u_xlat0.x<(-u_xlat0.x);
#endif
    u_xlat17 = u_xlatb17 ? -3.14159274 : float(0.0);
    u_xlat10 = u_xlat10 + u_xlat17;
    u_xlat16_4.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat16_9 = max(u_xlat0.x, u_xlat0.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat16_4.x<(-u_xlat16_4.x));
#else
    u_xlatb17 = u_xlat16_4.x<(-u_xlat16_4.x);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat16_9>=(-u_xlat16_9));
#else
    u_xlatb3 = u_xlat16_9>=(-u_xlat16_9);
#endif
    u_xlatb17 = u_xlatb17 && u_xlatb3;
    u_xlat10 = (u_xlatb17) ? (-u_xlat10) : u_xlat10;
    u_xlat3.x = u_xlat10 * 0.159154937 + 0.5;
    u_xlat10 = u_xlat16_16 * _RingUVParams.z;
    u_xlat3.y = fract(u_xlat10);
    u_xlat16_4.xy = (u_xlatb2.x) ? u_xlat3.xy : u_xlat0.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xy = vec2(u_xlat15) * _RingUVParams.xy + u_xlat16_4.xy;
    u_xlat16_0 = texture(_BaseMap, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_16 = u_xlat16_0.w * u_xlat16_4.y;
    u_xlat16_16 = (u_xlatb2.y) ? u_xlat16_16 : u_xlat16_0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_16) * u_xlat16_1.xyz;
    SV_Target0.xyz = (u_xlatb2.z) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_1.x = u_xlat16_16 * _BaseColor.w;
    SV_Target0.w = u_xlat16_1.x * _BaseIntensityParams.y;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _RingUVParams;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _BaseMap;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec3 u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_9;
float u_xlat10;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat10 = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlatb15 = 0.999899983<u_xlat10;
    if(u_xlatb15){discard;}
    u_xlat16_1.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat15 = _Time.y * 0.000277777785;
    u_xlatb2.x = u_xlat15>=(-u_xlat15);
    u_xlat15 = fract(abs(u_xlat15));
    u_xlat15 = (u_xlatb2.x) ? u_xlat15 : (-u_xlat15);
    u_xlat15 = u_xlat15 * 3600.0;
    u_xlat10 = _ZBufferParams.x * u_xlat10 + _ZBufferParams.y;
    u_xlat10 = float(1.0) / u_xlat10;
    u_xlat2.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.z = 1.0;
    u_xlat2.xyz = u_xlat2.xyz * _ProjectionParams.zzz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraInvProjection[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyz = hlslcc_mtx4x4unity_CameraInvProjection[3].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixInvV[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixInvV[0].xz * u_xlat0.xx + u_xlat2.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixInvV[2].xz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_MatrixInvV[3].xz;
    u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD2.xz);
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _BaseMapToggles.zyxz).xyz;
    u_xlat16_16 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_16 = sqrt(u_xlat16_16);
    u_xlat16_4.x = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat16_9 = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat16_9 = float(1.0) / u_xlat16_9;
    u_xlat16_4.x = u_xlat16_9 * u_xlat16_4.x;
    u_xlat16_9 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat10 = u_xlat16_9 * 0.0208350997 + -0.0851330012;
    u_xlat10 = u_xlat16_9 * u_xlat10 + 0.180141002;
    u_xlat10 = u_xlat16_9 * u_xlat10 + -0.330299497;
    u_xlat10 = u_xlat16_9 * u_xlat10 + 0.999866009;
    u_xlat17 = u_xlat10 * u_xlat16_4.x;
    u_xlatb3 = abs(u_xlat0.x)<abs(u_xlat0.y);
    u_xlat17 = u_xlat17 * -2.0 + 1.57079637;
    u_xlat17 = u_xlatb3 ? u_xlat17 : float(0.0);
    u_xlat10 = u_xlat16_4.x * u_xlat10 + u_xlat17;
    u_xlatb17 = u_xlat0.x<(-u_xlat0.x);
    u_xlat17 = u_xlatb17 ? -3.14159274 : float(0.0);
    u_xlat10 = u_xlat10 + u_xlat17;
    u_xlat16_4.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat16_9 = max(u_xlat0.x, u_xlat0.y);
    u_xlatb17 = u_xlat16_4.x<(-u_xlat16_4.x);
    u_xlatb3 = u_xlat16_9>=(-u_xlat16_9);
    u_xlatb17 = u_xlatb17 && u_xlatb3;
    u_xlat10 = (u_xlatb17) ? (-u_xlat10) : u_xlat10;
    u_xlat3.x = u_xlat10 * 0.159154937 + 0.5;
    u_xlat10 = u_xlat16_16 * _RingUVParams.z;
    u_xlat3.y = fract(u_xlat10);
    u_xlat16_4.xy = (u_xlatb2.x) ? u_xlat3.xy : u_xlat0.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xy = vec2(u_xlat15) * _RingUVParams.xy + u_xlat16_4.xy;
    u_xlat10_0 = texture2D(_BaseMap, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz;
    u_xlat16_16 = u_xlat10_0.w * u_xlat16_4.y;
    u_xlat16_16 = (u_xlatb2.y) ? u_xlat16_16 : u_xlat10_0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_16) * u_xlat16_1.xyz;
    SV_Target0.xyz = (u_xlatb2.z) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_1.x = u_xlat16_16 * _BaseColor.w;
    SV_Target0.w = u_xlat16_1.x * _BaseIntensityParams.y;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _RingUVParams;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _BaseMap;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bvec3 u_xlatb2;
vec3 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_9;
float u_xlat10;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat10 = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlatb15 = 0.999899983<u_xlat10;
    if(u_xlatb15){discard;}
    u_xlat16_1.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat15 = _Time.y * 0.000277777785;
    u_xlatb2.x = u_xlat15>=(-u_xlat15);
    u_xlat15 = fract(abs(u_xlat15));
    u_xlat15 = (u_xlatb2.x) ? u_xlat15 : (-u_xlat15);
    u_xlat15 = u_xlat15 * 3600.0;
    u_xlat10 = _ZBufferParams.x * u_xlat10 + _ZBufferParams.y;
    u_xlat10 = float(1.0) / u_xlat10;
    u_xlat2.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.z = 1.0;
    u_xlat2.xyz = u_xlat2.xyz * _ProjectionParams.zzz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraInvProjection[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraInvProjection[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraInvProjection[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyz = hlslcc_mtx4x4unity_CameraInvProjection[3].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixInvV[1].xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixInvV[0].xz * u_xlat0.xx + u_xlat2.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixInvV[2].xz * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_MatrixInvV[3].xz;
    u_xlat0.xy = u_xlat0.xy + (-vs_TEXCOORD2.xz);
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _BaseMapToggles.zyxz).xyz;
    u_xlat16_16 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_16 = sqrt(u_xlat16_16);
    u_xlat16_4.x = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat16_9 = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat16_9 = float(1.0) / u_xlat16_9;
    u_xlat16_4.x = u_xlat16_9 * u_xlat16_4.x;
    u_xlat16_9 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat10 = u_xlat16_9 * 0.0208350997 + -0.0851330012;
    u_xlat10 = u_xlat16_9 * u_xlat10 + 0.180141002;
    u_xlat10 = u_xlat16_9 * u_xlat10 + -0.330299497;
    u_xlat10 = u_xlat16_9 * u_xlat10 + 0.999866009;
    u_xlat17 = u_xlat10 * u_xlat16_4.x;
    u_xlatb3 = abs(u_xlat0.x)<abs(u_xlat0.y);
    u_xlat17 = u_xlat17 * -2.0 + 1.57079637;
    u_xlat17 = u_xlatb3 ? u_xlat17 : float(0.0);
    u_xlat10 = u_xlat16_4.x * u_xlat10 + u_xlat17;
    u_xlatb17 = u_xlat0.x<(-u_xlat0.x);
    u_xlat17 = u_xlatb17 ? -3.14159274 : float(0.0);
    u_xlat10 = u_xlat10 + u_xlat17;
    u_xlat16_4.x = min(u_xlat0.x, u_xlat0.y);
    u_xlat16_9 = max(u_xlat0.x, u_xlat0.y);
    u_xlatb17 = u_xlat16_4.x<(-u_xlat16_4.x);
    u_xlatb3 = u_xlat16_9>=(-u_xlat16_9);
    u_xlatb17 = u_xlatb17 && u_xlatb3;
    u_xlat10 = (u_xlatb17) ? (-u_xlat10) : u_xlat10;
    u_xlat3.x = u_xlat10 * 0.159154937 + 0.5;
    u_xlat10 = u_xlat16_16 * _RingUVParams.z;
    u_xlat3.y = fract(u_xlat10);
    u_xlat16_4.xy = (u_xlatb2.x) ? u_xlat3.xy : u_xlat0.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xy = vec2(u_xlat15) * _RingUVParams.xy + u_xlat16_4.xy;
    u_xlat10_0 = texture2D(_BaseMap, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz;
    u_xlat16_16 = u_xlat10_0.w * u_xlat16_4.y;
    u_xlat16_16 = (u_xlatb2.y) ? u_xlat16_16 : u_xlat10_0.w;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_16) * u_xlat16_1.xyz;
    SV_Target0.xyz = (u_xlatb2.z) ? u_xlat16_4.xyz : u_xlat16_1.xyz;
    u_xlat16_1.x = u_xlat16_16 * _BaseColor.w;
    SV_Target0.w = u_xlat16_1.x * _BaseIntensityParams.y;
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
}
}
}
CustomEditor "TheseusEditor.TheseusModuleShaderGUIBase"
}