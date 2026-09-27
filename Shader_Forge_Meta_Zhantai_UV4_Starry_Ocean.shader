//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Shader Forge/Meta_Zhantai_UV4_Starry_Ocean" {
Properties {

[Header(Test)] [Header(Gerstner_____________________________________________________________________________)] [Space(10)] _Speed ("波速度", Float) = 0.5

_TotalRotate ("旋转总体调整", Float) = 0.0

_yScale ("波高总体调整", Float) = 1.0

_WaveA ("Wave A (XY波方向, Z波尖(小于1), 波宽)", Vector) = (1,1.39,0.7,0.4)

_WaveB ("Wave B", Vector) = (-0.05,1,0.9,0.8)

_WaveC ("Wave C", Vector) = (1,-0.58,0.51,1.6)

_WaveD ("Wave D", Vector) = (8.98,1,0.24,1.38)

_EffectByVertexColor ("Gerstner受到顶点色影响程度", Float) = 0.0

[Toggle] _ShowVertexColor ("显示顶点色", Float) = 0.0

[Header(Noise)] [Header(Foam_________________________________________________________________________________)] _FoamTex ("泡沫贴图", 2D) = "white" { }

_FoamThre ("泡沫范围", Range(0.01, 1)) = 0.30000001192092896

_FoamRange ("泡沫软硬", Range(-1, 1)) = 0.699999988079071

_FoamDir ("泡沫的方向", Vector) = (0,0,1,1)

_FoamColor ("泡沫颜色", Color) = (1,1,1,1)

_FoamDepthStartPoint ("泡沫远近有无的起始点", Float) = 93.9000015258789

_FoamDepthRange ("泡沫远近有无的软硬程度", Float) = -43.099998474121094

_WaveNoise ("波浪噪声", 2D) = "back" { }

_FoamNoiseTilingScale ("泡沫噪声缩放", Float) = 7.0

_FoamNoiseStrength ("泡沫噪声强度", Float) = 3.0

[Header(Y Axis Color________________________________________________________________________________)] _worldYDepthA ("深度颜色起始高度", Float) = -1.0

_worldYDepthB ("深度颜色结束高度", Float) = 0.0

_WolrdYDepthColor ("深度颜色", Color) = (0,0,0,1)

[Header(Origin_______________________________________________________________________________________)] _Diff ("Diff", 2D) = "white" { }

_DiffColor ("DiffColor", Color) = (1,1,1,1)

_light_PW ("light_PW", Float) = 5.0

_Light ("Light", 2D) = "white" { }

_Normal ("Normal", 2D) = "bump" { }

_Cubemap ("Cubemap", Cube) = "_Skybox" { }

_Em_G_CU_R_MASK ("Em_G_CU_R_MASK", 2D) = "white" { }

_Cube_FW ("Cube_FW", Float) = 0.4000000059604645

_Cube_power ("Cube_power", Float) = 8.0

_ES_PW ("ES_PW", Float) = 2.0

[Enum(Off, 0, On, 1)] _ZWrite ("ZWrite", Float) = 0.0

_ReceiveShadowsStrength ("ReceiveShadowsStrength", Float) = 1.0

[Space(10)] [Header(Starry)] _StarryTex ("星空纹理", 2D) = "black" { }

_StarryTexRotator ("星空纹理旋转", Range(0, 360)) = 180.0

_Starry_Intensity ("星空强度", Float) = 1.0

[MaterialToggle] _IsScreenPos ("打开屏幕UV坐标|关闭正常UV坐标", Float) = 1.0

[MaterialToggle] _IsLoopUv ("打开循环UV移动|关闭线性UV移动", Float) = 1.0

_MatcapUVScale ("视觉纹理UV缩放", Float) = 1.0

[MaterialToggle] _UseViewDir ("使用视觉纹理", Float) = 0.0

[Enum(PositiveX,1,PositiveY,2,PositiveZ,3,NegativeX,4,NegativeY,5,NegativeZ,6)] _ViewDir ("视觉纹理深度方向", Float) = 6.0

_Starry_Speed ("星空流动(xy:速度 z:循环间隔)", Vector) = (0,0,0,0)

[Space(10)] [Header(Alpha)] _Alpha ("整体透明", Float) = 1.0

[Header(Fog)] [MaterialToggle] _EnableCustomFog ("打开雾效", Float) = 0.0

_FogColor ("雾效颜色", Color) = (1,1,1,1)

_FogDistance ("雾效距离", Float) = 1000.0

_FogFade ("雾效衰减", Float) = 1.0

_CustomWaveTimeParams ("CustomWaveTimeParams", Vector) = (0,0,0,0)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "ForwardBase"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 ZWrite Off
  GpuProgramID 37533
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
uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump vec4 _WaveA;
uniform 	mediump vec4 _WaveB;
uniform 	mediump vec4 _WaveC;
uniform 	mediump vec4 _WaveD;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _EffectByVertexColor;
uniform 	mediump float _TotalRotate;
uniform 	mediump float _yScale;
uniform 	vec4 _CustomWaveTimeParams;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_23;
vec2 u_xlat34;
mediump float u_xlat16_35;
vec2 u_xlat36;
float u_xlat51;
mediump float u_xlat16_52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = 6.28318548 / _WaveA.w;
    u_xlat16_1.x = _WaveA.z / u_xlat0.x;
    u_xlat16_18.x = 9.80000019 / u_xlat0.x;
    u_xlat16_18.x = sqrt(u_xlat16_18.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.5<_CustomWaveTimeParams.x);
#else
    u_xlatb17 = 0.5<_CustomWaveTimeParams.x;
#endif
    u_xlat17 = (u_xlatb17) ? _CustomWaveTimeParams.y : _Time.y;
    u_xlat34.x = u_xlat17 * u_xlat16_18.x;
    u_xlat2.xy = in_COLOR0.xz * vec2(vec2(_EffectByVertexColor, _EffectByVertexColor)) + in_POSITION0.xz;
    u_xlat16_18.x = dot(_WaveA.xy, _WaveA.xy);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_18.xy = u_xlat16_18.xx * _WaveA.yx;
    u_xlat3.x = sin(_TotalRotate);
    u_xlat4.x = cos(_TotalRotate);
    u_xlat36.xy = u_xlat16_18.xy * u_xlat3.xx;
    u_xlat5.x = u_xlat16_18.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat5.y = u_xlat16_18.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat5.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * _Speed + u_xlat51;
    u_xlat0.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_6.x = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_7;
    u_xlat16_8.y = u_xlat16_1.x * u_xlat16_6.x;
    u_xlat16_8.xz = u_xlat16_18.xx * u_xlat5.xy;
    u_xlat0.x = 6.28318548 / _WaveB.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveB.xy, _WaveB.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xy = u_xlat16_1.xx * _WaveB.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xy;
    u_xlat9.x = u_xlat16_1.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat9.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat16_1.xyz = vec3(vec3(_Speed, _Speed, _Speed)) * vec3(1.29999995, 1.60000002, 1.79999995);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.x + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveB.z / u_xlat0.x;
    u_xlat16_10.x = sin(u_xlat34.x);
    u_xlat16_11 = cos(u_xlat34.x);
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_11;
    u_xlat16_12.y = u_xlat16_1.x * u_xlat16_10.x;
    u_xlat16_12.xz = vec2(u_xlat16_52) * u_xlat9.xy;
    u_xlat16_23.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat0.x = 6.28318548 / _WaveC.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveC.xy, _WaveC.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xw = u_xlat16_1.xx * _WaveC.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xw;
    u_xlat13.x = u_xlat16_1.w * u_xlat4.x + (-u_xlat36.x);
    u_xlat13.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat13.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.y + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveC.z / u_xlat0.x;
    u_xlat16_8.x = sin(u_xlat34.x);
    u_xlat16_12.x = cos(u_xlat34.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_12.x;
    u_xlat16_14.y = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_14.xz = u_xlat16_18.xx * u_xlat13.xy;
    u_xlat16_1.xyw = u_xlat16_23.xyz + u_xlat16_14.xyz;
    u_xlat0.x = 6.28318548 / _WaveD.w;
    u_xlat16_23.x = 9.80000019 / u_xlat0.x;
    u_xlat16_23.x = sqrt(u_xlat16_23.x);
    u_xlat17 = u_xlat17 * u_xlat16_23.x;
    u_xlat16_23.x = dot(_WaveD.xy, _WaveD.xy);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_23.xy = u_xlat16_23.xx * _WaveD.yx;
    u_xlat34.xy = u_xlat3.xx * u_xlat16_23.xy;
    u_xlat3.x = u_xlat16_23.y * u_xlat4.x + (-u_xlat34.x);
    u_xlat3.y = u_xlat16_23.x * u_xlat4.x + u_xlat34.y;
    u_xlat34.x = dot(u_xlat3.xy, u_xlat2.xy);
    u_xlat17 = (-u_xlat17) * u_xlat16_1.z + u_xlat34.x;
    u_xlat17 = u_xlat17 * u_xlat0.x;
    u_xlat16_35 = _WaveD.z / u_xlat0.x;
    u_xlat16_14.x = sin(u_xlat17);
    u_xlat16_15 = cos(u_xlat17);
    u_xlat16_23.x = u_xlat16_35 * u_xlat16_15;
    u_xlat16_16.y = u_xlat16_35 * u_xlat16_14.x;
    u_xlat16_16.xz = u_xlat3.xy * u_xlat16_23.xx;
    u_xlat16_1.xyz = u_xlat16_1.xyw + u_xlat16_16.xyz;
    u_xlat0.xz = u_xlat16_1.xz;
    u_xlat0.y = u_xlat16_1.y * _yScale;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD8.x = u_xlat0.y;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_23.xyz = u_xlat5.xyy * (-u_xlat5.xxy);
    u_xlat16_6.x = u_xlat16_6.x * _WaveA.z;
    u_xlat16_7 = u_xlat16_7 * _WaveA.z;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_23.z;
    u_xlat16_6.yz = u_xlat16_6.xx * u_xlat16_23.yx;
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlat16_16.z = u_xlat5.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat5.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat16_6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat16_16.xyz + vec3(1.0, 0.0, 0.0);
    u_xlat16_6.xyz = u_xlat9.xyy * (-u_xlat9.xxy);
    u_xlat16_57 = u_xlat16_10.x * _WaveB.z;
    u_xlat16_7 = u_xlat16_11 * _WaveB.z;
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_10.y = u_xlat16_6.y;
    u_xlat16_10.z = u_xlat16_7 * u_xlat9.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat9.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat13.xyy * (-u_xlat13.xxy);
    u_xlat16_57 = u_xlat16_8.x * _WaveC.z;
    u_xlat16_7 = u_xlat16_12.x * _WaveC.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat16_7 * u_xlat13.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat13.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat3.xyy * (-u_xlat3.xxy);
    u_xlat16_57 = u_xlat16_14.x * _WaveD.z;
    u_xlat16_7 = u_xlat16_15 * _WaveD.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat3.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat3.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat3.zxy * u_xlat2.yzx + (-u_xlat16_6.xyz);
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor));
#else
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
#endif
    vs_TEXCOORD3.xyz = (bool(u_xlatb53)) ? in_COLOR0.xyz : u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat3.xyz = vec3(u_xlat53) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    vs_TEXCOORD5.xyz = vec3(u_xlat53) * u_xlat2.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD8.y = in_COLOR0.w;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	vec4 _StarryTex_ST;
uniform 	float _StarryTexRotator;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	mediump float _ViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	mediump float _Alpha;
uniform 	mediump float _EnableCustomFog;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogDistance;
uniform 	mediump float _FogFade;
uniform 	mediump float _FoamThre;
uniform 	mediump float _FoamRange;
uniform 	mediump vec3 _FoamDir;
uniform 	mediump vec3 _FoamColor;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _FoamDepthStartPoint;
uniform 	mediump float _FoamDepthRange;
uniform 	mediump float _FoamNoiseTilingScale;
uniform 	mediump float _FoamNoiseStrength;
uniform 	mediump vec4 _DiffColor;
uniform 	vec4 _FoamTex_ST;
uniform 	mediump float _worldYDepthA;
uniform 	mediump float _worldYDepthB;
uniform 	mediump vec4 _WolrdYDepthColor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(6) uniform mediump sampler2D _WaveNoise;
UNITY_LOCATION(7) uniform mediump sampler2D _FoamTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
float u_xlat13;
float u_xlat15;
vec3 u_xlat17;
vec2 u_xlat32;
float u_xlat39;
bool u_xlatb39;
float u_xlat40;
mediump float u_xlat16_40;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
#endif
    if(u_xlatb0){
        u_xlat0.xyz = vs_TEXCOORD3.xyz;
        u_xlat0.w = 1.0;
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat39 = u_xlat39 + u_xlat39;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat39)) + (-u_xlat1.xyz);
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_2.xyz = texture(_Diff, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _DiffColor.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_4.xy = texture(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat17.xyz = u_xlat2.xyz * u_xlat16_4.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat1.xyz);
    u_xlat5.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_FW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat6.xyz);
    u_xlat5.xyz = u_xlat6.xyz * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat39 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat5.xyz = vec3(u_xlat39) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_4.xxx * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat17.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat5.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_5.xyz = texture(_Light, u_xlat5.xy).xyz;
    u_xlat6.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat6.xy = u_xlat6.xy + (-vs_TEXCOORD0.xy);
    u_xlat6.xy = vec2(_IsScreenPos) * u_xlat6.xy + vs_TEXCOORD0.xy;
    u_xlat39 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat39 = u_xlat39 * _Time.y;
    u_xlat39 = cos(u_xlat39);
    u_xlat39 = sin(u_xlat39);
    u_xlat32.xy = vec2(u_xlat39) * _Starry_Speed.xxyz.yz + u_xlat6.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(_ViewDir==6.0);
#else
    u_xlatb39 = _ViewDir==6.0;
