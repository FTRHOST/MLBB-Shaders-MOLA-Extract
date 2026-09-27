//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/VFX/MeshEffect_CommonSF_UnlitShadow" {
Properties {

[ModuleBegin(1)] _ModuleBegin_MergeStage ("合并阶段设置", Float) = 0.0

[Enum(UnityEngine.Rendering.CullMode)] _CullMode ("剔除模式", Float) = 0.0

[Toggle] _UseAlphaToMask ("AlphaToMask(MSAA边缘平滑)", Float) = 0.0

[ModuleEnd] _Cutoff ("AlphaTest裁剪阈值(溶解×Mask×主贴图Alpha)", Range(0, 1)) = 0.5

_ZWrite ("__zw", Float) = 1.0

_BlendPreset ("__blendPreset", Float) = 0.0

[ModuleBegin(0)] _ModuleBegin_UVMode ("UV模式设置", Float) = 0.0

[Toggle(_ENABLE_SCREEN_UV)] _EnableScreenUV ("切换屏幕UV", Float) = 0.0

[ModuleEnd] [Vector4Split(Toggle, Hidden, Hidden, Hidden)] _ScreenUVToggles ("贴图跟随屏幕UV ## 遮罩贴图 | _ | _ | _", Vector) = (0,0,0,0)

[ModuleBegin(0)] _ModuleBegin_Stencil ("模板缓存设置", Float) = 0.0

_StencilRef ("模板参考值", Range(0, 255)) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("比较方式", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("通过运算", Float) = 0.0

[ModuleEnd] [Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("失败运算", Float) = 0.0

[ModuleBegin(0)] _ModuleBegin_Main ("主贴图设置", Float) = 0.0

_BaseMap ("主贴图", 2D) = "white" { }

[Vector4Split(Toggle, Toggle, Toggle, Toggle)] _BaseMapToggles ("主贴图开关 ## 开启预乘Alpha(禁动画中K开关) | 去黑底(禁动画中K开关) | 开启极坐标(禁动画中K开关) | 切换为2U(禁动画中K开关)", Vector) = (0,0,0,0)

_BaseColor ("整体叠色", Color) = (1,1,1,1)

_BaseFrontColor ("前面叠色", Color) = (1,1,1,1)

[Vector4Split(Range, Range, Toggle, Range)] _BaseIntensityParams ("主贴图强度参数 ## 整体强度(0, 10) | 整体Alpha强度(0, 10) | 开启双面渲染(禁动画中K开关) | 背面颜色强度(0, 10) ", Vector) = (0,1,0,0)

_DiffuseBackColor ("背面颜色", Color) = (1,1,1,1)

[ModuleEnd] [Vector4Split(Float, Float, Range, Range)] _BaseUVParams ("主贴图UV参数 ## U方向流速 | V方向流速 | 缩放(0, 10) | 旋转(0, 720)", Vector) = (0,0,1,0)

[ModuleBegin()] _ModuleBegin_Mask ("遮罩设置", Float) = 0.0

_Mask ("Mask贴图", 2D) = "white" { }

[Vector4Split(Float, Float, Range, Range)] _MaskUVParams ("遮罩UV参数 ## U方向流速 | V方向流速 | 缩放(0, 10) | 旋转(0, 720)", Vector) = (0,0,1,0)

[Vector4Split(Toggle, Range, Toggle, Toggle)] _MaskMapParams ("遮罩参数 ## 兼容纯Alpha图 | 遮罩强度(0, 10) | 开启极坐标 | 切换2U", Vector) = (0,1,0,0)

[ModuleEnd] [Vector4Split(Toggle, Hidden, Toggle, Hidden)] _MaskMapToggles ("遮罩通道开关 ## R通道不影响主贴图Alpha(禁动画中K开关) | R通道不影响混合贴图Alpha(禁动画中K开关) | G通道影响溶解(禁动画中K开关) | B通道影响抗动(禁动画中K开关)", Vector) = (0,0,0,0)

[ModuleBegin(_FALLOFF_DISSOLVE_ON)] _ModuleBegin_FalloffDissolve ("溶解设置", Float) = 0.0

_DissolveTex ("溶解噪声", 2D) = "white" { }

[Vector4Split(Float, Float, Range, Range)] _DissolveUVParams ("溶解UV参数 ## U方向流速 | V方向流速 | 缩放(0, 10) | 旋转(0, 720)", Vector) = (0,0,1,0)

[Vector4Split(UVDirection, Toggle, Range)] _DissolveConfigParams ("溶解配置参数 ## 溶解方向切换 | 溶解纹理使用2U | 溶解形状强度(0, 5)", Vector) = (0,0,1,0)

[Vector4Split(Range, Range, Range, Range)] _DissolveControlParams ("溶解控制参数 ## 溶解(-2, 2) | 溶解软硬(0, 1) | 溶解边缘(0, 2) | 溶解边缘软硬(0, 1)", Vector) = (-1,0,0,0)

_DissolveColor ("溶解边缘颜色", Color) = (1,1,1,1)

[ModuleEnd] [Ramp] _DissolveColorRampTex ("溶解边缘Ramp图", 2D) = "white" { }

[ModuleBegin(_ENABLE_VERTEX_OFFSET)] _ModuleBegin_VertexOffset ("顶点偏移设置", Float) = 0.0

_VertexOffsetNoiseMap ("顶点偏移噪声图(R通道)", 2D) = "black" { }

[Enum(Normal,0,Vertex,1)] _MotionDir ("运动方向", Float) = 0.0

_VertexDir ("顶点方向", Vector) = (0,1,0,0)

[Vector4Split(Float, Float, Range, Range)] _VertexOffsetParams ("顶点偏移参数 ## VertexScale | VertexPower | VertexScaleHeightU(0, 1) | VertexScaleHeightV(0, 1)", Vector) = (0.1,1,1,1)

[ModuleEnd] _VertexMotionSpeed ("VertexMotionSpeed", Vector) = (0,1,0,0)

[ModuleBegin(_GRADIENT_ON)] _ModuleBegin_Gradient ("渐变设置", Float) = 0.0

[Toggle] _GradientSameDiffOn ("左右渐变开启Diff相同UV(禁动画中K开关)", Float) = 0.0

[Toggle] _GradientApplyToBase ("仅作用于主图采样(MixBase/DouYin重采样不染色)", Float) = 0.0

_LeftColor ("左侧渐变色", Color) = (1,1,1,1)

_RightColor ("右侧渐变色", Color) = (1,1,1,1)

[ModuleEnd] [Vector4Split(Range, Range, Range, Range)] _GradientParams ("渐变参数 ## UV权重(0, 1) | 左侧渐变色权重(0, 1) | 右侧渐变色权重(0, 2) | 渐变色权重偏移(-1, 1)", Vector) = (0,0,1,0)

[ModuleBegin(_COLOUR_ON)] _ModuleBegin_Colour ("调色设置", Float) = 0.0

[Vector4Split(Range, Range, Range, Hidden)] _ColorGradingParams ("调色参数 ## 色相(-0.5, 0.5) | 饱和度(0, 2) | 对比度(0, 2) | _", Vector) = (0,1,1,0)

_SaturationRightColor ("灰度渐变亮色", Color) = (1,1,1,1)

_SaturationLeftColor ("灰度渐变暗色", Color) = (1,1,1,1)

_SaturationRightColorWeights ("灰度渐变亮色权重", Range(0.5, 1)) = 1.0

[Toggle] _ColourApplyToBase ("仅作用于主图采样(MixBase/DouYin重采样不染色)", Float) = 0.0

[ModuleEnd] _SaturationLeftColorWeights ("灰度渐变暗色权重", Range(0, 0.5)) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
 ZWrite Off
 Cull Off
  GpuProgramID 25486
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
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat8;
mediump vec2 u_xlat16_10;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_BaseMapToggles.w>=0.5);
#else
    u_xlatb0 = _BaseMapToggles.w>=0.5;
#endif
    u_xlat16_2.xy = (-in_TEXCOORD0.xy) + in_TEXCOORD1.xy;
    u_xlat16_10.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_10.xy = u_xlat16_10.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_10.xy + vec2(-0.5, -0.5);
    u_xlat16_10.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_10.x);
    u_xlat3.x = cos(u_xlat16_10.x);
    u_xlat16_10.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_10.x;
    u_xlat1.y = u_xlat16_10.x * u_xlat3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat8.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat8.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat8.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_MaskMapParams.w>=0.5);
#else
    u_xlatb0 = _MaskMapParams.w>=0.5;
#endif
    u_xlat16_2.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_2.xy = u_xlat16_2.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.x = _MaskUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_2.x);
    u_xlat3.x = cos(u_xlat16_2.x);
    u_xlat16_2.x = float(1.0) / _MaskUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_2.x;
    u_xlat1.y = u_xlat16_2.x * u_xlat3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _BaseFrontColor;
uniform 	mediump vec4 _DiffuseBackColor;
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
uniform 	mediump vec4 _MaskMapToggles;
uniform 	mediump float _BlendPreset;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _BaseMap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat7;
bool u_xlatb7;
bool u_xlatb8;
mediump float u_xlat16_9;
float u_xlat14;
bvec2 u_xlatb14;
float u_xlat15;
bool u_xlatb15;
mediump vec2 u_xlat16_16;
float u_xlat21;
bool u_xlatb21;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat21 = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat21 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat21 * u_xlat1.x + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat21 * u_xlat14;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb8 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb8 ? u_xlat1.x : float(0.0);
    u_xlat14 = u_xlat14 * u_xlat21 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb21 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat14 = u_xlat21 + u_xlat14;
    u_xlat21 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21<(-u_xlat21));
#else
    u_xlatb21 = u_xlat21<(-u_xlat21);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb21 = u_xlatb21 && u_xlatb1;
    u_xlat14 = (u_xlatb21) ? (-u_xlat14) : u_xlat14;
    u_xlat0.y = u_xlat14 * 0.159154937;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), _MaskMapParams.zxzx).xy;
    u_xlat16_2.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD1.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat7.xy = u_xlat0.xx * _MaskUVParams.xy;
    u_xlat1.xy = u_xlat0.xx * _BaseUVParams.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xy = fract(u_xlat7.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_2.xy;
    u_xlat0.xy = texture(_Mask, u_xlat0.xy).xw;
    u_xlat16_2.x = (u_xlatb14.y) ? u_xlat0.y : u_xlat0.x;
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * _MaskMapParams.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_9 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat0.xy = vs_TEXCOORD0.wz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat21 = u_xlat14 * u_xlat14;
    u_xlat15 = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat15 = u_xlat21 * u_xlat15 + 0.180141002;
    u_xlat15 = u_xlat21 * u_xlat15 + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat15 + 0.999866009;
    u_xlat15 = u_xlat21 * u_xlat14;
    u_xlat15 = u_xlat15 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb22 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat15 = u_xlatb22 ? u_xlat15 : float(0.0);
    u_xlat14 = u_xlat14 * u_xlat21 + u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb21 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat14 = u_xlat21 + u_xlat14;
    u_xlat21 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21<(-u_xlat21));
#else
    u_xlatb21 = u_xlat21<(-u_xlat21);
#endif
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat15>=(-u_xlat15));
#else
    u_xlatb15 = u_xlat15>=(-u_xlat15);
#endif
    u_xlatb21 = u_xlatb21 && u_xlatb15;
    u_xlat14 = (u_xlatb21) ? (-u_xlat14) : u_xlat14;
    u_xlat0.y = u_xlat14 * 0.159154937;
    u_xlatb3.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _BaseMapToggles.zyxz).xyz;
    u_xlat16_16.xy = (u_xlatb3.x) ? u_xlat0.xy : vs_TEXCOORD0.zw;
    u_xlat16_16.xy = u_xlat16_16.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xy = u_xlat1.xy + u_xlat16_16.xy;
    u_xlat16_0 = texture(_BaseMap, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_16.x = u_xlat16_0.w * u_xlat16_4.y;
    u_xlat16_0.w = (u_xlatb3.y) ? u_xlat16_16.x : u_xlat16_0.w;
    u_xlat16_5.xyz = u_xlat16_0.www * u_xlat16_4.xyz;
    u_xlat16_0.xyz = (u_xlatb3.z) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_BaseIntensityParams.z);
#else
    u_xlatb1 = 0.5<_BaseIntensityParams.z;
#endif
    u_xlat16_4.xyz = _DiffuseBackColor.xyz * _DiffuseBackColor.xyz + _BaseIntensityParams.www;
    u_xlat16_3.xyz = _BaseFrontColor.xyz * _BaseFrontColor.xyz + _BaseIntensityParams.xxx;
    u_xlat16_4.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_3.xyz : u_xlat16_4.xyz;
    u_xlat16_3.w = _BaseFrontColor.w;
    u_xlat16_4.w = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? u_xlat16_3.w : _DiffuseBackColor.w;
    u_xlat16_1 = (bool(u_xlatb1)) ? u_xlat16_4 : u_xlat16_3;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_4.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat16_0.w * _BaseColor.w;
    u_xlat16_0.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_0.w = vs_TEXCOORD3.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(u_xlat16_9);
    u_xlat16_2.w = u_xlat16_2.x * u_xlat16_0.w;
    u_xlat16_1.w = u_xlat16_0.w;
    u_xlat16_2.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(1.0<_BlendPreset);
#else
    u_xlatb6 = 1.0<_BlendPreset;
#endif
    u_xlat16_1 = (bool(u_xlatb6)) ? u_xlat16_1 : u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(_MaskMapToggles.x<0.5);
#else
    u_xlatb6 = _MaskMapToggles.x<0.5;
#endif
    u_xlat16_0 = (bool(u_xlatb6)) ? u_xlat16_1 : u_xlat16_0;
    u_xlat16_2.x = u_xlat16_0.w * _BaseIntensityParams.y + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb6 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb6){discard;}
    u_xlat6.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat16_2.x = u_xlat16_0.w * _BaseIntensityParams.y;
    SV_Target0.w = u_xlat16_2.x;
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
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat8;
mediump vec2 u_xlat16_10;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_BaseMapToggles.w>=0.5);
#else
    u_xlatb0 = _BaseMapToggles.w>=0.5;
#endif
    u_xlat16_2.xy = (-in_TEXCOORD0.xy) + in_TEXCOORD1.xy;
    u_xlat16_10.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_10.xy = u_xlat16_10.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_10.xy + vec2(-0.5, -0.5);
    u_xlat16_10.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_10.x);
    u_xlat3.x = cos(u_xlat16_10.x);
    u_xlat16_10.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_10.x;
    u_xlat1.y = u_xlat16_10.x * u_xlat3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat8.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat8.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat8.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_MaskMapParams.w>=0.5);
#else
    u_xlatb0 = _MaskMapParams.w>=0.5;
#endif
    u_xlat16_2.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_2.xy = u_xlat16_2.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.x = _MaskUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_2.x);
    u_xlat3.x = cos(u_xlat16_2.x);
    u_xlat16_2.x = float(1.0) / _MaskUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_2.x;
    u_xlat1.y = u_xlat16_2.x * u_xlat3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _BaseFrontColor;
uniform 	mediump vec4 _DiffuseBackColor;
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
uniform 	mediump vec4 _MaskMapToggles;
uniform 	mediump float _BlendPreset;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _BaseMap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat7;
bool u_xlatb7;
bool u_xlatb8;
mediump float u_xlat16_9;
float u_xlat14;
bvec2 u_xlatb14;
float u_xlat15;
bool u_xlatb15;
mediump vec2 u_xlat16_16;
float u_xlat21;
bool u_xlatb21;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat21 = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat21 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat21 * u_xlat1.x + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat21 * u_xlat14;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb8 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb8 ? u_xlat1.x : float(0.0);
    u_xlat14 = u_xlat14 * u_xlat21 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb21 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat14 = u_xlat21 + u_xlat14;
    u_xlat21 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21<(-u_xlat21));
#else
    u_xlatb21 = u_xlat21<(-u_xlat21);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb21 = u_xlatb21 && u_xlatb1;
    u_xlat14 = (u_xlatb21) ? (-u_xlat14) : u_xlat14;
    u_xlat0.y = u_xlat14 * 0.159154937;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), _MaskMapParams.zxzx).xy;
    u_xlat16_2.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD1.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat7.xy = u_xlat0.xx * _MaskUVParams.xy;
    u_xlat1.xy = u_xlat0.xx * _BaseUVParams.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xy = fract(u_xlat7.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_2.xy;
    u_xlat0.xy = texture(_Mask, u_xlat0.xy).xw;
    u_xlat16_2.x = (u_xlatb14.y) ? u_xlat0.y : u_xlat0.x;
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * _MaskMapParams.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_9 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat0.xy = vs_TEXCOORD0.wz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat21 = u_xlat14 * u_xlat14;
    u_xlat15 = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat15 = u_xlat21 * u_xlat15 + 0.180141002;
    u_xlat15 = u_xlat21 * u_xlat15 + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat15 + 0.999866009;
    u_xlat15 = u_xlat21 * u_xlat14;
    u_xlat15 = u_xlat15 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb22 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat15 = u_xlatb22 ? u_xlat15 : float(0.0);
    u_xlat14 = u_xlat14 * u_xlat21 + u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb21 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat14 = u_xlat21 + u_xlat14;
    u_xlat21 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21<(-u_xlat21));
#else
    u_xlatb21 = u_xlat21<(-u_xlat21);
#endif
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat15>=(-u_xlat15));
#else
    u_xlatb15 = u_xlat15>=(-u_xlat15);
#endif
    u_xlatb21 = u_xlatb21 && u_xlatb15;
    u_xlat14 = (u_xlatb21) ? (-u_xlat14) : u_xlat14;
    u_xlat0.y = u_xlat14 * 0.159154937;
    u_xlatb3.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _BaseMapToggles.zyxz).xyz;
    u_xlat16_16.xy = (u_xlatb3.x) ? u_xlat0.xy : vs_TEXCOORD0.zw;
    u_xlat16_16.xy = u_xlat16_16.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xy = u_xlat1.xy + u_xlat16_16.xy;
    u_xlat16_0 = texture(_BaseMap, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_16.x = u_xlat16_0.w * u_xlat16_4.y;
    u_xlat16_0.w = (u_xlatb3.y) ? u_xlat16_16.x : u_xlat16_0.w;
    u_xlat16_5.xyz = u_xlat16_0.www * u_xlat16_4.xyz;
    u_xlat16_0.xyz = (u_xlatb3.z) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_BaseIntensityParams.z);
#else
    u_xlatb1 = 0.5<_BaseIntensityParams.z;
#endif
    u_xlat16_4.xyz = _DiffuseBackColor.xyz * _DiffuseBackColor.xyz + _BaseIntensityParams.www;
    u_xlat16_3.xyz = _BaseFrontColor.xyz * _BaseFrontColor.xyz + _BaseIntensityParams.xxx;
    u_xlat16_4.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_3.xyz : u_xlat16_4.xyz;
    u_xlat16_3.w = _BaseFrontColor.w;
    u_xlat16_4.w = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? u_xlat16_3.w : _DiffuseBackColor.w;
    u_xlat16_1 = (bool(u_xlatb1)) ? u_xlat16_4 : u_xlat16_3;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_4.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat16_0.w * _BaseColor.w;
    u_xlat16_0.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_0.w = vs_TEXCOORD3.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(u_xlat16_9);
    u_xlat16_2.w = u_xlat16_2.x * u_xlat16_0.w;
    u_xlat16_1.w = u_xlat16_0.w;
    u_xlat16_2.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(1.0<_BlendPreset);