#endif
    if(u_xlatb39){
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat7.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    } else {
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat8.xyz = vec3(u_xlat39) * u_xlat1.xzy;
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat9.xyz = vec3(u_xlat39) * u_xlat1.zyx;
        u_xlat1.w = (-u_xlat1.z);
        u_xlat39 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat10.xyz = vec3(u_xlat39) * u_xlat1.xyw;
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat11.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat39 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat11.xyz = vec3(u_xlat39) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb39 = !!(_ViewDir==1.0);
#else
        u_xlatb39 = _ViewDir==1.0;
#endif
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat40 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat40 = inversesqrt(u_xlat40);
        u_xlat1.xyz = vec3(u_xlat40) * u_xlat1.xyz;
        u_xlat1.xyz = bool(u_xlatb39) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb3.w) ? u_xlat11.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.z) ? u_xlat10.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.y) ? u_xlat9.xyz : u_xlat1.xyz;
        u_xlat7.xyz = (u_xlatb3.x) ? u_xlat8.xyz : u_xlat1.xyz;
    }
    u_xlat39 = u_xlat7.z + 1.0;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat39 = u_xlat39 * 2.82842708;
    u_xlat1.xy = u_xlat7.xy / vec2(u_xlat39);
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat39 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat39 = u_xlat39 * 3.14159274;
    u_xlat7.x = sin(u_xlat39);
    u_xlat8.x = cos(u_xlat39);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat1.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat1.xy, u_xlat9.xy);
    u_xlat1.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16_1.xyz = texture(_StarryTex, u_xlat1.xy).xyz;
    u_xlat6.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlat32.xy = (-u_xlat6.xy) + u_xlat32.xy;
    u_xlat6.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat32.xy + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_6.xyz = texture(_StarryTex, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + (-u_xlat16_6.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat16_6.xyz;
    u_xlat6.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat1.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat5.xyz = u_xlat16_5.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = sqrt(u_xlat39);
    u_xlat40 = u_xlat39 / _FogDistance;
    u_xlat16_12.x = max(_FogFade, 0.0);
    u_xlat40 = log2(u_xlat40);
    u_xlat40 = u_xlat40 * u_xlat16_12.x;
    u_xlat40 = exp2(u_xlat40);
    u_xlat40 = min(u_xlat40, 1.0);
    u_xlat40 = u_xlat40 * _FogColor.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + _FogColor.xyz;
    u_xlat2.xyz = vec3(u_xlat40) * u_xlat2.xyz;
    u_xlat1.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(vec2(_FoamNoiseTilingScale, _FoamNoiseTilingScale));
    u_xlat16_40 = texture(_WaveNoise, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD0.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat16_2.x = texture(_FoamTex, u_xlat2.xy).x;
    u_xlat39 = u_xlat39 + (-_FoamDepthStartPoint);
    u_xlat15 = float(1.0) / _FoamDepthRange;
    u_xlat39 = u_xlat39 * u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat15;
    u_xlat16_12.xyz = vec3(u_xlat39) * _FoamColor.xyz;
    u_xlat16_12.xyz = u_xlat16_2.xxx * u_xlat16_12.xyz;
    u_xlat2.x = u_xlat16_40 * _FoamNoiseStrength + _FoamDir.x;
    u_xlat2.yz = _FoamDir.yz;
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat2.xyz = vec3(u_xlat39) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = u_xlat0.x + (-_FoamThre);
    u_xlat13 = float(1.0) / _FoamRange;
    u_xlat0.x = u_xlat13 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat13 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _WolrdYDepthColor.xyz;
    u_xlat39 = (-_worldYDepthA) + _worldYDepthB;
    u_xlat40 = vs_TEXCOORD8.x + (-_worldYDepthA);
    u_xlat39 = float(1.0) / u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat0.xyz = (-_WolrdYDepthColor.xyz) * u_xlat0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_TEXCOORD8.y * _Alpha;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump vec4 _WaveA;
uniform 	mediump vec4 _WaveB;
uniform 	mediump vec4 _WaveC;
uniform 	mediump vec4 _WaveD;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _EffectByVertexColor;
uniform 	mediump float _TotalRotate;
uniform 	mediump float _yScale;
uniform 	vec4 _CustomWaveTimeParams;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_23;
vec2 u_xlat34;
mediump float u_xlat16_35;
vec2 u_xlat36;
float u_xlat51;
mediump float u_xlat16_52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = 6.28318548 / _WaveA.w;
    u_xlat16_1.x = _WaveA.z / u_xlat0.x;
    u_xlat16_18.x = 9.80000019 / u_xlat0.x;
    u_xlat16_18.x = sqrt(u_xlat16_18.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.5<_CustomWaveTimeParams.x);
#else
    u_xlatb17 = 0.5<_CustomWaveTimeParams.x;
#endif
    u_xlat17 = (u_xlatb17) ? _CustomWaveTimeParams.y : _Time.y;
    u_xlat34.x = u_xlat17 * u_xlat16_18.x;
    u_xlat2.xy = in_COLOR0.xz * vec2(vec2(_EffectByVertexColor, _EffectByVertexColor)) + in_POSITION0.xz;
    u_xlat16_18.x = dot(_WaveA.xy, _WaveA.xy);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_18.xy = u_xlat16_18.xx * _WaveA.yx;
    u_xlat3.x = sin(_TotalRotate);
    u_xlat4.x = cos(_TotalRotate);
    u_xlat36.xy = u_xlat16_18.xy * u_xlat3.xx;
    u_xlat5.x = u_xlat16_18.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat5.y = u_xlat16_18.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat5.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * _Speed + u_xlat51;
    u_xlat0.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_6.x = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_7;
    u_xlat16_8.y = u_xlat16_1.x * u_xlat16_6.x;
    u_xlat16_8.xz = u_xlat16_18.xx * u_xlat5.xy;
    u_xlat0.x = 6.28318548 / _WaveB.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveB.xy, _WaveB.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xy = u_xlat16_1.xx * _WaveB.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xy;
    u_xlat9.x = u_xlat16_1.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat9.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat16_1.xyz = vec3(vec3(_Speed, _Speed, _Speed)) * vec3(1.29999995, 1.60000002, 1.79999995);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.x + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveB.z / u_xlat0.x;
    u_xlat16_10.x = sin(u_xlat34.x);
    u_xlat16_11 = cos(u_xlat34.x);
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_11;
    u_xlat16_12.y = u_xlat16_1.x * u_xlat16_10.x;
    u_xlat16_12.xz = vec2(u_xlat16_52) * u_xlat9.xy;
    u_xlat16_23.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat0.x = 6.28318548 / _WaveC.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveC.xy, _WaveC.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xw = u_xlat16_1.xx * _WaveC.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xw;
    u_xlat13.x = u_xlat16_1.w * u_xlat4.x + (-u_xlat36.x);
    u_xlat13.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat13.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.y + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveC.z / u_xlat0.x;
    u_xlat16_8.x = sin(u_xlat34.x);
    u_xlat16_12.x = cos(u_xlat34.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_12.x;
    u_xlat16_14.y = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_14.xz = u_xlat16_18.xx * u_xlat13.xy;
    u_xlat16_1.xyw = u_xlat16_23.xyz + u_xlat16_14.xyz;
    u_xlat0.x = 6.28318548 / _WaveD.w;
    u_xlat16_23.x = 9.80000019 / u_xlat0.x;
    u_xlat16_23.x = sqrt(u_xlat16_23.x);
    u_xlat17 = u_xlat17 * u_xlat16_23.x;
    u_xlat16_23.x = dot(_WaveD.xy, _WaveD.xy);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_23.xy = u_xlat16_23.xx * _WaveD.yx;
    u_xlat34.xy = u_xlat3.xx * u_xlat16_23.xy;
    u_xlat3.x = u_xlat16_23.y * u_xlat4.x + (-u_xlat34.x);
    u_xlat3.y = u_xlat16_23.x * u_xlat4.x + u_xlat34.y;
    u_xlat34.x = dot(u_xlat3.xy, u_xlat2.xy);
    u_xlat17 = (-u_xlat17) * u_xlat16_1.z + u_xlat34.x;
    u_xlat17 = u_xlat17 * u_xlat0.x;
    u_xlat16_35 = _WaveD.z / u_xlat0.x;
    u_xlat16_14.x = sin(u_xlat17);
    u_xlat16_15 = cos(u_xlat17);
    u_xlat16_23.x = u_xlat16_35 * u_xlat16_15;
    u_xlat16_16.y = u_xlat16_35 * u_xlat16_14.x;
    u_xlat16_16.xz = u_xlat3.xy * u_xlat16_23.xx;
    u_xlat16_1.xyz = u_xlat16_1.xyw + u_xlat16_16.xyz;
    u_xlat0.xz = u_xlat16_1.xz;
    u_xlat0.y = u_xlat16_1.y * _yScale;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD8.x = u_xlat0.y;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_23.xyz = u_xlat5.xyy * (-u_xlat5.xxy);
    u_xlat16_6.x = u_xlat16_6.x * _WaveA.z;
    u_xlat16_7 = u_xlat16_7 * _WaveA.z;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_23.z;
    u_xlat16_6.yz = u_xlat16_6.xx * u_xlat16_23.yx;
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlat16_16.z = u_xlat5.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat5.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat16_6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat16_16.xyz + vec3(1.0, 0.0, 0.0);
    u_xlat16_6.xyz = u_xlat9.xyy * (-u_xlat9.xxy);
    u_xlat16_57 = u_xlat16_10.x * _WaveB.z;
    u_xlat16_7 = u_xlat16_11 * _WaveB.z;
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_10.y = u_xlat16_6.y;
    u_xlat16_10.z = u_xlat16_7 * u_xlat9.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat9.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat13.xyy * (-u_xlat13.xxy);
    u_xlat16_57 = u_xlat16_8.x * _WaveC.z;
    u_xlat16_7 = u_xlat16_12.x * _WaveC.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat16_7 * u_xlat13.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat13.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat3.xyy * (-u_xlat3.xxy);
    u_xlat16_57 = u_xlat16_14.x * _WaveD.z;
    u_xlat16_7 = u_xlat16_15 * _WaveD.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat3.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat3.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat3.zxy * u_xlat2.yzx + (-u_xlat16_6.xyz);
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor));
#else
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
#endif
    vs_TEXCOORD3.xyz = (bool(u_xlatb53)) ? in_COLOR0.xyz : u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat3.xyz = vec3(u_xlat53) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    vs_TEXCOORD5.xyz = vec3(u_xlat53) * u_xlat2.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD8.y = in_COLOR0.w;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	vec4 _StarryTex_ST;
uniform 	float _StarryTexRotator;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	mediump float _ViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	mediump float _Alpha;
uniform 	mediump float _EnableCustomFog;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogDistance;
uniform 	mediump float _FogFade;
uniform 	mediump float _FoamThre;
uniform 	mediump float _FoamRange;
uniform 	mediump vec3 _FoamDir;
uniform 	mediump vec3 _FoamColor;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _FoamDepthStartPoint;
uniform 	mediump float _FoamDepthRange;
uniform 	mediump float _FoamNoiseTilingScale;
uniform 	mediump float _FoamNoiseStrength;
uniform 	mediump vec4 _DiffColor;
uniform 	vec4 _FoamTex_ST;
uniform 	mediump float _worldYDepthA;
uniform 	mediump float _worldYDepthB;
uniform 	mediump vec4 _WolrdYDepthColor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(6) uniform mediump sampler2D _WaveNoise;
UNITY_LOCATION(7) uniform mediump sampler2D _FoamTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
float u_xlat13;
float u_xlat15;
vec3 u_xlat17;
vec2 u_xlat32;
float u_xlat39;
bool u_xlatb39;
float u_xlat40;
mediump float u_xlat16_40;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
#endif
    if(u_xlatb0){
        u_xlat0.xyz = vs_TEXCOORD3.xyz;
        u_xlat0.w = 1.0;
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat39 = u_xlat39 + u_xlat39;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat39)) + (-u_xlat1.xyz);
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_2.xyz = texture(_Diff, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _DiffColor.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_4.xy = texture(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat17.xyz = u_xlat2.xyz * u_xlat16_4.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat1.xyz);
    u_xlat5.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_FW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat6.xyz);
    u_xlat5.xyz = u_xlat6.xyz * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat39 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat5.xyz = vec3(u_xlat39) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_4.xxx * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat17.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat5.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_5.xyz = texture(_Light, u_xlat5.xy).xyz;
    u_xlat6.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat6.xy = u_xlat6.xy + (-vs_TEXCOORD0.xy);
    u_xlat6.xy = vec2(_IsScreenPos) * u_xlat6.xy + vs_TEXCOORD0.xy;
    u_xlat39 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat39 = u_xlat39 * _Time.y;
    u_xlat39 = cos(u_xlat39);
    u_xlat39 = sin(u_xlat39);
    u_xlat32.xy = vec2(u_xlat39) * _Starry_Speed.xxyz.yz + u_xlat6.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(_ViewDir==6.0);
#else
    u_xlatb39 = _ViewDir==6.0;
#endif
    if(u_xlatb39){
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat7.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    } else {
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat8.xyz = vec3(u_xlat39) * u_xlat1.xzy;
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat9.xyz = vec3(u_xlat39) * u_xlat1.zyx;
        u_xlat1.w = (-u_xlat1.z);
        u_xlat39 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat10.xyz = vec3(u_xlat39) * u_xlat1.xyw;
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat11.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat39 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat11.xyz = vec3(u_xlat39) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb39 = !!(_ViewDir==1.0);
#else
        u_xlatb39 = _ViewDir==1.0;
#endif
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat40 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat40 = inversesqrt(u_xlat40);
        u_xlat1.xyz = vec3(u_xlat40) * u_xlat1.xyz;
        u_xlat1.xyz = bool(u_xlatb39) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb3.w) ? u_xlat11.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.z) ? u_xlat10.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.y) ? u_xlat9.xyz : u_xlat1.xyz;
        u_xlat7.xyz = (u_xlatb3.x) ? u_xlat8.xyz : u_xlat1.xyz;
    }
    u_xlat39 = u_xlat7.z + 1.0;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat39 = u_xlat39 * 2.82842708;
    u_xlat1.xy = u_xlat7.xy / vec2(u_xlat39);
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat39 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat39 = u_xlat39 * 3.14159274;
    u_xlat7.x = sin(u_xlat39);
    u_xlat8.x = cos(u_xlat39);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat1.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat1.xy, u_xlat9.xy);
    u_xlat1.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16_1.xyz = texture(_StarryTex, u_xlat1.xy).xyz;
    u_xlat6.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlat32.xy = (-u_xlat6.xy) + u_xlat32.xy;
    u_xlat6.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat32.xy + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_6.xyz = texture(_StarryTex, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + (-u_xlat16_6.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat16_6.xyz;
    u_xlat6.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat1.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat5.xyz = u_xlat16_5.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = sqrt(u_xlat39);
    u_xlat40 = u_xlat39 / _FogDistance;
    u_xlat16_12.x = max(_FogFade, 0.0);
    u_xlat40 = log2(u_xlat40);
    u_xlat40 = u_xlat40 * u_xlat16_12.x;
    u_xlat40 = exp2(u_xlat40);
    u_xlat40 = min(u_xlat40, 1.0);
    u_xlat40 = u_xlat40 * _FogColor.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + _FogColor.xyz;
    u_xlat2.xyz = vec3(u_xlat40) * u_xlat2.xyz;
    u_xlat1.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(vec2(_FoamNoiseTilingScale, _FoamNoiseTilingScale));
    u_xlat16_40 = texture(_WaveNoise, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD0.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat16_2.x = texture(_FoamTex, u_xlat2.xy).x;
    u_xlat39 = u_xlat39 + (-_FoamDepthStartPoint);
    u_xlat15 = float(1.0) / _FoamDepthRange;
    u_xlat39 = u_xlat39 * u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat15;
    u_xlat16_12.xyz = vec3(u_xlat39) * _FoamColor.xyz;
    u_xlat16_12.xyz = u_xlat16_2.xxx * u_xlat16_12.xyz;
    u_xlat2.x = u_xlat16_40 * _FoamNoiseStrength + _FoamDir.x;
    u_xlat2.yz = _FoamDir.yz;
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat2.xyz = vec3(u_xlat39) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = u_xlat0.x + (-_FoamThre);
    u_xlat13 = float(1.0) / _FoamRange;
    u_xlat0.x = u_xlat13 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat13 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _WolrdYDepthColor.xyz;
    u_xlat39 = (-_worldYDepthA) + _worldYDepthB;
    u_xlat40 = vs_TEXCOORD8.x + (-_worldYDepthA);
    u_xlat39 = float(1.0) / u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat0.xyz = (-_WolrdYDepthColor.xyz) * u_xlat0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_TEXCOORD8.y * _Alpha;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump vec4 _WaveA;
uniform 	mediump vec4 _WaveB;
uniform 	mediump vec4 _WaveC;
uniform 	mediump vec4 _WaveD;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _EffectByVertexColor;
uniform 	mediump float _TotalRotate;
uniform 	mediump float _yScale;
uniform 	vec4 _CustomWaveTimeParams;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_23;
vec2 u_xlat34;
mediump float u_xlat16_35;
vec2 u_xlat36;
float u_xlat51;
mediump float u_xlat16_52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = 6.28318548 / _WaveA.w;
    u_xlat16_1.x = _WaveA.z / u_xlat0.x;
    u_xlat16_18.x = 9.80000019 / u_xlat0.x;
    u_xlat16_18.x = sqrt(u_xlat16_18.x);
    u_xlatb17 = 0.5<_CustomWaveTimeParams.x;
    u_xlat17 = (u_xlatb17) ? _CustomWaveTimeParams.y : _Time.y;
    u_xlat34.x = u_xlat17 * u_xlat16_18.x;
    u_xlat2.xy = in_COLOR0.xz * vec2(vec2(_EffectByVertexColor, _EffectByVertexColor)) + in_POSITION0.xz;
    u_xlat16_18.x = dot(_WaveA.xy, _WaveA.xy);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_18.xy = u_xlat16_18.xx * _WaveA.yx;
    u_xlat3.x = sin(_TotalRotate);
    u_xlat4.x = cos(_TotalRotate);
    u_xlat36.xy = u_xlat16_18.xy * u_xlat3.xx;
    u_xlat5.x = u_xlat16_18.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat5.y = u_xlat16_18.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat5.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * _Speed + u_xlat51;
    u_xlat0.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_6.x = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_7;
    u_xlat16_8.y = u_xlat16_1.x * u_xlat16_6.x;
    u_xlat16_8.xz = u_xlat16_18.xx * u_xlat5.xy;
    u_xlat0.x = 6.28318548 / _WaveB.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveB.xy, _WaveB.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xy = u_xlat16_1.xx * _WaveB.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xy;
    u_xlat9.x = u_xlat16_1.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat9.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat16_1.xyz = vec3(vec3(_Speed, _Speed, _Speed)) * vec3(1.29999995, 1.60000002, 1.79999995);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.x + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveB.z / u_xlat0.x;
    u_xlat16_10.x = sin(u_xlat34.x);
    u_xlat16_11 = cos(u_xlat34.x);
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_11;
    u_xlat16_12.y = u_xlat16_1.x * u_xlat16_10.x;
    u_xlat16_12.xz = vec2(u_xlat16_52) * u_xlat9.xy;
    u_xlat16_23.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat0.x = 6.28318548 / _WaveC.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveC.xy, _WaveC.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xw = u_xlat16_1.xx * _WaveC.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xw;
    u_xlat13.x = u_xlat16_1.w * u_xlat4.x + (-u_xlat36.x);
    u_xlat13.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat13.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.y + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveC.z / u_xlat0.x;
    u_xlat16_8.x = sin(u_xlat34.x);
    u_xlat16_12.x = cos(u_xlat34.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_12.x;
    u_xlat16_14.y = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_14.xz = u_xlat16_18.xx * u_xlat13.xy;
    u_xlat16_1.xyw = u_xlat16_23.xyz + u_xlat16_14.xyz;
    u_xlat0.x = 6.28318548 / _WaveD.w;
    u_xlat16_23.x = 9.80000019 / u_xlat0.x;
    u_xlat16_23.x = sqrt(u_xlat16_23.x);
    u_xlat17 = u_xlat17 * u_xlat16_23.x;
    u_xlat16_23.x = dot(_WaveD.xy, _WaveD.xy);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_23.xy = u_xlat16_23.xx * _WaveD.yx;
    u_xlat34.xy = u_xlat3.xx * u_xlat16_23.xy;
    u_xlat3.x = u_xlat16_23.y * u_xlat4.x + (-u_xlat34.x);
    u_xlat3.y = u_xlat16_23.x * u_xlat4.x + u_xlat34.y;
    u_xlat34.x = dot(u_xlat3.xy, u_xlat2.xy);
    u_xlat17 = (-u_xlat17) * u_xlat16_1.z + u_xlat34.x;
    u_xlat17 = u_xlat17 * u_xlat0.x;
    u_xlat16_35 = _WaveD.z / u_xlat0.x;
    u_xlat16_14.x = sin(u_xlat17);
    u_xlat16_15 = cos(u_xlat17);
    u_xlat16_23.x = u_xlat16_35 * u_xlat16_15;
    u_xlat16_16.y = u_xlat16_35 * u_xlat16_14.x;
    u_xlat16_16.xz = u_xlat3.xy * u_xlat16_23.xx;
    u_xlat16_1.xyz = u_xlat16_1.xyw + u_xlat16_16.xyz;
    u_xlat0.xz = u_xlat16_1.xz;
    u_xlat0.y = u_xlat16_1.y * _yScale;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD8.x = u_xlat0.y;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_23.xyz = u_xlat5.xyy * (-u_xlat5.xxy);
    u_xlat16_6.x = u_xlat16_6.x * _WaveA.z;
    u_xlat16_7 = u_xlat16_7 * _WaveA.z;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_23.z;
    u_xlat16_6.yz = u_xlat16_6.xx * u_xlat16_23.yx;
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlat16_16.z = u_xlat5.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat5.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat16_6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat16_16.xyz + vec3(1.0, 0.0, 0.0);
    u_xlat16_6.xyz = u_xlat9.xyy * (-u_xlat9.xxy);
    u_xlat16_57 = u_xlat16_10.x * _WaveB.z;
    u_xlat16_7 = u_xlat16_11 * _WaveB.z;
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_10.y = u_xlat16_6.y;
    u_xlat16_10.z = u_xlat16_7 * u_xlat9.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat9.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat13.xyy * (-u_xlat13.xxy);
    u_xlat16_57 = u_xlat16_8.x * _WaveC.z;
    u_xlat16_7 = u_xlat16_12.x * _WaveC.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat16_7 * u_xlat13.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat13.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat3.xyy * (-u_xlat3.xxy);
    u_xlat16_57 = u_xlat16_14.x * _WaveD.z;
    u_xlat16_7 = u_xlat16_15 * _WaveD.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat3.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat3.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat3.zxy * u_xlat2.yzx + (-u_xlat16_6.xyz);
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
    vs_TEXCOORD3.xyz = (bool(u_xlatb53)) ? in_COLOR0.xyz : u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat3.xyz = vec3(u_xlat53) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    vs_TEXCOORD5.xyz = vec3(u_xlat53) * u_xlat2.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD8.y = in_COLOR0.w;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	vec4 _StarryTex_ST;
uniform 	float _StarryTexRotator;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	mediump float _ViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	mediump float _Alpha;
uniform 	mediump float _EnableCustomFog;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogDistance;
uniform 	mediump float _FogFade;
uniform 	mediump float _FoamThre;
uniform 	mediump float _FoamRange;
uniform 	mediump vec3 _FoamDir;
uniform 	mediump vec3 _FoamColor;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _FoamDepthStartPoint;
uniform 	mediump float _FoamDepthRange;
uniform 	mediump float _FoamNoiseTilingScale;
uniform 	mediump float _FoamNoiseStrength;
uniform 	mediump vec4 _DiffColor;
uniform 	vec4 _FoamTex_ST;
uniform 	mediump float _worldYDepthA;
uniform 	mediump float _worldYDepthB;
uniform 	mediump vec4 _WolrdYDepthColor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform lowp sampler2D _WaveNoise;
uniform lowp sampler2D _FoamTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec2 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
float u_xlat13;
float u_xlat15;
vec3 u_xlat17;
vec2 u_xlat32;
float u_xlat39;
bool u_xlatb39;
float u_xlat40;
lowp float u_xlat10_40;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
    if(u_xlatb0){
        u_xlat0.xyz = vs_TEXCOORD3.xyz;
        u_xlat0.w = 1.0;
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat39 = u_xlat39 + u_xlat39;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat39)) + (-u_xlat1.xyz);
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_2.xyz = texture2D(_Diff, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _DiffColor.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_4.xy = texture2D(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat17.xyz = u_xlat2.xyz * u_xlat10_4.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat1.xyz);
    u_xlat5.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_FW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat6.xyz);
    u_xlat5.xyz = u_xlat6.xyz * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat39 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat5.xyz = vec3(u_xlat39) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat10_4.xxx * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat17.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat5.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_5.xyz = texture2D(_Light, u_xlat5.xy).xyz;
    u_xlat6.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat6.xy = u_xlat6.xy + (-vs_TEXCOORD0.xy);
    u_xlat6.xy = vec2(_IsScreenPos) * u_xlat6.xy + vs_TEXCOORD0.xy;
    u_xlat39 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat39 = u_xlat39 * _Time.y;
    u_xlat39 = cos(u_xlat39);
    u_xlat39 = sin(u_xlat39);
    u_xlat32.xy = vec2(u_xlat39) * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlatb39 = _ViewDir==6.0;
    if(u_xlatb39){
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat7.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    } else {
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat8.xyz = vec3(u_xlat39) * u_xlat1.xzy;
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat9.xyz = vec3(u_xlat39) * u_xlat1.zyx;
        u_xlat1.w = (-u_xlat1.z);
        u_xlat39 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat10.xyz = vec3(u_xlat39) * u_xlat1.xyw;
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat11.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat39 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat11.xyz = vec3(u_xlat39) * u_xlat11.xyz;
        u_xlatb39 = _ViewDir==1.0;
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat40 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat40 = inversesqrt(u_xlat40);
        u_xlat1.xyz = vec3(u_xlat40) * u_xlat1.xyz;
        u_xlat1.xyz = bool(u_xlatb39) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb3.w) ? u_xlat11.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.z) ? u_xlat10.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.y) ? u_xlat9.xyz : u_xlat1.xyz;
        u_xlat7.xyz = (u_xlatb3.x) ? u_xlat8.xyz : u_xlat1.xyz;
    }
    u_xlat39 = u_xlat7.z + 1.0;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat39 = u_xlat39 * 2.82842708;
    u_xlat1.xy = u_xlat7.xy / vec2(u_xlat39);
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat39 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat39 = u_xlat39 * 3.14159274;
    u_xlat7.x = sin(u_xlat39);
    u_xlat8.x = cos(u_xlat39);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat1.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat1.xy, u_xlat9.xy);
    u_xlat1.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat10_1.xyz = texture2D(_StarryTex, u_xlat1.xy).xyz;
    u_xlat6.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlat32.xy = (-u_xlat6.xy) + u_xlat32.xy;
    u_xlat6.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat32.xy + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_6.xyz = texture2D(_StarryTex, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + (-u_xlat10_6.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat10_6.xyz;
    u_xlat6.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat1.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat5.xyz = u_xlat10_5.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = sqrt(u_xlat39);
    u_xlat40 = u_xlat39 / _FogDistance;
    u_xlat16_12.x = max(_FogFade, 0.0);
    u_xlat40 = log2(u_xlat40);
    u_xlat40 = u_xlat40 * u_xlat16_12.x;
    u_xlat40 = exp2(u_xlat40);
    u_xlat40 = min(u_xlat40, 1.0);
    u_xlat40 = u_xlat40 * _FogColor.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + _FogColor.xyz;
    u_xlat2.xyz = vec3(u_xlat40) * u_xlat2.xyz;
    u_xlat1.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(vec2(_FoamNoiseTilingScale, _FoamNoiseTilingScale));
    u_xlat10_40 = texture2D(_WaveNoise, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD0.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat10_2.x = texture2D(_FoamTex, u_xlat2.xy).x;
    u_xlat39 = u_xlat39 + (-_FoamDepthStartPoint);
    u_xlat15 = float(1.0) / _FoamDepthRange;
    u_xlat39 = u_xlat39 * u_xlat15;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat15 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat15;
    u_xlat16_12.xyz = vec3(u_xlat39) * _FoamColor.xyz;
    u_xlat16_12.xyz = u_xlat10_2.xxx * u_xlat16_12.xyz;
    u_xlat2.x = u_xlat10_40 * _FoamNoiseStrength + _FoamDir.x;
    u_xlat2.yz = _FoamDir.yz;
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat2.xyz = vec3(u_xlat39) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = u_xlat0.x + (-_FoamThre);
    u_xlat13 = float(1.0) / _FoamRange;
    u_xlat0.x = u_xlat13 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat13 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _WolrdYDepthColor.xyz;
    u_xlat39 = (-_worldYDepthA) + _worldYDepthB;
    u_xlat40 = vs_TEXCOORD8.x + (-_worldYDepthA);
    u_xlat39 = float(1.0) / u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat40 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat0.xyz = (-_WolrdYDepthColor.xyz) * u_xlat0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_TEXCOORD8.y * _Alpha;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump vec4 _WaveA;
uniform 	mediump vec4 _WaveB;
uniform 	mediump vec4 _WaveC;
uniform 	mediump vec4 _WaveD;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _EffectByVertexColor;
uniform 	mediump float _TotalRotate;
uniform 	mediump float _yScale;
uniform 	vec4 _CustomWaveTimeParams;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_23;
vec2 u_xlat34;
mediump float u_xlat16_35;
vec2 u_xlat36;
float u_xlat51;
mediump float u_xlat16_52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = 6.28318548 / _WaveA.w;
    u_xlat16_1.x = _WaveA.z / u_xlat0.x;
    u_xlat16_18.x = 9.80000019 / u_xlat0.x;
    u_xlat16_18.x = sqrt(u_xlat16_18.x);
    u_xlatb17 = 0.5<_CustomWaveTimeParams.x;
    u_xlat17 = (u_xlatb17) ? _CustomWaveTimeParams.y : _Time.y;
    u_xlat34.x = u_xlat17 * u_xlat16_18.x;
    u_xlat2.xy = in_COLOR0.xz * vec2(vec2(_EffectByVertexColor, _EffectByVertexColor)) + in_POSITION0.xz;
    u_xlat16_18.x = dot(_WaveA.xy, _WaveA.xy);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_18.xy = u_xlat16_18.xx * _WaveA.yx;
    u_xlat3.x = sin(_TotalRotate);
    u_xlat4.x = cos(_TotalRotate);
    u_xlat36.xy = u_xlat16_18.xy * u_xlat3.xx;
    u_xlat5.x = u_xlat16_18.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat5.y = u_xlat16_18.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat5.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * _Speed + u_xlat51;
    u_xlat0.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_6.x = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_7;
    u_xlat16_8.y = u_xlat16_1.x * u_xlat16_6.x;
    u_xlat16_8.xz = u_xlat16_18.xx * u_xlat5.xy;
    u_xlat0.x = 6.28318548 / _WaveB.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveB.xy, _WaveB.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xy = u_xlat16_1.xx * _WaveB.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xy;
    u_xlat9.x = u_xlat16_1.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat9.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat16_1.xyz = vec3(vec3(_Speed, _Speed, _Speed)) * vec3(1.29999995, 1.60000002, 1.79999995);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.x + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveB.z / u_xlat0.x;
    u_xlat16_10.x = sin(u_xlat34.x);
    u_xlat16_11 = cos(u_xlat34.x);
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_11;
    u_xlat16_12.y = u_xlat16_1.x * u_xlat16_10.x;
    u_xlat16_12.xz = vec2(u_xlat16_52) * u_xlat9.xy;
    u_xlat16_23.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat0.x = 6.28318548 / _WaveC.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveC.xy, _WaveC.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xw = u_xlat16_1.xx * _WaveC.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xw;
    u_xlat13.x = u_xlat16_1.w * u_xlat4.x + (-u_xlat36.x);
    u_xlat13.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat13.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.y + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveC.z / u_xlat0.x;
    u_xlat16_8.x = sin(u_xlat34.x);
    u_xlat16_12.x = cos(u_xlat34.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_12.x;
    u_xlat16_14.y = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_14.xz = u_xlat16_18.xx * u_xlat13.xy;
    u_xlat16_1.xyw = u_xlat16_23.xyz + u_xlat16_14.xyz;
    u_xlat0.x = 6.28318548 / _WaveD.w;
    u_xlat16_23.x = 9.80000019 / u_xlat0.x;
    u_xlat16_23.x = sqrt(u_xlat16_23.x);
    u_xlat17 = u_xlat17 * u_xlat16_23.x;
    u_xlat16_23.x = dot(_WaveD.xy, _WaveD.xy);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_23.xy = u_xlat16_23.xx * _WaveD.yx;
    u_xlat34.xy = u_xlat3.xx * u_xlat16_23.xy;
    u_xlat3.x = u_xlat16_23.y * u_xlat4.x + (-u_xlat34.x);
    u_xlat3.y = u_xlat16_23.x * u_xlat4.x + u_xlat34.y;
    u_xlat34.x = dot(u_xlat3.xy, u_xlat2.xy);
    u_xlat17 = (-u_xlat17) * u_xlat16_1.z + u_xlat34.x;
    u_xlat17 = u_xlat17 * u_xlat0.x;
    u_xlat16_35 = _WaveD.z / u_xlat0.x;
    u_xlat16_14.x = sin(u_xlat17);
    u_xlat16_15 = cos(u_xlat17);
    u_xlat16_23.x = u_xlat16_35 * u_xlat16_15;
    u_xlat16_16.y = u_xlat16_35 * u_xlat16_14.x;
    u_xlat16_16.xz = u_xlat3.xy * u_xlat16_23.xx;
    u_xlat16_1.xyz = u_xlat16_1.xyw + u_xlat16_16.xyz;
    u_xlat0.xz = u_xlat16_1.xz;
    u_xlat0.y = u_xlat16_1.y * _yScale;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD8.x = u_xlat0.y;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_23.xyz = u_xlat5.xyy * (-u_xlat5.xxy);
    u_xlat16_6.x = u_xlat16_6.x * _WaveA.z;
    u_xlat16_7 = u_xlat16_7 * _WaveA.z;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_23.z;
    u_xlat16_6.yz = u_xlat16_6.xx * u_xlat16_23.yx;
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlat16_16.z = u_xlat5.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat5.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat16_6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat16_16.xyz + vec3(1.0, 0.0, 0.0);
    u_xlat16_6.xyz = u_xlat9.xyy * (-u_xlat9.xxy);
    u_xlat16_57 = u_xlat16_10.x * _WaveB.z;
    u_xlat16_7 = u_xlat16_11 * _WaveB.z;
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_10.y = u_xlat16_6.y;
    u_xlat16_10.z = u_xlat16_7 * u_xlat9.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat9.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat13.xyy * (-u_xlat13.xxy);
    u_xlat16_57 = u_xlat16_8.x * _WaveC.z;
    u_xlat16_7 = u_xlat16_12.x * _WaveC.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat16_7 * u_xlat13.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat13.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat3.xyy * (-u_xlat3.xxy);
    u_xlat16_57 = u_xlat16_14.x * _WaveD.z;
    u_xlat16_7 = u_xlat16_15 * _WaveD.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat3.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat3.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat3.zxy * u_xlat2.yzx + (-u_xlat16_6.xyz);
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
    vs_TEXCOORD3.xyz = (bool(u_xlatb53)) ? in_COLOR0.xyz : u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat3.xyz = vec3(u_xlat53) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    vs_TEXCOORD5.xyz = vec3(u_xlat53) * u_xlat2.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD8.y = in_COLOR0.w;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	vec4 _StarryTex_ST;
uniform 	float _StarryTexRotator;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	mediump float _ViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	mediump float _Alpha;
uniform 	mediump float _EnableCustomFog;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogDistance;
uniform 	mediump float _FogFade;
uniform 	mediump float _FoamThre;
uniform 	mediump float _FoamRange;
uniform 	mediump vec3 _FoamDir;
uniform 	mediump vec3 _FoamColor;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _FoamDepthStartPoint;
uniform 	mediump float _FoamDepthRange;
uniform 	mediump float _FoamNoiseTilingScale;
uniform 	mediump float _FoamNoiseStrength;
uniform 	mediump vec4 _DiffColor;
uniform 	vec4 _FoamTex_ST;
uniform 	mediump float _worldYDepthA;
uniform 	mediump float _worldYDepthB;
uniform 	mediump vec4 _WolrdYDepthColor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform lowp sampler2D _WaveNoise;
uniform lowp sampler2D _FoamTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec2 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
float u_xlat13;
float u_xlat15;
vec3 u_xlat17;
vec2 u_xlat32;
float u_xlat39;
bool u_xlatb39;
float u_xlat40;
lowp float u_xlat10_40;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
    if(u_xlatb0){
        u_xlat0.xyz = vs_TEXCOORD3.xyz;
        u_xlat0.w = 1.0;
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat39 = u_xlat39 + u_xlat39;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat39)) + (-u_xlat1.xyz);
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_2.xyz = texture2D(_Diff, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _DiffColor.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_4.xy = texture2D(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat17.xyz = u_xlat2.xyz * u_xlat10_4.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat1.xyz);
    u_xlat5.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_FW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat6.xyz);
    u_xlat5.xyz = u_xlat6.xyz * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat39 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat5.xyz = vec3(u_xlat39) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat10_4.xxx * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat17.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat5.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_5.xyz = texture2D(_Light, u_xlat5.xy).xyz;
    u_xlat6.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat6.xy = u_xlat6.xy + (-vs_TEXCOORD0.xy);
    u_xlat6.xy = vec2(_IsScreenPos) * u_xlat6.xy + vs_TEXCOORD0.xy;
    u_xlat39 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat39 = u_xlat39 * _Time.y;
    u_xlat39 = cos(u_xlat39);
    u_xlat39 = sin(u_xlat39);
    u_xlat32.xy = vec2(u_xlat39) * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlatb39 = _ViewDir==6.0;
    if(u_xlatb39){
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat7.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    } else {
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat8.xyz = vec3(u_xlat39) * u_xlat1.xzy;
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat9.xyz = vec3(u_xlat39) * u_xlat1.zyx;
        u_xlat1.w = (-u_xlat1.z);
        u_xlat39 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat10.xyz = vec3(u_xlat39) * u_xlat1.xyw;
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat11.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat39 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat11.xyz = vec3(u_xlat39) * u_xlat11.xyz;
        u_xlatb39 = _ViewDir==1.0;
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat40 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat40 = inversesqrt(u_xlat40);
        u_xlat1.xyz = vec3(u_xlat40) * u_xlat1.xyz;
        u_xlat1.xyz = bool(u_xlatb39) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb3.w) ? u_xlat11.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.z) ? u_xlat10.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.y) ? u_xlat9.xyz : u_xlat1.xyz;
        u_xlat7.xyz = (u_xlatb3.x) ? u_xlat8.xyz : u_xlat1.xyz;
    }
    u_xlat39 = u_xlat7.z + 1.0;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat39 = u_xlat39 * 2.82842708;
    u_xlat1.xy = u_xlat7.xy / vec2(u_xlat39);
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat39 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat39 = u_xlat39 * 3.14159274;
    u_xlat7.x = sin(u_xlat39);
    u_xlat8.x = cos(u_xlat39);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat1.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat1.xy, u_xlat9.xy);
    u_xlat1.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat10_1.xyz = texture2D(_StarryTex, u_xlat1.xy).xyz;
    u_xlat6.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlat32.xy = (-u_xlat6.xy) + u_xlat32.xy;
    u_xlat6.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat32.xy + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_6.xyz = texture2D(_StarryTex, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + (-u_xlat10_6.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat10_6.xyz;
    u_xlat6.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat1.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat5.xyz = u_xlat10_5.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = sqrt(u_xlat39);
    u_xlat40 = u_xlat39 / _FogDistance;
    u_xlat16_12.x = max(_FogFade, 0.0);
    u_xlat40 = log2(u_xlat40);
    u_xlat40 = u_xlat40 * u_xlat16_12.x;
    u_xlat40 = exp2(u_xlat40);
    u_xlat40 = min(u_xlat40, 1.0);
    u_xlat40 = u_xlat40 * _FogColor.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + _FogColor.xyz;
    u_xlat2.xyz = vec3(u_xlat40) * u_xlat2.xyz;
    u_xlat1.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(vec2(_FoamNoiseTilingScale, _FoamNoiseTilingScale));
    u_xlat10_40 = texture2D(_WaveNoise, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD0.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat10_2.x = texture2D(_FoamTex, u_xlat2.xy).x;
    u_xlat39 = u_xlat39 + (-_FoamDepthStartPoint);
    u_xlat15 = float(1.0) / _FoamDepthRange;
    u_xlat39 = u_xlat39 * u_xlat15;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat15 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat15;
    u_xlat16_12.xyz = vec3(u_xlat39) * _FoamColor.xyz;
    u_xlat16_12.xyz = u_xlat10_2.xxx * u_xlat16_12.xyz;
    u_xlat2.x = u_xlat10_40 * _FoamNoiseStrength + _FoamDir.x;
    u_xlat2.yz = _FoamDir.yz;
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat2.xyz = vec3(u_xlat39) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = u_xlat0.x + (-_FoamThre);
    u_xlat13 = float(1.0) / _FoamRange;
    u_xlat0.x = u_xlat13 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat13 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _WolrdYDepthColor.xyz;
    u_xlat39 = (-_worldYDepthA) + _worldYDepthB;
    u_xlat40 = vs_TEXCOORD8.x + (-_worldYDepthA);
    u_xlat39 = float(1.0) / u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat40 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat0.xyz = (-_WolrdYDepthColor.xyz) * u_xlat0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_TEXCOORD8.y * _Alpha;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump vec4 _WaveA;
uniform 	mediump vec4 _WaveB;
uniform 	mediump vec4 _WaveC;
uniform 	mediump vec4 _WaveD;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _EffectByVertexColor;
uniform 	mediump float _TotalRotate;
uniform 	mediump float _yScale;
uniform 	vec4 _CustomWaveTimeParams;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_23;
vec2 u_xlat34;
mediump float u_xlat16_35;
vec2 u_xlat36;
float u_xlat51;
mediump float u_xlat16_52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = 6.28318548 / _WaveA.w;
    u_xlat16_1.x = _WaveA.z / u_xlat0.x;
    u_xlat16_18.x = 9.80000019 / u_xlat0.x;
    u_xlat16_18.x = sqrt(u_xlat16_18.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.5<_CustomWaveTimeParams.x);
#else
    u_xlatb17 = 0.5<_CustomWaveTimeParams.x;
#endif
    u_xlat17 = (u_xlatb17) ? _CustomWaveTimeParams.y : _Time.y;
    u_xlat34.x = u_xlat17 * u_xlat16_18.x;
    u_xlat2.xy = in_COLOR0.xz * vec2(vec2(_EffectByVertexColor, _EffectByVertexColor)) + in_POSITION0.xz;
    u_xlat16_18.x = dot(_WaveA.xy, _WaveA.xy);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_18.xy = u_xlat16_18.xx * _WaveA.yx;
    u_xlat3.x = sin(_TotalRotate);
    u_xlat4.x = cos(_TotalRotate);
    u_xlat36.xy = u_xlat16_18.xy * u_xlat3.xx;
    u_xlat5.x = u_xlat16_18.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat5.y = u_xlat16_18.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat5.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * _Speed + u_xlat51;
    u_xlat0.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_6.x = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_7;
    u_xlat16_8.y = u_xlat16_1.x * u_xlat16_6.x;
    u_xlat16_8.xz = u_xlat16_18.xx * u_xlat5.xy;
    u_xlat0.x = 6.28318548 / _WaveB.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveB.xy, _WaveB.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xy = u_xlat16_1.xx * _WaveB.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xy;
    u_xlat9.x = u_xlat16_1.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat9.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat16_1.xyz = vec3(vec3(_Speed, _Speed, _Speed)) * vec3(1.29999995, 1.60000002, 1.79999995);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.x + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveB.z / u_xlat0.x;
    u_xlat16_10.x = sin(u_xlat34.x);
    u_xlat16_11 = cos(u_xlat34.x);
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_11;
    u_xlat16_12.y = u_xlat16_1.x * u_xlat16_10.x;
    u_xlat16_12.xz = vec2(u_xlat16_52) * u_xlat9.xy;
    u_xlat16_23.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat0.x = 6.28318548 / _WaveC.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveC.xy, _WaveC.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xw = u_xlat16_1.xx * _WaveC.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xw;
    u_xlat13.x = u_xlat16_1.w * u_xlat4.x + (-u_xlat36.x);
    u_xlat13.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat13.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.y + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveC.z / u_xlat0.x;
    u_xlat16_8.x = sin(u_xlat34.x);
    u_xlat16_12.x = cos(u_xlat34.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_12.x;
    u_xlat16_14.y = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_14.xz = u_xlat16_18.xx * u_xlat13.xy;
    u_xlat16_1.xyw = u_xlat16_23.xyz + u_xlat16_14.xyz;
    u_xlat0.x = 6.28318548 / _WaveD.w;
    u_xlat16_23.x = 9.80000019 / u_xlat0.x;
    u_xlat16_23.x = sqrt(u_xlat16_23.x);
    u_xlat17 = u_xlat17 * u_xlat16_23.x;
    u_xlat16_23.x = dot(_WaveD.xy, _WaveD.xy);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_23.xy = u_xlat16_23.xx * _WaveD.yx;
    u_xlat34.xy = u_xlat3.xx * u_xlat16_23.xy;
    u_xlat3.x = u_xlat16_23.y * u_xlat4.x + (-u_xlat34.x);
    u_xlat3.y = u_xlat16_23.x * u_xlat4.x + u_xlat34.y;
    u_xlat34.x = dot(u_xlat3.xy, u_xlat2.xy);
    u_xlat17 = (-u_xlat17) * u_xlat16_1.z + u_xlat34.x;
    u_xlat17 = u_xlat17 * u_xlat0.x;
    u_xlat16_35 = _WaveD.z / u_xlat0.x;
    u_xlat16_14.x = sin(u_xlat17);
    u_xlat16_15 = cos(u_xlat17);
    u_xlat16_23.x = u_xlat16_35 * u_xlat16_15;
    u_xlat16_16.y = u_xlat16_35 * u_xlat16_14.x;
    u_xlat16_16.xz = u_xlat3.xy * u_xlat16_23.xx;
    u_xlat16_1.xyz = u_xlat16_1.xyw + u_xlat16_16.xyz;
    u_xlat0.xz = u_xlat16_1.xz;
    u_xlat0.y = u_xlat16_1.y * _yScale;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD8.x = u_xlat0.y;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat1;
    u_xlat16_23.xyz = u_xlat5.xyy * (-u_xlat5.xxy);
    u_xlat16_6.x = u_xlat16_6.x * _WaveA.z;
    u_xlat16_7 = u_xlat16_7 * _WaveA.z;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_23.z;
    u_xlat16_6.yz = u_xlat16_6.xx * u_xlat16_23.yx;
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlat16_16.z = u_xlat5.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat5.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat16_6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat16_16.xyz + vec3(1.0, 0.0, 0.0);
    u_xlat16_6.xyz = u_xlat9.xyy * (-u_xlat9.xxy);
    u_xlat16_57 = u_xlat16_10.x * _WaveB.z;
    u_xlat16_7 = u_xlat16_11 * _WaveB.z;
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_10.y = u_xlat16_6.y;
    u_xlat16_10.z = u_xlat16_7 * u_xlat9.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat9.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat13.xyy * (-u_xlat13.xxy);
    u_xlat16_57 = u_xlat16_8.x * _WaveC.z;
    u_xlat16_7 = u_xlat16_12.x * _WaveC.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat16_7 * u_xlat13.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat13.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat3.xyy * (-u_xlat3.xxy);
    u_xlat16_57 = u_xlat16_14.x * _WaveD.z;
    u_xlat16_7 = u_xlat16_15 * _WaveD.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat3.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat3.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat3.zxy * u_xlat2.yzx + (-u_xlat16_6.xyz);
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor));
#else
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
#endif
    vs_TEXCOORD3.xyz = (bool(u_xlatb53)) ? in_COLOR0.xyz : u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat3.xyz = vec3(u_xlat53) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    vs_TEXCOORD5.xyz = vec3(u_xlat53) * u_xlat2.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat0 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat1.zzzz + u_xlat0;
    vs_TEXCOORD7 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD8.y = in_COLOR0.w;
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
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _StarryTex_ST;
uniform 	float _StarryTexRotator;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	mediump float _ViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	mediump float _Alpha;
uniform 	mediump float _EnableCustomFog;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogDistance;
uniform 	mediump float _FogFade;
uniform 	mediump float _FoamThre;
uniform 	mediump float _FoamRange;
uniform 	mediump vec3 _FoamDir;
uniform 	mediump vec3 _FoamColor;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _FoamDepthStartPoint;
uniform 	mediump float _FoamDepthRange;
uniform 	mediump float _FoamNoiseTilingScale;
uniform 	mediump float _FoamNoiseStrength;
uniform 	mediump vec4 _DiffColor;
uniform 	vec4 _FoamTex_ST;
uniform 	mediump float _worldYDepthA;
uniform 	mediump float _worldYDepthB;
uniform 	mediump vec4 _WolrdYDepthColor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(6) uniform mediump sampler2D _WaveNoise;
UNITY_LOCATION(7) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(8) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(9) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
float u_xlat13;
float u_xlat15;
vec3 u_xlat17;
float u_xlat27;
vec2 u_xlat32;
float u_xlat39;
mediump float u_xlat16_39;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
bool u_xlatb41;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
#endif
    if(u_xlatb0){
        u_xlat0.xyz = vs_TEXCOORD3.xyz;
        u_xlat0.w = 1.0;
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat39 = u_xlat39 + u_xlat39;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat39)) + (-u_xlat1.xyz);
    u_xlat2.xyz = vs_TEXCOORD7.xyz / vs_TEXCOORD7.www;
    u_xlat4.xyz = u_xlat2.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xyz = u_xlat2.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xyz = u_xlat2.xyz + _ShadowOffsets[2].xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xyz = u_xlat2.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat39 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat2.x = (-_LightShadowData.x) + 1.0;
    u_xlat39 = u_xlat39 * u_xlat2.x + _LightShadowData.x;
    u_xlat39 = u_xlat39 + -1.0;
    u_xlat39 = _ReceiveShadowsStrength * u_xlat39 + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_2.xyz = texture(_Diff, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _DiffColor.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_4.xy = texture(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat17.xyz = u_xlat2.xyz * u_xlat16_4.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat1.xyz);
    u_xlat5.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_FW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat6.xyz);
    u_xlat5.xyz = u_xlat6.xyz * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat41 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat5.xyz = vec3(u_xlat41) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_4.xxx * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat17.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat5.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_5.xyz = texture(_Light, u_xlat5.xy).xyz;
    u_xlat6.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat6.xy = u_xlat6.xy + (-vs_TEXCOORD0.xy);
    u_xlat6.xy = vec2(_IsScreenPos) * u_xlat6.xy + vs_TEXCOORD0.xy;
    u_xlat41 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat41 = u_xlat41 * _Time.y;
    u_xlat41 = cos(u_xlat41);
    u_xlat41 = sin(u_xlat41);
    u_xlat32.xy = vec2(u_xlat41) * _Starry_Speed.xxyz.yz + u_xlat6.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(_ViewDir==6.0);
#else
    u_xlatb41 = _ViewDir==6.0;
#endif
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat7.xyz = u_xlat1.xyz * vec3(u_xlat41);
    } else {
        u_xlat41 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat8.xyz = u_xlat1.xzy * vec3(u_xlat41);
        u_xlat41 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat9.xyz = u_xlat1.zyx * vec3(u_xlat41);
        u_xlat1.w = (-u_xlat1.z);
        u_xlat41 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat10.xyz = u_xlat1.xyw * vec3(u_xlat41);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat11.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat40 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlat40 = inversesqrt(u_xlat40);
        u_xlat11.xyz = vec3(u_xlat40) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb40 = !!(_ViewDir==1.0);
#else
        u_xlatb40 = _ViewDir==1.0;
#endif
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat41 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat41);
        u_xlat1.xyz = bool(u_xlatb40) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb3.w) ? u_xlat11.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.z) ? u_xlat10.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.y) ? u_xlat9.xyz : u_xlat1.xyz;
        u_xlat7.xyz = (u_xlatb3.x) ? u_xlat8.xyz : u_xlat1.xyz;
    }
    u_xlat1.x = u_xlat7.z + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 2.82842708;
    u_xlat1.xy = u_xlat7.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat27 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat27 = u_xlat27 * 3.14159274;
    u_xlat7.x = sin(u_xlat27);
    u_xlat8.x = cos(u_xlat27);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat1.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat1.xy, u_xlat9.xy);
    u_xlat1.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16_1.xyz = texture(_StarryTex, u_xlat1.xy).xyz;
    u_xlat6.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlat32.xy = (-u_xlat6.xy) + u_xlat32.xy;
    u_xlat6.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat32.xy + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_6.xyz = texture(_StarryTex, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + (-u_xlat16_6.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat16_6.xyz;
    u_xlat6.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat1.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat5.xyz = u_xlat16_5.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat2.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat40 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat41 = u_xlat40 / _FogDistance;
    u_xlat16_12.x = max(_FogFade, 0.0);
    u_xlat41 = log2(u_xlat41);
    u_xlat41 = u_xlat41 * u_xlat16_12.x;
    u_xlat41 = exp2(u_xlat41);
    u_xlat41 = min(u_xlat41, 1.0);
    u_xlat41 = u_xlat41 * _FogColor.w;
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat39) + _FogColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat41);
    u_xlat1.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(vec2(_FoamNoiseTilingScale, _FoamNoiseTilingScale));
    u_xlat16_39 = texture(_WaveNoise, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD0.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat16_2.x = texture(_FoamTex, u_xlat2.xy).x;
    u_xlat40 = u_xlat40 + (-_FoamDepthStartPoint);
    u_xlat15 = float(1.0) / _FoamDepthRange;
    u_xlat40 = u_xlat40 * u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15;
    u_xlat16_12.xyz = vec3(u_xlat40) * _FoamColor.xyz;
    u_xlat16_12.xyz = u_xlat16_2.xxx * u_xlat16_12.xyz;
    u_xlat2.x = u_xlat16_39 * _FoamNoiseStrength + _FoamDir.x;
    u_xlat2.yz = _FoamDir.yz;
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat2.xyz = vec3(u_xlat39) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = u_xlat0.x + (-_FoamThre);
    u_xlat13 = float(1.0) / _FoamRange;
    u_xlat0.x = u_xlat13 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat13 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _WolrdYDepthColor.xyz;
    u_xlat39 = (-_worldYDepthA) + _worldYDepthB;
    u_xlat40 = vs_TEXCOORD8.x + (-_worldYDepthA);
    u_xlat39 = float(1.0) / u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat0.xyz = (-_WolrdYDepthColor.xyz) * u_xlat0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_TEXCOORD8.y * _Alpha;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump vec4 _WaveA;
uniform 	mediump vec4 _WaveB;
uniform 	mediump vec4 _WaveC;
uniform 	mediump vec4 _WaveD;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _EffectByVertexColor;
uniform 	mediump float _TotalRotate;
uniform 	mediump float _yScale;
uniform 	vec4 _CustomWaveTimeParams;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_23;
vec2 u_xlat34;
mediump float u_xlat16_35;
vec2 u_xlat36;
float u_xlat51;
mediump float u_xlat16_52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = 6.28318548 / _WaveA.w;
    u_xlat16_1.x = _WaveA.z / u_xlat0.x;
    u_xlat16_18.x = 9.80000019 / u_xlat0.x;
    u_xlat16_18.x = sqrt(u_xlat16_18.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.5<_CustomWaveTimeParams.x);
#else
    u_xlatb17 = 0.5<_CustomWaveTimeParams.x;
#endif
    u_xlat17 = (u_xlatb17) ? _CustomWaveTimeParams.y : _Time.y;
    u_xlat34.x = u_xlat17 * u_xlat16_18.x;
    u_xlat2.xy = in_COLOR0.xz * vec2(vec2(_EffectByVertexColor, _EffectByVertexColor)) + in_POSITION0.xz;
    u_xlat16_18.x = dot(_WaveA.xy, _WaveA.xy);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_18.xy = u_xlat16_18.xx * _WaveA.yx;
    u_xlat3.x = sin(_TotalRotate);
    u_xlat4.x = cos(_TotalRotate);
    u_xlat36.xy = u_xlat16_18.xy * u_xlat3.xx;
    u_xlat5.x = u_xlat16_18.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat5.y = u_xlat16_18.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat5.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * _Speed + u_xlat51;
    u_xlat0.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_6.x = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_7;
    u_xlat16_8.y = u_xlat16_1.x * u_xlat16_6.x;
    u_xlat16_8.xz = u_xlat16_18.xx * u_xlat5.xy;
    u_xlat0.x = 6.28318548 / _WaveB.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveB.xy, _WaveB.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xy = u_xlat16_1.xx * _WaveB.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xy;
    u_xlat9.x = u_xlat16_1.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat9.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat16_1.xyz = vec3(vec3(_Speed, _Speed, _Speed)) * vec3(1.29999995, 1.60000002, 1.79999995);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.x + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveB.z / u_xlat0.x;
    u_xlat16_10.x = sin(u_xlat34.x);
    u_xlat16_11 = cos(u_xlat34.x);
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_11;
    u_xlat16_12.y = u_xlat16_1.x * u_xlat16_10.x;
    u_xlat16_12.xz = vec2(u_xlat16_52) * u_xlat9.xy;
    u_xlat16_23.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat0.x = 6.28318548 / _WaveC.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveC.xy, _WaveC.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xw = u_xlat16_1.xx * _WaveC.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xw;
    u_xlat13.x = u_xlat16_1.w * u_xlat4.x + (-u_xlat36.x);
    u_xlat13.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat13.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.y + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveC.z / u_xlat0.x;
    u_xlat16_8.x = sin(u_xlat34.x);
    u_xlat16_12.x = cos(u_xlat34.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_12.x;
    u_xlat16_14.y = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_14.xz = u_xlat16_18.xx * u_xlat13.xy;
    u_xlat16_1.xyw = u_xlat16_23.xyz + u_xlat16_14.xyz;
    u_xlat0.x = 6.28318548 / _WaveD.w;
    u_xlat16_23.x = 9.80000019 / u_xlat0.x;
    u_xlat16_23.x = sqrt(u_xlat16_23.x);
    u_xlat17 = u_xlat17 * u_xlat16_23.x;
    u_xlat16_23.x = dot(_WaveD.xy, _WaveD.xy);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_23.xy = u_xlat16_23.xx * _WaveD.yx;
    u_xlat34.xy = u_xlat3.xx * u_xlat16_23.xy;
    u_xlat3.x = u_xlat16_23.y * u_xlat4.x + (-u_xlat34.x);
    u_xlat3.y = u_xlat16_23.x * u_xlat4.x + u_xlat34.y;
    u_xlat34.x = dot(u_xlat3.xy, u_xlat2.xy);
    u_xlat17 = (-u_xlat17) * u_xlat16_1.z + u_xlat34.x;
    u_xlat17 = u_xlat17 * u_xlat0.x;
    u_xlat16_35 = _WaveD.z / u_xlat0.x;
    u_xlat16_14.x = sin(u_xlat17);
    u_xlat16_15 = cos(u_xlat17);
    u_xlat16_23.x = u_xlat16_35 * u_xlat16_15;
    u_xlat16_16.y = u_xlat16_35 * u_xlat16_14.x;
    u_xlat16_16.xz = u_xlat3.xy * u_xlat16_23.xx;
    u_xlat16_1.xyz = u_xlat16_1.xyw + u_xlat16_16.xyz;
    u_xlat0.xz = u_xlat16_1.xz;
    u_xlat0.y = u_xlat16_1.y * _yScale;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD8.x = u_xlat0.y;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat1;
    u_xlat16_23.xyz = u_xlat5.xyy * (-u_xlat5.xxy);
    u_xlat16_6.x = u_xlat16_6.x * _WaveA.z;
    u_xlat16_7 = u_xlat16_7 * _WaveA.z;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_23.z;
    u_xlat16_6.yz = u_xlat16_6.xx * u_xlat16_23.yx;
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlat16_16.z = u_xlat5.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat5.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat16_6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat16_16.xyz + vec3(1.0, 0.0, 0.0);
    u_xlat16_6.xyz = u_xlat9.xyy * (-u_xlat9.xxy);
    u_xlat16_57 = u_xlat16_10.x * _WaveB.z;
    u_xlat16_7 = u_xlat16_11 * _WaveB.z;
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_10.y = u_xlat16_6.y;
    u_xlat16_10.z = u_xlat16_7 * u_xlat9.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat9.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat13.xyy * (-u_xlat13.xxy);
    u_xlat16_57 = u_xlat16_8.x * _WaveC.z;
    u_xlat16_7 = u_xlat16_12.x * _WaveC.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat16_7 * u_xlat13.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat13.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat3.xyy * (-u_xlat3.xxy);
    u_xlat16_57 = u_xlat16_14.x * _WaveD.z;
    u_xlat16_7 = u_xlat16_15 * _WaveD.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat3.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat3.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat3.zxy * u_xlat2.yzx + (-u_xlat16_6.xyz);
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor));
#else
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
#endif
    vs_TEXCOORD3.xyz = (bool(u_xlatb53)) ? in_COLOR0.xyz : u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat3.xyz = vec3(u_xlat53) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    vs_TEXCOORD5.xyz = vec3(u_xlat53) * u_xlat2.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat0 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat1.zzzz + u_xlat0;
    vs_TEXCOORD7 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD8.y = in_COLOR0.w;
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
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _StarryTex_ST;
uniform 	float _StarryTexRotator;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	mediump float _ViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	mediump float _Alpha;
uniform 	mediump float _EnableCustomFog;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogDistance;
uniform 	mediump float _FogFade;
uniform 	mediump float _FoamThre;
uniform 	mediump float _FoamRange;
uniform 	mediump vec3 _FoamDir;
uniform 	mediump vec3 _FoamColor;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _FoamDepthStartPoint;
uniform 	mediump float _FoamDepthRange;
uniform 	mediump float _FoamNoiseTilingScale;
uniform 	mediump float _FoamNoiseStrength;
uniform 	mediump vec4 _DiffColor;
uniform 	vec4 _FoamTex_ST;
uniform 	mediump float _worldYDepthA;
uniform 	mediump float _worldYDepthB;
uniform 	mediump vec4 _WolrdYDepthColor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(6) uniform mediump sampler2D _WaveNoise;
UNITY_LOCATION(7) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(8) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(9) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
float u_xlat13;
float u_xlat15;
vec3 u_xlat17;
float u_xlat27;
vec2 u_xlat32;
float u_xlat39;
mediump float u_xlat16_39;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
bool u_xlatb41;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
#endif
    if(u_xlatb0){
        u_xlat0.xyz = vs_TEXCOORD3.xyz;
        u_xlat0.w = 1.0;
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat39 = u_xlat39 + u_xlat39;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat39)) + (-u_xlat1.xyz);
    u_xlat2.xyz = vs_TEXCOORD7.xyz / vs_TEXCOORD7.www;
    u_xlat4.xyz = u_xlat2.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat4.xyz = u_xlat2.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat4.xyz = u_xlat2.xyz + _ShadowOffsets[2].xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xyz = u_xlat2.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat39 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat2.x = (-_LightShadowData.x) + 1.0;
    u_xlat39 = u_xlat39 * u_xlat2.x + _LightShadowData.x;
    u_xlat39 = u_xlat39 + -1.0;
    u_xlat39 = _ReceiveShadowsStrength * u_xlat39 + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_2.xyz = texture(_Diff, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _DiffColor.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_4.xy = texture(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat17.xyz = u_xlat2.xyz * u_xlat16_4.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat1.xyz);
    u_xlat5.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_FW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat6.xyz);
    u_xlat5.xyz = u_xlat6.xyz * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat41 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat5.xyz = vec3(u_xlat41) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_4.xxx * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat17.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat5.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_5.xyz = texture(_Light, u_xlat5.xy).xyz;
    u_xlat6.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat6.xy = u_xlat6.xy + (-vs_TEXCOORD0.xy);
    u_xlat6.xy = vec2(_IsScreenPos) * u_xlat6.xy + vs_TEXCOORD0.xy;
    u_xlat41 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat41 = u_xlat41 * _Time.y;
    u_xlat41 = cos(u_xlat41);
    u_xlat41 = sin(u_xlat41);
    u_xlat32.xy = vec2(u_xlat41) * _Starry_Speed.xxyz.yz + u_xlat6.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb41 = !!(_ViewDir==6.0);