#else
    u_xlatb6 = 1.0<_BlendPreset;
#endif
    u_xlat16_1 = (bool(u_xlatb6)) ? u_xlat16_1 : u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(_MaskMapToggles.x<0.5);
#else
    u_xlatb6 = _MaskMapToggles.x<0.5;
#endif
    u_xlat16_0 = (bool(u_xlatb6)) ? u_xlat16_1 : u_xlat16_0;
    u_xlat16_2.x = u_xlat16_0.w * _BaseIntensityParams.y + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb6 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb6){discard;}
    u_xlat6.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat16_2.x = u_xlat16_0.w * _BaseIntensityParams.y;
    SV_Target0.w = u_xlat16_2.x;
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

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec4 in_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat8;
mediump vec2 u_xlat16_10;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb0 = _BaseMapToggles.w>=0.5;
    u_xlat16_2.xy = (-in_TEXCOORD0.xy) + in_TEXCOORD1.xy;
    u_xlat16_10.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_10.xy = u_xlat16_10.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_10.xy + vec2(-0.5, -0.5);
    u_xlat16_10.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_10.x);
    u_xlat3.x = cos(u_xlat16_10.x);
    u_xlat16_10.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_10.x;
    u_xlat1.y = u_xlat16_10.x * u_xlat3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat8.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat8.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat8.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb0 = _MaskMapParams.w>=0.5;
    u_xlat16_2.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_2.xy = u_xlat16_2.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.x = _MaskUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_2.x);
    u_xlat3.x = cos(u_xlat16_2.x);
    u_xlat16_2.x = float(1.0) / _MaskUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_2.x;
    u_xlat1.y = u_xlat16_2.x * u_xlat3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseFrontColor;
uniform 	mediump vec4 _DiffuseBackColor;
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
uniform 	mediump vec4 _MaskMapToggles;
uniform 	mediump float _BlendPreset;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _BaseMap;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat7;
bool u_xlatb7;
bool u_xlatb8;
mediump float u_xlat16_9;
float u_xlat14;
bvec2 u_xlatb14;
float u_xlat15;
bool u_xlatb15;
mediump vec2 u_xlat16_16;
float u_xlat21;
bool u_xlatb21;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat21 = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat21 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat21 * u_xlat1.x + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat21 * u_xlat14;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb8 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb8 ? u_xlat1.x : float(0.0);
    u_xlat14 = u_xlat14 * u_xlat21 + u_xlat1.x;
    u_xlatb21 = u_xlat0.y<(-u_xlat0.y);
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat14 = u_xlat21 + u_xlat14;
    u_xlat21 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb21 = u_xlat21<(-u_xlat21);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb21 = u_xlatb21 && u_xlatb1;
    u_xlat14 = (u_xlatb21) ? (-u_xlat14) : u_xlat14;
    u_xlat0.y = u_xlat14 * 0.159154937;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), _MaskMapParams.zxzx).xy;
    u_xlat16_2.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD1.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat7.xy = u_xlat0.xx * _MaskUVParams.xy;
    u_xlat1.xy = u_xlat0.xx * _BaseUVParams.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xy = fract(u_xlat7.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_2.xy;
    u_xlat0.xy = texture2D(_Mask, u_xlat0.xy).xw;
    u_xlat16_2.x = (u_xlatb14.y) ? u_xlat0.y : u_xlat0.x;
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * _MaskMapParams.y;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_9 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat0.xy = vs_TEXCOORD0.wz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat21 = u_xlat14 * u_xlat14;
    u_xlat15 = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat15 = u_xlat21 * u_xlat15 + 0.180141002;
    u_xlat15 = u_xlat21 * u_xlat15 + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat15 + 0.999866009;
    u_xlat15 = u_xlat21 * u_xlat14;
    u_xlat15 = u_xlat15 * -2.0 + 1.57079637;
    u_xlatb22 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat15 = u_xlatb22 ? u_xlat15 : float(0.0);
    u_xlat14 = u_xlat14 * u_xlat21 + u_xlat15;
    u_xlatb21 = u_xlat0.y<(-u_xlat0.y);
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat14 = u_xlat21 + u_xlat14;
    u_xlat21 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb21 = u_xlat21<(-u_xlat21);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb15 = u_xlat15>=(-u_xlat15);
    u_xlatb21 = u_xlatb21 && u_xlatb15;
    u_xlat14 = (u_xlatb21) ? (-u_xlat14) : u_xlat14;
    u_xlat0.y = u_xlat14 * 0.159154937;
    u_xlatb3.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _BaseMapToggles.zyxz).xyz;
    u_xlat16_16.xy = (u_xlatb3.x) ? u_xlat0.xy : vs_TEXCOORD0.zw;
    u_xlat16_16.xy = u_xlat16_16.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xy = u_xlat1.xy + u_xlat16_16.xy;
    u_xlat10_0 = texture2D(_BaseMap, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz;
    u_xlat16_16.x = u_xlat10_0.w * u_xlat16_4.y;
    u_xlat16_0.w = (u_xlatb3.y) ? u_xlat16_16.x : u_xlat10_0.w;
    u_xlat16_5.xyz = u_xlat16_0.www * u_xlat16_4.xyz;
    u_xlat16_0.xyz = (u_xlatb3.z) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlatb1 = 0.5<_BaseIntensityParams.z;
    u_xlat16_4.xyz = _DiffuseBackColor.xyz * _DiffuseBackColor.xyz + _BaseIntensityParams.www;
    u_xlat16_3.xyz = _BaseFrontColor.xyz * _BaseFrontColor.xyz + _BaseIntensityParams.xxx;
    u_xlat16_4.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat16_3.xyz : u_xlat16_4.xyz;
    u_xlat16_3.w = _BaseFrontColor.w;
    u_xlat16_4.w = ((gl_FrontFacing ? 1 : 0) != 0) ? u_xlat16_3.w : _DiffuseBackColor.w;
    u_xlat16_1 = (bool(u_xlatb1)) ? u_xlat16_4 : u_xlat16_3;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_4.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat16_0.w * _BaseColor.w;
    u_xlat16_0.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_0.w = vs_TEXCOORD3.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(u_xlat16_9);
    u_xlat16_2.w = u_xlat16_2.x * u_xlat16_0.w;
    u_xlat16_1.w = u_xlat16_0.w;
    u_xlat16_2.xyz = u_xlat16_0.xyz;
    u_xlatb6 = 1.0<_BlendPreset;
    u_xlat16_1 = (bool(u_xlatb6)) ? u_xlat16_1 : u_xlat16_2;
    u_xlatb6 = _MaskMapToggles.x<0.5;
    u_xlat16_0 = (bool(u_xlatb6)) ? u_xlat16_1 : u_xlat16_0;
    u_xlat16_2.x = u_xlat16_0.w * _BaseIntensityParams.y + (-_Cutoff);
    u_xlatb6 = u_xlat16_2.x<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat16_2.x = u_xlat16_0.w * _BaseIntensityParams.y;
    SV_Target0.w = u_xlat16_2.x;
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

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec4 in_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat8;
mediump vec2 u_xlat16_10;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb0 = _BaseMapToggles.w>=0.5;
    u_xlat16_2.xy = (-in_TEXCOORD0.xy) + in_TEXCOORD1.xy;
    u_xlat16_10.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_10.xy = u_xlat16_10.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_10.xy + vec2(-0.5, -0.5);
    u_xlat16_10.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_10.x);
    u_xlat3.x = cos(u_xlat16_10.x);
    u_xlat16_10.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_10.x;
    u_xlat1.y = u_xlat16_10.x * u_xlat3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat8.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat8.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat8.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb0 = _MaskMapParams.w>=0.5;
    u_xlat16_2.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_2.xy = u_xlat16_2.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.x = _MaskUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_2.x);
    u_xlat3.x = cos(u_xlat16_2.x);
    u_xlat16_2.x = float(1.0) / _MaskUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_2.x;
    u_xlat1.y = u_xlat16_2.x * u_xlat3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseFrontColor;