#else
    u_xlatb41 = _ViewDir==6.0;
#endif
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat7.xyz = u_xlat1.xyz * vec3(u_xlat41);
    } else {
        u_xlat41 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat8.xyz = u_xlat1.xzy * vec3(u_xlat41);
        u_xlat41 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat9.xyz = u_xlat1.zyx * vec3(u_xlat41);
        u_xlat1.w = (-u_xlat1.z);
        u_xlat41 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat10.xyz = u_xlat1.xyw * vec3(u_xlat41);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat11.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat40 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlat40 = inversesqrt(u_xlat40);
        u_xlat11.xyz = vec3(u_xlat40) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb40 = !!(_ViewDir==1.0);
#else
        u_xlatb40 = _ViewDir==1.0;
#endif
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat41 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat41);
        u_xlat1.xyz = bool(u_xlatb40) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb3.w) ? u_xlat11.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.z) ? u_xlat10.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.y) ? u_xlat9.xyz : u_xlat1.xyz;
        u_xlat7.xyz = (u_xlatb3.x) ? u_xlat8.xyz : u_xlat1.xyz;
    }
    u_xlat1.x = u_xlat7.z + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 2.82842708;
    u_xlat1.xy = u_xlat7.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat27 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat27 = u_xlat27 * 3.14159274;
    u_xlat7.x = sin(u_xlat27);
    u_xlat8.x = cos(u_xlat27);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat1.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat1.xy, u_xlat9.xy);
    u_xlat1.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16_1.xyz = texture(_StarryTex, u_xlat1.xy).xyz;
    u_xlat6.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlat32.xy = (-u_xlat6.xy) + u_xlat32.xy;
    u_xlat6.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat32.xy + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_6.xyz = texture(_StarryTex, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + (-u_xlat16_6.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat16_6.xyz;
    u_xlat6.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat1.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat5.xyz = u_xlat16_5.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat2.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat40 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat41 = u_xlat40 / _FogDistance;
    u_xlat16_12.x = max(_FogFade, 0.0);
    u_xlat41 = log2(u_xlat41);
    u_xlat41 = u_xlat41 * u_xlat16_12.x;
    u_xlat41 = exp2(u_xlat41);
    u_xlat41 = min(u_xlat41, 1.0);
    u_xlat41 = u_xlat41 * _FogColor.w;
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat39) + _FogColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat41);
    u_xlat1.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(vec2(_FoamNoiseTilingScale, _FoamNoiseTilingScale));
    u_xlat16_39 = texture(_WaveNoise, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD0.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat16_2.x = texture(_FoamTex, u_xlat2.xy).x;
    u_xlat40 = u_xlat40 + (-_FoamDepthStartPoint);
    u_xlat15 = float(1.0) / _FoamDepthRange;
    u_xlat40 = u_xlat40 * u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15;
    u_xlat16_12.xyz = vec3(u_xlat40) * _FoamColor.xyz;
    u_xlat16_12.xyz = u_xlat16_2.xxx * u_xlat16_12.xyz;
    u_xlat2.x = u_xlat16_39 * _FoamNoiseStrength + _FoamDir.x;
    u_xlat2.yz = _FoamDir.yz;
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat2.xyz = vec3(u_xlat39) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = u_xlat0.x + (-_FoamThre);
    u_xlat13 = float(1.0) / _FoamRange;
    u_xlat0.x = u_xlat13 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat13 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _WolrdYDepthColor.xyz;
    u_xlat39 = (-_worldYDepthA) + _worldYDepthB;
    u_xlat40 = vs_TEXCOORD8.x + (-_worldYDepthA);
    u_xlat39 = float(1.0) / u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat0.xyz = (-_WolrdYDepthColor.xyz) * u_xlat0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_TEXCOORD8.y * _Alpha;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump vec4 _WaveA;
uniform 	mediump vec4 _WaveB;
uniform 	mediump vec4 _WaveC;
uniform 	mediump vec4 _WaveD;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _EffectByVertexColor;
uniform 	mediump float _TotalRotate;
uniform 	mediump float _yScale;
uniform 	vec4 _CustomWaveTimeParams;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_23;
vec2 u_xlat34;
mediump float u_xlat16_35;
vec2 u_xlat36;
float u_xlat51;
mediump float u_xlat16_52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = 6.28318548 / _WaveA.w;
    u_xlat16_1.x = _WaveA.z / u_xlat0.x;
    u_xlat16_18.x = 9.80000019 / u_xlat0.x;
    u_xlat16_18.x = sqrt(u_xlat16_18.x);
    u_xlatb17 = 0.5<_CustomWaveTimeParams.x;
    u_xlat17 = (u_xlatb17) ? _CustomWaveTimeParams.y : _Time.y;
    u_xlat34.x = u_xlat17 * u_xlat16_18.x;
    u_xlat2.xy = in_COLOR0.xz * vec2(vec2(_EffectByVertexColor, _EffectByVertexColor)) + in_POSITION0.xz;
    u_xlat16_18.x = dot(_WaveA.xy, _WaveA.xy);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_18.xy = u_xlat16_18.xx * _WaveA.yx;
    u_xlat3.x = sin(_TotalRotate);
    u_xlat4.x = cos(_TotalRotate);
    u_xlat36.xy = u_xlat16_18.xy * u_xlat3.xx;
    u_xlat5.x = u_xlat16_18.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat5.y = u_xlat16_18.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat5.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * _Speed + u_xlat51;
    u_xlat0.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_6.x = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_7;
    u_xlat16_8.y = u_xlat16_1.x * u_xlat16_6.x;
    u_xlat16_8.xz = u_xlat16_18.xx * u_xlat5.xy;
    u_xlat0.x = 6.28318548 / _WaveB.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveB.xy, _WaveB.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xy = u_xlat16_1.xx * _WaveB.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xy;
    u_xlat9.x = u_xlat16_1.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat9.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat16_1.xyz = vec3(vec3(_Speed, _Speed, _Speed)) * vec3(1.29999995, 1.60000002, 1.79999995);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.x + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveB.z / u_xlat0.x;
    u_xlat16_10.x = sin(u_xlat34.x);
    u_xlat16_11 = cos(u_xlat34.x);
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_11;
    u_xlat16_12.y = u_xlat16_1.x * u_xlat16_10.x;
    u_xlat16_12.xz = vec2(u_xlat16_52) * u_xlat9.xy;
    u_xlat16_23.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat0.x = 6.28318548 / _WaveC.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveC.xy, _WaveC.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xw = u_xlat16_1.xx * _WaveC.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xw;
    u_xlat13.x = u_xlat16_1.w * u_xlat4.x + (-u_xlat36.x);
    u_xlat13.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat13.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.y + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveC.z / u_xlat0.x;
    u_xlat16_8.x = sin(u_xlat34.x);
    u_xlat16_12.x = cos(u_xlat34.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_12.x;
    u_xlat16_14.y = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_14.xz = u_xlat16_18.xx * u_xlat13.xy;
    u_xlat16_1.xyw = u_xlat16_23.xyz + u_xlat16_14.xyz;
    u_xlat0.x = 6.28318548 / _WaveD.w;
    u_xlat16_23.x = 9.80000019 / u_xlat0.x;
    u_xlat16_23.x = sqrt(u_xlat16_23.x);
    u_xlat17 = u_xlat17 * u_xlat16_23.x;
    u_xlat16_23.x = dot(_WaveD.xy, _WaveD.xy);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_23.xy = u_xlat16_23.xx * _WaveD.yx;
    u_xlat34.xy = u_xlat3.xx * u_xlat16_23.xy;
    u_xlat3.x = u_xlat16_23.y * u_xlat4.x + (-u_xlat34.x);
    u_xlat3.y = u_xlat16_23.x * u_xlat4.x + u_xlat34.y;
    u_xlat34.x = dot(u_xlat3.xy, u_xlat2.xy);
    u_xlat17 = (-u_xlat17) * u_xlat16_1.z + u_xlat34.x;
    u_xlat17 = u_xlat17 * u_xlat0.x;
    u_xlat16_35 = _WaveD.z / u_xlat0.x;
    u_xlat16_14.x = sin(u_xlat17);
    u_xlat16_15 = cos(u_xlat17);
    u_xlat16_23.x = u_xlat16_35 * u_xlat16_15;
    u_xlat16_16.y = u_xlat16_35 * u_xlat16_14.x;
    u_xlat16_16.xz = u_xlat3.xy * u_xlat16_23.xx;
    u_xlat16_1.xyz = u_xlat16_1.xyw + u_xlat16_16.xyz;
    u_xlat0.xz = u_xlat16_1.xz;
    u_xlat0.y = u_xlat16_1.y * _yScale;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD8.x = u_xlat0.y;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat1;
    u_xlat16_23.xyz = u_xlat5.xyy * (-u_xlat5.xxy);
    u_xlat16_6.x = u_xlat16_6.x * _WaveA.z;
    u_xlat16_7 = u_xlat16_7 * _WaveA.z;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_23.z;
    u_xlat16_6.yz = u_xlat16_6.xx * u_xlat16_23.yx;
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlat16_16.z = u_xlat5.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat5.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat16_6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat16_16.xyz + vec3(1.0, 0.0, 0.0);
    u_xlat16_6.xyz = u_xlat9.xyy * (-u_xlat9.xxy);
    u_xlat16_57 = u_xlat16_10.x * _WaveB.z;
    u_xlat16_7 = u_xlat16_11 * _WaveB.z;
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_10.y = u_xlat16_6.y;
    u_xlat16_10.z = u_xlat16_7 * u_xlat9.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat9.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat13.xyy * (-u_xlat13.xxy);
    u_xlat16_57 = u_xlat16_8.x * _WaveC.z;
    u_xlat16_7 = u_xlat16_12.x * _WaveC.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat16_7 * u_xlat13.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat13.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat3.xyy * (-u_xlat3.xxy);
    u_xlat16_57 = u_xlat16_14.x * _WaveD.z;
    u_xlat16_7 = u_xlat16_15 * _WaveD.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat3.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat3.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat3.zxy * u_xlat2.yzx + (-u_xlat16_6.xyz);
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
    vs_TEXCOORD3.xyz = (bool(u_xlatb53)) ? in_COLOR0.xyz : u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat3.xyz = vec3(u_xlat53) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    vs_TEXCOORD5.xyz = vec3(u_xlat53) * u_xlat2.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat0 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat1.zzzz + u_xlat0;
    vs_TEXCOORD7 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD8.y = in_COLOR0.w;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _StarryTex_ST;
uniform 	float _StarryTexRotator;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	mediump float _ViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	mediump float _Alpha;
uniform 	mediump float _EnableCustomFog;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogDistance;
uniform 	mediump float _FogFade;
uniform 	mediump float _FoamThre;
uniform 	mediump float _FoamRange;
uniform 	mediump vec3 _FoamDir;
uniform 	mediump vec3 _FoamColor;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _FoamDepthStartPoint;
uniform 	mediump float _FoamDepthRange;
uniform 	mediump float _FoamNoiseTilingScale;
uniform 	mediump float _FoamNoiseStrength;
uniform 	mediump vec4 _DiffColor;
uniform 	vec4 _FoamTex_ST;
uniform 	mediump float _worldYDepthA;
uniform 	mediump float _worldYDepthB;
uniform 	mediump vec4 _WolrdYDepthColor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform lowp sampler2D _WaveNoise;
uniform lowp sampler2D _FoamTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec2 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
float u_xlat13;
float u_xlat15;
vec3 u_xlat17;
float u_xlat27;
vec2 u_xlat32;
float u_xlat39;
lowp float u_xlat10_39;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
bool u_xlatb41;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
    if(u_xlatb0){
        u_xlat0.xyz = vs_TEXCOORD3.xyz;
        u_xlat0.w = 1.0;
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat39 = u_xlat39 + u_xlat39;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat39)) + (-u_xlat1.xyz);
    u_xlat2.xyz = vs_TEXCOORD7.xyz / vs_TEXCOORD7.www;
    u_xlat4.xyz = u_xlat2.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
    u_xlat4.xyz = u_xlat2.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
    u_xlat4.xyz = u_xlat2.xyz + _ShadowOffsets[2].xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
    u_xlat2.xyz = u_xlat2.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat3.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
    u_xlat39 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat2.x = (-_LightShadowData.x) + 1.0;
    u_xlat39 = u_xlat39 * u_xlat2.x + _LightShadowData.x;
    u_xlat39 = u_xlat39 + -1.0;
    u_xlat39 = _ReceiveShadowsStrength * u_xlat39 + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_2.xyz = texture2D(_Diff, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _DiffColor.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_4.xy = texture2D(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat17.xyz = u_xlat2.xyz * u_xlat10_4.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat1.xyz);
    u_xlat5.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_FW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat6.xyz);
    u_xlat5.xyz = u_xlat6.xyz * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat41 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat5.xyz = vec3(u_xlat41) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat10_4.xxx * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat17.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat5.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_5.xyz = texture2D(_Light, u_xlat5.xy).xyz;
    u_xlat6.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat6.xy = u_xlat6.xy + (-vs_TEXCOORD0.xy);
    u_xlat6.xy = vec2(_IsScreenPos) * u_xlat6.xy + vs_TEXCOORD0.xy;
    u_xlat41 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat41 = u_xlat41 * _Time.y;
    u_xlat41 = cos(u_xlat41);
    u_xlat41 = sin(u_xlat41);
    u_xlat32.xy = vec2(u_xlat41) * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlatb41 = _ViewDir==6.0;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat7.xyz = u_xlat1.xyz * vec3(u_xlat41);
    } else {
        u_xlat41 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat8.xyz = u_xlat1.xzy * vec3(u_xlat41);
        u_xlat41 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat9.xyz = u_xlat1.zyx * vec3(u_xlat41);
        u_xlat1.w = (-u_xlat1.z);
        u_xlat41 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat10.xyz = u_xlat1.xyw * vec3(u_xlat41);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat11.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat40 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlat40 = inversesqrt(u_xlat40);
        u_xlat11.xyz = vec3(u_xlat40) * u_xlat11.xyz;
        u_xlatb40 = _ViewDir==1.0;
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat41 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat41);
        u_xlat1.xyz = bool(u_xlatb40) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb3.w) ? u_xlat11.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.z) ? u_xlat10.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.y) ? u_xlat9.xyz : u_xlat1.xyz;
        u_xlat7.xyz = (u_xlatb3.x) ? u_xlat8.xyz : u_xlat1.xyz;
    }
    u_xlat1.x = u_xlat7.z + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 2.82842708;
    u_xlat1.xy = u_xlat7.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat27 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat27 = u_xlat27 * 3.14159274;
    u_xlat7.x = sin(u_xlat27);
    u_xlat8.x = cos(u_xlat27);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat1.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat1.xy, u_xlat9.xy);
    u_xlat1.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat10_1.xyz = texture2D(_StarryTex, u_xlat1.xy).xyz;
    u_xlat6.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlat32.xy = (-u_xlat6.xy) + u_xlat32.xy;
    u_xlat6.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat32.xy + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_6.xyz = texture2D(_StarryTex, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + (-u_xlat10_6.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat10_6.xyz;
    u_xlat6.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat1.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat5.xyz = u_xlat10_5.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat2.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat40 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat41 = u_xlat40 / _FogDistance;
    u_xlat16_12.x = max(_FogFade, 0.0);
    u_xlat41 = log2(u_xlat41);
    u_xlat41 = u_xlat41 * u_xlat16_12.x;
    u_xlat41 = exp2(u_xlat41);
    u_xlat41 = min(u_xlat41, 1.0);
    u_xlat41 = u_xlat41 * _FogColor.w;
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat39) + _FogColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat41);
    u_xlat1.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(vec2(_FoamNoiseTilingScale, _FoamNoiseTilingScale));
    u_xlat10_39 = texture2D(_WaveNoise, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD0.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat10_2.x = texture2D(_FoamTex, u_xlat2.xy).x;
    u_xlat40 = u_xlat40 + (-_FoamDepthStartPoint);
    u_xlat15 = float(1.0) / _FoamDepthRange;
    u_xlat40 = u_xlat40 * u_xlat15;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat15 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15;
    u_xlat16_12.xyz = vec3(u_xlat40) * _FoamColor.xyz;
    u_xlat16_12.xyz = u_xlat10_2.xxx * u_xlat16_12.xyz;
    u_xlat2.x = u_xlat10_39 * _FoamNoiseStrength + _FoamDir.x;
    u_xlat2.yz = _FoamDir.yz;
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat2.xyz = vec3(u_xlat39) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = u_xlat0.x + (-_FoamThre);
    u_xlat13 = float(1.0) / _FoamRange;
    u_xlat0.x = u_xlat13 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat13 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _WolrdYDepthColor.xyz;
    u_xlat39 = (-_worldYDepthA) + _worldYDepthB;
    u_xlat40 = vs_TEXCOORD8.x + (-_worldYDepthA);
    u_xlat39 = float(1.0) / u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat40 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat0.xyz = (-_WolrdYDepthColor.xyz) * u_xlat0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_TEXCOORD8.y * _Alpha;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump vec4 _WaveA;
uniform 	mediump vec4 _WaveB;
uniform 	mediump vec4 _WaveC;
uniform 	mediump vec4 _WaveD;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _EffectByVertexColor;
uniform 	mediump float _TotalRotate;
uniform 	mediump float _yScale;
uniform 	vec4 _CustomWaveTimeParams;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_23;
vec2 u_xlat34;
mediump float u_xlat16_35;
vec2 u_xlat36;
float u_xlat51;
mediump float u_xlat16_52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = 6.28318548 / _WaveA.w;
    u_xlat16_1.x = _WaveA.z / u_xlat0.x;
    u_xlat16_18.x = 9.80000019 / u_xlat0.x;
    u_xlat16_18.x = sqrt(u_xlat16_18.x);
    u_xlatb17 = 0.5<_CustomWaveTimeParams.x;
    u_xlat17 = (u_xlatb17) ? _CustomWaveTimeParams.y : _Time.y;
    u_xlat34.x = u_xlat17 * u_xlat16_18.x;
    u_xlat2.xy = in_COLOR0.xz * vec2(vec2(_EffectByVertexColor, _EffectByVertexColor)) + in_POSITION0.xz;
    u_xlat16_18.x = dot(_WaveA.xy, _WaveA.xy);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_18.xy = u_xlat16_18.xx * _WaveA.yx;
    u_xlat3.x = sin(_TotalRotate);
    u_xlat4.x = cos(_TotalRotate);
    u_xlat36.xy = u_xlat16_18.xy * u_xlat3.xx;
    u_xlat5.x = u_xlat16_18.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat5.y = u_xlat16_18.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat5.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * _Speed + u_xlat51;
    u_xlat0.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_6.x = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_7;
    u_xlat16_8.y = u_xlat16_1.x * u_xlat16_6.x;
    u_xlat16_8.xz = u_xlat16_18.xx * u_xlat5.xy;
    u_xlat0.x = 6.28318548 / _WaveB.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveB.xy, _WaveB.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xy = u_xlat16_1.xx * _WaveB.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xy;
    u_xlat9.x = u_xlat16_1.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat9.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat16_1.xyz = vec3(vec3(_Speed, _Speed, _Speed)) * vec3(1.29999995, 1.60000002, 1.79999995);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.x + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveB.z / u_xlat0.x;
    u_xlat16_10.x = sin(u_xlat34.x);
    u_xlat16_11 = cos(u_xlat34.x);
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_11;
    u_xlat16_12.y = u_xlat16_1.x * u_xlat16_10.x;
    u_xlat16_12.xz = vec2(u_xlat16_52) * u_xlat9.xy;
    u_xlat16_23.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat0.x = 6.28318548 / _WaveC.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveC.xy, _WaveC.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xw = u_xlat16_1.xx * _WaveC.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xw;
    u_xlat13.x = u_xlat16_1.w * u_xlat4.x + (-u_xlat36.x);
    u_xlat13.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat13.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.y + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveC.z / u_xlat0.x;
    u_xlat16_8.x = sin(u_xlat34.x);
    u_xlat16_12.x = cos(u_xlat34.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_12.x;
    u_xlat16_14.y = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_14.xz = u_xlat16_18.xx * u_xlat13.xy;
    u_xlat16_1.xyw = u_xlat16_23.xyz + u_xlat16_14.xyz;
    u_xlat0.x = 6.28318548 / _WaveD.w;
    u_xlat16_23.x = 9.80000019 / u_xlat0.x;
    u_xlat16_23.x = sqrt(u_xlat16_23.x);
    u_xlat17 = u_xlat17 * u_xlat16_23.x;
    u_xlat16_23.x = dot(_WaveD.xy, _WaveD.xy);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_23.xy = u_xlat16_23.xx * _WaveD.yx;
    u_xlat34.xy = u_xlat3.xx * u_xlat16_23.xy;
    u_xlat3.x = u_xlat16_23.y * u_xlat4.x + (-u_xlat34.x);
    u_xlat3.y = u_xlat16_23.x * u_xlat4.x + u_xlat34.y;
    u_xlat34.x = dot(u_xlat3.xy, u_xlat2.xy);
    u_xlat17 = (-u_xlat17) * u_xlat16_1.z + u_xlat34.x;
    u_xlat17 = u_xlat17 * u_xlat0.x;
    u_xlat16_35 = _WaveD.z / u_xlat0.x;
    u_xlat16_14.x = sin(u_xlat17);
    u_xlat16_15 = cos(u_xlat17);
    u_xlat16_23.x = u_xlat16_35 * u_xlat16_15;
    u_xlat16_16.y = u_xlat16_35 * u_xlat16_14.x;
    u_xlat16_16.xz = u_xlat3.xy * u_xlat16_23.xx;
    u_xlat16_1.xyz = u_xlat16_1.xyw + u_xlat16_16.xyz;
    u_xlat0.xz = u_xlat16_1.xz;
    u_xlat0.y = u_xlat16_1.y * _yScale;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD8.x = u_xlat0.y;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat2;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat1;
    u_xlat16_23.xyz = u_xlat5.xyy * (-u_xlat5.xxy);
    u_xlat16_6.x = u_xlat16_6.x * _WaveA.z;
    u_xlat16_7 = u_xlat16_7 * _WaveA.z;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_23.z;
    u_xlat16_6.yz = u_xlat16_6.xx * u_xlat16_23.yx;
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlat16_16.z = u_xlat5.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat5.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat16_6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat16_16.xyz + vec3(1.0, 0.0, 0.0);
    u_xlat16_6.xyz = u_xlat9.xyy * (-u_xlat9.xxy);
    u_xlat16_57 = u_xlat16_10.x * _WaveB.z;
    u_xlat16_7 = u_xlat16_11 * _WaveB.z;
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_10.y = u_xlat16_6.y;
    u_xlat16_10.z = u_xlat16_7 * u_xlat9.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat9.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat13.xyy * (-u_xlat13.xxy);
    u_xlat16_57 = u_xlat16_8.x * _WaveC.z;
    u_xlat16_7 = u_xlat16_12.x * _WaveC.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat16_7 * u_xlat13.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat13.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat3.xyy * (-u_xlat3.xxy);
    u_xlat16_57 = u_xlat16_14.x * _WaveD.z;
    u_xlat16_7 = u_xlat16_15 * _WaveD.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat3.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat3.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat3.zxy * u_xlat2.yzx + (-u_xlat16_6.xyz);
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
    vs_TEXCOORD3.xyz = (bool(u_xlatb53)) ? in_COLOR0.xyz : u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat3.xyz = vec3(u_xlat53) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    vs_TEXCOORD5.xyz = vec3(u_xlat53) * u_xlat2.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat0 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat1.zzzz + u_xlat0;
    vs_TEXCOORD7 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD8.y = in_COLOR0.w;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _ShadowOffsets[4];
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _StarryTex_ST;
uniform 	float _StarryTexRotator;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	mediump float _ViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	mediump float _Alpha;
uniform 	mediump float _EnableCustomFog;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogDistance;
uniform 	mediump float _FogFade;
uniform 	mediump float _FoamThre;
uniform 	mediump float _FoamRange;
uniform 	mediump vec3 _FoamDir;
uniform 	mediump vec3 _FoamColor;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _FoamDepthStartPoint;
uniform 	mediump float _FoamDepthRange;
uniform 	mediump float _FoamNoiseTilingScale;
uniform 	mediump float _FoamNoiseStrength;
uniform 	mediump vec4 _DiffColor;
uniform 	vec4 _FoamTex_ST;
uniform 	mediump float _worldYDepthA;
uniform 	mediump float _worldYDepthB;
uniform 	mediump vec4 _WolrdYDepthColor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform lowp sampler2D _WaveNoise;
uniform lowp sampler2D _FoamTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec2 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
float u_xlat13;
float u_xlat15;
vec3 u_xlat17;
float u_xlat27;
vec2 u_xlat32;
float u_xlat39;
lowp float u_xlat10_39;
float u_xlat40;
bool u_xlatb40;
float u_xlat41;
bool u_xlatb41;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
    if(u_xlatb0){
        u_xlat0.xyz = vs_TEXCOORD3.xyz;
        u_xlat0.w = 1.0;
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat39 = u_xlat39 + u_xlat39;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat39)) + (-u_xlat1.xyz);
    u_xlat2.xyz = vs_TEXCOORD7.xyz / vs_TEXCOORD7.www;
    u_xlat4.xyz = u_xlat2.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
    u_xlat4.xyz = u_xlat2.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
    u_xlat4.xyz = u_xlat2.xyz + _ShadowOffsets[2].xyz;
    vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat3.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
    u_xlat2.xyz = u_xlat2.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat3.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
    u_xlat39 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat2.x = (-_LightShadowData.x) + 1.0;
    u_xlat39 = u_xlat39 * u_xlat2.x + _LightShadowData.x;
    u_xlat39 = u_xlat39 + -1.0;
    u_xlat39 = _ReceiveShadowsStrength * u_xlat39 + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_2.xyz = texture2D(_Diff, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _DiffColor.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_4.xy = texture2D(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat17.xyz = u_xlat2.xyz * u_xlat10_4.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat1.xyz);
    u_xlat5.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_FW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat6.xyz);
    u_xlat5.xyz = u_xlat6.xyz * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat41 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat5.xyz = vec3(u_xlat41) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat10_4.xxx * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat17.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat5.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_5.xyz = texture2D(_Light, u_xlat5.xy).xyz;
    u_xlat6.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat6.xy = u_xlat6.xy + (-vs_TEXCOORD0.xy);
    u_xlat6.xy = vec2(_IsScreenPos) * u_xlat6.xy + vs_TEXCOORD0.xy;
    u_xlat41 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat41 = u_xlat41 * _Time.y;
    u_xlat41 = cos(u_xlat41);
    u_xlat41 = sin(u_xlat41);
    u_xlat32.xy = vec2(u_xlat41) * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlatb41 = _ViewDir==6.0;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat7.xyz = u_xlat1.xyz * vec3(u_xlat41);
    } else {
        u_xlat41 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat8.xyz = u_xlat1.xzy * vec3(u_xlat41);
        u_xlat41 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat9.xyz = u_xlat1.zyx * vec3(u_xlat41);
        u_xlat1.w = (-u_xlat1.z);
        u_xlat41 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat10.xyz = u_xlat1.xyw * vec3(u_xlat41);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat11.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat40 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlat40 = inversesqrt(u_xlat40);
        u_xlat11.xyz = vec3(u_xlat40) * u_xlat11.xyz;
        u_xlatb40 = _ViewDir==1.0;
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat41 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat41 = inversesqrt(u_xlat41);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat41);
        u_xlat1.xyz = bool(u_xlatb40) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb3.w) ? u_xlat11.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.z) ? u_xlat10.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.y) ? u_xlat9.xyz : u_xlat1.xyz;
        u_xlat7.xyz = (u_xlatb3.x) ? u_xlat8.xyz : u_xlat1.xyz;
    }
    u_xlat1.x = u_xlat7.z + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 2.82842708;
    u_xlat1.xy = u_xlat7.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat27 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat27 = u_xlat27 * 3.14159274;
    u_xlat7.x = sin(u_xlat27);
    u_xlat8.x = cos(u_xlat27);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat1.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat1.xy, u_xlat9.xy);
    u_xlat1.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat10_1.xyz = texture2D(_StarryTex, u_xlat1.xy).xyz;
    u_xlat6.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlat32.xy = (-u_xlat6.xy) + u_xlat32.xy;
    u_xlat6.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat32.xy + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_6.xyz = texture2D(_StarryTex, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + (-u_xlat10_6.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat10_6.xyz;
    u_xlat6.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat1.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat5.xyz = u_xlat10_5.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat2.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat40 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat40 = sqrt(u_xlat40);
    u_xlat41 = u_xlat40 / _FogDistance;
    u_xlat16_12.x = max(_FogFade, 0.0);
    u_xlat41 = log2(u_xlat41);
    u_xlat41 = u_xlat41 * u_xlat16_12.x;
    u_xlat41 = exp2(u_xlat41);
    u_xlat41 = min(u_xlat41, 1.0);
    u_xlat41 = u_xlat41 * _FogColor.w;
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat39) + _FogColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat41);
    u_xlat1.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(vec2(_FoamNoiseTilingScale, _FoamNoiseTilingScale));
    u_xlat10_39 = texture2D(_WaveNoise, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD0.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat10_2.x = texture2D(_FoamTex, u_xlat2.xy).x;
    u_xlat40 = u_xlat40 + (-_FoamDepthStartPoint);
    u_xlat15 = float(1.0) / _FoamDepthRange;
    u_xlat40 = u_xlat40 * u_xlat15;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat15 = u_xlat40 * -2.0 + 3.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat15;
    u_xlat16_12.xyz = vec3(u_xlat40) * _FoamColor.xyz;
    u_xlat16_12.xyz = u_xlat10_2.xxx * u_xlat16_12.xyz;
    u_xlat2.x = u_xlat10_39 * _FoamNoiseStrength + _FoamDir.x;
    u_xlat2.yz = _FoamDir.yz;
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat2.xyz = vec3(u_xlat39) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = u_xlat0.x + (-_FoamThre);
    u_xlat13 = float(1.0) / _FoamRange;
    u_xlat0.x = u_xlat13 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat13 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _WolrdYDepthColor.xyz;
    u_xlat39 = (-_worldYDepthA) + _worldYDepthB;
    u_xlat40 = vs_TEXCOORD8.x + (-_worldYDepthA);
    u_xlat39 = float(1.0) / u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat40 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat0.xyz = (-_WolrdYDepthColor.xyz) * u_xlat0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_TEXCOORD8.y * _Alpha;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump vec4 _WaveA;
uniform 	mediump vec4 _WaveB;
uniform 	mediump vec4 _WaveC;
uniform 	mediump vec4 _WaveD;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _EffectByVertexColor;
uniform 	mediump float _TotalRotate;
uniform 	mediump float _yScale;
uniform 	vec4 _CustomWaveTimeParams;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_23;
vec2 u_xlat34;
mediump float u_xlat16_35;
vec2 u_xlat36;
float u_xlat51;
mediump float u_xlat16_52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = 6.28318548 / _WaveA.w;
    u_xlat16_1.x = _WaveA.z / u_xlat0.x;
    u_xlat16_18.x = 9.80000019 / u_xlat0.x;
    u_xlat16_18.x = sqrt(u_xlat16_18.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.5<_CustomWaveTimeParams.x);
#else
    u_xlatb17 = 0.5<_CustomWaveTimeParams.x;
#endif
    u_xlat17 = (u_xlatb17) ? _CustomWaveTimeParams.y : _Time.y;
    u_xlat34.x = u_xlat17 * u_xlat16_18.x;
    u_xlat2.xy = in_COLOR0.xz * vec2(vec2(_EffectByVertexColor, _EffectByVertexColor)) + in_POSITION0.xz;
    u_xlat16_18.x = dot(_WaveA.xy, _WaveA.xy);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_18.xy = u_xlat16_18.xx * _WaveA.yx;
    u_xlat3.x = sin(_TotalRotate);
    u_xlat4.x = cos(_TotalRotate);
    u_xlat36.xy = u_xlat16_18.xy * u_xlat3.xx;
    u_xlat5.x = u_xlat16_18.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat5.y = u_xlat16_18.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat5.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * _Speed + u_xlat51;
    u_xlat0.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_6.x = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_7;
    u_xlat16_8.y = u_xlat16_1.x * u_xlat16_6.x;
    u_xlat16_8.xz = u_xlat16_18.xx * u_xlat5.xy;
    u_xlat0.x = 6.28318548 / _WaveB.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveB.xy, _WaveB.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xy = u_xlat16_1.xx * _WaveB.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xy;
    u_xlat9.x = u_xlat16_1.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat9.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat16_1.xyz = vec3(vec3(_Speed, _Speed, _Speed)) * vec3(1.29999995, 1.60000002, 1.79999995);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.x + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveB.z / u_xlat0.x;
    u_xlat16_10.x = sin(u_xlat34.x);
    u_xlat16_11 = cos(u_xlat34.x);
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_11;
    u_xlat16_12.y = u_xlat16_1.x * u_xlat16_10.x;
    u_xlat16_12.xz = vec2(u_xlat16_52) * u_xlat9.xy;
    u_xlat16_23.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat0.x = 6.28318548 / _WaveC.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveC.xy, _WaveC.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xw = u_xlat16_1.xx * _WaveC.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xw;
    u_xlat13.x = u_xlat16_1.w * u_xlat4.x + (-u_xlat36.x);
    u_xlat13.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat13.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.y + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveC.z / u_xlat0.x;
    u_xlat16_8.x = sin(u_xlat34.x);
    u_xlat16_12.x = cos(u_xlat34.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_12.x;
    u_xlat16_14.y = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_14.xz = u_xlat16_18.xx * u_xlat13.xy;
    u_xlat16_1.xyw = u_xlat16_23.xyz + u_xlat16_14.xyz;
    u_xlat0.x = 6.28318548 / _WaveD.w;
    u_xlat16_23.x = 9.80000019 / u_xlat0.x;
    u_xlat16_23.x = sqrt(u_xlat16_23.x);
    u_xlat17 = u_xlat17 * u_xlat16_23.x;
    u_xlat16_23.x = dot(_WaveD.xy, _WaveD.xy);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_23.xy = u_xlat16_23.xx * _WaveD.yx;
    u_xlat34.xy = u_xlat3.xx * u_xlat16_23.xy;
    u_xlat3.x = u_xlat16_23.y * u_xlat4.x + (-u_xlat34.x);
    u_xlat3.y = u_xlat16_23.x * u_xlat4.x + u_xlat34.y;
    u_xlat34.x = dot(u_xlat3.xy, u_xlat2.xy);
    u_xlat17 = (-u_xlat17) * u_xlat16_1.z + u_xlat34.x;
    u_xlat17 = u_xlat17 * u_xlat0.x;
    u_xlat16_35 = _WaveD.z / u_xlat0.x;
    u_xlat16_14.x = sin(u_xlat17);
    u_xlat16_15 = cos(u_xlat17);
    u_xlat16_23.x = u_xlat16_35 * u_xlat16_15;
    u_xlat16_16.y = u_xlat16_35 * u_xlat16_14.x;
    u_xlat16_16.xz = u_xlat3.xy * u_xlat16_23.xx;
    u_xlat16_1.xyz = u_xlat16_1.xyw + u_xlat16_16.xyz;
    u_xlat0.xz = u_xlat16_1.xz;
    u_xlat0.y = u_xlat16_1.y * _yScale;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD8.x = u_xlat0.y;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_23.xyz = u_xlat5.xyy * (-u_xlat5.xxy);
    u_xlat16_6.x = u_xlat16_6.x * _WaveA.z;
    u_xlat16_7 = u_xlat16_7 * _WaveA.z;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_23.z;
    u_xlat16_6.yz = u_xlat16_6.xx * u_xlat16_23.yx;
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlat16_16.z = u_xlat5.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat5.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat16_6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat16_16.xyz + vec3(1.0, 0.0, 0.0);
    u_xlat16_6.xyz = u_xlat9.xyy * (-u_xlat9.xxy);
    u_xlat16_57 = u_xlat16_10.x * _WaveB.z;
    u_xlat16_7 = u_xlat16_11 * _WaveB.z;
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_10.y = u_xlat16_6.y;
    u_xlat16_10.z = u_xlat16_7 * u_xlat9.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat9.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat13.xyy * (-u_xlat13.xxy);
    u_xlat16_57 = u_xlat16_8.x * _WaveC.z;
    u_xlat16_7 = u_xlat16_12.x * _WaveC.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat16_7 * u_xlat13.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat13.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat3.xyy * (-u_xlat3.xxy);
    u_xlat16_57 = u_xlat16_14.x * _WaveD.z;
    u_xlat16_7 = u_xlat16_15 * _WaveD.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat3.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat3.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat3.zxy * u_xlat2.yzx + (-u_xlat16_6.xyz);
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor));
#else
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
#endif
    vs_TEXCOORD3.xyz = (bool(u_xlatb53)) ? in_COLOR0.xyz : u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat3.xyz = vec3(u_xlat53) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    vs_TEXCOORD5.xyz = vec3(u_xlat53) * u_xlat2.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD8.y = in_COLOR0.w;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	vec4 _StarryTex_ST;