uniform 	mediump vec4 _DiffuseBackColor;
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
uniform 	mediump vec4 _MaskMapToggles;
uniform 	mediump float _BlendPreset;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _BaseMap;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec3 u_xlatb3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat7;
bool u_xlatb7;
bool u_xlatb8;
mediump float u_xlat16_9;
float u_xlat14;
bvec2 u_xlatb14;
float u_xlat15;
bool u_xlatb15;
mediump vec2 u_xlat16_16;
float u_xlat21;
bool u_xlatb21;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat21 = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat21 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat21 * u_xlat1.x + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat21 * u_xlat14;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb8 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb8 ? u_xlat1.x : float(0.0);
    u_xlat14 = u_xlat14 * u_xlat21 + u_xlat1.x;
    u_xlatb21 = u_xlat0.y<(-u_xlat0.y);
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat14 = u_xlat21 + u_xlat14;
    u_xlat21 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb21 = u_xlat21<(-u_xlat21);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb21 = u_xlatb21 && u_xlatb1;
    u_xlat14 = (u_xlatb21) ? (-u_xlat14) : u_xlat14;
    u_xlat0.y = u_xlat14 * 0.159154937;
    u_xlatb14.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), _MaskMapParams.zxzx).xy;
    u_xlat16_2.xy = (u_xlatb14.x) ? u_xlat0.xy : vs_TEXCOORD1.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb7 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb7) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat7.xy = u_xlat0.xx * _MaskUVParams.xy;
    u_xlat1.xy = u_xlat0.xx * _BaseUVParams.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xy = fract(u_xlat7.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_2.xy;
    u_xlat0.xy = texture2D(_Mask, u_xlat0.xy).xw;
    u_xlat16_2.x = (u_xlatb14.y) ? u_xlat0.y : u_xlat0.x;
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * _MaskMapParams.y;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_9 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat0.xy = vs_TEXCOORD0.wz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat21 = u_xlat14 * u_xlat14;
    u_xlat15 = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat15 = u_xlat21 * u_xlat15 + 0.180141002;
    u_xlat15 = u_xlat21 * u_xlat15 + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat15 + 0.999866009;
    u_xlat15 = u_xlat21 * u_xlat14;
    u_xlat15 = u_xlat15 * -2.0 + 1.57079637;
    u_xlatb22 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat15 = u_xlatb22 ? u_xlat15 : float(0.0);
    u_xlat14 = u_xlat14 * u_xlat21 + u_xlat15;
    u_xlatb21 = u_xlat0.y<(-u_xlat0.y);
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat14 = u_xlat21 + u_xlat14;
    u_xlat21 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb21 = u_xlat21<(-u_xlat21);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb15 = u_xlat15>=(-u_xlat15);
    u_xlatb21 = u_xlatb21 && u_xlatb15;
    u_xlat14 = (u_xlatb21) ? (-u_xlat14) : u_xlat14;
    u_xlat0.y = u_xlat14 * 0.159154937;
    u_xlatb3.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _BaseMapToggles.zyxz).xyz;
    u_xlat16_16.xy = (u_xlatb3.x) ? u_xlat0.xy : vs_TEXCOORD0.zw;
    u_xlat16_16.xy = u_xlat16_16.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xy = u_xlat1.xy + u_xlat16_16.xy;
    u_xlat10_0 = texture2D(_BaseMap, u_xlat0.xy);
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz;
    u_xlat16_16.x = u_xlat10_0.w * u_xlat16_4.y;
    u_xlat16_0.w = (u_xlatb3.y) ? u_xlat16_16.x : u_xlat10_0.w;
    u_xlat16_5.xyz = u_xlat16_0.www * u_xlat16_4.xyz;
    u_xlat16_0.xyz = (u_xlatb3.z) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlatb1 = 0.5<_BaseIntensityParams.z;
    u_xlat16_4.xyz = _DiffuseBackColor.xyz * _DiffuseBackColor.xyz + _BaseIntensityParams.www;
    u_xlat16_3.xyz = _BaseFrontColor.xyz * _BaseFrontColor.xyz + _BaseIntensityParams.xxx;
    u_xlat16_4.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat16_3.xyz : u_xlat16_4.xyz;
    u_xlat16_3.w = _BaseFrontColor.w;
    u_xlat16_4.w = ((gl_FrontFacing ? 1 : 0) != 0) ? u_xlat16_3.w : _DiffuseBackColor.w;
    u_xlat16_1 = (bool(u_xlatb1)) ? u_xlat16_4 : u_xlat16_3;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_4.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_1.w = u_xlat16_0.w * _BaseColor.w;
    u_xlat16_0.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_0.w = vs_TEXCOORD3.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(u_xlat16_9);
    u_xlat16_2.w = u_xlat16_2.x * u_xlat16_0.w;
    u_xlat16_1.w = u_xlat16_0.w;
    u_xlat16_2.xyz = u_xlat16_0.xyz;
    u_xlatb6 = 1.0<_BlendPreset;
    u_xlat16_1 = (bool(u_xlatb6)) ? u_xlat16_1 : u_xlat16_2;
    u_xlatb6 = _MaskMapToggles.x<0.5;
    u_xlat16_0 = (bool(u_xlatb6)) ? u_xlat16_1 : u_xlat16_0;
    u_xlat16_2.x = u_xlat16_0.w * _BaseIntensityParams.y + (-_Cutoff);
    u_xlatb6 = u_xlat16_2.x<0.0;
    if(u_xlatb6){discard;}
    u_xlat6.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat16_2.x = u_xlat16_0.w * _BaseIntensityParams.y;
    SV_Target0.w = u_xlat16_2.x;
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
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat8;
mediump vec2 u_xlat16_10;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_BaseMapToggles.w>=0.5);
#else
    u_xlatb0 = _BaseMapToggles.w>=0.5;
#endif
    u_xlat16_2.xy = (-in_TEXCOORD0.xy) + in_TEXCOORD1.xy;
    u_xlat16_10.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_10.xy = u_xlat16_10.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_10.xy + vec2(-0.5, -0.5);
    u_xlat16_10.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_10.x);
    u_xlat3.x = cos(u_xlat16_10.x);
    u_xlat16_10.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_10.x;
    u_xlat1.y = u_xlat16_10.x * u_xlat3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat8.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat8.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat8.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_MaskMapParams.w>=0.5);
#else
    u_xlatb0 = _MaskMapParams.w>=0.5;
#endif
    u_xlat16_2.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_2.xy = u_xlat16_2.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.x = _MaskUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_2.x);
    u_xlat3.x = cos(u_xlat16_2.x);
    u_xlat16_2.x = float(1.0) / _MaskUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_2.x;
    u_xlat1.y = u_xlat16_2.x * u_xlat3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _BaseFrontColor;
uniform 	mediump vec4 _DiffuseBackColor;
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
uniform 	mediump vec4 _MaskMapToggles;
uniform 	mediump float _BlendPreset;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _BaseMap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
bool u_xlatb5;
vec2 u_xlat6;
bool u_xlatb6;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
float u_xlat12;
bvec2 u_xlatb12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
bool u_xlatb18;
bool u_xlatb19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat18 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat18 * u_xlat1.x + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat18 * u_xlat12;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb7 ? u_xlat1.x : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat18 + u_xlat12;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18<(-u_xlat18));
#else
    u_xlatb18 = u_xlat18<(-u_xlat18);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb1;
    u_xlat12 = (u_xlatb18) ? (-u_xlat12) : u_xlat12;
    u_xlat0.y = u_xlat12 * 0.159154937;
    u_xlatb12.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), _MaskMapParams.zxzx).xy;
    u_xlat16_2.xy = (u_xlatb12.x) ? u_xlat0.xy : vs_TEXCOORD1.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb6 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat6.xy = u_xlat0.xx * _MaskUVParams.xy;
    u_xlat1.xy = u_xlat0.xx * _BaseUVParams.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xy = fract(u_xlat6.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_2.xy;
    u_xlat0.xy = texture(_Mask, u_xlat0.xy).xw;
    u_xlat16_2.x = (u_xlatb12.y) ? u_xlat0.y : u_xlat0.x;
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * _MaskMapParams.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat0.xy = vs_TEXCOORD0.wz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat18 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat18 * u_xlat13 + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat18 * u_xlat12;
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb19 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat13 = u_xlatb19 ? u_xlat13 : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat18 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat18 + u_xlat12;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18<(-u_xlat18));
#else
    u_xlatb18 = u_xlat18<(-u_xlat18);
#endif
    u_xlat13 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13>=(-u_xlat13));
#else
    u_xlatb13 = u_xlat13>=(-u_xlat13);
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb13;
    u_xlat12 = (u_xlatb18) ? (-u_xlat12) : u_xlat12;
    u_xlat0.y = u_xlat12 * 0.159154937;
    u_xlatb12.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), _BaseMapToggles.zyzy).xy;
    u_xlat16_8.xy = (u_xlatb12.x) ? u_xlat0.xy : vs_TEXCOORD0.zw;
    u_xlat16_8.xy = u_xlat16_8.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xy = u_xlat1.xy + u_xlat16_8.xy;
    u_xlat16_1 = texture(_BaseMap, u_xlat0.xy);
    u_xlat16_8.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_8.x = u_xlat16_1.w * u_xlat16_3.y;
    u_xlat16_3.w = (u_xlatb12.y) ? u_xlat16_8.x : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_BaseIntensityParams.z);
#else
    u_xlatb0 = 0.5<_BaseIntensityParams.z;
#endif
    u_xlat16_8.xyz = _DiffuseBackColor.xyz * _DiffuseBackColor.xyz + _BaseIntensityParams.www;
    u_xlat16_1.xyz = _BaseFrontColor.xyz * _BaseFrontColor.xyz + _BaseIntensityParams.xxx;
    u_xlat16_4.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_1.xyz : u_xlat16_8.xyz;
    u_xlat16_1.w = _BaseFrontColor.w;
    u_xlat16_4.w = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? u_xlat16_1.w : _DiffuseBackColor.w;
    u_xlat16_0 = (bool(u_xlatb0)) ? u_xlat16_4 : u_xlat16_1;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_3;
    u_xlat16_8.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_8.xyz;
    u_xlat16_1.w = u_xlat16_0.w * _BaseColor.w;
    u_xlat16_0.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_0.w = vs_TEXCOORD3.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_2.xxxx * u_xlat16_0;
    u_xlat16_2.xyz = u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_0.w;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(1.0<_BlendPreset);
#else
    u_xlatb5 = 1.0<_BlendPreset;
#endif
    u_xlat16_1 = (bool(u_xlatb5)) ? u_xlat16_2 : u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_MaskMapToggles.x<0.5);
#else
    u_xlatb5 = _MaskMapToggles.x<0.5;
#endif
    u_xlat16_0 = (bool(u_xlatb5)) ? u_xlat16_1 : u_xlat16_0;
    u_xlat16_2.x = u_xlat16_0.w * _BaseIntensityParams.y + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb5 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb5){discard;}
    u_xlat16_2.x = u_xlat16_0.w * _BaseIntensityParams.y;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_2.x;
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
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat8;
mediump vec2 u_xlat16_10;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_BaseMapToggles.w>=0.5);
#else
    u_xlatb0 = _BaseMapToggles.w>=0.5;