uniform 	float _StarryTexRotator;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	mediump float _ViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	mediump float _Alpha;
uniform 	mediump float _EnableCustomFog;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogDistance;
uniform 	mediump float _FogFade;
uniform 	mediump float _FoamThre;
uniform 	mediump float _FoamRange;
uniform 	mediump vec3 _FoamDir;
uniform 	mediump vec3 _FoamColor;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _FoamDepthStartPoint;
uniform 	mediump float _FoamDepthRange;
uniform 	mediump float _FoamNoiseTilingScale;
uniform 	mediump float _FoamNoiseStrength;
uniform 	mediump vec4 _DiffColor;
uniform 	vec4 _FoamTex_ST;
uniform 	mediump float _worldYDepthA;
uniform 	mediump float _worldYDepthB;
uniform 	mediump vec4 _WolrdYDepthColor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(6) uniform mediump sampler2D _WaveNoise;
UNITY_LOCATION(7) uniform mediump sampler2D _FoamTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
float u_xlat13;
float u_xlat15;
vec3 u_xlat17;
vec2 u_xlat32;
float u_xlat39;
bool u_xlatb39;
float u_xlat40;
mediump float u_xlat16_40;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
#endif
    if(u_xlatb0){
        u_xlat0.xyz = vs_TEXCOORD3.xyz;
        u_xlat0.w = 1.0;
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat39 = u_xlat39 + u_xlat39;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat39)) + (-u_xlat1.xyz);
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_2.xyz = texture(_Diff, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _DiffColor.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_4.xy = texture(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat17.xyz = u_xlat2.xyz * u_xlat16_4.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat1.xyz);
    u_xlat5.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_FW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat6.xyz);
    u_xlat5.xyz = u_xlat6.xyz * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat39 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat5.xyz = vec3(u_xlat39) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_4.xxx * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat17.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat5.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_5.xyz = texture(_Light, u_xlat5.xy).xyz;
    u_xlat6.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat6.xy = u_xlat6.xy + (-vs_TEXCOORD0.xy);
    u_xlat6.xy = vec2(_IsScreenPos) * u_xlat6.xy + vs_TEXCOORD0.xy;
    u_xlat39 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat39 = u_xlat39 * _Time.y;
    u_xlat39 = cos(u_xlat39);
    u_xlat39 = sin(u_xlat39);
    u_xlat32.xy = vec2(u_xlat39) * _Starry_Speed.xxyz.yz + u_xlat6.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(_ViewDir==6.0);
#else
    u_xlatb39 = _ViewDir==6.0;