#endif
    u_xlat16_2.xy = (-in_TEXCOORD0.xy) + in_TEXCOORD1.xy;
    u_xlat16_10.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_10.xy = u_xlat16_10.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_10.xy + vec2(-0.5, -0.5);
    u_xlat16_10.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_10.x);
    u_xlat3.x = cos(u_xlat16_10.x);
    u_xlat16_10.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_10.x;
    u_xlat1.y = u_xlat16_10.x * u_xlat3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat8.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat8.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat8.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_MaskMapParams.w>=0.5);
#else
    u_xlatb0 = _MaskMapParams.w>=0.5;
#endif
    u_xlat16_2.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_2.xy = u_xlat16_2.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.x = _MaskUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_2.x);
    u_xlat3.x = cos(u_xlat16_2.x);
    u_xlat16_2.x = float(1.0) / _MaskUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_2.x;
    u_xlat1.y = u_xlat16_2.x * u_xlat3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _BaseFrontColor;
uniform 	mediump vec4 _DiffuseBackColor;
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
uniform 	mediump vec4 _MaskMapToggles;
uniform 	mediump float _BlendPreset;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _BaseMap;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
bool u_xlatb5;
vec2 u_xlat6;
bool u_xlatb6;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
float u_xlat12;
bvec2 u_xlatb12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
bool u_xlatb18;
bool u_xlatb19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat18 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat18 * u_xlat1.x + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat18 * u_xlat12;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb7 ? u_xlat1.x : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat18 + u_xlat12;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18<(-u_xlat18));
#else
    u_xlatb18 = u_xlat18<(-u_xlat18);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb1;
    u_xlat12 = (u_xlatb18) ? (-u_xlat12) : u_xlat12;
    u_xlat0.y = u_xlat12 * 0.159154937;
    u_xlatb12.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), _MaskMapParams.zxzx).xy;
    u_xlat16_2.xy = (u_xlatb12.x) ? u_xlat0.xy : vs_TEXCOORD1.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb6 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat6.xy = u_xlat0.xx * _MaskUVParams.xy;
    u_xlat1.xy = u_xlat0.xx * _BaseUVParams.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xy = fract(u_xlat6.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_2.xy;
    u_xlat0.xy = texture(_Mask, u_xlat0.xy).xw;
    u_xlat16_2.x = (u_xlatb12.y) ? u_xlat0.y : u_xlat0.x;
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * _MaskMapParams.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat0.xy = vs_TEXCOORD0.wz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat18 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat18 * u_xlat13 + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat18 * u_xlat12;
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb19 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat13 = u_xlatb19 ? u_xlat13 : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat18 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat18 + u_xlat12;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18<(-u_xlat18));
#else
    u_xlatb18 = u_xlat18<(-u_xlat18);
#endif
    u_xlat13 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13>=(-u_xlat13));
#else
    u_xlatb13 = u_xlat13>=(-u_xlat13);
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb13;
    u_xlat12 = (u_xlatb18) ? (-u_xlat12) : u_xlat12;
    u_xlat0.y = u_xlat12 * 0.159154937;
    u_xlatb12.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), _BaseMapToggles.zyzy).xy;
    u_xlat16_8.xy = (u_xlatb12.x) ? u_xlat0.xy : vs_TEXCOORD0.zw;
    u_xlat16_8.xy = u_xlat16_8.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xy = u_xlat1.xy + u_xlat16_8.xy;
    u_xlat16_1 = texture(_BaseMap, u_xlat0.xy);
    u_xlat16_8.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlat16_8.x = u_xlat16_1.w * u_xlat16_3.y;
    u_xlat16_3.w = (u_xlatb12.y) ? u_xlat16_8.x : u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_BaseIntensityParams.z);
#else
    u_xlatb0 = 0.5<_BaseIntensityParams.z;
#endif
    u_xlat16_8.xyz = _DiffuseBackColor.xyz * _DiffuseBackColor.xyz + _BaseIntensityParams.www;
    u_xlat16_1.xyz = _BaseFrontColor.xyz * _BaseFrontColor.xyz + _BaseIntensityParams.xxx;
    u_xlat16_4.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? u_xlat16_1.xyz : u_xlat16_8.xyz;
    u_xlat16_1.w = _BaseFrontColor.w;
    u_xlat16_4.w = ((gl_FrontFacing ? 0xffffffffu : uint(0)) != uint(0)) ? u_xlat16_1.w : _DiffuseBackColor.w;
    u_xlat16_0 = (bool(u_xlatb0)) ? u_xlat16_4 : u_xlat16_1;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_3;
    u_xlat16_8.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_8.xyz;
    u_xlat16_1.w = u_xlat16_0.w * _BaseColor.w;
    u_xlat16_0.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_0.w = vs_TEXCOORD3.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_2.xxxx * u_xlat16_0;
    u_xlat16_2.xyz = u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_0.w;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(1.0<_BlendPreset);
#else
    u_xlatb5 = 1.0<_BlendPreset;
#endif
    u_xlat16_1 = (bool(u_xlatb5)) ? u_xlat16_2 : u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_MaskMapToggles.x<0.5);
#else
    u_xlatb5 = _MaskMapToggles.x<0.5;
#endif
    u_xlat16_0 = (bool(u_xlatb5)) ? u_xlat16_1 : u_xlat16_0;
    u_xlat16_2.x = u_xlat16_0.w * _BaseIntensityParams.y + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb5 = u_xlat16_2.x<0.0;
#endif
    if(u_xlatb5){discard;}
    u_xlat16_2.x = u_xlat16_0.w * _BaseIntensityParams.y;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec4 in_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat8;
mediump vec2 u_xlat16_10;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb0 = _BaseMapToggles.w>=0.5;
    u_xlat16_2.xy = (-in_TEXCOORD0.xy) + in_TEXCOORD1.xy;
    u_xlat16_10.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_10.xy = u_xlat16_10.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_10.xy + vec2(-0.5, -0.5);
    u_xlat16_10.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_10.x);
    u_xlat3.x = cos(u_xlat16_10.x);
    u_xlat16_10.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_10.x;
    u_xlat1.y = u_xlat16_10.x * u_xlat3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat8.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat8.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat8.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb0 = _MaskMapParams.w>=0.5;
    u_xlat16_2.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_2.xy = u_xlat16_2.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.x = _MaskUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_2.x);
    u_xlat3.x = cos(u_xlat16_2.x);
    u_xlat16_2.x = float(1.0) / _MaskUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_2.x;
    u_xlat1.y = u_xlat16_2.x * u_xlat3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseFrontColor;
uniform 	mediump vec4 _DiffuseBackColor;
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
uniform 	mediump vec4 _MaskMapToggles;
uniform 	mediump float _BlendPreset;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _BaseMap;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
bool u_xlatb5;
vec2 u_xlat6;
bool u_xlatb6;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
float u_xlat12;
bvec2 u_xlatb12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
bool u_xlatb18;
bool u_xlatb19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat18 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat18 * u_xlat1.x + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat18 * u_xlat12;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb7 ? u_xlat1.x : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat18 + u_xlat1.x;
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat18 + u_xlat12;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb18 = u_xlat18<(-u_xlat18);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb18 = u_xlatb18 && u_xlatb1;
    u_xlat12 = (u_xlatb18) ? (-u_xlat12) : u_xlat12;
    u_xlat0.y = u_xlat12 * 0.159154937;
    u_xlatb12.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), _MaskMapParams.zxzx).xy;
    u_xlat16_2.xy = (u_xlatb12.x) ? u_xlat0.xy : vs_TEXCOORD1.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb6 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat6.xy = u_xlat0.xx * _MaskUVParams.xy;
    u_xlat1.xy = u_xlat0.xx * _BaseUVParams.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xy = fract(u_xlat6.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_2.xy;
    u_xlat0.xy = texture2D(_Mask, u_xlat0.xy).xw;
    u_xlat16_2.x = (u_xlatb12.y) ? u_xlat0.y : u_xlat0.x;
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * _MaskMapParams.y;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat0.xy = vs_TEXCOORD0.wz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat18 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat18 * u_xlat13 + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat18 * u_xlat12;
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlatb19 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat13 = u_xlatb19 ? u_xlat13 : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat18 + u_xlat13;
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat18 + u_xlat12;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb18 = u_xlat18<(-u_xlat18);
    u_xlat13 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb13 = u_xlat13>=(-u_xlat13);
    u_xlatb18 = u_xlatb18 && u_xlatb13;
    u_xlat12 = (u_xlatb18) ? (-u_xlat12) : u_xlat12;
    u_xlat0.y = u_xlat12 * 0.159154937;
    u_xlatb12.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), _BaseMapToggles.zyzy).xy;
    u_xlat16_8.xy = (u_xlatb12.x) ? u_xlat0.xy : vs_TEXCOORD0.zw;
    u_xlat16_8.xy = u_xlat16_8.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xy = u_xlat1.xy + u_xlat16_8.xy;
    u_xlat10_1 = texture2D(_BaseMap, u_xlat0.xy);
    u_xlat16_8.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat10_1.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_1.xyz * u_xlat16_8.xyz;
    u_xlat16_8.x = u_xlat10_1.w * u_xlat16_3.y;
    u_xlat16_3.w = (u_xlatb12.y) ? u_xlat16_8.x : u_xlat10_1.w;
    u_xlatb0 = 0.5<_BaseIntensityParams.z;
    u_xlat16_8.xyz = _DiffuseBackColor.xyz * _DiffuseBackColor.xyz + _BaseIntensityParams.www;
    u_xlat16_1.xyz = _BaseFrontColor.xyz * _BaseFrontColor.xyz + _BaseIntensityParams.xxx;
    u_xlat16_4.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat16_1.xyz : u_xlat16_8.xyz;
    u_xlat16_1.w = _BaseFrontColor.w;
    u_xlat16_4.w = ((gl_FrontFacing ? 1 : 0) != 0) ? u_xlat16_1.w : _DiffuseBackColor.w;
    u_xlat16_0 = (bool(u_xlatb0)) ? u_xlat16_4 : u_xlat16_1;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_3;
    u_xlat16_8.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_8.xyz;
    u_xlat16_1.w = u_xlat16_0.w * _BaseColor.w;
    u_xlat16_0.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_0.w = vs_TEXCOORD3.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_2.xxxx * u_xlat16_0;
    u_xlat16_2.xyz = u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_0.w;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
    u_xlatb5 = 1.0<_BlendPreset;
    u_xlat16_1 = (bool(u_xlatb5)) ? u_xlat16_2 : u_xlat16_1;
    u_xlatb5 = _MaskMapToggles.x<0.5;
    u_xlat16_0 = (bool(u_xlatb5)) ? u_xlat16_1 : u_xlat16_0;
    u_xlat16_2.x = u_xlat16_0.w * _BaseIntensityParams.y + (-_Cutoff);
    u_xlatb5 = u_xlat16_2.x<0.0;
    if(u_xlatb5){discard;}
    u_xlat16_2.x = u_xlat16_0.w * _BaseIntensityParams.y;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec4 in_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
vec2 u_xlat3;
vec2 u_xlat8;
mediump vec2 u_xlat16_10;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb0 = _BaseMapToggles.w>=0.5;
    u_xlat16_2.xy = (-in_TEXCOORD0.xy) + in_TEXCOORD1.xy;
    u_xlat16_10.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_10.xy = u_xlat16_10.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_10.xy + vec2(-0.5, -0.5);
    u_xlat16_10.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_10.x);
    u_xlat3.x = cos(u_xlat16_10.x);
    u_xlat16_10.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_10.x;
    u_xlat1.y = u_xlat16_10.x * u_xlat3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat8.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat8.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat8.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb0 = _MaskMapParams.w>=0.5;
    u_xlat16_2.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_2.xy = u_xlat16_2.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.x = _MaskUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_2.x);
    u_xlat3.x = cos(u_xlat16_2.x);
    u_xlat16_2.x = float(1.0) / _MaskUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_2.x;
    u_xlat1.y = u_xlat16_2.x * u_xlat3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat3.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat3.xy + vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseFrontColor;
uniform 	mediump vec4 _DiffuseBackColor;
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
uniform 	mediump vec4 _MaskMapToggles;
uniform 	mediump float _BlendPreset;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _BaseMap;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
bool u_xlatb5;
vec2 u_xlat6;
bool u_xlatb6;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
float u_xlat12;
bvec2 u_xlatb12;
float u_xlat13;
bool u_xlatb13;
float u_xlat18;
bool u_xlatb18;
bool u_xlatb19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat18 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat18 * u_xlat1.x + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat18 * u_xlat12;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb7 ? u_xlat1.x : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat18 + u_xlat1.x;
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat18 + u_xlat12;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb18 = u_xlat18<(-u_xlat18);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb18 = u_xlatb18 && u_xlatb1;
    u_xlat12 = (u_xlatb18) ? (-u_xlat12) : u_xlat12;
    u_xlat0.y = u_xlat12 * 0.159154937;
    u_xlatb12.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), _MaskMapParams.zxzx).xy;
    u_xlat16_2.xy = (u_xlatb12.x) ? u_xlat0.xy : vs_TEXCOORD1.xy;
    u_xlat16_2.xy = u_xlat16_2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb6 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat6.xy = u_xlat0.xx * _MaskUVParams.xy;
    u_xlat1.xy = u_xlat0.xx * _BaseUVParams.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat0.xy = fract(u_xlat6.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_2.xy;
    u_xlat0.xy = texture2D(_Mask, u_xlat0.xy).xw;
    u_xlat16_2.x = (u_xlatb12.y) ? u_xlat0.y : u_xlat0.x;
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * _MaskMapParams.y;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    u_xlat0.xy = vs_TEXCOORD0.wz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat12 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat18 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat18 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat18 * u_xlat13 + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat18 * u_xlat12;
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlatb19 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat13 = u_xlatb19 ? u_xlat13 : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat18 + u_xlat13;
    u_xlatb18 = u_xlat0.y<(-u_xlat0.y);
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat18 + u_xlat12;
    u_xlat18 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb18 = u_xlat18<(-u_xlat18);
    u_xlat13 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb13 = u_xlat13>=(-u_xlat13);
    u_xlatb18 = u_xlatb18 && u_xlatb13;
    u_xlat12 = (u_xlatb18) ? (-u_xlat12) : u_xlat12;
    u_xlat0.y = u_xlat12 * 0.159154937;
    u_xlatb12.xy = lessThan(vec4(0.5, 0.5, 0.5, 0.5), _BaseMapToggles.zyzy).xy;
    u_xlat16_8.xy = (u_xlatb12.x) ? u_xlat0.xy : vs_TEXCOORD0.zw;
    u_xlat16_8.xy = u_xlat16_8.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat0.xy = u_xlat1.xy + u_xlat16_8.xy;
    u_xlat10_1 = texture2D(_BaseMap, u_xlat0.xy);
    u_xlat16_8.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat10_1.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_1.xyz * u_xlat16_8.xyz;
    u_xlat16_8.x = u_xlat10_1.w * u_xlat16_3.y;
    u_xlat16_3.w = (u_xlatb12.y) ? u_xlat16_8.x : u_xlat10_1.w;
    u_xlatb0 = 0.5<_BaseIntensityParams.z;
    u_xlat16_8.xyz = _DiffuseBackColor.xyz * _DiffuseBackColor.xyz + _BaseIntensityParams.www;
    u_xlat16_1.xyz = _BaseFrontColor.xyz * _BaseFrontColor.xyz + _BaseIntensityParams.xxx;
    u_xlat16_4.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? u_xlat16_1.xyz : u_xlat16_8.xyz;
    u_xlat16_1.w = _BaseFrontColor.w;
    u_xlat16_4.w = ((gl_FrontFacing ? 1 : 0) != 0) ? u_xlat16_1.w : _DiffuseBackColor.w;
    u_xlat16_0 = (bool(u_xlatb0)) ? u_xlat16_4 : u_xlat16_1;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_3;
    u_xlat16_8.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_8.xyz;
    u_xlat16_1.w = u_xlat16_0.w * _BaseColor.w;
    u_xlat16_0.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_0.w = vs_TEXCOORD3.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_2.xxxx * u_xlat16_0;
    u_xlat16_2.xyz = u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_0.w;
    u_xlat16_1.xyz = u_xlat16_0.xyz;
    u_xlatb5 = 1.0<_BlendPreset;
    u_xlat16_1 = (bool(u_xlatb5)) ? u_xlat16_2 : u_xlat16_1;
    u_xlatb5 = _MaskMapToggles.x<0.5;
    u_xlat16_0 = (bool(u_xlatb5)) ? u_xlat16_1 : u_xlat16_0;
    u_xlat16_2.x = u_xlat16_0.w * _BaseIntensityParams.y + (-_Cutoff);
    u_xlatb5 = u_xlat16_2.x<0.0;
    if(u_xlatb5){discard;}
    u_xlat16_2.x = u_xlat16_0.w * _BaseIntensityParams.y;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_2.x;
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
 Pass {
 Name "ShadowCaster"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
 Cull Off
  GpuProgramID 101016
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" }
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
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
vec2 u_xlat8;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_BaseMapToggles.w>=0.5);
#else
    u_xlatb0 = _BaseMapToggles.w>=0.5;
#endif
    u_xlat16_2.xy = (-in_TEXCOORD0.xy) + in_TEXCOORD1.xy;
    u_xlat16_2.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_2.xy = u_xlat16_2.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_2.x);
    u_xlat3 = cos(u_xlat16_2.x);
    u_xlat16_2.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_2.x;
    u_xlat1.y = u_xlat16_2.x * u_xlat3;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat8.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat8.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat8.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
uniform 	mediump vec4 _MaskMapToggles;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
bool u_xlatb0;
vec2 u_xlat1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec2 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec2 u_xlatb4;
bool u_xlatb5;
mediump vec2 u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4.x = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb4.x = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb4.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlatb4.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _BaseMapToggles.zyzz).xy;
    u_xlat1.xy = vs_TEXCOORD0.wz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat2.x = sqrt(u_xlat12);
    u_xlat12 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat9 = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat12 = u_xlat12 * u_xlat9;
    u_xlat9 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat9 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat9 * u_xlat13 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat12 * u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
    u_xlatb10 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlat13 = u_xlatb10 ? u_xlat13 : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat9 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat1.y<(-u_xlat1.y));