#endif
    if(u_xlatb39){
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat7.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    } else {
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat8.xyz = vec3(u_xlat39) * u_xlat1.xzy;
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat9.xyz = vec3(u_xlat39) * u_xlat1.zyx;
        u_xlat1.w = (-u_xlat1.z);
        u_xlat39 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat10.xyz = vec3(u_xlat39) * u_xlat1.xyw;
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat11.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat39 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat11.xyz = vec3(u_xlat39) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb39 = !!(_ViewDir==1.0);
#else
        u_xlatb39 = _ViewDir==1.0;
#endif
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat40 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat40 = inversesqrt(u_xlat40);
        u_xlat1.xyz = vec3(u_xlat40) * u_xlat1.xyz;
        u_xlat1.xyz = bool(u_xlatb39) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb3.w) ? u_xlat11.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.z) ? u_xlat10.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.y) ? u_xlat9.xyz : u_xlat1.xyz;
        u_xlat7.xyz = (u_xlatb3.x) ? u_xlat8.xyz : u_xlat1.xyz;
    }
    u_xlat39 = u_xlat7.z + 1.0;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat39 = u_xlat39 * 2.82842708;
    u_xlat1.xy = u_xlat7.xy / vec2(u_xlat39);
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat39 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat39 = u_xlat39 * 3.14159274;
    u_xlat7.x = sin(u_xlat39);
    u_xlat8.x = cos(u_xlat39);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat1.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat1.xy, u_xlat9.xy);
    u_xlat1.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16_1.xyz = texture(_StarryTex, u_xlat1.xy).xyz;
    u_xlat6.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlat32.xy = (-u_xlat6.xy) + u_xlat32.xy;
    u_xlat6.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat32.xy + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_6.xyz = texture(_StarryTex, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + (-u_xlat16_6.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat16_6.xyz;
    u_xlat6.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat1.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat5.xyz = u_xlat16_5.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = sqrt(u_xlat39);
    u_xlat40 = u_xlat39 / _FogDistance;
    u_xlat16_12.x = max(_FogFade, 0.0);
    u_xlat40 = log2(u_xlat40);
    u_xlat40 = u_xlat40 * u_xlat16_12.x;
    u_xlat40 = exp2(u_xlat40);
    u_xlat40 = min(u_xlat40, 1.0);
    u_xlat40 = u_xlat40 * _FogColor.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + _FogColor.xyz;
    u_xlat2.xyz = vec3(u_xlat40) * u_xlat2.xyz;
    u_xlat1.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(vec2(_FoamNoiseTilingScale, _FoamNoiseTilingScale));
    u_xlat16_40 = texture(_WaveNoise, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD0.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat16_2.x = texture(_FoamTex, u_xlat2.xy).x;
    u_xlat39 = u_xlat39 + (-_FoamDepthStartPoint);
    u_xlat15 = float(1.0) / _FoamDepthRange;
    u_xlat39 = u_xlat39 * u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat15;
    u_xlat16_12.xyz = vec3(u_xlat39) * _FoamColor.xyz;
    u_xlat16_12.xyz = u_xlat16_2.xxx * u_xlat16_12.xyz;
    u_xlat2.x = u_xlat16_40 * _FoamNoiseStrength + _FoamDir.x;
    u_xlat2.yz = _FoamDir.yz;
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat2.xyz = vec3(u_xlat39) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = u_xlat0.x + (-_FoamThre);
    u_xlat13 = float(1.0) / _FoamRange;
    u_xlat0.x = u_xlat13 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat13 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _WolrdYDepthColor.xyz;
    u_xlat39 = (-_worldYDepthA) + _worldYDepthB;
    u_xlat40 = vs_TEXCOORD8.x + (-_worldYDepthA);
    u_xlat39 = float(1.0) / u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat0.xyz = (-_WolrdYDepthColor.xyz) * u_xlat0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_TEXCOORD8.y * _Alpha;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump vec4 _WaveA;
uniform 	mediump vec4 _WaveB;
uniform 	mediump vec4 _WaveC;
uniform 	mediump vec4 _WaveD;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _EffectByVertexColor;
uniform 	mediump float _TotalRotate;
uniform 	mediump float _yScale;
uniform 	vec4 _CustomWaveTimeParams;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_23;
vec2 u_xlat34;
mediump float u_xlat16_35;
vec2 u_xlat36;
float u_xlat51;
mediump float u_xlat16_52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = 6.28318548 / _WaveA.w;
    u_xlat16_1.x = _WaveA.z / u_xlat0.x;
    u_xlat16_18.x = 9.80000019 / u_xlat0.x;
    u_xlat16_18.x = sqrt(u_xlat16_18.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.5<_CustomWaveTimeParams.x);
#else
    u_xlatb17 = 0.5<_CustomWaveTimeParams.x;
#endif
    u_xlat17 = (u_xlatb17) ? _CustomWaveTimeParams.y : _Time.y;
    u_xlat34.x = u_xlat17 * u_xlat16_18.x;
    u_xlat2.xy = in_COLOR0.xz * vec2(vec2(_EffectByVertexColor, _EffectByVertexColor)) + in_POSITION0.xz;
    u_xlat16_18.x = dot(_WaveA.xy, _WaveA.xy);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_18.xy = u_xlat16_18.xx * _WaveA.yx;
    u_xlat3.x = sin(_TotalRotate);
    u_xlat4.x = cos(_TotalRotate);
    u_xlat36.xy = u_xlat16_18.xy * u_xlat3.xx;
    u_xlat5.x = u_xlat16_18.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat5.y = u_xlat16_18.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat5.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * _Speed + u_xlat51;
    u_xlat0.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_6.x = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_7;
    u_xlat16_8.y = u_xlat16_1.x * u_xlat16_6.x;
    u_xlat16_8.xz = u_xlat16_18.xx * u_xlat5.xy;
    u_xlat0.x = 6.28318548 / _WaveB.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveB.xy, _WaveB.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xy = u_xlat16_1.xx * _WaveB.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xy;
    u_xlat9.x = u_xlat16_1.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat9.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat16_1.xyz = vec3(vec3(_Speed, _Speed, _Speed)) * vec3(1.29999995, 1.60000002, 1.79999995);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.x + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveB.z / u_xlat0.x;
    u_xlat16_10.x = sin(u_xlat34.x);
    u_xlat16_11 = cos(u_xlat34.x);
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_11;
    u_xlat16_12.y = u_xlat16_1.x * u_xlat16_10.x;
    u_xlat16_12.xz = vec2(u_xlat16_52) * u_xlat9.xy;
    u_xlat16_23.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat0.x = 6.28318548 / _WaveC.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveC.xy, _WaveC.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xw = u_xlat16_1.xx * _WaveC.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xw;
    u_xlat13.x = u_xlat16_1.w * u_xlat4.x + (-u_xlat36.x);
    u_xlat13.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat13.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.y + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveC.z / u_xlat0.x;
    u_xlat16_8.x = sin(u_xlat34.x);
    u_xlat16_12.x = cos(u_xlat34.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_12.x;
    u_xlat16_14.y = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_14.xz = u_xlat16_18.xx * u_xlat13.xy;
    u_xlat16_1.xyw = u_xlat16_23.xyz + u_xlat16_14.xyz;
    u_xlat0.x = 6.28318548 / _WaveD.w;
    u_xlat16_23.x = 9.80000019 / u_xlat0.x;
    u_xlat16_23.x = sqrt(u_xlat16_23.x);
    u_xlat17 = u_xlat17 * u_xlat16_23.x;
    u_xlat16_23.x = dot(_WaveD.xy, _WaveD.xy);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_23.xy = u_xlat16_23.xx * _WaveD.yx;
    u_xlat34.xy = u_xlat3.xx * u_xlat16_23.xy;
    u_xlat3.x = u_xlat16_23.y * u_xlat4.x + (-u_xlat34.x);
    u_xlat3.y = u_xlat16_23.x * u_xlat4.x + u_xlat34.y;
    u_xlat34.x = dot(u_xlat3.xy, u_xlat2.xy);
    u_xlat17 = (-u_xlat17) * u_xlat16_1.z + u_xlat34.x;
    u_xlat17 = u_xlat17 * u_xlat0.x;
    u_xlat16_35 = _WaveD.z / u_xlat0.x;
    u_xlat16_14.x = sin(u_xlat17);
    u_xlat16_15 = cos(u_xlat17);
    u_xlat16_23.x = u_xlat16_35 * u_xlat16_15;
    u_xlat16_16.y = u_xlat16_35 * u_xlat16_14.x;
    u_xlat16_16.xz = u_xlat3.xy * u_xlat16_23.xx;
    u_xlat16_1.xyz = u_xlat16_1.xyw + u_xlat16_16.xyz;
    u_xlat0.xz = u_xlat16_1.xz;
    u_xlat0.y = u_xlat16_1.y * _yScale;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD8.x = u_xlat0.y;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_23.xyz = u_xlat5.xyy * (-u_xlat5.xxy);
    u_xlat16_6.x = u_xlat16_6.x * _WaveA.z;
    u_xlat16_7 = u_xlat16_7 * _WaveA.z;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_23.z;
    u_xlat16_6.yz = u_xlat16_6.xx * u_xlat16_23.yx;
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlat16_16.z = u_xlat5.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat5.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat16_6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat16_16.xyz + vec3(1.0, 0.0, 0.0);
    u_xlat16_6.xyz = u_xlat9.xyy * (-u_xlat9.xxy);
    u_xlat16_57 = u_xlat16_10.x * _WaveB.z;
    u_xlat16_7 = u_xlat16_11 * _WaveB.z;
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_10.y = u_xlat16_6.y;
    u_xlat16_10.z = u_xlat16_7 * u_xlat9.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat9.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat13.xyy * (-u_xlat13.xxy);
    u_xlat16_57 = u_xlat16_8.x * _WaveC.z;
    u_xlat16_7 = u_xlat16_12.x * _WaveC.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat16_7 * u_xlat13.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat13.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat3.xyy * (-u_xlat3.xxy);
    u_xlat16_57 = u_xlat16_14.x * _WaveD.z;
    u_xlat16_7 = u_xlat16_15 * _WaveD.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat3.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat3.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat3.zxy * u_xlat2.yzx + (-u_xlat16_6.xyz);
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor));
#else
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
#endif
    vs_TEXCOORD3.xyz = (bool(u_xlatb53)) ? in_COLOR0.xyz : u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat3.xyz = vec3(u_xlat53) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    vs_TEXCOORD5.xyz = vec3(u_xlat53) * u_xlat2.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD8.y = in_COLOR0.w;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	vec4 _StarryTex_ST;
uniform 	float _StarryTexRotator;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	mediump float _ViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	mediump float _Alpha;
uniform 	mediump float _EnableCustomFog;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogDistance;
uniform 	mediump float _FogFade;
uniform 	mediump float _FoamThre;
uniform 	mediump float _FoamRange;
uniform 	mediump vec3 _FoamDir;
uniform 	mediump vec3 _FoamColor;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _FoamDepthStartPoint;
uniform 	mediump float _FoamDepthRange;
uniform 	mediump float _FoamNoiseTilingScale;
uniform 	mediump float _FoamNoiseStrength;
uniform 	mediump vec4 _DiffColor;
uniform 	vec4 _FoamTex_ST;
uniform 	mediump float _worldYDepthA;
uniform 	mediump float _worldYDepthB;
uniform 	mediump vec4 _WolrdYDepthColor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(6) uniform mediump sampler2D _WaveNoise;
UNITY_LOCATION(7) uniform mediump sampler2D _FoamTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
float u_xlat13;
float u_xlat15;
vec3 u_xlat17;
vec2 u_xlat32;
float u_xlat39;
bool u_xlatb39;
float u_xlat40;
mediump float u_xlat16_40;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
#endif
    if(u_xlatb0){
        u_xlat0.xyz = vs_TEXCOORD3.xyz;
        u_xlat0.w = 1.0;
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat39 = u_xlat39 + u_xlat39;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat39)) + (-u_xlat1.xyz);
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_2.xyz = texture(_Diff, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _DiffColor.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_4.xy = texture(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat17.xyz = u_xlat2.xyz * u_xlat16_4.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat1.xyz);
    u_xlat5.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_FW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat6.xyz);
    u_xlat5.xyz = u_xlat6.xyz * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat39 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat5.xyz = vec3(u_xlat39) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_4.xxx * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat17.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat5.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_5.xyz = texture(_Light, u_xlat5.xy).xyz;
    u_xlat6.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat6.xy = u_xlat6.xy + (-vs_TEXCOORD0.xy);
    u_xlat6.xy = vec2(_IsScreenPos) * u_xlat6.xy + vs_TEXCOORD0.xy;
    u_xlat39 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat39 = u_xlat39 * _Time.y;
    u_xlat39 = cos(u_xlat39);
    u_xlat39 = sin(u_xlat39);
    u_xlat32.xy = vec2(u_xlat39) * _Starry_Speed.xxyz.yz + u_xlat6.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(_ViewDir==6.0);
#else
    u_xlatb39 = _ViewDir==6.0;
#endif
    if(u_xlatb39){
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat7.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    } else {
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat8.xyz = vec3(u_xlat39) * u_xlat1.xzy;
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat9.xyz = vec3(u_xlat39) * u_xlat1.zyx;
        u_xlat1.w = (-u_xlat1.z);
        u_xlat39 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat10.xyz = vec3(u_xlat39) * u_xlat1.xyw;
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat11.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat39 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat11.xyz = vec3(u_xlat39) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb39 = !!(_ViewDir==1.0);
#else
        u_xlatb39 = _ViewDir==1.0;
#endif
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat40 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat40 = inversesqrt(u_xlat40);
        u_xlat1.xyz = vec3(u_xlat40) * u_xlat1.xyz;
        u_xlat1.xyz = bool(u_xlatb39) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb3.w) ? u_xlat11.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.z) ? u_xlat10.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.y) ? u_xlat9.xyz : u_xlat1.xyz;
        u_xlat7.xyz = (u_xlatb3.x) ? u_xlat8.xyz : u_xlat1.xyz;
    }
    u_xlat39 = u_xlat7.z + 1.0;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat39 = u_xlat39 * 2.82842708;
    u_xlat1.xy = u_xlat7.xy / vec2(u_xlat39);
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat39 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat39 = u_xlat39 * 3.14159274;
    u_xlat7.x = sin(u_xlat39);
    u_xlat8.x = cos(u_xlat39);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat1.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat1.xy, u_xlat9.xy);
    u_xlat1.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16_1.xyz = texture(_StarryTex, u_xlat1.xy).xyz;
    u_xlat6.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlat32.xy = (-u_xlat6.xy) + u_xlat32.xy;
    u_xlat6.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat32.xy + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_6.xyz = texture(_StarryTex, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + (-u_xlat16_6.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat16_6.xyz;
    u_xlat6.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat1.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat5.xyz = u_xlat16_5.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = sqrt(u_xlat39);
    u_xlat40 = u_xlat39 / _FogDistance;
    u_xlat16_12.x = max(_FogFade, 0.0);
    u_xlat40 = log2(u_xlat40);
    u_xlat40 = u_xlat40 * u_xlat16_12.x;
    u_xlat40 = exp2(u_xlat40);
    u_xlat40 = min(u_xlat40, 1.0);
    u_xlat40 = u_xlat40 * _FogColor.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + _FogColor.xyz;
    u_xlat2.xyz = vec3(u_xlat40) * u_xlat2.xyz;
    u_xlat1.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(vec2(_FoamNoiseTilingScale, _FoamNoiseTilingScale));
    u_xlat16_40 = texture(_WaveNoise, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD0.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat16_2.x = texture(_FoamTex, u_xlat2.xy).x;
    u_xlat39 = u_xlat39 + (-_FoamDepthStartPoint);
    u_xlat15 = float(1.0) / _FoamDepthRange;
    u_xlat39 = u_xlat39 * u_xlat15;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat15;
    u_xlat16_12.xyz = vec3(u_xlat39) * _FoamColor.xyz;
    u_xlat16_12.xyz = u_xlat16_2.xxx * u_xlat16_12.xyz;
    u_xlat2.x = u_xlat16_40 * _FoamNoiseStrength + _FoamDir.x;
    u_xlat2.yz = _FoamDir.yz;
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat2.xyz = vec3(u_xlat39) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = u_xlat0.x + (-_FoamThre);
    u_xlat13 = float(1.0) / _FoamRange;
    u_xlat0.x = u_xlat13 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat13 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _WolrdYDepthColor.xyz;
    u_xlat39 = (-_worldYDepthA) + _worldYDepthB;
    u_xlat40 = vs_TEXCOORD8.x + (-_worldYDepthA);
    u_xlat39 = float(1.0) / u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat0.xyz = (-_WolrdYDepthColor.xyz) * u_xlat0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_TEXCOORD8.y * _Alpha;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump vec4 _WaveA;
uniform 	mediump vec4 _WaveB;
uniform 	mediump vec4 _WaveC;
uniform 	mediump vec4 _WaveD;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _EffectByVertexColor;
uniform 	mediump float _TotalRotate;
uniform 	mediump float _yScale;
uniform 	vec4 _CustomWaveTimeParams;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_23;
vec2 u_xlat34;
mediump float u_xlat16_35;
vec2 u_xlat36;
float u_xlat51;
mediump float u_xlat16_52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = 6.28318548 / _WaveA.w;
    u_xlat16_1.x = _WaveA.z / u_xlat0.x;
    u_xlat16_18.x = 9.80000019 / u_xlat0.x;
    u_xlat16_18.x = sqrt(u_xlat16_18.x);
    u_xlatb17 = 0.5<_CustomWaveTimeParams.x;
    u_xlat17 = (u_xlatb17) ? _CustomWaveTimeParams.y : _Time.y;
    u_xlat34.x = u_xlat17 * u_xlat16_18.x;
    u_xlat2.xy = in_COLOR0.xz * vec2(vec2(_EffectByVertexColor, _EffectByVertexColor)) + in_POSITION0.xz;
    u_xlat16_18.x = dot(_WaveA.xy, _WaveA.xy);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_18.xy = u_xlat16_18.xx * _WaveA.yx;
    u_xlat3.x = sin(_TotalRotate);
    u_xlat4.x = cos(_TotalRotate);
    u_xlat36.xy = u_xlat16_18.xy * u_xlat3.xx;
    u_xlat5.x = u_xlat16_18.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat5.y = u_xlat16_18.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat5.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * _Speed + u_xlat51;
    u_xlat0.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_6.x = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_7;
    u_xlat16_8.y = u_xlat16_1.x * u_xlat16_6.x;
    u_xlat16_8.xz = u_xlat16_18.xx * u_xlat5.xy;
    u_xlat0.x = 6.28318548 / _WaveB.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveB.xy, _WaveB.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xy = u_xlat16_1.xx * _WaveB.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xy;
    u_xlat9.x = u_xlat16_1.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat9.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat16_1.xyz = vec3(vec3(_Speed, _Speed, _Speed)) * vec3(1.29999995, 1.60000002, 1.79999995);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.x + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveB.z / u_xlat0.x;
    u_xlat16_10.x = sin(u_xlat34.x);
    u_xlat16_11 = cos(u_xlat34.x);
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_11;
    u_xlat16_12.y = u_xlat16_1.x * u_xlat16_10.x;
    u_xlat16_12.xz = vec2(u_xlat16_52) * u_xlat9.xy;
    u_xlat16_23.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat0.x = 6.28318548 / _WaveC.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveC.xy, _WaveC.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xw = u_xlat16_1.xx * _WaveC.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xw;
    u_xlat13.x = u_xlat16_1.w * u_xlat4.x + (-u_xlat36.x);
    u_xlat13.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat13.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.y + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveC.z / u_xlat0.x;
    u_xlat16_8.x = sin(u_xlat34.x);
    u_xlat16_12.x = cos(u_xlat34.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_12.x;
    u_xlat16_14.y = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_14.xz = u_xlat16_18.xx * u_xlat13.xy;
    u_xlat16_1.xyw = u_xlat16_23.xyz + u_xlat16_14.xyz;
    u_xlat0.x = 6.28318548 / _WaveD.w;
    u_xlat16_23.x = 9.80000019 / u_xlat0.x;
    u_xlat16_23.x = sqrt(u_xlat16_23.x);
    u_xlat17 = u_xlat17 * u_xlat16_23.x;
    u_xlat16_23.x = dot(_WaveD.xy, _WaveD.xy);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_23.xy = u_xlat16_23.xx * _WaveD.yx;
    u_xlat34.xy = u_xlat3.xx * u_xlat16_23.xy;
    u_xlat3.x = u_xlat16_23.y * u_xlat4.x + (-u_xlat34.x);
    u_xlat3.y = u_xlat16_23.x * u_xlat4.x + u_xlat34.y;
    u_xlat34.x = dot(u_xlat3.xy, u_xlat2.xy);
    u_xlat17 = (-u_xlat17) * u_xlat16_1.z + u_xlat34.x;
    u_xlat17 = u_xlat17 * u_xlat0.x;
    u_xlat16_35 = _WaveD.z / u_xlat0.x;
    u_xlat16_14.x = sin(u_xlat17);
    u_xlat16_15 = cos(u_xlat17);
    u_xlat16_23.x = u_xlat16_35 * u_xlat16_15;
    u_xlat16_16.y = u_xlat16_35 * u_xlat16_14.x;
    u_xlat16_16.xz = u_xlat3.xy * u_xlat16_23.xx;
    u_xlat16_1.xyz = u_xlat16_1.xyw + u_xlat16_16.xyz;
    u_xlat0.xz = u_xlat16_1.xz;
    u_xlat0.y = u_xlat16_1.y * _yScale;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD8.x = u_xlat0.y;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_23.xyz = u_xlat5.xyy * (-u_xlat5.xxy);
    u_xlat16_6.x = u_xlat16_6.x * _WaveA.z;
    u_xlat16_7 = u_xlat16_7 * _WaveA.z;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_23.z;
    u_xlat16_6.yz = u_xlat16_6.xx * u_xlat16_23.yx;
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlat16_16.z = u_xlat5.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat5.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat16_6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat16_16.xyz + vec3(1.0, 0.0, 0.0);
    u_xlat16_6.xyz = u_xlat9.xyy * (-u_xlat9.xxy);
    u_xlat16_57 = u_xlat16_10.x * _WaveB.z;
    u_xlat16_7 = u_xlat16_11 * _WaveB.z;
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_10.y = u_xlat16_6.y;
    u_xlat16_10.z = u_xlat16_7 * u_xlat9.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat9.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat13.xyy * (-u_xlat13.xxy);
    u_xlat16_57 = u_xlat16_8.x * _WaveC.z;
    u_xlat16_7 = u_xlat16_12.x * _WaveC.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat16_7 * u_xlat13.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat13.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat3.xyy * (-u_xlat3.xxy);
    u_xlat16_57 = u_xlat16_14.x * _WaveD.z;
    u_xlat16_7 = u_xlat16_15 * _WaveD.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat3.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat3.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat3.zxy * u_xlat2.yzx + (-u_xlat16_6.xyz);
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
    vs_TEXCOORD3.xyz = (bool(u_xlatb53)) ? in_COLOR0.xyz : u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat3.xyz = vec3(u_xlat53) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    vs_TEXCOORD5.xyz = vec3(u_xlat53) * u_xlat2.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD8.y = in_COLOR0.w;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	vec4 _StarryTex_ST;
uniform 	float _StarryTexRotator;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	mediump float _ViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	mediump float _Alpha;
uniform 	mediump float _EnableCustomFog;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogDistance;
uniform 	mediump float _FogFade;
uniform 	mediump float _FoamThre;
uniform 	mediump float _FoamRange;
uniform 	mediump vec3 _FoamDir;
uniform 	mediump vec3 _FoamColor;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _FoamDepthStartPoint;
uniform 	mediump float _FoamDepthRange;
uniform 	mediump float _FoamNoiseTilingScale;
uniform 	mediump float _FoamNoiseStrength;
uniform 	mediump vec4 _DiffColor;
uniform 	vec4 _FoamTex_ST;
uniform 	mediump float _worldYDepthA;
uniform 	mediump float _worldYDepthB;
uniform 	mediump vec4 _WolrdYDepthColor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform lowp sampler2D _WaveNoise;
uniform lowp sampler2D _FoamTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec2 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
float u_xlat13;
float u_xlat15;
vec3 u_xlat17;
vec2 u_xlat32;
float u_xlat39;
bool u_xlatb39;
float u_xlat40;
lowp float u_xlat10_40;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
    if(u_xlatb0){
        u_xlat0.xyz = vs_TEXCOORD3.xyz;
        u_xlat0.w = 1.0;
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat39 = u_xlat39 + u_xlat39;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat39)) + (-u_xlat1.xyz);
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_2.xyz = texture2D(_Diff, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _DiffColor.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_4.xy = texture2D(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat17.xyz = u_xlat2.xyz * u_xlat10_4.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat1.xyz);
    u_xlat5.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_FW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat6.xyz);
    u_xlat5.xyz = u_xlat6.xyz * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat39 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat5.xyz = vec3(u_xlat39) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat10_4.xxx * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat17.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat5.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_5.xyz = texture2D(_Light, u_xlat5.xy).xyz;
    u_xlat6.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat6.xy = u_xlat6.xy + (-vs_TEXCOORD0.xy);
    u_xlat6.xy = vec2(_IsScreenPos) * u_xlat6.xy + vs_TEXCOORD0.xy;
    u_xlat39 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat39 = u_xlat39 * _Time.y;
    u_xlat39 = cos(u_xlat39);
    u_xlat39 = sin(u_xlat39);
    u_xlat32.xy = vec2(u_xlat39) * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlatb39 = _ViewDir==6.0;
    if(u_xlatb39){
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat7.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    } else {
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat8.xyz = vec3(u_xlat39) * u_xlat1.xzy;
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat9.xyz = vec3(u_xlat39) * u_xlat1.zyx;
        u_xlat1.w = (-u_xlat1.z);
        u_xlat39 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat10.xyz = vec3(u_xlat39) * u_xlat1.xyw;
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat11.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat39 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat11.xyz = vec3(u_xlat39) * u_xlat11.xyz;
        u_xlatb39 = _ViewDir==1.0;
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat40 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat40 = inversesqrt(u_xlat40);
        u_xlat1.xyz = vec3(u_xlat40) * u_xlat1.xyz;
        u_xlat1.xyz = bool(u_xlatb39) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb3.w) ? u_xlat11.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.z) ? u_xlat10.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.y) ? u_xlat9.xyz : u_xlat1.xyz;
        u_xlat7.xyz = (u_xlatb3.x) ? u_xlat8.xyz : u_xlat1.xyz;
    }
    u_xlat39 = u_xlat7.z + 1.0;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat39 = u_xlat39 * 2.82842708;
    u_xlat1.xy = u_xlat7.xy / vec2(u_xlat39);
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat39 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat39 = u_xlat39 * 3.14159274;
    u_xlat7.x = sin(u_xlat39);
    u_xlat8.x = cos(u_xlat39);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat1.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat1.xy, u_xlat9.xy);
    u_xlat1.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat10_1.xyz = texture2D(_StarryTex, u_xlat1.xy).xyz;
    u_xlat6.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlat32.xy = (-u_xlat6.xy) + u_xlat32.xy;
    u_xlat6.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat32.xy + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_6.xyz = texture2D(_StarryTex, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + (-u_xlat10_6.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat10_6.xyz;
    u_xlat6.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat1.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat5.xyz = u_xlat10_5.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = sqrt(u_xlat39);
    u_xlat40 = u_xlat39 / _FogDistance;
    u_xlat16_12.x = max(_FogFade, 0.0);
    u_xlat40 = log2(u_xlat40);
    u_xlat40 = u_xlat40 * u_xlat16_12.x;
    u_xlat40 = exp2(u_xlat40);
    u_xlat40 = min(u_xlat40, 1.0);
    u_xlat40 = u_xlat40 * _FogColor.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + _FogColor.xyz;
    u_xlat2.xyz = vec3(u_xlat40) * u_xlat2.xyz;
    u_xlat1.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(vec2(_FoamNoiseTilingScale, _FoamNoiseTilingScale));
    u_xlat10_40 = texture2D(_WaveNoise, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD0.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat10_2.x = texture2D(_FoamTex, u_xlat2.xy).x;
    u_xlat39 = u_xlat39 + (-_FoamDepthStartPoint);
    u_xlat15 = float(1.0) / _FoamDepthRange;
    u_xlat39 = u_xlat39 * u_xlat15;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat15 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat15;
    u_xlat16_12.xyz = vec3(u_xlat39) * _FoamColor.xyz;
    u_xlat16_12.xyz = u_xlat10_2.xxx * u_xlat16_12.xyz;
    u_xlat2.x = u_xlat10_40 * _FoamNoiseStrength + _FoamDir.x;
    u_xlat2.yz = _FoamDir.yz;
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat2.xyz = vec3(u_xlat39) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = u_xlat0.x + (-_FoamThre);
    u_xlat13 = float(1.0) / _FoamRange;
    u_xlat0.x = u_xlat13 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat13 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _WolrdYDepthColor.xyz;
    u_xlat39 = (-_worldYDepthA) + _worldYDepthB;
    u_xlat40 = vs_TEXCOORD8.x + (-_worldYDepthA);
    u_xlat39 = float(1.0) / u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat40 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat0.xyz = (-_WolrdYDepthColor.xyz) * u_xlat0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_TEXCOORD8.y * _Alpha;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump vec4 _WaveA;
uniform 	mediump vec4 _WaveB;
uniform 	mediump vec4 _WaveC;
uniform 	mediump vec4 _WaveD;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _EffectByVertexColor;
uniform 	mediump float _TotalRotate;
uniform 	mediump float _yScale;
uniform 	vec4 _CustomWaveTimeParams;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_23;
vec2 u_xlat34;
mediump float u_xlat16_35;
vec2 u_xlat36;
float u_xlat51;
mediump float u_xlat16_52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = 6.28318548 / _WaveA.w;
    u_xlat16_1.x = _WaveA.z / u_xlat0.x;
    u_xlat16_18.x = 9.80000019 / u_xlat0.x;
    u_xlat16_18.x = sqrt(u_xlat16_18.x);
    u_xlatb17 = 0.5<_CustomWaveTimeParams.x;
    u_xlat17 = (u_xlatb17) ? _CustomWaveTimeParams.y : _Time.y;
    u_xlat34.x = u_xlat17 * u_xlat16_18.x;
    u_xlat2.xy = in_COLOR0.xz * vec2(vec2(_EffectByVertexColor, _EffectByVertexColor)) + in_POSITION0.xz;
    u_xlat16_18.x = dot(_WaveA.xy, _WaveA.xy);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_18.xy = u_xlat16_18.xx * _WaveA.yx;
    u_xlat3.x = sin(_TotalRotate);
    u_xlat4.x = cos(_TotalRotate);
    u_xlat36.xy = u_xlat16_18.xy * u_xlat3.xx;
    u_xlat5.x = u_xlat16_18.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat5.y = u_xlat16_18.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat5.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * _Speed + u_xlat51;
    u_xlat0.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_6.x = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_7;
    u_xlat16_8.y = u_xlat16_1.x * u_xlat16_6.x;
    u_xlat16_8.xz = u_xlat16_18.xx * u_xlat5.xy;
    u_xlat0.x = 6.28318548 / _WaveB.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveB.xy, _WaveB.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xy = u_xlat16_1.xx * _WaveB.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xy;
    u_xlat9.x = u_xlat16_1.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat9.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat16_1.xyz = vec3(vec3(_Speed, _Speed, _Speed)) * vec3(1.29999995, 1.60000002, 1.79999995);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.x + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveB.z / u_xlat0.x;
    u_xlat16_10.x = sin(u_xlat34.x);
    u_xlat16_11 = cos(u_xlat34.x);
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_11;
    u_xlat16_12.y = u_xlat16_1.x * u_xlat16_10.x;
    u_xlat16_12.xz = vec2(u_xlat16_52) * u_xlat9.xy;
    u_xlat16_23.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat0.x = 6.28318548 / _WaveC.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveC.xy, _WaveC.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xw = u_xlat16_1.xx * _WaveC.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xw;
    u_xlat13.x = u_xlat16_1.w * u_xlat4.x + (-u_xlat36.x);
    u_xlat13.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat13.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.y + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveC.z / u_xlat0.x;
    u_xlat16_8.x = sin(u_xlat34.x);
    u_xlat16_12.x = cos(u_xlat34.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_12.x;
    u_xlat16_14.y = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_14.xz = u_xlat16_18.xx * u_xlat13.xy;
    u_xlat16_1.xyw = u_xlat16_23.xyz + u_xlat16_14.xyz;
    u_xlat0.x = 6.28318548 / _WaveD.w;
    u_xlat16_23.x = 9.80000019 / u_xlat0.x;
    u_xlat16_23.x = sqrt(u_xlat16_23.x);
    u_xlat17 = u_xlat17 * u_xlat16_23.x;
    u_xlat16_23.x = dot(_WaveD.xy, _WaveD.xy);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_23.xy = u_xlat16_23.xx * _WaveD.yx;
    u_xlat34.xy = u_xlat3.xx * u_xlat16_23.xy;
    u_xlat3.x = u_xlat16_23.y * u_xlat4.x + (-u_xlat34.x);
    u_xlat3.y = u_xlat16_23.x * u_xlat4.x + u_xlat34.y;
    u_xlat34.x = dot(u_xlat3.xy, u_xlat2.xy);
    u_xlat17 = (-u_xlat17) * u_xlat16_1.z + u_xlat34.x;
    u_xlat17 = u_xlat17 * u_xlat0.x;
    u_xlat16_35 = _WaveD.z / u_xlat0.x;
    u_xlat16_14.x = sin(u_xlat17);
    u_xlat16_15 = cos(u_xlat17);
    u_xlat16_23.x = u_xlat16_35 * u_xlat16_15;
    u_xlat16_16.y = u_xlat16_35 * u_xlat16_14.x;
    u_xlat16_16.xz = u_xlat3.xy * u_xlat16_23.xx;
    u_xlat16_1.xyz = u_xlat16_1.xyw + u_xlat16_16.xyz;
    u_xlat0.xz = u_xlat16_1.xz;
    u_xlat0.y = u_xlat16_1.y * _yScale;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD8.x = u_xlat0.y;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_23.xyz = u_xlat5.xyy * (-u_xlat5.xxy);
    u_xlat16_6.x = u_xlat16_6.x * _WaveA.z;
    u_xlat16_7 = u_xlat16_7 * _WaveA.z;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_23.z;
    u_xlat16_6.yz = u_xlat16_6.xx * u_xlat16_23.yx;
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlat16_16.z = u_xlat5.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat5.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat16_6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat16_16.xyz + vec3(1.0, 0.0, 0.0);
    u_xlat16_6.xyz = u_xlat9.xyy * (-u_xlat9.xxy);
    u_xlat16_57 = u_xlat16_10.x * _WaveB.z;
    u_xlat16_7 = u_xlat16_11 * _WaveB.z;
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_10.y = u_xlat16_6.y;
    u_xlat16_10.z = u_xlat16_7 * u_xlat9.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat9.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat13.xyy * (-u_xlat13.xxy);
    u_xlat16_57 = u_xlat16_8.x * _WaveC.z;
    u_xlat16_7 = u_xlat16_12.x * _WaveC.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat16_7 * u_xlat13.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat13.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat3.xyy * (-u_xlat3.xxy);
    u_xlat16_57 = u_xlat16_14.x * _WaveD.z;
    u_xlat16_7 = u_xlat16_15 * _WaveD.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat3.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat3.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat3.zxy * u_xlat2.yzx + (-u_xlat16_6.xyz);
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
    vs_TEXCOORD3.xyz = (bool(u_xlatb53)) ? in_COLOR0.xyz : u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat3.xyz = vec3(u_xlat53) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    vs_TEXCOORD5.xyz = vec3(u_xlat53) * u_xlat2.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD8.y = in_COLOR0.w;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	vec4 _StarryTex_ST;
uniform 	float _StarryTexRotator;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	mediump float _ViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	mediump float _Alpha;
uniform 	mediump float _EnableCustomFog;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogDistance;
uniform 	mediump float _FogFade;
uniform 	mediump float _FoamThre;
uniform 	mediump float _FoamRange;
uniform 	mediump vec3 _FoamDir;
uniform 	mediump vec3 _FoamColor;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _FoamDepthStartPoint;
uniform 	mediump float _FoamDepthRange;
uniform 	mediump float _FoamNoiseTilingScale;
uniform 	mediump float _FoamNoiseStrength;
uniform 	mediump vec4 _DiffColor;
uniform 	vec4 _FoamTex_ST;
uniform 	mediump float _worldYDepthA;
uniform 	mediump float _worldYDepthB;
uniform 	mediump vec4 _WolrdYDepthColor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform lowp sampler2D _WaveNoise;
uniform lowp sampler2D _FoamTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec2 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
float u_xlat13;
float u_xlat15;
vec3 u_xlat17;
vec2 u_xlat32;
float u_xlat39;
bool u_xlatb39;
float u_xlat40;
lowp float u_xlat10_40;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
    if(u_xlatb0){
        u_xlat0.xyz = vs_TEXCOORD3.xyz;
        u_xlat0.w = 1.0;
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat39 = u_xlat39 + u_xlat39;
    u_xlat1.xyz = u_xlat0.xyz * (-vec3(u_xlat39)) + (-u_xlat1.xyz);
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_2.xyz = texture2D(_Diff, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _DiffColor.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_4.xy = texture2D(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat17.xyz = u_xlat2.xyz * u_xlat10_4.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat1.xyz);
    u_xlat5.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat6.xyz = u_xlat6.xyz * vec3(_Cube_FW);
    u_xlat5.xyz = u_xlat5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat6.xyz);
    u_xlat5.xyz = u_xlat6.xyz * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat39 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat5.xyz = vec3(u_xlat39) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat10_4.xxx * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat17.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat5.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_5.xyz = texture2D(_Light, u_xlat5.xy).xyz;
    u_xlat6.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat6.xy = u_xlat6.xy + (-vs_TEXCOORD0.xy);
    u_xlat6.xy = vec2(_IsScreenPos) * u_xlat6.xy + vs_TEXCOORD0.xy;
    u_xlat39 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat39 = u_xlat39 * _Time.y;
    u_xlat39 = cos(u_xlat39);
    u_xlat39 = sin(u_xlat39);
    u_xlat32.xy = vec2(u_xlat39) * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlatb39 = _ViewDir==6.0;
    if(u_xlatb39){
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat7.xyz = vec3(u_xlat39) * u_xlat1.xyz;
    } else {
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat8.xyz = vec3(u_xlat39) * u_xlat1.xzy;
        u_xlat39 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat9.xyz = vec3(u_xlat39) * u_xlat1.zyx;
        u_xlat1.w = (-u_xlat1.z);
        u_xlat39 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat10.xyz = vec3(u_xlat39) * u_xlat1.xyw;
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat11.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat39 = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlat39 = inversesqrt(u_xlat39);
        u_xlat11.xyz = vec3(u_xlat39) * u_xlat11.xyz;
        u_xlatb39 = _ViewDir==1.0;
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat40 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat40 = inversesqrt(u_xlat40);
        u_xlat1.xyz = vec3(u_xlat40) * u_xlat1.xyz;
        u_xlat1.xyz = bool(u_xlatb39) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb3.w) ? u_xlat11.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.z) ? u_xlat10.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.y) ? u_xlat9.xyz : u_xlat1.xyz;
        u_xlat7.xyz = (u_xlatb3.x) ? u_xlat8.xyz : u_xlat1.xyz;
    }
    u_xlat39 = u_xlat7.z + 1.0;
    u_xlat39 = sqrt(u_xlat39);
    u_xlat39 = u_xlat39 * 2.82842708;
    u_xlat1.xy = u_xlat7.xy / vec2(u_xlat39);
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat39 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat39 = u_xlat39 * 3.14159274;
    u_xlat7.x = sin(u_xlat39);
    u_xlat8.x = cos(u_xlat39);
    u_xlat9.x = (-u_xlat7.x);
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = u_xlat7.x;
    u_xlat7.x = dot(u_xlat1.xy, u_xlat9.yz);
    u_xlat7.y = dot(u_xlat1.xy, u_xlat9.xy);
    u_xlat1.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat10_1.xyz = texture2D(_StarryTex, u_xlat1.xy).xyz;
    u_xlat6.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat6.xy;
    u_xlat32.xy = (-u_xlat6.xy) + u_xlat32.xy;
    u_xlat6.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat32.xy + u_xlat6.xy;
    u_xlat6.xy = u_xlat6.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_6.xyz = texture2D(_StarryTex, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + (-u_xlat10_6.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat10_6.xyz;
    u_xlat6.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat1.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat5.xyz = u_xlat10_5.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = sqrt(u_xlat39);
    u_xlat40 = u_xlat39 / _FogDistance;
    u_xlat16_12.x = max(_FogFade, 0.0);
    u_xlat40 = log2(u_xlat40);
    u_xlat40 = u_xlat40 * u_xlat16_12.x;
    u_xlat40 = exp2(u_xlat40);
    u_xlat40 = min(u_xlat40, 1.0);
    u_xlat40 = u_xlat40 * _FogColor.w;
    u_xlat2.xyz = (-u_xlat1.xyz) + _FogColor.xyz;
    u_xlat2.xyz = vec3(u_xlat40) * u_xlat2.xyz;
    u_xlat1.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(vec2(_FoamNoiseTilingScale, _FoamNoiseTilingScale));
    u_xlat10_40 = texture2D(_WaveNoise, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD0.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat10_2.x = texture2D(_FoamTex, u_xlat2.xy).x;
    u_xlat39 = u_xlat39 + (-_FoamDepthStartPoint);
    u_xlat15 = float(1.0) / _FoamDepthRange;
    u_xlat39 = u_xlat39 * u_xlat15;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat15 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat15;
    u_xlat16_12.xyz = vec3(u_xlat39) * _FoamColor.xyz;
    u_xlat16_12.xyz = u_xlat10_2.xxx * u_xlat16_12.xyz;
    u_xlat2.x = u_xlat10_40 * _FoamNoiseStrength + _FoamDir.x;
    u_xlat2.yz = _FoamDir.yz;
    u_xlat39 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat2.xyz = vec3(u_xlat39) * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat0.x = u_xlat0.x + (-_FoamThre);
    u_xlat13 = float(1.0) / _FoamRange;
    u_xlat0.x = u_xlat13 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat13 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _WolrdYDepthColor.xyz;
    u_xlat39 = (-_worldYDepthA) + _worldYDepthB;
    u_xlat40 = vs_TEXCOORD8.x + (-_worldYDepthA);
    u_xlat39 = float(1.0) / u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat40 = u_xlat39 * -2.0 + 3.0;
    u_xlat39 = u_xlat39 * u_xlat39;
    u_xlat39 = u_xlat39 * u_xlat40;
    u_xlat0.xyz = (-_WolrdYDepthColor.xyz) * u_xlat0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_TEXCOORD8.y * _Alpha;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump vec4 _WaveA;
uniform 	mediump vec4 _WaveB;
uniform 	mediump vec4 _WaveC;
uniform 	mediump vec4 _WaveD;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _EffectByVertexColor;
uniform 	mediump float _TotalRotate;
uniform 	mediump float _yScale;
uniform 	vec4 _CustomWaveTimeParams;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_23;
vec2 u_xlat34;
mediump float u_xlat16_35;
vec2 u_xlat36;
float u_xlat51;
mediump float u_xlat16_52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = 6.28318548 / _WaveA.w;
    u_xlat16_1.x = _WaveA.z / u_xlat0.x;
    u_xlat16_18.x = 9.80000019 / u_xlat0.x;
    u_xlat16_18.x = sqrt(u_xlat16_18.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.5<_CustomWaveTimeParams.x);
#else
    u_xlatb17 = 0.5<_CustomWaveTimeParams.x;
#endif
    u_xlat17 = (u_xlatb17) ? _CustomWaveTimeParams.y : _Time.y;
    u_xlat34.x = u_xlat17 * u_xlat16_18.x;
    u_xlat2.xy = in_COLOR0.xz * vec2(vec2(_EffectByVertexColor, _EffectByVertexColor)) + in_POSITION0.xz;
    u_xlat16_18.x = dot(_WaveA.xy, _WaveA.xy);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_18.xy = u_xlat16_18.xx * _WaveA.yx;
    u_xlat3.x = sin(_TotalRotate);
    u_xlat4.x = cos(_TotalRotate);
    u_xlat36.xy = u_xlat16_18.xy * u_xlat3.xx;
    u_xlat5.x = u_xlat16_18.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat5.y = u_xlat16_18.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat5.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * _Speed + u_xlat51;
    u_xlat0.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_6.x = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_7;
    u_xlat16_8.y = u_xlat16_1.x * u_xlat16_6.x;
    u_xlat16_8.xz = u_xlat16_18.xx * u_xlat5.xy;
    u_xlat0.x = 6.28318548 / _WaveB.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveB.xy, _WaveB.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xy = u_xlat16_1.xx * _WaveB.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xy;
    u_xlat9.x = u_xlat16_1.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat9.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat16_1.xyz = vec3(vec3(_Speed, _Speed, _Speed)) * vec3(1.29999995, 1.60000002, 1.79999995);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.x + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveB.z / u_xlat0.x;
    u_xlat16_10.x = sin(u_xlat34.x);
    u_xlat16_11 = cos(u_xlat34.x);
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_11;
    u_xlat16_12.y = u_xlat16_1.x * u_xlat16_10.x;
    u_xlat16_12.xz = vec2(u_xlat16_52) * u_xlat9.xy;
    u_xlat16_23.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat0.x = 6.28318548 / _WaveC.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveC.xy, _WaveC.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xw = u_xlat16_1.xx * _WaveC.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xw;
    u_xlat13.x = u_xlat16_1.w * u_xlat4.x + (-u_xlat36.x);
    u_xlat13.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat13.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.y + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveC.z / u_xlat0.x;
    u_xlat16_8.x = sin(u_xlat34.x);
    u_xlat16_12.x = cos(u_xlat34.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_12.x;
    u_xlat16_14.y = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_14.xz = u_xlat16_18.xx * u_xlat13.xy;
    u_xlat16_1.xyw = u_xlat16_23.xyz + u_xlat16_14.xyz;
    u_xlat0.x = 6.28318548 / _WaveD.w;
    u_xlat16_23.x = 9.80000019 / u_xlat0.x;
    u_xlat16_23.x = sqrt(u_xlat16_23.x);
    u_xlat17 = u_xlat17 * u_xlat16_23.x;
    u_xlat16_23.x = dot(_WaveD.xy, _WaveD.xy);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_23.xy = u_xlat16_23.xx * _WaveD.yx;
    u_xlat34.xy = u_xlat3.xx * u_xlat16_23.xy;
    u_xlat3.x = u_xlat16_23.y * u_xlat4.x + (-u_xlat34.x);
    u_xlat3.y = u_xlat16_23.x * u_xlat4.x + u_xlat34.y;
    u_xlat34.x = dot(u_xlat3.xy, u_xlat2.xy);
    u_xlat17 = (-u_xlat17) * u_xlat16_1.z + u_xlat34.x;
    u_xlat17 = u_xlat17 * u_xlat0.x;
    u_xlat16_35 = _WaveD.z / u_xlat0.x;
    u_xlat16_14.x = sin(u_xlat17);
    u_xlat16_15 = cos(u_xlat17);
    u_xlat16_23.x = u_xlat16_35 * u_xlat16_15;
    u_xlat16_16.y = u_xlat16_35 * u_xlat16_14.x;
    u_xlat16_16.xz = u_xlat3.xy * u_xlat16_23.xx;
    u_xlat16_1.xyz = u_xlat16_1.xyw + u_xlat16_16.xyz;
    u_xlat0.xz = u_xlat16_1.xz;
    u_xlat0.y = u_xlat16_1.y * _yScale;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD8.x = u_xlat0.y;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_23.xyz = u_xlat5.xyy * (-u_xlat5.xxy);
    u_xlat16_6.x = u_xlat16_6.x * _WaveA.z;
    u_xlat16_7 = u_xlat16_7 * _WaveA.z;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_23.z;
    u_xlat16_6.yz = u_xlat16_6.xx * u_xlat16_23.yx;
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlat16_16.z = u_xlat5.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat5.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat16_6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat16_16.xyz + vec3(1.0, 0.0, 0.0);
    u_xlat16_6.xyz = u_xlat9.xyy * (-u_xlat9.xxy);
    u_xlat16_57 = u_xlat16_10.x * _WaveB.z;
    u_xlat16_7 = u_xlat16_11 * _WaveB.z;
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_10.y = u_xlat16_6.y;
    u_xlat16_10.z = u_xlat16_7 * u_xlat9.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat9.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat13.xyy * (-u_xlat13.xxy);
    u_xlat16_57 = u_xlat16_8.x * _WaveC.z;
    u_xlat16_7 = u_xlat16_12.x * _WaveC.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat16_7 * u_xlat13.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat13.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat3.xyy * (-u_xlat3.xxy);
    u_xlat16_57 = u_xlat16_14.x * _WaveD.z;
    u_xlat16_7 = u_xlat16_15 * _WaveD.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat3.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat3.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat3.zxy * u_xlat2.yzx + (-u_xlat16_6.xyz);
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor));
#else
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
#endif
    vs_TEXCOORD3.xyz = (bool(u_xlatb53)) ? in_COLOR0.xyz : u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat3.xyz = vec3(u_xlat53) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    vs_TEXCOORD5.xyz = vec3(u_xlat53) * u_xlat2.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD8.y = in_COLOR0.w;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _StarryTex_ST;
uniform 	float _StarryTexRotator;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	mediump float _ViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	mediump float _Alpha;
uniform 	mediump float _EnableCustomFog;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogDistance;
uniform 	mediump float _FogFade;
uniform 	mediump float _FoamThre;
uniform 	mediump float _FoamRange;
uniform 	mediump vec3 _FoamDir;
uniform 	mediump vec3 _FoamColor;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _FoamDepthStartPoint;
uniform 	mediump float _FoamDepthRange;
uniform 	mediump float _FoamNoiseTilingScale;
uniform 	mediump float _FoamNoiseStrength;
uniform 	mediump vec4 _DiffColor;
uniform 	vec4 _FoamTex_ST;
uniform 	mediump float _worldYDepthA;
uniform 	mediump float _worldYDepthB;
uniform 	mediump vec4 _WolrdYDepthColor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(6) uniform mediump sampler2D _WaveNoise;
UNITY_LOCATION(7) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(8) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(9) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec2 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec2 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec3 u_xlat24;
vec3 u_xlat25;
mediump vec3 u_xlat16_25;
mediump float u_xlat10_25;
float u_xlat26;
mediump float u_xlat16_32;
vec3 u_xlat42;
mediump float u_xlat10_50;
bool u_xlatb50;
float u_xlat51;
mediump vec2 u_xlat16_57;
mediump vec2 u_xlat16_58;
mediump vec2 u_xlat16_59;
mediump vec2 u_xlat16_60;
mediump vec2 u_xlat16_64;
vec2 u_xlat69;
float u_xlat75;
mediump float u_xlat16_75;
bool u_xlatb75;
float u_xlat76;
bool u_xlatb76;
float u_xlat77;
mediump float u_xlat10_77;
bool u_xlatb77;
mediump float u_xlat16_82;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
#endif
    if(u_xlatb0){
        u_xlat0.xyz = vs_TEXCOORD3.xyz;
        u_xlat0.w = 1.0;
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat75 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat1.xyz = vec3(u_xlat75) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat75 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat2.xyz = vec3(u_xlat75) * u_xlat2.xyz;
    u_xlat75 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat75 = u_xlat75 + u_xlat75;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat75)) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb75 = _ShadowBias.z!=0.0;
#endif
    u_xlat77 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat4.xyz = vec3(u_xlat77) * _WorldSpaceLightPos0.xyz;
    u_xlat77 = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat77 = (-u_xlat77) * u_xlat77 + 1.0;
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat77 * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat77) + vs_TEXCOORD2.xyz;
    u_xlat0.xyz = (bool(u_xlatb75)) ? u_xlat0.xyz : vs_TEXCOORD2.xyz;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat6;
    u_xlat4 = u_xlat0.yyyy * u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat5 * u_xlat0.zzzz + u_xlat3;
    u_xlat0 = u_xlat6 + u_xlat0;
    u_xlat77 = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat77 = min(max(u_xlat77, 0.0), 1.0);
#else
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
#endif
    u_xlat77 = u_xlat0.z + (-u_xlat77);
    u_xlat4.x = max((-u_xlat0.w), u_xlat77);
    u_xlat4.x = (-u_xlat77) + u_xlat4.x;
    u_xlat0.z = _ShadowBias.y * u_xlat4.x + u_xlat77;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(_softShadowQuality==1.0);
#else
    u_xlatb50 = _softShadowQuality==1.0;
#endif
    if(u_xlatb50){
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_32 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb50 = !!(_softShadowQuality==2.0);
#else
        u_xlatb50 = _softShadowQuality==2.0;
#endif
        if(u_xlatb50){
            u_xlat16_57.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_57.xy = floor(u_xlat16_57.xy);
            u_xlat16_8.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_57.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_58.xy = u_xlat16_4.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_9.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_59.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_10.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_59.xy;
            u_xlat16_8.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_8.xy) * u_xlat16_8.xy + u_xlat16_3.yw;
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_8.xy = u_xlat16_8.xy + vec2(1.0, 1.0);
            u_xlat16_4.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_5.xy = u_xlat16_59.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_3.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_4.z = u_xlat16_6.x;
            u_xlat16_4.w = u_xlat16_8.x;
            u_xlat16_5.z = u_xlat16_9.x;
            u_xlat16_5.w = u_xlat16_58.x;
            u_xlat16_3 = u_xlat16_4.zwxz + u_xlat16_5.zwxz;
            u_xlat16_6.z = u_xlat16_4.y;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_9.z = u_xlat16_5.y;
            u_xlat16_9.w = u_xlat16_58.y;
            u_xlat16_8.xyz = u_xlat16_6.zyw + u_xlat16_9.zyw;
            u_xlat16_10.xyz = u_xlat16_5.xzw / u_xlat16_3.zwy;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_9.xyz = u_xlat16_9.zyw / u_xlat16_8.xyz;
            u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_4.xyz = u_xlat16_10.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_5.xyz = u_xlat16_9.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_4.w = u_xlat16_5.x;
            u_xlat16_6 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.ywxw;
            u_xlat16_9.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.zw;
            u_xlat16_5.w = u_xlat16_4.y;
            u_xlat16_4.yw = u_xlat16_5.yz;
            u_xlat16_10 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
            u_xlat16_5 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.wywz;
            u_xlat16_4 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xwzw;
            u_xlat16_11 = u_xlat16_3.zwyz * u_xlat16_8.xxxy;
            u_xlat16_12 = u_xlat16_3 * u_xlat16_8.yyzz;
            u_xlat16_57.x = u_xlat16_3.y * u_xlat16_8.z;
            vec3 txVec4 = vec3(u_xlat16_6.xy,u_xlat0.w);
            u_xlat10_50 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_6.zw,u_xlat0.w);
            u_xlat10_77 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_82 = u_xlat10_77 * u_xlat16_11.y;
            u_xlat16_82 = u_xlat16_11.x * u_xlat10_50 + u_xlat16_82;
            vec3 txVec6 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_50 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_82 = u_xlat16_11.z * u_xlat10_50 + u_xlat16_82;
            vec3 txVec7 = vec3(u_xlat16_5.xy,u_xlat0.w);
            u_xlat10_50 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_82 = u_xlat16_11.w * u_xlat10_50 + u_xlat16_82;
            vec3 txVec8 = vec3(u_xlat16_10.xy,u_xlat0.w);
            u_xlat10_50 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_82 = u_xlat16_12.x * u_xlat10_50 + u_xlat16_82;
            vec3 txVec9 = vec3(u_xlat16_10.zw,u_xlat0.w);
            u_xlat10_50 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_82 = u_xlat16_12.y * u_xlat10_50 + u_xlat16_82;
            vec3 txVec10 = vec3(u_xlat16_5.zw,u_xlat0.w);
            u_xlat10_50 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_82 = u_xlat16_12.z * u_xlat10_50 + u_xlat16_82;
            vec3 txVec11 = vec3(u_xlat16_4.xy,u_xlat0.w);
            u_xlat10_50 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_82 = u_xlat16_12.w * u_xlat10_50 + u_xlat16_82;
            vec3 txVec12 = vec3(u_xlat16_4.zw,u_xlat0.w);
            u_xlat10_50 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_32 = u_xlat16_57.x * u_xlat10_50 + u_xlat16_82;
        } else {
            u_xlat16_57.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_57.xy = floor(u_xlat16_57.xy);
            u_xlat16_8.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_57.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_5.yw = u_xlat16_4.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_58.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_9.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_59.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_59.xy) * u_xlat16_59.xy + u_xlat16_9.xy;
            u_xlat16_59.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.zw = (-u_xlat16_59.xy) * u_xlat16_59.xy + u_xlat16_3.yw;
            u_xlat16_9 = u_xlat16_9 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_3.z = u_xlat16_9.z * 0.0816320032;
            u_xlat16_4.xy = u_xlat16_58.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_58.xy = u_xlat16_9.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_4.z = u_xlat16_9.w * 0.0816320032;
            u_xlat16_3.x = u_xlat16_4.y;
            u_xlat16_3.yw = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_58.x;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_3 = u_xlat16_3 + u_xlat16_6;
            u_xlat16_4.yw = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_5.xz = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_5.y = u_xlat16_58.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 / u_xlat16_3;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_5 = u_xlat16_5 / u_xlat16_4;
            u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_5 = u_xlat16_5.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_8.xzw = u_xlat16_6.yzw;
            u_xlat16_8.y = u_xlat16_5.x;
            u_xlat16_9 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_10.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.y = u_xlat16_8.y;
            u_xlat16_8.y = u_xlat16_5.z;
            u_xlat16_11 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_60.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.z = u_xlat16_8.y;
            u_xlat16_12 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyxz;
            u_xlat16_8.y = u_xlat16_5.w;
            u_xlat16_13 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_14.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_64.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xw;
            u_xlat16_5.xzw = u_xlat16_8.xzw;
            u_xlat16_8 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_15.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.wy;
            u_xlat16_5.x = u_xlat16_6.x;
            u_xlat16_57.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xy;
            u_xlat16_5 = u_xlat16_3 * u_xlat16_4.xxxx;
            u_xlat16_6 = u_xlat16_3 * u_xlat16_4.yyyy;
            u_xlat16_16 = u_xlat16_3 * u_xlat16_4.zzzz;
            u_xlat16_3 = u_xlat16_3 * u_xlat16_4.wwww;
            vec3 txVec13 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_9.zw,u_xlat0.w);
            u_xlat10_25 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_9.x = u_xlat10_25 * u_xlat16_5.y;
            u_xlat16_9.x = u_xlat16_5.x * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec15 = vec3(u_xlat16_10.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_9.x = u_xlat16_5.z * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec16 = vec3(u_xlat16_12.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_9.x = u_xlat16_5.w * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec17 = vec3(u_xlat16_11.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_9.x = u_xlat16_6.x * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec18 = vec3(u_xlat16_11.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_9.x = u_xlat16_6.y * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec19 = vec3(u_xlat16_60.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_9.x = u_xlat16_6.z * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec20 = vec3(u_xlat16_12.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_9.x = u_xlat16_6.w * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec21 = vec3(u_xlat16_13.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_9.x = u_xlat16_16.x * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec22 = vec3(u_xlat16_13.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_9.x = u_xlat16_16.y * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec23 = vec3(u_xlat16_14.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_9.x = u_xlat16_16.z * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec24 = vec3(u_xlat16_64.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_9.x = u_xlat16_16.w * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec25 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_8.x = u_xlat16_3.x * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec26 = vec3(u_xlat16_8.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_8.x = u_xlat16_3.y * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec27 = vec3(u_xlat16_15.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_8.x = u_xlat16_3.z * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec28 = vec3(u_xlat16_57.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_32 = u_xlat16_3.w * u_xlat10_0 + u_xlat16_8.x;
        }
    }
    u_xlat16_57.x = (-u_xlat16_7.x) + 1.0;
    u_xlat16_7.x = u_xlat16_32 * u_xlat16_57.x + u_xlat16_7.x;
    u_xlat0.x = u_xlat16_7.x + -1.0;
    u_xlat0.x = _ReceiveShadowsStrength * u_xlat0.x + 1.0;
    u_xlat25.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_25.xyz = texture(_Diff, u_xlat25.xy).xyz;
    u_xlat25.xyz = u_xlat16_25.xyz * _DiffColor.xyz;
    u_xlat17.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_17.xy = texture(_Em_G_CU_R_MASK, u_xlat17.xy).xy;
    u_xlat42.xyz = u_xlat25.xyz * u_xlat16_17.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat1.xyz);
    u_xlat18.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat19.xyz = u_xlat18.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat19.xyz = u_xlat19.xyz * vec3(_Cube_FW);
    u_xlat18.xyz = u_xlat18.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat19.xyz);
    u_xlat18.xyz = u_xlat19.xyz * u_xlat18.xyz + u_xlat19.xyz;
    u_xlat77 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat18.xyz = vec3(u_xlat77) * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat16_17.xxx * u_xlat18.xyz;
    u_xlat17.xyz = u_xlat42.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat18.xyz;
    u_xlat18.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_18.xyz = texture(_Light, u_xlat18.xy).xyz;
    u_xlat19.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat19.xy = u_xlat19.xy + (-vs_TEXCOORD0.xy);
    u_xlat19.xy = vec2(_IsScreenPos) * u_xlat19.xy + vs_TEXCOORD0.xy;
    u_xlat77 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat77 = u_xlat77 * _Time.y;
    u_xlat77 = cos(u_xlat77);
    u_xlat77 = sin(u_xlat77);
    u_xlat69.xy = vec2(u_xlat77) * _Starry_Speed.xxyz.yz + u_xlat19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb77 = !!(_ViewDir==6.0);
#else
    u_xlatb77 = _ViewDir==6.0;
#endif
    if(u_xlatb77){
        u_xlat77 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat20.xyz = u_xlat1.xyz * vec3(u_xlat77);
    } else {
        u_xlat77 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat21.xyz = u_xlat1.xzy * vec3(u_xlat77);
        u_xlat77 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat22.xyz = u_xlat1.zyx * vec3(u_xlat77);
        u_xlat1.w = (-u_xlat1.z);
        u_xlat77 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat23.xyz = u_xlat1.xyw * vec3(u_xlat77);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat24.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat76 = dot(u_xlat24.xyz, u_xlat24.xyz);
        u_xlat76 = inversesqrt(u_xlat76);
        u_xlat24.xyz = vec3(u_xlat76) * u_xlat24.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb76 = !!(_ViewDir==1.0);
#else
        u_xlatb76 = _ViewDir==1.0;
#endif
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat77 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat77);
        u_xlat1.xyz = bool(u_xlatb76) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb3.w) ? u_xlat24.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.z) ? u_xlat23.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.y) ? u_xlat22.xyz : u_xlat1.xyz;
        u_xlat20.xyz = (u_xlatb3.x) ? u_xlat21.xyz : u_xlat1.xyz;
    }
    u_xlat1.x = u_xlat20.z + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 2.82842708;
    u_xlat1.xy = u_xlat20.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat51 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat51 = u_xlat51 * 3.14159274;
    u_xlat20.x = sin(u_xlat51);
    u_xlat21.x = cos(u_xlat51);
    u_xlat22.x = (-u_xlat20.x);
    u_xlat22.y = u_xlat21.x;
    u_xlat22.z = u_xlat20.x;
    u_xlat20.x = dot(u_xlat1.xy, u_xlat22.yz);
    u_xlat20.y = dot(u_xlat1.xy, u_xlat22.xy);
    u_xlat1.xy = u_xlat20.xy + vec2(0.5, 0.5);
    u_xlat16_1.xyz = texture(_StarryTex, u_xlat1.xy).xyz;
    u_xlat19.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat19.xy;
    u_xlat69.xy = (-u_xlat19.xy) + u_xlat69.xy;
    u_xlat19.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat69.xy + u_xlat19.xy;
    u_xlat19.xy = u_xlat19.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_19.xyz = texture(_StarryTex, u_xlat19.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + (-u_xlat16_19.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat16_19.xyz;
    u_xlat19.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat19.xyz = u_xlat1.xyz * u_xlat19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat19.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat18.xyz = u_xlat16_18.xyz * vec3(_light_PW);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat18.xyz + u_xlat1.xyz;
    u_xlat25.xyz = u_xlat25.xyz + u_xlat17.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat25.xyz;
    u_xlat17.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat76 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat77 = u_xlat76 / _FogDistance;
    u_xlat16_7.x = max(_FogFade, 0.0);
    u_xlat77 = log2(u_xlat77);
    u_xlat77 = u_xlat77 * u_xlat16_7.x;
    u_xlat77 = exp2(u_xlat77);
    u_xlat77 = min(u_xlat77, 1.0);
    u_xlat77 = u_xlat77 * _FogColor.w;
    u_xlat0.xyz = (-u_xlat25.xyz) * u_xlat0.xxx + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat77);
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(vec2(_FoamNoiseTilingScale, _FoamNoiseTilingScale));
    u_xlat16_75 = texture(_WaveNoise, u_xlat1.xy).x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat16_1.x = texture(_FoamTex, u_xlat1.xy).x;
    u_xlat26 = u_xlat76 + (-_FoamDepthStartPoint);
    u_xlat51 = float(1.0) / _FoamDepthRange;
    u_xlat26 = u_xlat51 * u_xlat26;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat51 = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat51;
    u_xlat16_7.xyz = vec3(u_xlat26) * _FoamColor.xyz;
    u_xlat16_7.xyz = u_xlat16_1.xxx * u_xlat16_7.xyz;
    u_xlat1.x = u_xlat16_75 * _FoamNoiseStrength + _FoamDir.x;
    u_xlat1.yz = _FoamDir.yz;
    u_xlat75 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat1.xyz = vec3(u_xlat75) * u_xlat1.xyz;
    u_xlat75 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat75 = u_xlat75 + (-_FoamThre);
    u_xlat1.x = float(1.0) / _FoamRange;
    u_xlat75 = u_xlat75 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat1.x;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(u_xlat75) + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _WolrdYDepthColor.xyz;
    u_xlat75 = (-_worldYDepthA) + _worldYDepthB;
    u_xlat76 = vs_TEXCOORD8.x + (-_worldYDepthA);
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat76;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat76 = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat76;
    u_xlat0.xyz = (-_WolrdYDepthColor.xyz) * u_xlat0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat75) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_TEXCOORD8.y * _Alpha;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump vec4 _WaveA;
uniform 	mediump vec4 _WaveB;
uniform 	mediump vec4 _WaveC;
uniform 	mediump vec4 _WaveD;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _EffectByVertexColor;
uniform 	mediump float _TotalRotate;
uniform 	mediump float _yScale;
uniform 	vec4 _CustomWaveTimeParams;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_23;
vec2 u_xlat34;
mediump float u_xlat16_35;
vec2 u_xlat36;
float u_xlat51;
mediump float u_xlat16_52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = 6.28318548 / _WaveA.w;
    u_xlat16_1.x = _WaveA.z / u_xlat0.x;
    u_xlat16_18.x = 9.80000019 / u_xlat0.x;
    u_xlat16_18.x = sqrt(u_xlat16_18.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.5<_CustomWaveTimeParams.x);
#else
    u_xlatb17 = 0.5<_CustomWaveTimeParams.x;
#endif
    u_xlat17 = (u_xlatb17) ? _CustomWaveTimeParams.y : _Time.y;
    u_xlat34.x = u_xlat17 * u_xlat16_18.x;
    u_xlat2.xy = in_COLOR0.xz * vec2(vec2(_EffectByVertexColor, _EffectByVertexColor)) + in_POSITION0.xz;
    u_xlat16_18.x = dot(_WaveA.xy, _WaveA.xy);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_18.xy = u_xlat16_18.xx * _WaveA.yx;
    u_xlat3.x = sin(_TotalRotate);
    u_xlat4.x = cos(_TotalRotate);
    u_xlat36.xy = u_xlat16_18.xy * u_xlat3.xx;
    u_xlat5.x = u_xlat16_18.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat5.y = u_xlat16_18.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat5.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * _Speed + u_xlat51;
    u_xlat0.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_6.x = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_7;
    u_xlat16_8.y = u_xlat16_1.x * u_xlat16_6.x;
    u_xlat16_8.xz = u_xlat16_18.xx * u_xlat5.xy;
    u_xlat0.x = 6.28318548 / _WaveB.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveB.xy, _WaveB.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xy = u_xlat16_1.xx * _WaveB.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xy;
    u_xlat9.x = u_xlat16_1.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat9.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat16_1.xyz = vec3(vec3(_Speed, _Speed, _Speed)) * vec3(1.29999995, 1.60000002, 1.79999995);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.x + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveB.z / u_xlat0.x;
    u_xlat16_10.x = sin(u_xlat34.x);
    u_xlat16_11 = cos(u_xlat34.x);
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_11;
    u_xlat16_12.y = u_xlat16_1.x * u_xlat16_10.x;
    u_xlat16_12.xz = vec2(u_xlat16_52) * u_xlat9.xy;
    u_xlat16_23.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat0.x = 6.28318548 / _WaveC.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveC.xy, _WaveC.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xw = u_xlat16_1.xx * _WaveC.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xw;
    u_xlat13.x = u_xlat16_1.w * u_xlat4.x + (-u_xlat36.x);
    u_xlat13.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat13.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.y + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveC.z / u_xlat0.x;
    u_xlat16_8.x = sin(u_xlat34.x);
    u_xlat16_12.x = cos(u_xlat34.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_12.x;
    u_xlat16_14.y = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_14.xz = u_xlat16_18.xx * u_xlat13.xy;
    u_xlat16_1.xyw = u_xlat16_23.xyz + u_xlat16_14.xyz;
    u_xlat0.x = 6.28318548 / _WaveD.w;
    u_xlat16_23.x = 9.80000019 / u_xlat0.x;
    u_xlat16_23.x = sqrt(u_xlat16_23.x);
    u_xlat17 = u_xlat17 * u_xlat16_23.x;
    u_xlat16_23.x = dot(_WaveD.xy, _WaveD.xy);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_23.xy = u_xlat16_23.xx * _WaveD.yx;
    u_xlat34.xy = u_xlat3.xx * u_xlat16_23.xy;
    u_xlat3.x = u_xlat16_23.y * u_xlat4.x + (-u_xlat34.x);
    u_xlat3.y = u_xlat16_23.x * u_xlat4.x + u_xlat34.y;
    u_xlat34.x = dot(u_xlat3.xy, u_xlat2.xy);
    u_xlat17 = (-u_xlat17) * u_xlat16_1.z + u_xlat34.x;
    u_xlat17 = u_xlat17 * u_xlat0.x;
    u_xlat16_35 = _WaveD.z / u_xlat0.x;
    u_xlat16_14.x = sin(u_xlat17);
    u_xlat16_15 = cos(u_xlat17);
    u_xlat16_23.x = u_xlat16_35 * u_xlat16_15;
    u_xlat16_16.y = u_xlat16_35 * u_xlat16_14.x;
    u_xlat16_16.xz = u_xlat3.xy * u_xlat16_23.xx;
    u_xlat16_1.xyz = u_xlat16_1.xyw + u_xlat16_16.xyz;
    u_xlat0.xz = u_xlat16_1.xz;
    u_xlat0.y = u_xlat16_1.y * _yScale;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD8.x = u_xlat0.y;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_23.xyz = u_xlat5.xyy * (-u_xlat5.xxy);
    u_xlat16_6.x = u_xlat16_6.x * _WaveA.z;
    u_xlat16_7 = u_xlat16_7 * _WaveA.z;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_23.z;
    u_xlat16_6.yz = u_xlat16_6.xx * u_xlat16_23.yx;
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlat16_16.z = u_xlat5.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat5.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat16_6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat16_16.xyz + vec3(1.0, 0.0, 0.0);
    u_xlat16_6.xyz = u_xlat9.xyy * (-u_xlat9.xxy);
    u_xlat16_57 = u_xlat16_10.x * _WaveB.z;
    u_xlat16_7 = u_xlat16_11 * _WaveB.z;
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_10.y = u_xlat16_6.y;
    u_xlat16_10.z = u_xlat16_7 * u_xlat9.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat9.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat13.xyy * (-u_xlat13.xxy);
    u_xlat16_57 = u_xlat16_8.x * _WaveC.z;
    u_xlat16_7 = u_xlat16_12.x * _WaveC.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat16_7 * u_xlat13.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat13.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat3.xyy * (-u_xlat3.xxy);
    u_xlat16_57 = u_xlat16_14.x * _WaveD.z;
    u_xlat16_7 = u_xlat16_15 * _WaveD.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat3.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat3.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat3.zxy * u_xlat2.yzx + (-u_xlat16_6.xyz);
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb53 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor));
#else
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
#endif
    vs_TEXCOORD3.xyz = (bool(u_xlatb53)) ? in_COLOR0.xyz : u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat3.xyz = vec3(u_xlat53) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    vs_TEXCOORD5.xyz = vec3(u_xlat53) * u_xlat2.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD8.y = in_COLOR0.w;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _StarryTex_ST;
uniform 	float _StarryTexRotator;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	mediump float _ViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	mediump float _Alpha;
uniform 	mediump float _EnableCustomFog;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogDistance;
uniform 	mediump float _FogFade;
uniform 	mediump float _FoamThre;
uniform 	mediump float _FoamRange;
uniform 	mediump vec3 _FoamDir;
uniform 	mediump vec3 _FoamColor;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _FoamDepthStartPoint;
uniform 	mediump float _FoamDepthRange;
uniform 	mediump float _FoamNoiseTilingScale;
uniform 	mediump float _FoamNoiseStrength;
uniform 	mediump vec4 _DiffColor;
uniform 	vec4 _FoamTex_ST;
uniform 	mediump float _worldYDepthA;
uniform 	mediump float _worldYDepthB;
uniform 	mediump vec4 _WolrdYDepthColor;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(6) uniform mediump sampler2D _WaveNoise;
UNITY_LOCATION(7) uniform mediump sampler2D _FoamTex;
UNITY_LOCATION(8) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(9) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec2 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec2 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
mediump vec2 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec3 u_xlat24;
vec3 u_xlat25;
mediump vec3 u_xlat16_25;
mediump float u_xlat10_25;
float u_xlat26;
mediump float u_xlat16_32;
vec3 u_xlat42;
mediump float u_xlat10_50;
bool u_xlatb50;
float u_xlat51;
mediump vec2 u_xlat16_57;
mediump vec2 u_xlat16_58;
mediump vec2 u_xlat16_59;
mediump vec2 u_xlat16_60;
mediump vec2 u_xlat16_64;
vec2 u_xlat69;
float u_xlat75;
mediump float u_xlat16_75;
bool u_xlatb75;
float u_xlat76;
bool u_xlatb76;
float u_xlat77;
mediump float u_xlat10_77;
bool u_xlatb77;
mediump float u_xlat16_82;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
#endif
    if(u_xlatb0){
        u_xlat0.xyz = vs_TEXCOORD3.xyz;
        u_xlat0.w = 1.0;
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat75 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat1.xyz = vec3(u_xlat75) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat75 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat2.xyz = vec3(u_xlat75) * u_xlat2.xyz;
    u_xlat75 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat75 = u_xlat75 + u_xlat75;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat75)) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb75 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb75 = _ShadowBias.z!=0.0;
#endif
    u_xlat77 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat4.xyz = vec3(u_xlat77) * _WorldSpaceLightPos0.xyz;
    u_xlat77 = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat77 = (-u_xlat77) * u_xlat77 + 1.0;
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat77 * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat77) + vs_TEXCOORD2.xyz;
    u_xlat0.xyz = (bool(u_xlatb75)) ? u_xlat0.xyz : vs_TEXCOORD2.xyz;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat6;
    u_xlat4 = u_xlat0.yyyy * u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat5 * u_xlat0.zzzz + u_xlat3;
    u_xlat0 = u_xlat6 + u_xlat0;
    u_xlat77 = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat77 = min(max(u_xlat77, 0.0), 1.0);
#else
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
#endif
    u_xlat77 = u_xlat0.z + (-u_xlat77);
    u_xlat4.x = max((-u_xlat0.w), u_xlat77);
    u_xlat4.x = (-u_xlat77) + u_xlat4.x;
    u_xlat0.z = _ShadowBias.y * u_xlat4.x + u_xlat77;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(_softShadowQuality==1.0);
#else
    u_xlatb50 = _softShadowQuality==1.0;
#endif
    if(u_xlatb50){
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_32 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb50 = !!(_softShadowQuality==2.0);
#else
        u_xlatb50 = _softShadowQuality==2.0;
#endif
        if(u_xlatb50){
            u_xlat16_57.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_57.xy = floor(u_xlat16_57.xy);
            u_xlat16_8.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_57.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_58.xy = u_xlat16_4.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_9.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_59.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_10.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_59.xy;
            u_xlat16_8.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_8.xy) * u_xlat16_8.xy + u_xlat16_3.yw;
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_8.xy = u_xlat16_8.xy + vec2(1.0, 1.0);
            u_xlat16_4.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_5.xy = u_xlat16_59.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_3.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_4.z = u_xlat16_6.x;
            u_xlat16_4.w = u_xlat16_8.x;
            u_xlat16_5.z = u_xlat16_9.x;
            u_xlat16_5.w = u_xlat16_58.x;
            u_xlat16_3 = u_xlat16_4.zwxz + u_xlat16_5.zwxz;
            u_xlat16_6.z = u_xlat16_4.y;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_9.z = u_xlat16_5.y;
            u_xlat16_9.w = u_xlat16_58.y;
            u_xlat16_8.xyz = u_xlat16_6.zyw + u_xlat16_9.zyw;
            u_xlat16_10.xyz = u_xlat16_5.xzw / u_xlat16_3.zwy;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_9.xyz = u_xlat16_9.zyw / u_xlat16_8.xyz;
            u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_4.xyz = u_xlat16_10.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_5.xyz = u_xlat16_9.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_4.w = u_xlat16_5.x;
            u_xlat16_6 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.ywxw;
            u_xlat16_9.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.zw;
            u_xlat16_5.w = u_xlat16_4.y;
            u_xlat16_4.yw = u_xlat16_5.yz;
            u_xlat16_10 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
            u_xlat16_5 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.wywz;
            u_xlat16_4 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xwzw;
            u_xlat16_11 = u_xlat16_3.zwyz * u_xlat16_8.xxxy;
            u_xlat16_12 = u_xlat16_3 * u_xlat16_8.yyzz;
            u_xlat16_57.x = u_xlat16_3.y * u_xlat16_8.z;
            vec3 txVec4 = vec3(u_xlat16_6.xy,u_xlat0.w);
            u_xlat10_50 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_6.zw,u_xlat0.w);
            u_xlat10_77 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_82 = u_xlat10_77 * u_xlat16_11.y;
            u_xlat16_82 = u_xlat16_11.x * u_xlat10_50 + u_xlat16_82;
            vec3 txVec6 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_50 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_82 = u_xlat16_11.z * u_xlat10_50 + u_xlat16_82;
            vec3 txVec7 = vec3(u_xlat16_5.xy,u_xlat0.w);
            u_xlat10_50 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_82 = u_xlat16_11.w * u_xlat10_50 + u_xlat16_82;
            vec3 txVec8 = vec3(u_xlat16_10.xy,u_xlat0.w);
            u_xlat10_50 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_82 = u_xlat16_12.x * u_xlat10_50 + u_xlat16_82;
            vec3 txVec9 = vec3(u_xlat16_10.zw,u_xlat0.w);
            u_xlat10_50 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_82 = u_xlat16_12.y * u_xlat10_50 + u_xlat16_82;
            vec3 txVec10 = vec3(u_xlat16_5.zw,u_xlat0.w);
            u_xlat10_50 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_82 = u_xlat16_12.z * u_xlat10_50 + u_xlat16_82;
            vec3 txVec11 = vec3(u_xlat16_4.xy,u_xlat0.w);
            u_xlat10_50 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_82 = u_xlat16_12.w * u_xlat10_50 + u_xlat16_82;
            vec3 txVec12 = vec3(u_xlat16_4.zw,u_xlat0.w);
            u_xlat10_50 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_32 = u_xlat16_57.x * u_xlat10_50 + u_xlat16_82;
        } else {
            u_xlat16_57.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_57.xy = floor(u_xlat16_57.xy);
            u_xlat16_8.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_57.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_5.yw = u_xlat16_4.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_58.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_9.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_59.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_59.xy) * u_xlat16_59.xy + u_xlat16_9.xy;
            u_xlat16_59.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.zw = (-u_xlat16_59.xy) * u_xlat16_59.xy + u_xlat16_3.yw;
            u_xlat16_9 = u_xlat16_9 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_3.z = u_xlat16_9.z * 0.0816320032;
            u_xlat16_4.xy = u_xlat16_58.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_58.xy = u_xlat16_9.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_4.z = u_xlat16_9.w * 0.0816320032;
            u_xlat16_3.x = u_xlat16_4.y;
            u_xlat16_3.yw = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_58.x;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_3 = u_xlat16_3 + u_xlat16_6;
            u_xlat16_4.yw = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_5.xz = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_5.y = u_xlat16_58.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 / u_xlat16_3;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_5 = u_xlat16_5 / u_xlat16_4;
            u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_5 = u_xlat16_5.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_8.xzw = u_xlat16_6.yzw;
            u_xlat16_8.y = u_xlat16_5.x;
            u_xlat16_9 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_10.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.y = u_xlat16_8.y;
            u_xlat16_8.y = u_xlat16_5.z;
            u_xlat16_11 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_60.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.z = u_xlat16_8.y;
            u_xlat16_12 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyxz;
            u_xlat16_8.y = u_xlat16_5.w;
            u_xlat16_13 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_14.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_64.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xw;
            u_xlat16_5.xzw = u_xlat16_8.xzw;
            u_xlat16_8 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_15.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.wy;
            u_xlat16_5.x = u_xlat16_6.x;
            u_xlat16_57.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xy;
            u_xlat16_5 = u_xlat16_3 * u_xlat16_4.xxxx;
            u_xlat16_6 = u_xlat16_3 * u_xlat16_4.yyyy;
            u_xlat16_16 = u_xlat16_3 * u_xlat16_4.zzzz;
            u_xlat16_3 = u_xlat16_3 * u_xlat16_4.wwww;
            vec3 txVec13 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_9.zw,u_xlat0.w);
            u_xlat10_25 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_9.x = u_xlat10_25 * u_xlat16_5.y;
            u_xlat16_9.x = u_xlat16_5.x * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec15 = vec3(u_xlat16_10.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_9.x = u_xlat16_5.z * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec16 = vec3(u_xlat16_12.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_9.x = u_xlat16_5.w * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec17 = vec3(u_xlat16_11.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_9.x = u_xlat16_6.x * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec18 = vec3(u_xlat16_11.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_9.x = u_xlat16_6.y * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec19 = vec3(u_xlat16_60.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_9.x = u_xlat16_6.z * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec20 = vec3(u_xlat16_12.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_9.x = u_xlat16_6.w * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec21 = vec3(u_xlat16_13.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_9.x = u_xlat16_16.x * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec22 = vec3(u_xlat16_13.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_9.x = u_xlat16_16.y * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec23 = vec3(u_xlat16_14.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_9.x = u_xlat16_16.z * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec24 = vec3(u_xlat16_64.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_9.x = u_xlat16_16.w * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec25 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_8.x = u_xlat16_3.x * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec26 = vec3(u_xlat16_8.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_8.x = u_xlat16_3.y * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec27 = vec3(u_xlat16_15.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_8.x = u_xlat16_3.z * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec28 = vec3(u_xlat16_57.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_32 = u_xlat16_3.w * u_xlat10_0 + u_xlat16_8.x;
        }
    }
    u_xlat16_57.x = (-u_xlat16_7.x) + 1.0;
    u_xlat16_7.x = u_xlat16_32 * u_xlat16_57.x + u_xlat16_7.x;
    u_xlat0.x = u_xlat16_7.x + -1.0;
    u_xlat0.x = _ReceiveShadowsStrength * u_xlat0.x + 1.0;
    u_xlat25.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_25.xyz = texture(_Diff, u_xlat25.xy).xyz;
    u_xlat25.xyz = u_xlat16_25.xyz * _DiffColor.xyz;
    u_xlat17.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_17.xy = texture(_Em_G_CU_R_MASK, u_xlat17.xy).xy;
    u_xlat42.xyz = u_xlat25.xyz * u_xlat16_17.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat1.xyz);
    u_xlat18.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat19.xyz = u_xlat18.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat19.xyz = u_xlat19.xyz * vec3(_Cube_FW);
    u_xlat18.xyz = u_xlat18.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat19.xyz);
    u_xlat18.xyz = u_xlat19.xyz * u_xlat18.xyz + u_xlat19.xyz;
    u_xlat77 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat18.xyz = vec3(u_xlat77) * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat16_17.xxx * u_xlat18.xyz;
    u_xlat17.xyz = u_xlat42.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat18.xyz;
    u_xlat18.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_18.xyz = texture(_Light, u_xlat18.xy).xyz;
    u_xlat19.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat19.xy = u_xlat19.xy + (-vs_TEXCOORD0.xy);
    u_xlat19.xy = vec2(_IsScreenPos) * u_xlat19.xy + vs_TEXCOORD0.xy;
    u_xlat77 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat77 = u_xlat77 * _Time.y;
    u_xlat77 = cos(u_xlat77);
    u_xlat77 = sin(u_xlat77);
    u_xlat69.xy = vec2(u_xlat77) * _Starry_Speed.xxyz.yz + u_xlat19.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb77 = !!(_ViewDir==6.0);
#else
    u_xlatb77 = _ViewDir==6.0;
#endif
    if(u_xlatb77){
        u_xlat77 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat20.xyz = u_xlat1.xyz * vec3(u_xlat77);
    } else {
        u_xlat77 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat21.xyz = u_xlat1.xzy * vec3(u_xlat77);
        u_xlat77 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat22.xyz = u_xlat1.zyx * vec3(u_xlat77);
        u_xlat1.w = (-u_xlat1.z);
        u_xlat77 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat23.xyz = u_xlat1.xyw * vec3(u_xlat77);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat24.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat76 = dot(u_xlat24.xyz, u_xlat24.xyz);
        u_xlat76 = inversesqrt(u_xlat76);
        u_xlat24.xyz = vec3(u_xlat76) * u_xlat24.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb76 = !!(_ViewDir==1.0);
#else
        u_xlatb76 = _ViewDir==1.0;
#endif
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat77 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat77);
        u_xlat1.xyz = bool(u_xlatb76) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb3.w) ? u_xlat24.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.z) ? u_xlat23.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.y) ? u_xlat22.xyz : u_xlat1.xyz;
        u_xlat20.xyz = (u_xlatb3.x) ? u_xlat21.xyz : u_xlat1.xyz;
    }
    u_xlat1.x = u_xlat20.z + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 2.82842708;
    u_xlat1.xy = u_xlat20.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat51 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat51 = u_xlat51 * 3.14159274;
    u_xlat20.x = sin(u_xlat51);
    u_xlat21.x = cos(u_xlat51);
    u_xlat22.x = (-u_xlat20.x);
    u_xlat22.y = u_xlat21.x;
    u_xlat22.z = u_xlat20.x;
    u_xlat20.x = dot(u_xlat1.xy, u_xlat22.yz);
    u_xlat20.y = dot(u_xlat1.xy, u_xlat22.xy);
    u_xlat1.xy = u_xlat20.xy + vec2(0.5, 0.5);
    u_xlat16_1.xyz = texture(_StarryTex, u_xlat1.xy).xyz;
    u_xlat19.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat19.xy;
    u_xlat69.xy = (-u_xlat19.xy) + u_xlat69.xy;
    u_xlat19.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat69.xy + u_xlat19.xy;
    u_xlat19.xy = u_xlat19.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_19.xyz = texture(_StarryTex, u_xlat19.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + (-u_xlat16_19.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat16_19.xyz;
    u_xlat19.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat19.xyz = u_xlat1.xyz * u_xlat19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat19.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat18.xyz = u_xlat16_18.xyz * vec3(_light_PW);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat18.xyz + u_xlat1.xyz;
    u_xlat25.xyz = u_xlat25.xyz + u_xlat17.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat25.xyz;
    u_xlat17.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat76 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat77 = u_xlat76 / _FogDistance;
    u_xlat16_7.x = max(_FogFade, 0.0);
    u_xlat77 = log2(u_xlat77);
    u_xlat77 = u_xlat77 * u_xlat16_7.x;
    u_xlat77 = exp2(u_xlat77);
    u_xlat77 = min(u_xlat77, 1.0);
    u_xlat77 = u_xlat77 * _FogColor.w;
    u_xlat0.xyz = (-u_xlat25.xyz) * u_xlat0.xxx + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat77);
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(vec2(_FoamNoiseTilingScale, _FoamNoiseTilingScale));
    u_xlat16_75 = texture(_WaveNoise, u_xlat1.xy).x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat16_1.x = texture(_FoamTex, u_xlat1.xy).x;
    u_xlat26 = u_xlat76 + (-_FoamDepthStartPoint);
    u_xlat51 = float(1.0) / _FoamDepthRange;
    u_xlat26 = u_xlat51 * u_xlat26;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat51 = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat51;
    u_xlat16_7.xyz = vec3(u_xlat26) * _FoamColor.xyz;
    u_xlat16_7.xyz = u_xlat16_1.xxx * u_xlat16_7.xyz;
    u_xlat1.x = u_xlat16_75 * _FoamNoiseStrength + _FoamDir.x;
    u_xlat1.yz = _FoamDir.yz;
    u_xlat75 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat1.xyz = vec3(u_xlat75) * u_xlat1.xyz;
    u_xlat75 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat75 = u_xlat75 + (-_FoamThre);
    u_xlat1.x = float(1.0) / _FoamRange;
    u_xlat75 = u_xlat75 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat1.x;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(u_xlat75) + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _WolrdYDepthColor.xyz;
    u_xlat75 = (-_worldYDepthA) + _worldYDepthB;
    u_xlat76 = vs_TEXCOORD8.x + (-_worldYDepthA);
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat76;
#ifdef UNITY_ADRENO_ES3
    u_xlat75 = min(max(u_xlat75, 0.0), 1.0);
#else
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
#endif
    u_xlat76 = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat76;
    u_xlat0.xyz = (-_WolrdYDepthColor.xyz) * u_xlat0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat75) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_TEXCOORD8.y * _Alpha;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump vec4 _WaveA;
uniform 	mediump vec4 _WaveB;
uniform 	mediump vec4 _WaveC;
uniform 	mediump vec4 _WaveD;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _EffectByVertexColor;
uniform 	mediump float _TotalRotate;
uniform 	mediump float _yScale;
uniform 	vec4 _CustomWaveTimeParams;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_23;
vec2 u_xlat34;
mediump float u_xlat16_35;
vec2 u_xlat36;
float u_xlat51;
mediump float u_xlat16_52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = 6.28318548 / _WaveA.w;
    u_xlat16_1.x = _WaveA.z / u_xlat0.x;
    u_xlat16_18.x = 9.80000019 / u_xlat0.x;
    u_xlat16_18.x = sqrt(u_xlat16_18.x);
    u_xlatb17 = 0.5<_CustomWaveTimeParams.x;
    u_xlat17 = (u_xlatb17) ? _CustomWaveTimeParams.y : _Time.y;
    u_xlat34.x = u_xlat17 * u_xlat16_18.x;
    u_xlat2.xy = in_COLOR0.xz * vec2(vec2(_EffectByVertexColor, _EffectByVertexColor)) + in_POSITION0.xz;
    u_xlat16_18.x = dot(_WaveA.xy, _WaveA.xy);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_18.xy = u_xlat16_18.xx * _WaveA.yx;
    u_xlat3.x = sin(_TotalRotate);
    u_xlat4.x = cos(_TotalRotate);
    u_xlat36.xy = u_xlat16_18.xy * u_xlat3.xx;
    u_xlat5.x = u_xlat16_18.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat5.y = u_xlat16_18.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat5.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * _Speed + u_xlat51;
    u_xlat0.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_6.x = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_7;
    u_xlat16_8.y = u_xlat16_1.x * u_xlat16_6.x;
    u_xlat16_8.xz = u_xlat16_18.xx * u_xlat5.xy;
    u_xlat0.x = 6.28318548 / _WaveB.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveB.xy, _WaveB.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xy = u_xlat16_1.xx * _WaveB.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xy;
    u_xlat9.x = u_xlat16_1.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat9.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat16_1.xyz = vec3(vec3(_Speed, _Speed, _Speed)) * vec3(1.29999995, 1.60000002, 1.79999995);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.x + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveB.z / u_xlat0.x;
    u_xlat16_10.x = sin(u_xlat34.x);
    u_xlat16_11 = cos(u_xlat34.x);
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_11;
    u_xlat16_12.y = u_xlat16_1.x * u_xlat16_10.x;
    u_xlat16_12.xz = vec2(u_xlat16_52) * u_xlat9.xy;
    u_xlat16_23.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat0.x = 6.28318548 / _WaveC.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveC.xy, _WaveC.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xw = u_xlat16_1.xx * _WaveC.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xw;
    u_xlat13.x = u_xlat16_1.w * u_xlat4.x + (-u_xlat36.x);
    u_xlat13.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat13.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.y + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveC.z / u_xlat0.x;
    u_xlat16_8.x = sin(u_xlat34.x);
    u_xlat16_12.x = cos(u_xlat34.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_12.x;
    u_xlat16_14.y = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_14.xz = u_xlat16_18.xx * u_xlat13.xy;
    u_xlat16_1.xyw = u_xlat16_23.xyz + u_xlat16_14.xyz;
    u_xlat0.x = 6.28318548 / _WaveD.w;
    u_xlat16_23.x = 9.80000019 / u_xlat0.x;
    u_xlat16_23.x = sqrt(u_xlat16_23.x);
    u_xlat17 = u_xlat17 * u_xlat16_23.x;
    u_xlat16_23.x = dot(_WaveD.xy, _WaveD.xy);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_23.xy = u_xlat16_23.xx * _WaveD.yx;
    u_xlat34.xy = u_xlat3.xx * u_xlat16_23.xy;
    u_xlat3.x = u_xlat16_23.y * u_xlat4.x + (-u_xlat34.x);
    u_xlat3.y = u_xlat16_23.x * u_xlat4.x + u_xlat34.y;
    u_xlat34.x = dot(u_xlat3.xy, u_xlat2.xy);
    u_xlat17 = (-u_xlat17) * u_xlat16_1.z + u_xlat34.x;
    u_xlat17 = u_xlat17 * u_xlat0.x;
    u_xlat16_35 = _WaveD.z / u_xlat0.x;
    u_xlat16_14.x = sin(u_xlat17);
    u_xlat16_15 = cos(u_xlat17);
    u_xlat16_23.x = u_xlat16_35 * u_xlat16_15;
    u_xlat16_16.y = u_xlat16_35 * u_xlat16_14.x;
    u_xlat16_16.xz = u_xlat3.xy * u_xlat16_23.xx;
    u_xlat16_1.xyz = u_xlat16_1.xyw + u_xlat16_16.xyz;
    u_xlat0.xz = u_xlat16_1.xz;
    u_xlat0.y = u_xlat16_1.y * _yScale;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD8.x = u_xlat0.y;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_23.xyz = u_xlat5.xyy * (-u_xlat5.xxy);
    u_xlat16_6.x = u_xlat16_6.x * _WaveA.z;
    u_xlat16_7 = u_xlat16_7 * _WaveA.z;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_23.z;
    u_xlat16_6.yz = u_xlat16_6.xx * u_xlat16_23.yx;
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlat16_16.z = u_xlat5.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat5.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat16_6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat16_16.xyz + vec3(1.0, 0.0, 0.0);
    u_xlat16_6.xyz = u_xlat9.xyy * (-u_xlat9.xxy);
    u_xlat16_57 = u_xlat16_10.x * _WaveB.z;
    u_xlat16_7 = u_xlat16_11 * _WaveB.z;
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_10.y = u_xlat16_6.y;
    u_xlat16_10.z = u_xlat16_7 * u_xlat9.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat9.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat13.xyy * (-u_xlat13.xxy);
    u_xlat16_57 = u_xlat16_8.x * _WaveC.z;
    u_xlat16_7 = u_xlat16_12.x * _WaveC.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat16_7 * u_xlat13.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat13.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat3.xyy * (-u_xlat3.xxy);
    u_xlat16_57 = u_xlat16_14.x * _WaveD.z;
    u_xlat16_7 = u_xlat16_15 * _WaveD.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat3.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat3.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat3.zxy * u_xlat2.yzx + (-u_xlat16_6.xyz);
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
    vs_TEXCOORD3.xyz = (bool(u_xlatb53)) ? in_COLOR0.xyz : u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat3.xyz = vec3(u_xlat53) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    vs_TEXCOORD5.xyz = vec3(u_xlat53) * u_xlat2.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD8.y = in_COLOR0.w;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _StarryTex_ST;
uniform 	float _StarryTexRotator;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	mediump float _ViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	mediump float _Alpha;
uniform 	mediump float _EnableCustomFog;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogDistance;
uniform 	mediump float _FogFade;
uniform 	mediump float _FoamThre;
uniform 	mediump float _FoamRange;
uniform 	mediump vec3 _FoamDir;
uniform 	mediump vec3 _FoamColor;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _FoamDepthStartPoint;
uniform 	mediump float _FoamDepthRange;
uniform 	mediump float _FoamNoiseTilingScale;
uniform 	mediump float _FoamNoiseStrength;
uniform 	mediump vec4 _DiffColor;
uniform 	vec4 _FoamTex_ST;
uniform 	mediump float _worldYDepthA;
uniform 	mediump float _worldYDepthB;
uniform 	mediump vec4 _WolrdYDepthColor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform lowp sampler2D _WaveNoise;
uniform lowp sampler2D _FoamTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec2 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
lowp vec2 u_xlat10_17;
vec3 u_xlat18;
lowp vec3 u_xlat10_18;
vec3 u_xlat19;
lowp vec3 u_xlat10_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec3 u_xlat24;
vec3 u_xlat25;
lowp vec3 u_xlat10_25;
float u_xlat26;
mediump float u_xlat16_32;
vec3 u_xlat42;
lowp float u_xlat10_50;
bool u_xlatb50;
float u_xlat51;
mediump vec2 u_xlat16_57;
mediump vec2 u_xlat16_58;
mediump vec2 u_xlat16_59;
mediump vec2 u_xlat16_60;
mediump vec2 u_xlat16_64;
vec2 u_xlat69;
float u_xlat75;
lowp float u_xlat10_75;
bool u_xlatb75;
float u_xlat76;
bool u_xlatb76;
float u_xlat77;
lowp float u_xlat10_77;
bool u_xlatb77;
mediump float u_xlat16_82;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
    if(u_xlatb0){
        u_xlat0.xyz = vs_TEXCOORD3.xyz;
        u_xlat0.w = 1.0;
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat75 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat1.xyz = vec3(u_xlat75) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat75 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat2.xyz = vec3(u_xlat75) * u_xlat2.xyz;
    u_xlat75 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat75 = u_xlat75 + u_xlat75;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat75)) + (-u_xlat1.xyz);
    u_xlatb75 = _ShadowBias.z!=0.0;
    u_xlat77 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat4.xyz = vec3(u_xlat77) * _WorldSpaceLightPos0.xyz;
    u_xlat77 = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat77 = (-u_xlat77) * u_xlat77 + 1.0;
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat77 * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat77) + vs_TEXCOORD2.xyz;
    u_xlat0.xyz = (bool(u_xlatb75)) ? u_xlat0.xyz : vs_TEXCOORD2.xyz;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat6;
    u_xlat4 = u_xlat0.yyyy * u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat5 * u_xlat0.zzzz + u_xlat3;
    u_xlat0 = u_xlat6 + u_xlat0;
    u_xlat77 = _ShadowBias.x / u_xlat0.w;
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
    u_xlat77 = u_xlat0.z + (-u_xlat77);
    u_xlat4.x = max((-u_xlat0.w), u_xlat77);
    u_xlat4.x = (-u_xlat77) + u_xlat4.x;
    u_xlat0.z = _ShadowBias.y * u_xlat4.x + u_xlat77;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlatb50 = _softShadowQuality==1.0;
    if(u_xlatb50){
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_32 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb50 = _softShadowQuality==2.0;
        if(u_xlatb50){
            u_xlat16_57.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_57.xy = floor(u_xlat16_57.xy);
            u_xlat16_8.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_57.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_58.xy = u_xlat16_4.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_9.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_59.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_10.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_59.xy;
            u_xlat16_8.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_8.xy) * u_xlat16_8.xy + u_xlat16_3.yw;
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_8.xy = u_xlat16_8.xy + vec2(1.0, 1.0);
            u_xlat16_4.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_5.xy = u_xlat16_59.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_3.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_4.z = u_xlat16_6.x;
            u_xlat16_4.w = u_xlat16_8.x;
            u_xlat16_5.z = u_xlat16_9.x;
            u_xlat16_5.w = u_xlat16_58.x;
            u_xlat16_3 = u_xlat16_4.zwxz + u_xlat16_5.zwxz;
            u_xlat16_6.z = u_xlat16_4.y;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_9.z = u_xlat16_5.y;
            u_xlat16_9.w = u_xlat16_58.y;
            u_xlat16_8.xyz = u_xlat16_6.zyw + u_xlat16_9.zyw;
            u_xlat16_10.xyz = u_xlat16_5.xzw / u_xlat16_3.zwy;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_9.xyz = u_xlat16_9.zyw / u_xlat16_8.xyz;
            u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_4.xyz = u_xlat16_10.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_5.xyz = u_xlat16_9.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_4.w = u_xlat16_5.x;
            u_xlat16_6 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.ywxw;
            u_xlat16_9.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.zw;
            u_xlat16_5.w = u_xlat16_4.y;
            u_xlat16_4.yw = u_xlat16_5.yz;
            u_xlat16_10 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
            u_xlat16_5 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.wywz;
            u_xlat16_4 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xwzw;
            u_xlat16_11 = u_xlat16_3.zwyz * u_xlat16_8.xxxy;
            u_xlat16_12 = u_xlat16_3 * u_xlat16_8.yyzz;
            u_xlat16_57.x = u_xlat16_3.y * u_xlat16_8.z;
            vec3 txVec4 = vec3(u_xlat16_6.xy,u_xlat0.w);
            u_xlat10_50 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_6.zw,u_xlat0.w);
            u_xlat10_77 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_82 = u_xlat10_77 * u_xlat16_11.y;
            u_xlat16_82 = u_xlat16_11.x * u_xlat10_50 + u_xlat16_82;
            vec3 txVec6 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_50 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_82 = u_xlat16_11.z * u_xlat10_50 + u_xlat16_82;
            vec3 txVec7 = vec3(u_xlat16_5.xy,u_xlat0.w);
            u_xlat10_50 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_82 = u_xlat16_11.w * u_xlat10_50 + u_xlat16_82;
            vec3 txVec8 = vec3(u_xlat16_10.xy,u_xlat0.w);
            u_xlat10_50 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_82 = u_xlat16_12.x * u_xlat10_50 + u_xlat16_82;
            vec3 txVec9 = vec3(u_xlat16_10.zw,u_xlat0.w);
            u_xlat10_50 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_82 = u_xlat16_12.y * u_xlat10_50 + u_xlat16_82;
            vec3 txVec10 = vec3(u_xlat16_5.zw,u_xlat0.w);
            u_xlat10_50 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_82 = u_xlat16_12.z * u_xlat10_50 + u_xlat16_82;
            vec3 txVec11 = vec3(u_xlat16_4.xy,u_xlat0.w);
            u_xlat10_50 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_82 = u_xlat16_12.w * u_xlat10_50 + u_xlat16_82;
            vec3 txVec12 = vec3(u_xlat16_4.zw,u_xlat0.w);
            u_xlat10_50 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_32 = u_xlat16_57.x * u_xlat10_50 + u_xlat16_82;
        } else {
            u_xlat16_57.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_57.xy = floor(u_xlat16_57.xy);
            u_xlat16_8.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_57.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_5.yw = u_xlat16_4.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_58.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_9.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_59.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_59.xy) * u_xlat16_59.xy + u_xlat16_9.xy;
            u_xlat16_59.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.zw = (-u_xlat16_59.xy) * u_xlat16_59.xy + u_xlat16_3.yw;
            u_xlat16_9 = u_xlat16_9 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_3.z = u_xlat16_9.z * 0.0816320032;
            u_xlat16_4.xy = u_xlat16_58.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_58.xy = u_xlat16_9.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_4.z = u_xlat16_9.w * 0.0816320032;
            u_xlat16_3.x = u_xlat16_4.y;
            u_xlat16_3.yw = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_58.x;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_3 = u_xlat16_3 + u_xlat16_6;
            u_xlat16_4.yw = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_5.xz = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_5.y = u_xlat16_58.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 / u_xlat16_3;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_5 = u_xlat16_5 / u_xlat16_4;
            u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_5 = u_xlat16_5.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_8.xzw = u_xlat16_6.yzw;
            u_xlat16_8.y = u_xlat16_5.x;
            u_xlat16_9 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_10.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.y = u_xlat16_8.y;
            u_xlat16_8.y = u_xlat16_5.z;
            u_xlat16_11 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_60.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.z = u_xlat16_8.y;
            u_xlat16_12 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyxz;
            u_xlat16_8.y = u_xlat16_5.w;
            u_xlat16_13 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_14.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_64.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xw;
            u_xlat16_5.xzw = u_xlat16_8.xzw;
            u_xlat16_8 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_15.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.wy;
            u_xlat16_5.x = u_xlat16_6.x;
            u_xlat16_57.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xy;
            u_xlat16_5 = u_xlat16_3 * u_xlat16_4.xxxx;
            u_xlat16_6 = u_xlat16_3 * u_xlat16_4.yyyy;
            u_xlat16_16 = u_xlat16_3 * u_xlat16_4.zzzz;
            u_xlat16_3 = u_xlat16_3 * u_xlat16_4.wwww;
            vec3 txVec13 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_9.zw,u_xlat0.w);
            u_xlat10_25.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_9.x = u_xlat10_25.x * u_xlat16_5.y;
            u_xlat16_9.x = u_xlat16_5.x * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec15 = vec3(u_xlat16_10.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_9.x = u_xlat16_5.z * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec16 = vec3(u_xlat16_12.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_9.x = u_xlat16_5.w * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec17 = vec3(u_xlat16_11.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_9.x = u_xlat16_6.x * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec18 = vec3(u_xlat16_11.zw,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_9.x = u_xlat16_6.y * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec19 = vec3(u_xlat16_60.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_9.x = u_xlat16_6.z * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec20 = vec3(u_xlat16_12.zw,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_9.x = u_xlat16_6.w * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec21 = vec3(u_xlat16_13.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_9.x = u_xlat16_16.x * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec22 = vec3(u_xlat16_13.zw,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_9.x = u_xlat16_16.y * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec23 = vec3(u_xlat16_14.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_9.x = u_xlat16_16.z * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec24 = vec3(u_xlat16_64.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_9.x = u_xlat16_16.w * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec25 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_8.x = u_xlat16_3.x * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec26 = vec3(u_xlat16_8.zw,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_8.x = u_xlat16_3.y * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec27 = vec3(u_xlat16_15.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_8.x = u_xlat16_3.z * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec28 = vec3(u_xlat16_57.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_32 = u_xlat16_3.w * u_xlat10_0 + u_xlat16_8.x;
        }
    }
    u_xlat16_57.x = (-u_xlat16_7.x) + 1.0;
    u_xlat16_7.x = u_xlat16_32 * u_xlat16_57.x + u_xlat16_7.x;
    u_xlat0.x = u_xlat16_7.x + -1.0;
    u_xlat0.x = _ReceiveShadowsStrength * u_xlat0.x + 1.0;
    u_xlat25.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_25.xyz = texture2D(_Diff, u_xlat25.xy).xyz;
    u_xlat25.xyz = u_xlat10_25.xyz * _DiffColor.xyz;
    u_xlat17.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_17.xy = texture2D(_Em_G_CU_R_MASK, u_xlat17.xy).xy;
    u_xlat42.xyz = u_xlat25.xyz * u_xlat10_17.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat1.xyz);
    u_xlat18.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat19.xyz = u_xlat18.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat19.xyz = u_xlat19.xyz * vec3(_Cube_FW);
    u_xlat18.xyz = u_xlat18.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat19.xyz);
    u_xlat18.xyz = u_xlat19.xyz * u_xlat18.xyz + u_xlat19.xyz;
    u_xlat77 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat18.xyz = vec3(u_xlat77) * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat10_17.xxx * u_xlat18.xyz;
    u_xlat17.xyz = u_xlat42.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat18.xyz;
    u_xlat18.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_18.xyz = texture2D(_Light, u_xlat18.xy).xyz;
    u_xlat19.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat19.xy = u_xlat19.xy + (-vs_TEXCOORD0.xy);
    u_xlat19.xy = vec2(_IsScreenPos) * u_xlat19.xy + vs_TEXCOORD0.xy;
    u_xlat77 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat77 = u_xlat77 * _Time.y;
    u_xlat77 = cos(u_xlat77);
    u_xlat77 = sin(u_xlat77);
    u_xlat69.xy = vec2(u_xlat77) * _Starry_Speed.xxyz.yz + u_xlat19.xy;
    u_xlatb77 = _ViewDir==6.0;
    if(u_xlatb77){
        u_xlat77 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat20.xyz = u_xlat1.xyz * vec3(u_xlat77);
    } else {
        u_xlat77 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat21.xyz = u_xlat1.xzy * vec3(u_xlat77);
        u_xlat77 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat22.xyz = u_xlat1.zyx * vec3(u_xlat77);
        u_xlat1.w = (-u_xlat1.z);
        u_xlat77 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat23.xyz = u_xlat1.xyw * vec3(u_xlat77);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat24.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat76 = dot(u_xlat24.xyz, u_xlat24.xyz);
        u_xlat76 = inversesqrt(u_xlat76);
        u_xlat24.xyz = vec3(u_xlat76) * u_xlat24.xyz;
        u_xlatb76 = _ViewDir==1.0;
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat77 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat77);
        u_xlat1.xyz = bool(u_xlatb76) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb3.w) ? u_xlat24.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.z) ? u_xlat23.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.y) ? u_xlat22.xyz : u_xlat1.xyz;
        u_xlat20.xyz = (u_xlatb3.x) ? u_xlat21.xyz : u_xlat1.xyz;
    }
    u_xlat1.x = u_xlat20.z + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 2.82842708;
    u_xlat1.xy = u_xlat20.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat51 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat51 = u_xlat51 * 3.14159274;
    u_xlat20.x = sin(u_xlat51);
    u_xlat21.x = cos(u_xlat51);
    u_xlat22.x = (-u_xlat20.x);
    u_xlat22.y = u_xlat21.x;
    u_xlat22.z = u_xlat20.x;
    u_xlat20.x = dot(u_xlat1.xy, u_xlat22.yz);
    u_xlat20.y = dot(u_xlat1.xy, u_xlat22.xy);
    u_xlat1.xy = u_xlat20.xy + vec2(0.5, 0.5);
    u_xlat10_1.xyz = texture2D(_StarryTex, u_xlat1.xy).xyz;
    u_xlat19.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat19.xy;
    u_xlat69.xy = (-u_xlat19.xy) + u_xlat69.xy;
    u_xlat19.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat69.xy + u_xlat19.xy;
    u_xlat19.xy = u_xlat19.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_19.xyz = texture2D(_StarryTex, u_xlat19.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + (-u_xlat10_19.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat10_19.xyz;
    u_xlat19.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat19.xyz = u_xlat1.xyz * u_xlat19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat19.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat18.xyz = u_xlat10_18.xyz * vec3(_light_PW);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat18.xyz + u_xlat1.xyz;
    u_xlat25.xyz = u_xlat25.xyz + u_xlat17.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat25.xyz;
    u_xlat17.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat76 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat77 = u_xlat76 / _FogDistance;
    u_xlat16_7.x = max(_FogFade, 0.0);
    u_xlat77 = log2(u_xlat77);
    u_xlat77 = u_xlat77 * u_xlat16_7.x;
    u_xlat77 = exp2(u_xlat77);
    u_xlat77 = min(u_xlat77, 1.0);
    u_xlat77 = u_xlat77 * _FogColor.w;
    u_xlat0.xyz = (-u_xlat25.xyz) * u_xlat0.xxx + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat77);
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(vec2(_FoamNoiseTilingScale, _FoamNoiseTilingScale));
    u_xlat10_75 = texture2D(_WaveNoise, u_xlat1.xy).x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat10_1.x = texture2D(_FoamTex, u_xlat1.xy).x;
    u_xlat26 = u_xlat76 + (-_FoamDepthStartPoint);
    u_xlat51 = float(1.0) / _FoamDepthRange;
    u_xlat26 = u_xlat51 * u_xlat26;
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat51 = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat51;
    u_xlat16_7.xyz = vec3(u_xlat26) * _FoamColor.xyz;
    u_xlat16_7.xyz = u_xlat10_1.xxx * u_xlat16_7.xyz;
    u_xlat1.x = u_xlat10_75 * _FoamNoiseStrength + _FoamDir.x;
    u_xlat1.yz = _FoamDir.yz;
    u_xlat75 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat1.xyz = vec3(u_xlat75) * u_xlat1.xyz;
    u_xlat75 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat75 = u_xlat75 + (-_FoamThre);
    u_xlat1.x = float(1.0) / _FoamRange;
    u_xlat75 = u_xlat75 * u_xlat1.x;
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
    u_xlat1.x = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat1.x;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(u_xlat75) + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _WolrdYDepthColor.xyz;
    u_xlat75 = (-_worldYDepthA) + _worldYDepthB;
    u_xlat76 = vs_TEXCOORD8.x + (-_worldYDepthA);
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat76;
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
    u_xlat76 = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat76;
    u_xlat0.xyz = (-_WolrdYDepthColor.xyz) * u_xlat0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat75) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_TEXCOORD8.y * _Alpha;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Speed;
uniform 	mediump vec4 _WaveA;
uniform 	mediump vec4 _WaveB;
uniform 	mediump vec4 _WaveC;
uniform 	mediump vec4 _WaveD;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _EffectByVertexColor;
uniform 	mediump float _TotalRotate;
uniform 	mediump float _yScale;
uniform 	vec4 _CustomWaveTimeParams;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
mediump float u_xlat16_15;
mediump vec3 u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
mediump vec2 u_xlat16_18;
mediump vec3 u_xlat16_23;
vec2 u_xlat34;
mediump float u_xlat16_35;
vec2 u_xlat36;
float u_xlat51;
mediump float u_xlat16_52;
float u_xlat53;
bool u_xlatb53;
mediump float u_xlat16_57;
void main()
{
    u_xlat0.x = 6.28318548 / _WaveA.w;
    u_xlat16_1.x = _WaveA.z / u_xlat0.x;
    u_xlat16_18.x = 9.80000019 / u_xlat0.x;
    u_xlat16_18.x = sqrt(u_xlat16_18.x);
    u_xlatb17 = 0.5<_CustomWaveTimeParams.x;
    u_xlat17 = (u_xlatb17) ? _CustomWaveTimeParams.y : _Time.y;
    u_xlat34.x = u_xlat17 * u_xlat16_18.x;
    u_xlat2.xy = in_COLOR0.xz * vec2(vec2(_EffectByVertexColor, _EffectByVertexColor)) + in_POSITION0.xz;
    u_xlat16_18.x = dot(_WaveA.xy, _WaveA.xy);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat16_18.xy = u_xlat16_18.xx * _WaveA.yx;
    u_xlat3.x = sin(_TotalRotate);
    u_xlat4.x = cos(_TotalRotate);
    u_xlat36.xy = u_xlat16_18.xy * u_xlat3.xx;
    u_xlat5.x = u_xlat16_18.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat5.y = u_xlat16_18.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat5.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * _Speed + u_xlat51;
    u_xlat0.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_6.x = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_7;
    u_xlat16_8.y = u_xlat16_1.x * u_xlat16_6.x;
    u_xlat16_8.xz = u_xlat16_18.xx * u_xlat5.xy;
    u_xlat0.x = 6.28318548 / _WaveB.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveB.xy, _WaveB.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xy = u_xlat16_1.xx * _WaveB.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xy;
    u_xlat9.x = u_xlat16_1.y * u_xlat4.x + (-u_xlat36.x);
    u_xlat9.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat9.xy, u_xlat2.xy);
    u_xlat16_1.xyz = vec3(vec3(_Speed, _Speed, _Speed)) * vec3(1.29999995, 1.60000002, 1.79999995);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.x + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveB.z / u_xlat0.x;
    u_xlat16_10.x = sin(u_xlat34.x);
    u_xlat16_11 = cos(u_xlat34.x);
    u_xlat16_52 = u_xlat16_1.x * u_xlat16_11;
    u_xlat16_12.y = u_xlat16_1.x * u_xlat16_10.x;
    u_xlat16_12.xz = vec2(u_xlat16_52) * u_xlat9.xy;
    u_xlat16_23.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat0.x = 6.28318548 / _WaveC.w;
    u_xlat16_1.x = 9.80000019 / u_xlat0.x;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat34.x = u_xlat17 * u_xlat16_1.x;
    u_xlat16_1.x = dot(_WaveC.xy, _WaveC.xy);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xw = u_xlat16_1.xx * _WaveC.yx;
    u_xlat36.xy = u_xlat3.xx * u_xlat16_1.xw;
    u_xlat13.x = u_xlat16_1.w * u_xlat4.x + (-u_xlat36.x);
    u_xlat13.y = u_xlat16_1.x * u_xlat4.x + u_xlat36.y;
    u_xlat51 = dot(u_xlat13.xy, u_xlat2.xy);
    u_xlat34.x = (-u_xlat34.x) * u_xlat16_1.y + u_xlat51;
    u_xlat34.x = u_xlat34.x * u_xlat0.x;
    u_xlat16_1.x = _WaveC.z / u_xlat0.x;
    u_xlat16_8.x = sin(u_xlat34.x);
    u_xlat16_12.x = cos(u_xlat34.x);
    u_xlat16_18.x = u_xlat16_1.x * u_xlat16_12.x;
    u_xlat16_14.y = u_xlat16_1.x * u_xlat16_8.x;
    u_xlat16_14.xz = u_xlat16_18.xx * u_xlat13.xy;
    u_xlat16_1.xyw = u_xlat16_23.xyz + u_xlat16_14.xyz;
    u_xlat0.x = 6.28318548 / _WaveD.w;
    u_xlat16_23.x = 9.80000019 / u_xlat0.x;
    u_xlat16_23.x = sqrt(u_xlat16_23.x);
    u_xlat17 = u_xlat17 * u_xlat16_23.x;
    u_xlat16_23.x = dot(_WaveD.xy, _WaveD.xy);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_23.xy = u_xlat16_23.xx * _WaveD.yx;
    u_xlat34.xy = u_xlat3.xx * u_xlat16_23.xy;
    u_xlat3.x = u_xlat16_23.y * u_xlat4.x + (-u_xlat34.x);
    u_xlat3.y = u_xlat16_23.x * u_xlat4.x + u_xlat34.y;
    u_xlat34.x = dot(u_xlat3.xy, u_xlat2.xy);
    u_xlat17 = (-u_xlat17) * u_xlat16_1.z + u_xlat34.x;
    u_xlat17 = u_xlat17 * u_xlat0.x;
    u_xlat16_35 = _WaveD.z / u_xlat0.x;
    u_xlat16_14.x = sin(u_xlat17);
    u_xlat16_15 = cos(u_xlat17);
    u_xlat16_23.x = u_xlat16_35 * u_xlat16_15;
    u_xlat16_16.y = u_xlat16_35 * u_xlat16_14.x;
    u_xlat16_16.xz = u_xlat3.xy * u_xlat16_23.xx;
    u_xlat16_1.xyz = u_xlat16_1.xyw + u_xlat16_16.xyz;
    u_xlat0.xz = u_xlat16_1.xz;
    u_xlat0.y = u_xlat16_1.y * _yScale;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD8.x = u_xlat0.y;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_23.xyz = u_xlat5.xyy * (-u_xlat5.xxy);
    u_xlat16_6.x = u_xlat16_6.x * _WaveA.z;
    u_xlat16_7 = u_xlat16_7 * _WaveA.z;
    u_xlat16_16.x = u_xlat16_6.x * u_xlat16_23.z;
    u_xlat16_6.yz = u_xlat16_6.xx * u_xlat16_23.yx;
    u_xlat16_16.y = u_xlat16_6.y;
    u_xlat16_16.z = u_xlat5.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat5.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat16_6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat4.xyz = u_xlat16_16.xyz + vec3(1.0, 0.0, 0.0);
    u_xlat16_6.xyz = u_xlat9.xyy * (-u_xlat9.xxy);
    u_xlat16_57 = u_xlat16_10.x * _WaveB.z;
    u_xlat16_7 = u_xlat16_11 * _WaveB.z;
    u_xlat16_10.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_10.y = u_xlat16_6.y;
    u_xlat16_10.z = u_xlat16_7 * u_xlat9.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat9.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat13.xyy * (-u_xlat13.xxy);
    u_xlat16_57 = u_xlat16_8.x * _WaveC.z;
    u_xlat16_7 = u_xlat16_12.x * _WaveC.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat16_7 * u_xlat13.y;
    u_xlat16_6.x = u_xlat16_7 * u_xlat13.x;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat4.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat3.xyy * (-u_xlat3.xxy);
    u_xlat16_57 = u_xlat16_14.x * _WaveD.z;
    u_xlat16_7 = u_xlat16_15 * _WaveD.z;
    u_xlat16_8.x = u_xlat16_57 * u_xlat16_6.z;
    u_xlat16_6.yz = vec2(u_xlat16_57) * u_xlat16_6.yx;
    u_xlat16_8.y = u_xlat16_6.y;
    u_xlat16_8.z = u_xlat3.y * u_xlat16_7;
    u_xlat16_6.x = u_xlat3.x * u_xlat16_7;
    u_xlat2.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat4.xyz + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat16_6.xyz = u_xlat3.zxy * u_xlat2.yzx + (-u_xlat16_6.xyz);
    u_xlat16_57 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_6.xyz = vec3(u_xlat16_57) * u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_6.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_6.zzz + u_xlat2.xyz;
    u_xlatb53 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
    vs_TEXCOORD3.xyz = (bool(u_xlatb53)) ? in_COLOR0.xyz : u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat53 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    u_xlat3.xyz = vec3(u_xlat53) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat53 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat53 = inversesqrt(u_xlat53);
    vs_TEXCOORD5.xyz = vec3(u_xlat53) * u_xlat2.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    vs_TEXCOORD8.y = in_COLOR0.w;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	float _softShadowQuality;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _StarryTex_ST;
uniform 	float _StarryTexRotator;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	mediump float _ViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	mediump float _Alpha;
uniform 	mediump float _EnableCustomFog;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogDistance;
uniform 	mediump float _FogFade;
uniform 	mediump float _FoamThre;
uniform 	mediump float _FoamRange;
uniform 	mediump vec3 _FoamDir;
uniform 	mediump vec3 _FoamColor;
uniform 	mediump float _ShowVertexColor;
uniform 	mediump float _FoamDepthStartPoint;
uniform 	mediump float _FoamDepthRange;
uniform 	mediump float _FoamNoiseTilingScale;
uniform 	mediump float _FoamNoiseStrength;
uniform 	mediump vec4 _DiffColor;
uniform 	vec4 _FoamTex_ST;
uniform 	mediump float _worldYDepthA;
uniform 	mediump float _worldYDepthB;
uniform 	mediump vec4 _WolrdYDepthColor;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform lowp sampler2D _WaveNoise;
uniform lowp sampler2D _FoamTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec2 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec2 u_xlat16_15;
mediump vec4 u_xlat16_16;
vec3 u_xlat17;
lowp vec2 u_xlat10_17;
vec3 u_xlat18;
lowp vec3 u_xlat10_18;
vec3 u_xlat19;
lowp vec3 u_xlat10_19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec3 u_xlat24;
vec3 u_xlat25;
lowp vec3 u_xlat10_25;
float u_xlat26;
mediump float u_xlat16_32;
vec3 u_xlat42;
lowp float u_xlat10_50;
bool u_xlatb50;
float u_xlat51;
mediump vec2 u_xlat16_57;
mediump vec2 u_xlat16_58;
mediump vec2 u_xlat16_59;
mediump vec2 u_xlat16_60;
mediump vec2 u_xlat16_64;
vec2 u_xlat69;
float u_xlat75;
lowp float u_xlat10_75;
bool u_xlatb75;
float u_xlat76;
bool u_xlatb76;
float u_xlat77;
lowp float u_xlat10_77;
bool u_xlatb77;
mediump float u_xlat16_82;
void main()
{
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowVertexColor);
    if(u_xlatb0){
        u_xlat0.xyz = vs_TEXCOORD3.xyz;
        u_xlat0.w = 1.0;
        SV_Target0 = u_xlat0;
        return;
    }
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat75 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat1.xyz = vec3(u_xlat75) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat75 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat2.xyz = vec3(u_xlat75) * u_xlat2.xyz;
    u_xlat75 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat75 = u_xlat75 + u_xlat75;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat75)) + (-u_xlat1.xyz);
    u_xlatb75 = _ShadowBias.z!=0.0;
    u_xlat77 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat77 = inversesqrt(u_xlat77);
    u_xlat4.xyz = vec3(u_xlat77) * _WorldSpaceLightPos0.xyz;
    u_xlat77 = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat77 = (-u_xlat77) * u_xlat77 + 1.0;
    u_xlat77 = sqrt(u_xlat77);
    u_xlat77 = u_xlat77 * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat77) + vs_TEXCOORD2.xyz;
    u_xlat0.xyz = (bool(u_xlatb75)) ? u_xlat0.xyz : vs_TEXCOORD2.xyz;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat5;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat6;
    u_xlat4 = u_xlat0.yyyy * u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat5 * u_xlat0.zzzz + u_xlat3;
    u_xlat0 = u_xlat6 + u_xlat0;
    u_xlat77 = _ShadowBias.x / u_xlat0.w;
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
    u_xlat77 = u_xlat0.z + (-u_xlat77);
    u_xlat4.x = max((-u_xlat0.w), u_xlat77);
    u_xlat4.x = (-u_xlat77) + u_xlat4.x;
    u_xlat0.z = _ShadowBias.y * u_xlat4.x + u_xlat77;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat16_7.x = (-_ShadowBias.w) + 1.0;
    u_xlatb50 = _softShadowQuality==1.0;
    if(u_xlatb50){
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat3.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_32 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb50 = _softShadowQuality==2.0;
        if(u_xlatb50){
            u_xlat16_57.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_57.xy = floor(u_xlat16_57.xy);
            u_xlat16_8.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_57.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_58.xy = u_xlat16_4.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_9.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_59.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_10.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_10.xy = (-u_xlat16_10.xy) * u_xlat16_10.xy + u_xlat16_59.xy;
            u_xlat16_8.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_8.xy) * u_xlat16_8.xy + u_xlat16_3.yw;
            u_xlat16_10.xy = u_xlat16_10.xy + vec2(1.0, 1.0);
            u_xlat16_8.xy = u_xlat16_8.xy + vec2(1.0, 1.0);
            u_xlat16_4.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_5.xy = u_xlat16_59.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_6.xy = u_xlat16_10.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_9.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_3.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_4.z = u_xlat16_6.x;
            u_xlat16_4.w = u_xlat16_8.x;
            u_xlat16_5.z = u_xlat16_9.x;
            u_xlat16_5.w = u_xlat16_58.x;
            u_xlat16_3 = u_xlat16_4.zwxz + u_xlat16_5.zwxz;
            u_xlat16_6.z = u_xlat16_4.y;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_9.z = u_xlat16_5.y;
            u_xlat16_9.w = u_xlat16_58.y;
            u_xlat16_8.xyz = u_xlat16_6.zyw + u_xlat16_9.zyw;
            u_xlat16_10.xyz = u_xlat16_5.xzw / u_xlat16_3.zwy;
            u_xlat16_10.xyz = u_xlat16_10.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_9.xyz = u_xlat16_9.zyw / u_xlat16_8.xyz;
            u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_4.xyz = u_xlat16_10.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_5.xyz = u_xlat16_9.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_4.w = u_xlat16_5.x;
            u_xlat16_6 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.ywxw;
            u_xlat16_9.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.zw;
            u_xlat16_5.w = u_xlat16_4.y;
            u_xlat16_4.yw = u_xlat16_5.yz;
            u_xlat16_10 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
            u_xlat16_5 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.wywz;
            u_xlat16_4 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xwzw;
            u_xlat16_11 = u_xlat16_3.zwyz * u_xlat16_8.xxxy;
            u_xlat16_12 = u_xlat16_3 * u_xlat16_8.yyzz;
            u_xlat16_57.x = u_xlat16_3.y * u_xlat16_8.z;
            vec3 txVec4 = vec3(u_xlat16_6.xy,u_xlat0.w);
            u_xlat10_50 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_6.zw,u_xlat0.w);
            u_xlat10_77 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_82 = u_xlat10_77 * u_xlat16_11.y;
            u_xlat16_82 = u_xlat16_11.x * u_xlat10_50 + u_xlat16_82;
            vec3 txVec6 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_50 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_82 = u_xlat16_11.z * u_xlat10_50 + u_xlat16_82;
            vec3 txVec7 = vec3(u_xlat16_5.xy,u_xlat0.w);
            u_xlat10_50 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_82 = u_xlat16_11.w * u_xlat10_50 + u_xlat16_82;
            vec3 txVec8 = vec3(u_xlat16_10.xy,u_xlat0.w);
            u_xlat10_50 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_82 = u_xlat16_12.x * u_xlat10_50 + u_xlat16_82;
            vec3 txVec9 = vec3(u_xlat16_10.zw,u_xlat0.w);
            u_xlat10_50 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_82 = u_xlat16_12.y * u_xlat10_50 + u_xlat16_82;
            vec3 txVec10 = vec3(u_xlat16_5.zw,u_xlat0.w);
            u_xlat10_50 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_82 = u_xlat16_12.z * u_xlat10_50 + u_xlat16_82;
            vec3 txVec11 = vec3(u_xlat16_4.xy,u_xlat0.w);
            u_xlat10_50 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_82 = u_xlat16_12.w * u_xlat10_50 + u_xlat16_82;
            vec3 txVec12 = vec3(u_xlat16_4.zw,u_xlat0.w);
            u_xlat10_50 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_32 = u_xlat16_57.x * u_xlat10_50 + u_xlat16_82;
        } else {
            u_xlat16_57.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_57.xy = floor(u_xlat16_57.xy);
            u_xlat16_8.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_57.xy);
            u_xlat16_3 = u_xlat16_8.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_4 = u_xlat16_3.xxzz * u_xlat16_3.xxzz;
            u_xlat16_5.yw = u_xlat16_4.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_58.xy = u_xlat16_4.xz * vec2(0.5, 0.5) + (-u_xlat16_8.xy);
            u_xlat16_9.xy = (-u_xlat16_8.xy) + vec2(1.0, 1.0);
            u_xlat16_59.xy = min(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_59.xy) * u_xlat16_59.xy + u_xlat16_9.xy;
            u_xlat16_59.xy = max(u_xlat16_8.xy, vec2(0.0, 0.0));
            u_xlat16_9.zw = (-u_xlat16_59.xy) * u_xlat16_59.xy + u_xlat16_3.yw;
            u_xlat16_9 = u_xlat16_9 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_3.z = u_xlat16_9.z * 0.0816320032;
            u_xlat16_4.xy = u_xlat16_58.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_58.xy = u_xlat16_9.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_4.z = u_xlat16_9.w * 0.0816320032;
            u_xlat16_3.x = u_xlat16_4.y;
            u_xlat16_3.yw = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_6.xz = u_xlat16_8.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_6.y = u_xlat16_58.x;
            u_xlat16_6.w = u_xlat16_5.y;
            u_xlat16_3 = u_xlat16_3 + u_xlat16_6;
            u_xlat16_4.yw = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_5.xz = u_xlat16_8.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_5.y = u_xlat16_58.y;
            u_xlat16_4 = u_xlat16_4 + u_xlat16_5;
            u_xlat16_6 = u_xlat16_6 / u_xlat16_3;
            u_xlat16_6 = u_xlat16_6 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_5 = u_xlat16_5 / u_xlat16_4;
            u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_6 = u_xlat16_6.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_5 = u_xlat16_5.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_8.xzw = u_xlat16_6.yzw;
            u_xlat16_8.y = u_xlat16_5.x;
            u_xlat16_9 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_10.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.y = u_xlat16_8.y;
            u_xlat16_8.y = u_xlat16_5.z;
            u_xlat16_11 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_60.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.z = u_xlat16_8.y;
            u_xlat16_12 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_6.xyxz;
            u_xlat16_8.y = u_xlat16_5.w;
            u_xlat16_13 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_8.xyzy;
            u_xlat16_14.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_8.wy;
            u_xlat16_6.w = u_xlat16_8.y;
            u_xlat16_64.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_6.xw;
            u_xlat16_5.xzw = u_xlat16_8.xzw;
            u_xlat16_8 = u_xlat16_57.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyzy;
            u_xlat16_15.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.wy;
            u_xlat16_5.x = u_xlat16_6.x;
            u_xlat16_57.xy = u_xlat16_57.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xy;
            u_xlat16_5 = u_xlat16_3 * u_xlat16_4.xxxx;
            u_xlat16_6 = u_xlat16_3 * u_xlat16_4.yyyy;
            u_xlat16_16 = u_xlat16_3 * u_xlat16_4.zzzz;
            u_xlat16_3 = u_xlat16_3 * u_xlat16_4.wwww;
            vec3 txVec13 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_9.zw,u_xlat0.w);
            u_xlat10_25.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_9.x = u_xlat10_25.x * u_xlat16_5.y;
            u_xlat16_9.x = u_xlat16_5.x * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec15 = vec3(u_xlat16_10.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_9.x = u_xlat16_5.z * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec16 = vec3(u_xlat16_12.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_9.x = u_xlat16_5.w * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec17 = vec3(u_xlat16_11.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_9.x = u_xlat16_6.x * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec18 = vec3(u_xlat16_11.zw,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_9.x = u_xlat16_6.y * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec19 = vec3(u_xlat16_60.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_9.x = u_xlat16_6.z * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec20 = vec3(u_xlat16_12.zw,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_9.x = u_xlat16_6.w * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec21 = vec3(u_xlat16_13.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_9.x = u_xlat16_16.x * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec22 = vec3(u_xlat16_13.zw,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_9.x = u_xlat16_16.y * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec23 = vec3(u_xlat16_14.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_9.x = u_xlat16_16.z * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec24 = vec3(u_xlat16_64.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_9.x = u_xlat16_16.w * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec25 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_8.x = u_xlat16_3.x * u_xlat10_0 + u_xlat16_9.x;
            vec3 txVec26 = vec3(u_xlat16_8.zw,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_8.x = u_xlat16_3.y * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec27 = vec3(u_xlat16_15.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_8.x = u_xlat16_3.z * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec28 = vec3(u_xlat16_57.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_32 = u_xlat16_3.w * u_xlat10_0 + u_xlat16_8.x;
        }
    }
    u_xlat16_57.x = (-u_xlat16_7.x) + 1.0;
    u_xlat16_7.x = u_xlat16_32 * u_xlat16_57.x + u_xlat16_7.x;
    u_xlat0.x = u_xlat16_7.x + -1.0;
    u_xlat0.x = _ReceiveShadowsStrength * u_xlat0.x + 1.0;
    u_xlat25.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_25.xyz = texture2D(_Diff, u_xlat25.xy).xyz;
    u_xlat25.xyz = u_xlat10_25.xyz * _DiffColor.xyz;
    u_xlat17.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_17.xy = texture2D(_Em_G_CU_R_MASK, u_xlat17.xy).xy;
    u_xlat42.xyz = u_xlat25.xyz * u_xlat10_17.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat1.xyz);
    u_xlat18.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat19.xyz = u_xlat18.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat19.xyz = u_xlat19.xyz * vec3(_Cube_FW);
    u_xlat18.xyz = u_xlat18.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat19.xyz);
    u_xlat18.xyz = u_xlat19.xyz * u_xlat18.xyz + u_xlat19.xyz;
    u_xlat77 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat18.xyz = vec3(u_xlat77) * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat10_17.xxx * u_xlat18.xyz;
    u_xlat17.xyz = u_xlat42.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat18.xyz;
    u_xlat18.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_18.xyz = texture2D(_Light, u_xlat18.xy).xyz;
    u_xlat19.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat19.xy = u_xlat19.xy + (-vs_TEXCOORD0.xy);
    u_xlat19.xy = vec2(_IsScreenPos) * u_xlat19.xy + vs_TEXCOORD0.xy;
    u_xlat77 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat77 = u_xlat77 * _Time.y;
    u_xlat77 = cos(u_xlat77);
    u_xlat77 = sin(u_xlat77);
    u_xlat69.xy = vec2(u_xlat77) * _Starry_Speed.xxyz.yz + u_xlat19.xy;
    u_xlatb77 = _ViewDir==6.0;
    if(u_xlatb77){
        u_xlat77 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat20.xyz = u_xlat1.xyz * vec3(u_xlat77);
    } else {
        u_xlat77 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat21.xyz = u_xlat1.xzy * vec3(u_xlat77);
        u_xlat77 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat22.xyz = u_xlat1.zyx * vec3(u_xlat77);
        u_xlat1.w = (-u_xlat1.z);
        u_xlat77 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat23.xyz = u_xlat1.xyw * vec3(u_xlat77);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat24.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat76 = dot(u_xlat24.xyz, u_xlat24.xyz);
        u_xlat76 = inversesqrt(u_xlat76);
        u_xlat24.xyz = vec3(u_xlat76) * u_xlat24.xyz;
        u_xlatb76 = _ViewDir==1.0;
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat77 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat77 = inversesqrt(u_xlat77);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat77);
        u_xlat1.xyz = bool(u_xlatb76) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb3.w) ? u_xlat24.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.z) ? u_xlat23.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb3.y) ? u_xlat22.xyz : u_xlat1.xyz;
        u_xlat20.xyz = (u_xlatb3.x) ? u_xlat21.xyz : u_xlat1.xyz;
    }
    u_xlat1.x = u_xlat20.z + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 2.82842708;
    u_xlat1.xy = u_xlat20.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat51 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat51 = u_xlat51 * 3.14159274;
    u_xlat20.x = sin(u_xlat51);
    u_xlat21.x = cos(u_xlat51);
    u_xlat22.x = (-u_xlat20.x);
    u_xlat22.y = u_xlat21.x;
    u_xlat22.z = u_xlat20.x;
    u_xlat20.x = dot(u_xlat1.xy, u_xlat22.yz);
    u_xlat20.y = dot(u_xlat1.xy, u_xlat22.xy);
    u_xlat1.xy = u_xlat20.xy + vec2(0.5, 0.5);
    u_xlat10_1.xyz = texture2D(_StarryTex, u_xlat1.xy).xyz;
    u_xlat19.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat19.xy;
    u_xlat69.xy = (-u_xlat19.xy) + u_xlat69.xy;
    u_xlat19.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat69.xy + u_xlat19.xy;
    u_xlat19.xy = u_xlat19.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_19.xyz = texture2D(_StarryTex, u_xlat19.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + (-u_xlat10_19.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat10_19.xyz;
    u_xlat19.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat19.xyz = u_xlat1.xyz * u_xlat19.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat19.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat18.xyz = u_xlat10_18.xyz * vec3(_light_PW);
    u_xlat25.xyz = u_xlat25.xyz * u_xlat18.xyz + u_xlat1.xyz;
    u_xlat25.xyz = u_xlat25.xyz + u_xlat17.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat25.xyz;
    u_xlat17.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat76 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat77 = u_xlat76 / _FogDistance;
    u_xlat16_7.x = max(_FogFade, 0.0);
    u_xlat77 = log2(u_xlat77);
    u_xlat77 = u_xlat77 * u_xlat16_7.x;
    u_xlat77 = exp2(u_xlat77);
    u_xlat77 = min(u_xlat77, 1.0);
    u_xlat77 = u_xlat77 * _FogColor.w;
    u_xlat0.xyz = (-u_xlat25.xyz) * u_xlat0.xxx + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat77);
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(vec2(_FoamNoiseTilingScale, _FoamNoiseTilingScale));
    u_xlat10_75 = texture2D(_WaveNoise, u_xlat1.xy).x;
    u_xlat1.xy = vs_TEXCOORD0.xy * _FoamTex_ST.xy + _FoamTex_ST.zw;
    u_xlat10_1.x = texture2D(_FoamTex, u_xlat1.xy).x;
    u_xlat26 = u_xlat76 + (-_FoamDepthStartPoint);
    u_xlat51 = float(1.0) / _FoamDepthRange;
    u_xlat26 = u_xlat51 * u_xlat26;
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat51 = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = u_xlat26 * u_xlat51;
    u_xlat16_7.xyz = vec3(u_xlat26) * _FoamColor.xyz;
    u_xlat16_7.xyz = u_xlat10_1.xxx * u_xlat16_7.xyz;
    u_xlat1.x = u_xlat10_75 * _FoamNoiseStrength + _FoamDir.x;
    u_xlat1.yz = _FoamDir.yz;
    u_xlat75 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat75 = inversesqrt(u_xlat75);
    u_xlat1.xyz = vec3(u_xlat75) * u_xlat1.xyz;
    u_xlat75 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat75 = u_xlat75 + (-_FoamThre);
    u_xlat1.x = float(1.0) / _FoamRange;
    u_xlat75 = u_xlat75 * u_xlat1.x;
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
    u_xlat1.x = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat1.x;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(u_xlat75) + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * _WolrdYDepthColor.xyz;
    u_xlat75 = (-_worldYDepthA) + _worldYDepthB;
    u_xlat76 = vs_TEXCOORD8.x + (-_worldYDepthA);
    u_xlat75 = float(1.0) / u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat76;
    u_xlat75 = clamp(u_xlat75, 0.0, 1.0);
    u_xlat76 = u_xlat75 * -2.0 + 3.0;
    u_xlat75 = u_xlat75 * u_xlat75;
    u_xlat75 = u_xlat75 * u_xlat76;
    u_xlat0.xyz = (-_WolrdYDepthColor.xyz) * u_xlat0.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat75) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.w = vs_TEXCOORD8.y * _Alpha;
    SV_Target0 = u_xlat0;
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
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 78453
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