#else
    u_xlatb9 = u_xlat1.y<(-u_xlat1.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat12 + u_xlat9;
    u_xlat9 = min(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = max(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb5 = u_xlat9<(-u_xlat9);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb5;
    u_xlat12 = (u_xlatb1) ? (-u_xlat12) : u_xlat12;
    u_xlat2.y = u_xlat12 * 0.159154937;
    u_xlat16_3.xy = (u_xlatb4.x) ? u_xlat2.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xy = u_xlat16_3.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat4.xz = u_xlat0.xx * _BaseUVParams.xy;
    u_xlat4.xz = fract(u_xlat4.xz);
    u_xlat4.xz = u_xlat4.xz + u_xlat16_3.xy;
    u_xlat16_4.xz = texture(_BaseMap, u_xlat4.xz).yw;
    u_xlat16_3.x = u_xlat16_4.x * u_xlat16_4.z;
    u_xlat16_3.x = (u_xlatb4.y) ? u_xlat16_3.x : u_xlat16_4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4.x = !!(_MaskMapToggles.x<0.5);
#else
    u_xlatb4.x = _MaskMapToggles.x<0.5;
#endif
    if(u_xlatb4.x){
        u_xlatb4.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _MaskMapParams.zxzz).xy;
        u_xlat1.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
        u_xlat2.x = sqrt(u_xlat12);
        u_xlat12 = min(abs(u_xlat1.y), abs(u_xlat1.x));
        u_xlat9 = max(abs(u_xlat1.y), abs(u_xlat1.x));
        u_xlat9 = float(1.0) / u_xlat9;
        u_xlat12 = u_xlat12 * u_xlat9;
        u_xlat9 = u_xlat12 * u_xlat12;
        u_xlat13 = u_xlat9 * 0.0208350997 + -0.0851330012;
        u_xlat13 = u_xlat9 * u_xlat13 + 0.180141002;
        u_xlat13 = u_xlat9 * u_xlat13 + -0.330299497;
        u_xlat9 = u_xlat9 * u_xlat13 + 0.999866009;
        u_xlat13 = u_xlat12 * u_xlat9;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
        u_xlatb10 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
        u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
        u_xlat13 = u_xlatb10 ? u_xlat13 : float(0.0);
        u_xlat12 = u_xlat12 * u_xlat9 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(u_xlat1.y<(-u_xlat1.y));
#else
        u_xlatb9 = u_xlat1.y<(-u_xlat1.y);
#endif
        u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
        u_xlat12 = u_xlat12 + u_xlat9;
        u_xlat9 = min(u_xlat1.y, u_xlat1.x);
        u_xlat1.x = max(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat9<(-u_xlat9));
#else
        u_xlatb5 = u_xlat9<(-u_xlat9);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
        u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
        u_xlatb1 = u_xlatb1 && u_xlatb5;
        u_xlat12 = (u_xlatb1) ? (-u_xlat12) : u_xlat12;
        u_xlat2.y = u_xlat12 * 0.159154937;
        u_xlat16_7.xy = (u_xlatb4.x) ? u_xlat2.xy : vs_TEXCOORD1.xy;
        u_xlat16_7.xy = u_xlat16_7.xy * _Mask_ST.xy + _Mask_ST.zw;
        u_xlat0.xy = u_xlat0.xx * _MaskUVParams.xy;
        u_xlat0.xy = fract(u_xlat0.xy);
        u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
        u_xlat0.xy = texture(_Mask, u_xlat0.xy).xw;
        u_xlat16_7.x = (u_xlatb4.y) ? u_xlat0.y : u_xlat0.x;
        u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
        u_xlat16_7.x = u_xlat16_7.x * _MaskMapParams.y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
        u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
        u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
        u_xlat16_3.x = u_xlat16_7.x * u_xlat16_3.x;
    }
    u_xlat16_3.x = u_xlat16_3.x * _BaseIntensityParams.y + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb0 = u_xlat16_3.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" }
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
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
vec2 u_xlat8;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_BaseMapToggles.w>=0.5);
#else
    u_xlatb0 = _BaseMapToggles.w>=0.5;
#endif
    u_xlat16_2.xy = (-in_TEXCOORD0.xy) + in_TEXCOORD1.xy;
    u_xlat16_2.xy = (bool(u_xlatb0)) ? u_xlat16_2.xy : vec2(0.0, 0.0);
    u_xlat16_2.xy = u_xlat16_2.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_2.x);
    u_xlat3 = cos(u_xlat16_2.x);
    u_xlat16_2.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_2.x;
    u_xlat1.y = u_xlat16_2.x * u_xlat3;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat8.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat8.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat8.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
uniform 	mediump vec4 _MaskMapToggles;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
bool u_xlatb0;
vec2 u_xlat1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec2 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec2 u_xlatb4;
bool u_xlatb5;
mediump vec2 u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4.x = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb4.x = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb4.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlatb4.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _BaseMapToggles.zyzz).xy;
    u_xlat1.xy = vs_TEXCOORD0.wz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat2.x = sqrt(u_xlat12);
    u_xlat12 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat9 = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat12 = u_xlat12 * u_xlat9;
    u_xlat9 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat9 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat9 * u_xlat13 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat12 * u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
    u_xlatb10 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlat13 = u_xlatb10 ? u_xlat13 : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat9 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat1.y<(-u_xlat1.y));
#else
    u_xlatb9 = u_xlat1.y<(-u_xlat1.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat12 + u_xlat9;
    u_xlat9 = min(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = max(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb5 = u_xlat9<(-u_xlat9);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb5;
    u_xlat12 = (u_xlatb1) ? (-u_xlat12) : u_xlat12;
    u_xlat2.y = u_xlat12 * 0.159154937;
    u_xlat16_3.xy = (u_xlatb4.x) ? u_xlat2.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xy = u_xlat16_3.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat4.xz = u_xlat0.xx * _BaseUVParams.xy;
    u_xlat4.xz = fract(u_xlat4.xz);
    u_xlat4.xz = u_xlat4.xz + u_xlat16_3.xy;
    u_xlat16_4.xz = texture(_BaseMap, u_xlat4.xz).yw;
    u_xlat16_3.x = u_xlat16_4.x * u_xlat16_4.z;
    u_xlat16_3.x = (u_xlatb4.y) ? u_xlat16_3.x : u_xlat16_4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4.x = !!(_MaskMapToggles.x<0.5);
#else
    u_xlatb4.x = _MaskMapToggles.x<0.5;
#endif
    if(u_xlatb4.x){
        u_xlatb4.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _MaskMapParams.zxzz).xy;
        u_xlat1.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
        u_xlat2.x = sqrt(u_xlat12);
        u_xlat12 = min(abs(u_xlat1.y), abs(u_xlat1.x));
        u_xlat9 = max(abs(u_xlat1.y), abs(u_xlat1.x));
        u_xlat9 = float(1.0) / u_xlat9;
        u_xlat12 = u_xlat12 * u_xlat9;
        u_xlat9 = u_xlat12 * u_xlat12;
        u_xlat13 = u_xlat9 * 0.0208350997 + -0.0851330012;
        u_xlat13 = u_xlat9 * u_xlat13 + 0.180141002;
        u_xlat13 = u_xlat9 * u_xlat13 + -0.330299497;
        u_xlat9 = u_xlat9 * u_xlat13 + 0.999866009;
        u_xlat13 = u_xlat12 * u_xlat9;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
        u_xlatb10 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
        u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
        u_xlat13 = u_xlatb10 ? u_xlat13 : float(0.0);
        u_xlat12 = u_xlat12 * u_xlat9 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(u_xlat1.y<(-u_xlat1.y));
#else
        u_xlatb9 = u_xlat1.y<(-u_xlat1.y);
#endif
        u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
        u_xlat12 = u_xlat12 + u_xlat9;
        u_xlat9 = min(u_xlat1.y, u_xlat1.x);
        u_xlat1.x = max(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat9<(-u_xlat9));
#else
        u_xlatb5 = u_xlat9<(-u_xlat9);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
        u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
        u_xlatb1 = u_xlatb1 && u_xlatb5;
        u_xlat12 = (u_xlatb1) ? (-u_xlat12) : u_xlat12;
        u_xlat2.y = u_xlat12 * 0.159154937;
        u_xlat16_7.xy = (u_xlatb4.x) ? u_xlat2.xy : vs_TEXCOORD1.xy;
        u_xlat16_7.xy = u_xlat16_7.xy * _Mask_ST.xy + _Mask_ST.zw;
        u_xlat0.xy = u_xlat0.xx * _MaskUVParams.xy;
        u_xlat0.xy = fract(u_xlat0.xy);
        u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
        u_xlat0.xy = texture(_Mask, u_xlat0.xy).xw;
        u_xlat16_7.x = (u_xlatb4.y) ? u_xlat0.y : u_xlat0.x;
        u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
        u_xlat16_7.x = u_xlat16_7.x * _MaskMapParams.y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
        u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
        u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
        u_xlat16_3.x = u_xlat16_7.x * u_xlat16_3.x;
    }
    u_xlat16_3.x = u_xlat16_3.x * _BaseIntensityParams.y + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb0 = u_xlat16_3.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	float _DepthTextureMode;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
mediump vec2 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_BaseMapToggles.w>=0.5);
#else
    u_xlatb0 = _BaseMapToggles.w>=0.5;
#endif
    u_xlat16_3.xy = (-in_TEXCOORD0.xy) + in_TEXCOORD1.xy;
    u_xlat16_3.xy = (bool(u_xlatb0)) ? u_xlat16_3.xy : vec2(0.0, 0.0);
    u_xlat16_3.xy = u_xlat16_3.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_3.xy + vec2(-0.5, -0.5);
    u_xlat16_3.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_3.x);
    u_xlat2.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_3.x;
    u_xlat1.y = u_xlat2.x * u_xlat16_3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat8.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat8.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat8.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
uniform 	mediump vec4 _MaskMapToggles;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
bool u_xlatb0;
vec2 u_xlat1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec2 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec2 u_xlatb4;
bool u_xlatb5;
mediump vec2 u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4.x = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb4.x = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb4.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlatb4.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _BaseMapToggles.zyzz).xy;
    u_xlat1.xy = vs_TEXCOORD0.wz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat2.x = sqrt(u_xlat12);
    u_xlat12 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat9 = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat12 = u_xlat12 * u_xlat9;
    u_xlat9 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat9 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat9 * u_xlat13 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat12 * u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
    u_xlatb10 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlat13 = u_xlatb10 ? u_xlat13 : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat9 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat1.y<(-u_xlat1.y));
#else
    u_xlatb9 = u_xlat1.y<(-u_xlat1.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat12 + u_xlat9;
    u_xlat9 = min(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = max(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb5 = u_xlat9<(-u_xlat9);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb5;
    u_xlat12 = (u_xlatb1) ? (-u_xlat12) : u_xlat12;
    u_xlat2.y = u_xlat12 * 0.159154937;
    u_xlat16_3.xy = (u_xlatb4.x) ? u_xlat2.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xy = u_xlat16_3.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat4.xz = u_xlat0.xx * _BaseUVParams.xy;
    u_xlat4.xz = fract(u_xlat4.xz);
    u_xlat4.xz = u_xlat4.xz + u_xlat16_3.xy;
    u_xlat16_4.xz = texture(_BaseMap, u_xlat4.xz).yw;
    u_xlat16_3.x = u_xlat16_4.x * u_xlat16_4.z;
    u_xlat16_3.x = (u_xlatb4.y) ? u_xlat16_3.x : u_xlat16_4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4.x = !!(_MaskMapToggles.x<0.5);
#else
    u_xlatb4.x = _MaskMapToggles.x<0.5;
#endif
    if(u_xlatb4.x){
        u_xlatb4.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _MaskMapParams.zxzz).xy;
        u_xlat1.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
        u_xlat2.x = sqrt(u_xlat12);
        u_xlat12 = min(abs(u_xlat1.y), abs(u_xlat1.x));
        u_xlat9 = max(abs(u_xlat1.y), abs(u_xlat1.x));
        u_xlat9 = float(1.0) / u_xlat9;
        u_xlat12 = u_xlat12 * u_xlat9;
        u_xlat9 = u_xlat12 * u_xlat12;
        u_xlat13 = u_xlat9 * 0.0208350997 + -0.0851330012;
        u_xlat13 = u_xlat9 * u_xlat13 + 0.180141002;
        u_xlat13 = u_xlat9 * u_xlat13 + -0.330299497;
        u_xlat9 = u_xlat9 * u_xlat13 + 0.999866009;
        u_xlat13 = u_xlat12 * u_xlat9;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
        u_xlatb10 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
        u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
        u_xlat13 = u_xlatb10 ? u_xlat13 : float(0.0);
        u_xlat12 = u_xlat12 * u_xlat9 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(u_xlat1.y<(-u_xlat1.y));
#else
        u_xlatb9 = u_xlat1.y<(-u_xlat1.y);
#endif
        u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
        u_xlat12 = u_xlat12 + u_xlat9;
        u_xlat9 = min(u_xlat1.y, u_xlat1.x);
        u_xlat1.x = max(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat9<(-u_xlat9));
#else
        u_xlatb5 = u_xlat9<(-u_xlat9);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
        u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
        u_xlatb1 = u_xlatb1 && u_xlatb5;
        u_xlat12 = (u_xlatb1) ? (-u_xlat12) : u_xlat12;
        u_xlat2.y = u_xlat12 * 0.159154937;
        u_xlat16_7.xy = (u_xlatb4.x) ? u_xlat2.xy : vs_TEXCOORD1.xy;
        u_xlat16_7.xy = u_xlat16_7.xy * _Mask_ST.xy + _Mask_ST.zw;
        u_xlat0.xy = u_xlat0.xx * _MaskUVParams.xy;
        u_xlat0.xy = fract(u_xlat0.xy);
        u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
        u_xlat0.xy = texture(_Mask, u_xlat0.xy).xw;
        u_xlat16_7.x = (u_xlatb4.y) ? u_xlat0.y : u_xlat0.x;
        u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
        u_xlat16_7.x = u_xlat16_7.x * _MaskMapParams.y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
        u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
        u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
        u_xlat16_3.x = u_xlat16_7.x * u_xlat16_3.x;
    }
    u_xlat16_3.x = u_xlat16_3.x * _BaseIntensityParams.y + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb0 = u_xlat16_3.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	float _DepthTextureMode;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
mediump vec2 u_xlat16_3;
vec2 u_xlat8;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_BaseMapToggles.w>=0.5);
#else
    u_xlatb0 = _BaseMapToggles.w>=0.5;
#endif
    u_xlat16_3.xy = (-in_TEXCOORD0.xy) + in_TEXCOORD1.xy;
    u_xlat16_3.xy = (bool(u_xlatb0)) ? u_xlat16_3.xy : vec2(0.0, 0.0);
    u_xlat16_3.xy = u_xlat16_3.xy + in_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat16_3.xy + vec2(-0.5, -0.5);
    u_xlat16_3.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_3.x);
    u_xlat2.x = cos(u_xlat16_3.x);
    u_xlat16_3.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat1.x * u_xlat16_3.x;
    u_xlat1.y = u_xlat2.x * u_xlat16_3.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat8.y = dot(u_xlat1.xy, u_xlat0.xy);
    u_xlat8.x = dot(u_xlat1.yz, u_xlat0.xy);
    u_xlat0.xy = u_xlat8.xy + vec2(0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _BaseMapToggles;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _BaseIntensityParams;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _MaskUVParams;
uniform 	mediump vec4 _MaskMapParams;
uniform 	mediump vec4 _MaskMapToggles;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
bool u_xlatb0;
vec2 u_xlat1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec2 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bvec2 u_xlatb4;
bool u_xlatb5;
mediump vec2 u_xlat16_7;
float u_xlat9;
bool u_xlatb9;
bool u_xlatb10;
float u_xlat12;
float u_xlat13;
void main()
{
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4.x = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb4.x = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb4.x) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlatb4.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _BaseMapToggles.zyzz).xy;
    u_xlat1.xy = vs_TEXCOORD0.wz * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat2.x = sqrt(u_xlat12);
    u_xlat12 = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat9 = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat12 = u_xlat12 * u_xlat9;
    u_xlat9 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat9 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat9 * u_xlat13 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat12 * u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
    u_xlatb10 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlat13 = u_xlatb10 ? u_xlat13 : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat9 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat1.y<(-u_xlat1.y));
#else
    u_xlatb9 = u_xlat1.y<(-u_xlat1.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat12 + u_xlat9;
    u_xlat9 = min(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = max(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb5 = u_xlat9<(-u_xlat9);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb5;
    u_xlat12 = (u_xlatb1) ? (-u_xlat12) : u_xlat12;
    u_xlat2.y = u_xlat12 * 0.159154937;
    u_xlat16_3.xy = (u_xlatb4.x) ? u_xlat2.xy : vs_TEXCOORD0.zw;
    u_xlat16_3.xy = u_xlat16_3.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat4.xz = u_xlat0.xx * _BaseUVParams.xy;
    u_xlat4.xz = fract(u_xlat4.xz);
    u_xlat4.xz = u_xlat4.xz + u_xlat16_3.xy;
    u_xlat16_4.xz = texture(_BaseMap, u_xlat4.xz).yw;
    u_xlat16_3.x = u_xlat16_4.x * u_xlat16_4.z;
    u_xlat16_3.x = (u_xlatb4.y) ? u_xlat16_3.x : u_xlat16_4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4.x = !!(_MaskMapToggles.x<0.5);
#else
    u_xlatb4.x = _MaskMapToggles.x<0.5;
#endif
    if(u_xlatb4.x){
        u_xlatb4.xy = lessThan(vec4(0.5, 0.5, 0.0, 0.0), _MaskMapParams.zxzz).xy;
        u_xlat1.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
        u_xlat2.x = sqrt(u_xlat12);
        u_xlat12 = min(abs(u_xlat1.y), abs(u_xlat1.x));
        u_xlat9 = max(abs(u_xlat1.y), abs(u_xlat1.x));
        u_xlat9 = float(1.0) / u_xlat9;
        u_xlat12 = u_xlat12 * u_xlat9;
        u_xlat9 = u_xlat12 * u_xlat12;
        u_xlat13 = u_xlat9 * 0.0208350997 + -0.0851330012;
        u_xlat13 = u_xlat9 * u_xlat13 + 0.180141002;
        u_xlat13 = u_xlat9 * u_xlat13 + -0.330299497;
        u_xlat9 = u_xlat9 * u_xlat13 + 0.999866009;
        u_xlat13 = u_xlat12 * u_xlat9;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
        u_xlatb10 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
        u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
        u_xlat13 = u_xlatb10 ? u_xlat13 : float(0.0);
        u_xlat12 = u_xlat12 * u_xlat9 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
        u_xlatb9 = !!(u_xlat1.y<(-u_xlat1.y));
#else
        u_xlatb9 = u_xlat1.y<(-u_xlat1.y);
#endif
        u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
        u_xlat12 = u_xlat12 + u_xlat9;
        u_xlat9 = min(u_xlat1.y, u_xlat1.x);
        u_xlat1.x = max(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat9<(-u_xlat9));
#else
        u_xlatb5 = u_xlat9<(-u_xlat9);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
        u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
        u_xlatb1 = u_xlatb1 && u_xlatb5;
        u_xlat12 = (u_xlatb1) ? (-u_xlat12) : u_xlat12;
        u_xlat2.y = u_xlat12 * 0.159154937;
        u_xlat16_7.xy = (u_xlatb4.x) ? u_xlat2.xy : vs_TEXCOORD1.xy;
        u_xlat16_7.xy = u_xlat16_7.xy * _Mask_ST.xy + _Mask_ST.zw;
        u_xlat0.xy = u_xlat0.xx * _MaskUVParams.xy;
        u_xlat0.xy = fract(u_xlat0.xy);
        u_xlat0.xy = u_xlat0.xy + u_xlat16_7.xy;
        u_xlat0.xy = texture(_Mask, u_xlat0.xy).xw;
        u_xlat16_7.x = (u_xlatb4.y) ? u_xlat0.y : u_xlat0.x;
        u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
        u_xlat16_7.x = u_xlat16_7.x * _MaskMapParams.y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
        u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
        u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
        u_xlat16_3.x = u_xlat16_7.x * u_xlat16_3.x;
    }
    u_xlat16_3.x = u_xlat16_3.x * _BaseIntensityParams.y + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb0 = u_xlat16_3.x<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" }
""
}
}
}
}
CustomEditor "TheseusEditor.TheseusModuleShaderGUIBase"
}