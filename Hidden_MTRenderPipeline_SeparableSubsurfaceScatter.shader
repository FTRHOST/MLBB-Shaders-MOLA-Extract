//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/MTRenderPipeline/SeparableSubsurfaceScatter" {
Properties {

}
SubShader {
 Pass {
 Name "Separable X Pass"
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 30129
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _ZBufferParams;
uniform 	float _SSSScale;
uniform 	float _SampleStep;
uniform 	float _DistanceToProjectionWindow;
uniform 	float _ScaleOffset;
uniform 	vec4 _Kernel[16];
uniform 	vec4 _CustomDepthTexture_TexelSize;
uniform 	vec4 _SeparateSSSValidUVRect;
UNITY_LOCATION(0) uniform mediump sampler2D _SkinDiffuseX;
UNITY_LOCATION(1) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(2) uniform highp sampler2D _CustomDepthTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_TARGET0;
vec3 u_xlat0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
vec3 u_xlat9;
mediump float u_xlat10_9;
bool u_xlatb9;
vec2 u_xlat12;
mediump float u_xlat10_12;
bvec2 u_xlatb12;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat10_18;
mediump float u_xlat16_19;
float u_xlat20;
mediump float u_xlat10_20;
int u_xlati20;
bool u_xlatb20;
void main()
{
    u_xlatb0.xy = lessThan(_SeparateSSSValidUVRect.xyxx, _SeparateSSSValidUVRect.zwzz).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlatb6.xy = lessThan(vs_TEXCOORD0.xyxx, _SeparateSSSValidUVRect.xyxx).xy;
    u_xlatb6.x = u_xlatb6.y || u_xlatb6.x;
    u_xlatb12.xy = lessThan(_SeparateSSSValidUVRect.zwzw, vs_TEXCOORD0.xyxy).xy;
    u_xlatb12.x = u_xlatb12.y || u_xlatb12.x;
    u_xlatb6.x = u_xlatb12.x || u_xlatb6.x;
    u_xlatb0.x = u_xlatb6.x && u_xlatb0.x;
    if(u_xlatb0.x){
        SV_TARGET0 = vec4(0.0, 0.0, 0.0, 1.0);
        return;
    }
    u_xlat16_1.x = texture(_SkinMask, vs_TEXCOORD0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_1.x<0.00999999978);
#else
    u_xlatb0.x = u_xlat16_1.x<0.00999999978;
#endif
    if(u_xlatb0.x){
        u_xlat0.x = _CustomDepthTexture_TexelSize.x;
        u_xlat0.y = 0.0;
        u_xlat12.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
        u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
        u_xlat16_7 = texture(_SkinMask, u_xlat12.xy).x;
        u_xlat16_13 = texture(_SkinMask, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(u_xlat16_1.x<u_xlat16_7);
#else
        u_xlatb6.x = u_xlat16_1.x<u_xlat16_7;
#endif
        u_xlat18 = max(u_xlat16_7, u_xlat16_1.x);
        u_xlat6.x = (u_xlatb6.x) ? u_xlat12.x : vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb12.x = !!(u_xlat18<u_xlat16_13);
#else
        u_xlatb12.x = u_xlat18<u_xlat16_13;
#endif
        u_xlat18 = max(u_xlat16_13, u_xlat18);
        u_xlat0.x = (u_xlatb12.x) ? u_xlat0.x : u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb12.x = !!(u_xlat18<0.00999999978);
#else
        u_xlatb12.x = u_xlat18<0.00999999978;
#endif
        if(u_xlatb12.x){
            SV_TARGET0 = vec4(0.0, 0.0, 0.0, 1.0);
            return;
        }
    } else {
        u_xlat0.x = vs_TEXCOORD0.x;
    }
    u_xlat0.y = vs_TEXCOORD0.y;
    u_xlat16_1.xyz = texture(_SkinDiffuseX, u_xlat0.xy).xyz;
    u_xlat0.x = _SSSScale * _CustomDepthTexture_TexelSize.x;
    u_xlat0.x = u_xlat0.x * 4.0;
    u_xlat6.x = _ScaleOffset + 1.0;
    u_xlat6.x = max(u_xlat6.x, 9.99999975e-06);
    u_xlat10_12 = texture(_CustomDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat12.x = _ZBufferParams.z * u_xlat10_12 + _ZBufferParams.w;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat6.x * u_xlat12.x;
    u_xlat18 = _DistanceToProjectionWindow / u_xlat12.x;
    u_xlat18 = u_xlat18 * u_xlat0.x;
    u_xlat2.xyz = u_xlat16_1.xyz * _Kernel[0].xyz;
    u_xlat0.x = u_xlat0.x * _DistanceToProjectionWindow;
    u_xlat0.x = u_xlat0.x * 300.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(1.0<_SampleStep);
#else
    u_xlatb20 = 1.0<_SampleStep;
#endif
    if(u_xlatb20){
        u_xlat3.x = u_xlat18 * _Kernel[1].w;
        u_xlat3.y = 0.0;
        u_xlat3.xy = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat3.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat3.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat3.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat3.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat3.xyz = vec3(u_xlat20) * u_xlat3.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[1].xyz * u_xlat3.xyz + u_xlat2.xyz;
        u_xlati20 = 2;
    } else {
        u_xlati20 = 1;
    }
    u_xlat3.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat3.x<_SampleStep);
#else
    u_xlatb3 = u_xlat3.x<_SampleStep;
#endif
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[2].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[2].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 3;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[3].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[3].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 4;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[4].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[4].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 5;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[5].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[5].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 6;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[6].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[6].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 7;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[7].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[7].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 8;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[8].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[8].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 9;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[9].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[9].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 10;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[10].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[10].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 11;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[11].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[11].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 12;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[12].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[12].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 13;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[13].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[13].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 14;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[14].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[14].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 15;
    }
    u_xlat20 = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb20 = u_xlatb20 && u_xlatb3;
    if(u_xlatb20){
        u_xlat3.x = u_xlat18 * _Kernel[15].w;
        u_xlat3.y = 0.0;
        u_xlat3.xy = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat3.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat3.xy).x;
        u_xlat10_18 = texture(_CustomDepthTexture, u_xlat3.xy).x;
        u_xlat18 = _ZBufferParams.z * u_xlat10_18 + _ZBufferParams.w;
        u_xlat18 = float(1.0) / u_xlat18;
        u_xlat6.x = (-u_xlat18) * u_xlat6.x + u_xlat12.x;
        u_xlat0.x = u_xlat0.x * abs(u_xlat6.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat0.x = u_xlat16_19 * u_xlat0.x;
        u_xlat6.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[15].xyz * u_xlat0.xyz + u_xlat2.xyz;
    }
    SV_TARGET0.xyz = u_xlat2.xyz;
    SV_TARGET0.w = 1.0;
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _ZBufferParams;
uniform 	float _SSSScale;
uniform 	float _SampleStep;
uniform 	float _DistanceToProjectionWindow;
uniform 	float _ScaleOffset;
uniform 	vec4 _Kernel[16];
uniform 	vec4 _CustomDepthTexture_TexelSize;
uniform 	vec4 _SeparateSSSValidUVRect;
UNITY_LOCATION(0) uniform mediump sampler2D _SkinDiffuseX;
UNITY_LOCATION(1) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(2) uniform highp sampler2D _CustomDepthTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_TARGET0;
vec3 u_xlat0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
vec3 u_xlat9;
mediump float u_xlat10_9;
bool u_xlatb9;
vec2 u_xlat12;
mediump float u_xlat10_12;
bvec2 u_xlatb12;
mediump float u_xlat16_13;
float u_xlat18;
mediump float u_xlat10_18;
mediump float u_xlat16_19;
float u_xlat20;
mediump float u_xlat10_20;
int u_xlati20;
bool u_xlatb20;
void main()
{
    u_xlatb0.xy = lessThan(_SeparateSSSValidUVRect.xyxx, _SeparateSSSValidUVRect.zwzz).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlatb6.xy = lessThan(vs_TEXCOORD0.xyxx, _SeparateSSSValidUVRect.xyxx).xy;
    u_xlatb6.x = u_xlatb6.y || u_xlatb6.x;
    u_xlatb12.xy = lessThan(_SeparateSSSValidUVRect.zwzw, vs_TEXCOORD0.xyxy).xy;
    u_xlatb12.x = u_xlatb12.y || u_xlatb12.x;
    u_xlatb6.x = u_xlatb12.x || u_xlatb6.x;
    u_xlatb0.x = u_xlatb6.x && u_xlatb0.x;
    if(u_xlatb0.x){
        SV_TARGET0 = vec4(0.0, 0.0, 0.0, 1.0);
        return;
    }
    u_xlat16_1.x = texture(_SkinMask, vs_TEXCOORD0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_1.x<0.00999999978);
#else
    u_xlatb0.x = u_xlat16_1.x<0.00999999978;
#endif
    if(u_xlatb0.x){
        u_xlat0.x = _CustomDepthTexture_TexelSize.x;
        u_xlat0.y = 0.0;
        u_xlat12.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
        u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
        u_xlat16_7 = texture(_SkinMask, u_xlat12.xy).x;
        u_xlat16_13 = texture(_SkinMask, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6.x = !!(u_xlat16_1.x<u_xlat16_7);
#else
        u_xlatb6.x = u_xlat16_1.x<u_xlat16_7;
#endif
        u_xlat18 = max(u_xlat16_7, u_xlat16_1.x);
        u_xlat6.x = (u_xlatb6.x) ? u_xlat12.x : vs_TEXCOORD0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb12.x = !!(u_xlat18<u_xlat16_13);
#else
        u_xlatb12.x = u_xlat18<u_xlat16_13;
#endif
        u_xlat18 = max(u_xlat16_13, u_xlat18);
        u_xlat0.x = (u_xlatb12.x) ? u_xlat0.x : u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb12.x = !!(u_xlat18<0.00999999978);
#else
        u_xlatb12.x = u_xlat18<0.00999999978;
#endif
        if(u_xlatb12.x){
            SV_TARGET0 = vec4(0.0, 0.0, 0.0, 1.0);
            return;
        }
    } else {
        u_xlat0.x = vs_TEXCOORD0.x;
    }
    u_xlat0.y = vs_TEXCOORD0.y;
    u_xlat16_1.xyz = texture(_SkinDiffuseX, u_xlat0.xy).xyz;
    u_xlat0.x = _SSSScale * _CustomDepthTexture_TexelSize.x;
    u_xlat0.x = u_xlat0.x * 4.0;
    u_xlat6.x = _ScaleOffset + 1.0;
    u_xlat6.x = max(u_xlat6.x, 9.99999975e-06);
    u_xlat10_12 = texture(_CustomDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat12.x = _ZBufferParams.z * u_xlat10_12 + _ZBufferParams.w;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat6.x * u_xlat12.x;
    u_xlat18 = _DistanceToProjectionWindow / u_xlat12.x;
    u_xlat18 = u_xlat18 * u_xlat0.x;
    u_xlat2.xyz = u_xlat16_1.xyz * _Kernel[0].xyz;
    u_xlat0.x = u_xlat0.x * _DistanceToProjectionWindow;
    u_xlat0.x = u_xlat0.x * 300.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(1.0<_SampleStep);
#else
    u_xlatb20 = 1.0<_SampleStep;
#endif
    if(u_xlatb20){
        u_xlat3.x = u_xlat18 * _Kernel[1].w;
        u_xlat3.y = 0.0;
        u_xlat3.xy = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat3.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat3.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat3.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat3.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat3.xyz = vec3(u_xlat20) * u_xlat3.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[1].xyz * u_xlat3.xyz + u_xlat2.xyz;
        u_xlati20 = 2;
    } else {
        u_xlati20 = 1;
    }
    u_xlat3.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat3.x<_SampleStep);
#else
    u_xlatb3 = u_xlat3.x<_SampleStep;
#endif
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[2].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[2].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 3;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[3].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[3].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 4;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[4].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[4].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 5;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[5].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[5].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 6;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[6].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[6].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 7;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[7].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[7].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 8;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[8].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[8].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 9;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[9].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[9].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 10;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[10].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[10].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 11;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[11].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[11].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 12;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[12].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[12].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 13;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[13].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[13].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 14;
    }
    u_xlat9.x = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x<_SampleStep);
#else
    u_xlatb9 = u_xlat9.x<_SampleStep;
#endif
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[14].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[14].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 15;
    }
    u_xlat20 = float(u_xlati20);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb20 = u_xlatb20 && u_xlatb3;
    if(u_xlatb20){
        u_xlat3.x = u_xlat18 * _Kernel[15].w;
        u_xlat3.y = 0.0;
        u_xlat3.xy = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_SkinDiffuseX, u_xlat3.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat3.xy).x;
        u_xlat10_18 = texture(_CustomDepthTexture, u_xlat3.xy).x;
        u_xlat18 = _ZBufferParams.z * u_xlat10_18 + _ZBufferParams.w;
        u_xlat18 = float(1.0) / u_xlat18;
        u_xlat6.x = (-u_xlat18) * u_xlat6.x + u_xlat12.x;
        u_xlat0.x = u_xlat0.x * abs(u_xlat6.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat0.x = u_xlat16_19 * u_xlat0.x;
        u_xlat6.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[15].xyz * u_xlat0.xyz + u_xlat2.xyz;
    }
    SV_TARGET0.xyz = u_xlat2.xyz;
    SV_TARGET0.w = 1.0;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _ZBufferParams;
uniform 	float _SSSScale;
uniform 	float _SampleStep;
uniform 	float _DistanceToProjectionWindow;
uniform 	float _ScaleOffset;
uniform 	vec4 _Kernel[16];
uniform 	vec4 _CustomDepthTexture_TexelSize;
uniform 	vec4 _SeparateSSSValidUVRect;
uniform mediump sampler2D _SkinDiffuseX;
uniform mediump sampler2D _SkinMask;
uniform highp sampler2D _CustomDepthTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_TARGET0 gl_FragData[0]
vec3 u_xlat0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
vec3 u_xlat9;
lowp float u_xlat10_9;
bool u_xlatb9;
vec2 u_xlat12;
lowp float u_xlat10_12;
bvec2 u_xlatb12;
mediump float u_xlat16_13;
float u_xlat18;
lowp float u_xlat10_18;
mediump float u_xlat16_19;
float u_xlat20;
lowp float u_xlat10_20;
int u_xlati20;
bool u_xlatb20;
void main()
{
    u_xlatb0.xy = lessThan(_SeparateSSSValidUVRect.xyxx, _SeparateSSSValidUVRect.zwzz).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlatb6.xy = lessThan(vs_TEXCOORD0.xyxx, _SeparateSSSValidUVRect.xyxx).xy;
    u_xlatb6.x = u_xlatb6.y || u_xlatb6.x;
    u_xlatb12.xy = lessThan(_SeparateSSSValidUVRect.zwzw, vs_TEXCOORD0.xyxy).xy;
    u_xlatb12.x = u_xlatb12.y || u_xlatb12.x;
    u_xlatb6.x = u_xlatb12.x || u_xlatb6.x;
    u_xlatb0.x = u_xlatb6.x && u_xlatb0.x;
    if(u_xlatb0.x){
        SV_TARGET0 = vec4(0.0, 0.0, 0.0, 1.0);
        return;
    }
    u_xlat16_1.x = texture2D(_SkinMask, vs_TEXCOORD0.xy).x;
    u_xlatb0.x = u_xlat16_1.x<0.00999999978;
    if(u_xlatb0.x){
        u_xlat0.x = _CustomDepthTexture_TexelSize.x;
        u_xlat0.y = 0.0;
        u_xlat12.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
        u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
        u_xlat16_7 = texture2D(_SkinMask, u_xlat12.xy).x;
        u_xlat16_13 = texture2D(_SkinMask, u_xlat0.xy).x;
        u_xlatb6.x = u_xlat16_1.x<u_xlat16_7;
        u_xlat18 = max(u_xlat16_7, u_xlat16_1.x);
        u_xlat6.x = (u_xlatb6.x) ? u_xlat12.x : vs_TEXCOORD0.x;
        u_xlatb12.x = u_xlat18<u_xlat16_13;
        u_xlat18 = max(u_xlat16_13, u_xlat18);
        u_xlat0.x = (u_xlatb12.x) ? u_xlat0.x : u_xlat6.x;
        u_xlatb12.x = u_xlat18<0.00999999978;
        if(u_xlatb12.x){
            SV_TARGET0 = vec4(0.0, 0.0, 0.0, 1.0);
            return;
        }
    } else {
        u_xlat0.x = vs_TEXCOORD0.x;
    }
    u_xlat0.y = vs_TEXCOORD0.y;
    u_xlat16_1.xyz = texture2D(_SkinDiffuseX, u_xlat0.xy).xyz;
    u_xlat0.x = _SSSScale * _CustomDepthTexture_TexelSize.x;
    u_xlat0.x = u_xlat0.x * 4.0;
    u_xlat6.x = _ScaleOffset + 1.0;
    u_xlat6.x = max(u_xlat6.x, 9.99999975e-06);
    u_xlat10_12 = texture2D(_CustomDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat12.x = _ZBufferParams.z * u_xlat10_12 + _ZBufferParams.w;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat6.x * u_xlat12.x;
    u_xlat18 = _DistanceToProjectionWindow / u_xlat12.x;
    u_xlat18 = u_xlat18 * u_xlat0.x;
    u_xlat2.xyz = u_xlat16_1.xyz * _Kernel[0].xyz;
    u_xlat0.x = u_xlat0.x * _DistanceToProjectionWindow;
    u_xlat0.x = u_xlat0.x * 300.0;
    u_xlatb20 = 1.0<_SampleStep;
    if(u_xlatb20){
        u_xlat3.x = u_xlat18 * _Kernel[1].w;
        u_xlat3.y = 0.0;
        u_xlat3.xy = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat3.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat3.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat3.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat3.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat3.xyz = vec3(u_xlat20) * u_xlat3.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[1].xyz * u_xlat3.xyz + u_xlat2.xyz;
        u_xlati20 = 2;
    } else {
        u_xlati20 = 1;
    }
    u_xlat3.x = float(u_xlati20);
    u_xlatb3 = u_xlat3.x<_SampleStep;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[2].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[2].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 3;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[3].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[3].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 4;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[4].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[4].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 5;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[5].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[5].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 6;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[6].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[6].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 7;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[7].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[7].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 8;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[8].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[8].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 9;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[9].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[9].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 10;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[10].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[10].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 11;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[11].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[11].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 12;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[12].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[12].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 13;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[13].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[13].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 14;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[14].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[14].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 15;
    }
    u_xlat20 = float(u_xlati20);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb20 = u_xlatb20 && u_xlatb3;
    if(u_xlatb20){
        u_xlat3.x = u_xlat18 * _Kernel[15].w;
        u_xlat3.y = 0.0;
        u_xlat3.xy = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat3.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat3.xy).x;
        u_xlat10_18 = texture2D(_CustomDepthTexture, u_xlat3.xy).x;
        u_xlat18 = _ZBufferParams.z * u_xlat10_18 + _ZBufferParams.w;
        u_xlat18 = float(1.0) / u_xlat18;
        u_xlat6.x = (-u_xlat18) * u_xlat6.x + u_xlat12.x;
        u_xlat0.x = u_xlat0.x * abs(u_xlat6.x);
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat0.x = u_xlat16_19 * u_xlat0.x;
        u_xlat6.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[15].xyz * u_xlat0.xyz + u_xlat2.xyz;
    }
    SV_TARGET0.xyz = u_xlat2.xyz;
    SV_TARGET0.w = 1.0;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _ZBufferParams;
uniform 	float _SSSScale;
uniform 	float _SampleStep;
uniform 	float _DistanceToProjectionWindow;
uniform 	float _ScaleOffset;
uniform 	vec4 _Kernel[16];
uniform 	vec4 _CustomDepthTexture_TexelSize;
uniform 	vec4 _SeparateSSSValidUVRect;
uniform mediump sampler2D _SkinDiffuseX;
uniform mediump sampler2D _SkinMask;
uniform highp sampler2D _CustomDepthTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_TARGET0 gl_FragData[0]
vec3 u_xlat0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
vec3 u_xlat9;
lowp float u_xlat10_9;
bool u_xlatb9;
vec2 u_xlat12;
lowp float u_xlat10_12;
bvec2 u_xlatb12;
mediump float u_xlat16_13;
float u_xlat18;
lowp float u_xlat10_18;
mediump float u_xlat16_19;
float u_xlat20;
lowp float u_xlat10_20;
int u_xlati20;
bool u_xlatb20;
void main()
{
    u_xlatb0.xy = lessThan(_SeparateSSSValidUVRect.xyxx, _SeparateSSSValidUVRect.zwzz).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlatb6.xy = lessThan(vs_TEXCOORD0.xyxx, _SeparateSSSValidUVRect.xyxx).xy;
    u_xlatb6.x = u_xlatb6.y || u_xlatb6.x;
    u_xlatb12.xy = lessThan(_SeparateSSSValidUVRect.zwzw, vs_TEXCOORD0.xyxy).xy;
    u_xlatb12.x = u_xlatb12.y || u_xlatb12.x;
    u_xlatb6.x = u_xlatb12.x || u_xlatb6.x;
    u_xlatb0.x = u_xlatb6.x && u_xlatb0.x;
    if(u_xlatb0.x){
        SV_TARGET0 = vec4(0.0, 0.0, 0.0, 1.0);
        return;
    }
    u_xlat16_1.x = texture2D(_SkinMask, vs_TEXCOORD0.xy).x;
    u_xlatb0.x = u_xlat16_1.x<0.00999999978;
    if(u_xlatb0.x){
        u_xlat0.x = _CustomDepthTexture_TexelSize.x;
        u_xlat0.y = 0.0;
        u_xlat12.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
        u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
        u_xlat16_7 = texture2D(_SkinMask, u_xlat12.xy).x;
        u_xlat16_13 = texture2D(_SkinMask, u_xlat0.xy).x;
        u_xlatb6.x = u_xlat16_1.x<u_xlat16_7;
        u_xlat18 = max(u_xlat16_7, u_xlat16_1.x);
        u_xlat6.x = (u_xlatb6.x) ? u_xlat12.x : vs_TEXCOORD0.x;
        u_xlatb12.x = u_xlat18<u_xlat16_13;
        u_xlat18 = max(u_xlat16_13, u_xlat18);
        u_xlat0.x = (u_xlatb12.x) ? u_xlat0.x : u_xlat6.x;
        u_xlatb12.x = u_xlat18<0.00999999978;
        if(u_xlatb12.x){
            SV_TARGET0 = vec4(0.0, 0.0, 0.0, 1.0);
            return;
        }
    } else {
        u_xlat0.x = vs_TEXCOORD0.x;
    }
    u_xlat0.y = vs_TEXCOORD0.y;
    u_xlat16_1.xyz = texture2D(_SkinDiffuseX, u_xlat0.xy).xyz;
    u_xlat0.x = _SSSScale * _CustomDepthTexture_TexelSize.x;
    u_xlat0.x = u_xlat0.x * 4.0;
    u_xlat6.x = _ScaleOffset + 1.0;
    u_xlat6.x = max(u_xlat6.x, 9.99999975e-06);
    u_xlat10_12 = texture2D(_CustomDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat12.x = _ZBufferParams.z * u_xlat10_12 + _ZBufferParams.w;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat6.x * u_xlat12.x;
    u_xlat18 = _DistanceToProjectionWindow / u_xlat12.x;
    u_xlat18 = u_xlat18 * u_xlat0.x;
    u_xlat2.xyz = u_xlat16_1.xyz * _Kernel[0].xyz;
    u_xlat0.x = u_xlat0.x * _DistanceToProjectionWindow;
    u_xlat0.x = u_xlat0.x * 300.0;
    u_xlatb20 = 1.0<_SampleStep;
    if(u_xlatb20){
        u_xlat3.x = u_xlat18 * _Kernel[1].w;
        u_xlat3.y = 0.0;
        u_xlat3.xy = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat3.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat3.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat3.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat3.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat3.xyz = vec3(u_xlat20) * u_xlat3.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[1].xyz * u_xlat3.xyz + u_xlat2.xyz;
        u_xlati20 = 2;
    } else {
        u_xlati20 = 1;
    }
    u_xlat3.x = float(u_xlati20);
    u_xlatb3 = u_xlat3.x<_SampleStep;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[2].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[2].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 3;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[3].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[3].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 4;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[4].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[4].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 5;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[5].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[5].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 6;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[6].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[6].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 7;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[7].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[7].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 8;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[8].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[8].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 9;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[9].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[9].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 10;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[10].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[10].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 11;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[11].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[11].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 12;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[12].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[12].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 13;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[13].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[13].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 14;
    }
    u_xlat9.x = float(u_xlati20);
    u_xlatb9 = u_xlat9.x<_SampleStep;
    u_xlatb3 = u_xlatb9 && u_xlatb3;
    if(u_xlatb3){
        u_xlat5.x = u_xlat18 * _Kernel[14].w;
        u_xlat5.y = 0.0;
        u_xlat9.xy = u_xlat5.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat9.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat9.xy).x;
        u_xlat10_9 = texture2D(_CustomDepthTexture, u_xlat9.xy).x;
        u_xlat9.x = _ZBufferParams.z * u_xlat10_9 + _ZBufferParams.w;
        u_xlat9.x = float(1.0) / u_xlat9.x;
        u_xlat9.x = (-u_xlat9.x) * u_xlat6.x + u_xlat12.x;
        u_xlat9.x = u_xlat0.x * abs(u_xlat9.x);
        u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
        u_xlat9.x = (-u_xlat9.x) + 1.0;
        u_xlat9.x = u_xlat16_19 * u_xlat9.x;
        u_xlat5.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat9.xyz = u_xlat9.xxx * u_xlat5.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[14].xyz * u_xlat9.xyz + u_xlat2.xyz;
        u_xlati20 = 15;
    }
    u_xlat20 = float(u_xlati20);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb20 = u_xlatb20 && u_xlatb3;
    if(u_xlatb20){
        u_xlat3.x = u_xlat18 * _Kernel[15].w;
        u_xlat3.y = 0.0;
        u_xlat3.xy = u_xlat3.xy + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture2D(_SkinDiffuseX, u_xlat3.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat3.xy).x;
        u_xlat10_18 = texture2D(_CustomDepthTexture, u_xlat3.xy).x;
        u_xlat18 = _ZBufferParams.z * u_xlat10_18 + _ZBufferParams.w;
        u_xlat18 = float(1.0) / u_xlat18;
        u_xlat6.x = (-u_xlat18) * u_xlat6.x + u_xlat12.x;
        u_xlat0.x = u_xlat0.x * abs(u_xlat6.x);
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat0.x = u_xlat16_19 * u_xlat0.x;
        u_xlat6.xyz = (-u_xlat16_1.xyz) + u_xlat16_4.xyz;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_1.xyz;
        u_xlat2.xyz = _Kernel[15].xyz * u_xlat0.xyz + u_xlat2.xyz;
    }
    SV_TARGET0.xyz = u_xlat2.xyz;
    SV_TARGET0.w = 1.0;
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
 Name "Separable Y Pass"
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 71200
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _ZBufferParams;
uniform 	float _SSSScale;
uniform 	float _SampleStep;
uniform 	float _DistanceToProjectionWindow;
uniform 	float _ScaleOffset;
uniform 	vec4 _Kernel[16];
uniform 	vec4 _CustomDepthTexture_TexelSize;
uniform 	vec4 _SeparateSSSValidUVRect;
UNITY_LOCATION(0) uniform mediump sampler2D _SkinDiffuseY;
UNITY_LOCATION(1) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(2) uniform highp sampler2D _CustomDepthTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_TARGET0;
vec3 u_xlat0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
vec2 u_xlat12;
mediump float u_xlat10_12;
bvec2 u_xlatb12;
mediump float u_xlat16_13;
float u_xlat14;
mediump float u_xlat10_14;
bool u_xlatb14;
float u_xlat18;
mediump float u_xlat10_18;
int u_xlati18;
bool u_xlatb18;
mediump float u_xlat16_19;
float u_xlat20;
mediump float u_xlat10_20;
bool u_xlatb20;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlatb0.xy = lessThan(_SeparateSSSValidUVRect.xyxx, _SeparateSSSValidUVRect.zwzz).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlatb6.xy = lessThan(vs_TEXCOORD0.xyxx, _SeparateSSSValidUVRect.xyxx).xy;
    u_xlatb6.x = u_xlatb6.y || u_xlatb6.x;
    u_xlatb12.xy = lessThan(_SeparateSSSValidUVRect.zwzw, vs_TEXCOORD0.xyxy).xy;
    u_xlatb12.x = u_xlatb12.y || u_xlatb12.x;
    u_xlatb6.x = u_xlatb12.x || u_xlatb6.x;
    u_xlatb0.x = u_xlatb6.x && u_xlatb0.x;
    if(u_xlatb0.x){
        SV_TARGET0 = vec4(0.0, 0.0, 0.0, 1.0);
        return;
    }
    u_xlat16_1.x = texture(_SkinMask, vs_TEXCOORD0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_1.x<0.00999999978);
#else
    u_xlatb0.x = u_xlat16_1.x<0.00999999978;
#endif
    if(u_xlatb0.x){
        u_xlat0.x = 0.0;
        u_xlat0.y = _CustomDepthTexture_TexelSize.y;
        u_xlat12.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
        u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
        u_xlat16_7 = texture(_SkinMask, u_xlat12.xy).x;
        u_xlat16_13 = texture(_SkinMask, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0.x = !!(u_xlat16_1.x<u_xlat16_7);
#else
        u_xlatb0.x = u_xlat16_1.x<u_xlat16_7;
#endif
        u_xlat12.x = max(u_xlat16_7, u_xlat16_1.x);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat12.y : vs_TEXCOORD0.y;
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(u_xlat12.x<u_xlat16_13);
#else
        u_xlatb18 = u_xlat12.x<u_xlat16_13;
#endif
        u_xlat12.x = max(u_xlat16_13, u_xlat12.x);
        u_xlat0.x = (u_xlatb18) ? u_xlat0.y : u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb12.x = !!(u_xlat12.x<0.00999999978);
#else
        u_xlatb12.x = u_xlat12.x<0.00999999978;
#endif
        if(u_xlatb12.x){
            SV_TARGET0 = vec4(0.0, 0.0, 0.0, 1.0);
            return;
        }
    } else {
        u_xlat0.x = vs_TEXCOORD0.y;
    }
    u_xlat0.y = vs_TEXCOORD0.x;
    u_xlat16_1.xyz = texture(_SkinDiffuseY, u_xlat0.yx).xyz;
    u_xlat0.x = _SSSScale * _CustomDepthTexture_TexelSize.y;
    u_xlat0.x = u_xlat0.x * 4.0;
    u_xlat6.x = _ScaleOffset + 1.0;
    u_xlat6.x = max(u_xlat6.x, 9.99999975e-06);
    u_xlat10_12 = texture(_CustomDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat12.x = _ZBufferParams.z * u_xlat10_12 + _ZBufferParams.w;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat6.x * u_xlat12.x;
    u_xlat18 = _DistanceToProjectionWindow / u_xlat12.x;
    u_xlat2.y = u_xlat18 * u_xlat0.x;
    u_xlat3.xyz = u_xlat16_1.xyz * _Kernel[0].xyz;
    u_xlat0.x = u_xlat0.x * _DistanceToProjectionWindow;
    u_xlat0.x = u_xlat0.x * 300.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(1.0<_SampleStep);
#else
    u_xlatb18 = 1.0<_SampleStep;
#endif
    if(u_xlatb18){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[1].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_18 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat18 = _ZBufferParams.z * u_xlat10_18 + _ZBufferParams.w;
        u_xlat18 = float(1.0) / u_xlat18;
        u_xlat18 = (-u_xlat18) * u_xlat6.x + u_xlat12.x;
        u_xlat18 = u_xlat0.x * abs(u_xlat18);
#ifdef UNITY_ADRENO_ES3
        u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
        u_xlat18 = (-u_xlat18) + 1.0;
        u_xlat18 = u_xlat16_19 * u_xlat18;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[1].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 2;
    } else {
        u_xlati18 = 1;
    }
    u_xlat21 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21<_SampleStep);
#else
    u_xlatb21 = u_xlat21<_SampleStep;
#endif
    if(u_xlatb21){
        u_xlat2.z = 0.0;
        u_xlat4.xy = _Kernel[2].ww * u_xlat2.zy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_14 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat14 = _ZBufferParams.z * u_xlat10_14 + _ZBufferParams.w;
        u_xlat14 = float(1.0) / u_xlat14;
        u_xlat14 = (-u_xlat14) * u_xlat6.x + u_xlat12.x;
        u_xlat14 = u_xlat0.x * abs(u_xlat14);
#ifdef UNITY_ADRENO_ES3
        u_xlat14 = min(max(u_xlat14, 0.0), 1.0);
#else
        u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
#endif
        u_xlat14 = (-u_xlat14) + 1.0;
        u_xlat14 = u_xlat16_19 * u_xlat14;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat14) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[2].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 3;
    }
    u_xlat14 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14<_SampleStep);
#else
    u_xlatb14 = u_xlat14<_SampleStep;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    if(u_xlatb14){
        u_xlat2.w = 0.0;
        u_xlat4.xy = _Kernel[3].ww * u_xlat2.wy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[3].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 4;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[4].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[4].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 5;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[5].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[5].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 6;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[6].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[6].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 7;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[7].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[7].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 8;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[8].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[8].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 9;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[9].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[9].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 10;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[10].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[10].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 11;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[11].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[11].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 12;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[12].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[12].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 13;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[13].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[13].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 14;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[14].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[14].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 15;
    }
    u_xlat18 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18<_SampleStep);
#else
    u_xlatb18 = u_xlat18<_SampleStep;
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb14;
    if(u_xlatb18){
        u_xlat2.x = 0.0;
        u_xlat2.xy = _Kernel[15].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat2.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat2.xy).x;
        u_xlat10_18 = texture(_CustomDepthTexture, u_xlat2.xy).x;
        u_xlat18 = _ZBufferParams.z * u_xlat10_18 + _ZBufferParams.w;
        u_xlat18 = float(1.0) / u_xlat18;
        u_xlat6.x = (-u_xlat18) * u_xlat6.x + u_xlat12.x;
        u_xlat0.x = u_xlat0.x * abs(u_xlat6.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat0.x = u_xlat16_19 * u_xlat0.x;
        u_xlat6.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[15].xyz * u_xlat0.xyz + u_xlat3.xyz;
    }
    SV_TARGET0.xyz = u_xlat3.xyz;
    SV_TARGET0.w = 1.0;
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _ZBufferParams;
uniform 	float _SSSScale;
uniform 	float _SampleStep;
uniform 	float _DistanceToProjectionWindow;
uniform 	float _ScaleOffset;
uniform 	vec4 _Kernel[16];
uniform 	vec4 _CustomDepthTexture_TexelSize;
uniform 	vec4 _SeparateSSSValidUVRect;
UNITY_LOCATION(0) uniform mediump sampler2D _SkinDiffuseY;
UNITY_LOCATION(1) uniform mediump sampler2D _SkinMask;
UNITY_LOCATION(2) uniform highp sampler2D _CustomDepthTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_TARGET0;
vec3 u_xlat0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
vec2 u_xlat12;
mediump float u_xlat10_12;
bvec2 u_xlatb12;
mediump float u_xlat16_13;
float u_xlat14;
mediump float u_xlat10_14;
bool u_xlatb14;
float u_xlat18;
mediump float u_xlat10_18;
int u_xlati18;
bool u_xlatb18;
mediump float u_xlat16_19;
float u_xlat20;
mediump float u_xlat10_20;
bool u_xlatb20;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlatb0.xy = lessThan(_SeparateSSSValidUVRect.xyxx, _SeparateSSSValidUVRect.zwzz).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlatb6.xy = lessThan(vs_TEXCOORD0.xyxx, _SeparateSSSValidUVRect.xyxx).xy;
    u_xlatb6.x = u_xlatb6.y || u_xlatb6.x;
    u_xlatb12.xy = lessThan(_SeparateSSSValidUVRect.zwzw, vs_TEXCOORD0.xyxy).xy;
    u_xlatb12.x = u_xlatb12.y || u_xlatb12.x;
    u_xlatb6.x = u_xlatb12.x || u_xlatb6.x;
    u_xlatb0.x = u_xlatb6.x && u_xlatb0.x;
    if(u_xlatb0.x){
        SV_TARGET0 = vec4(0.0, 0.0, 0.0, 1.0);
        return;
    }
    u_xlat16_1.x = texture(_SkinMask, vs_TEXCOORD0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_1.x<0.00999999978);
#else
    u_xlatb0.x = u_xlat16_1.x<0.00999999978;
#endif
    if(u_xlatb0.x){
        u_xlat0.x = 0.0;
        u_xlat0.y = _CustomDepthTexture_TexelSize.y;
        u_xlat12.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
        u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
        u_xlat16_7 = texture(_SkinMask, u_xlat12.xy).x;
        u_xlat16_13 = texture(_SkinMask, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0.x = !!(u_xlat16_1.x<u_xlat16_7);
#else
        u_xlatb0.x = u_xlat16_1.x<u_xlat16_7;
#endif
        u_xlat12.x = max(u_xlat16_7, u_xlat16_1.x);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat12.y : vs_TEXCOORD0.y;
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(u_xlat12.x<u_xlat16_13);
#else
        u_xlatb18 = u_xlat12.x<u_xlat16_13;
#endif
        u_xlat12.x = max(u_xlat16_13, u_xlat12.x);
        u_xlat0.x = (u_xlatb18) ? u_xlat0.y : u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb12.x = !!(u_xlat12.x<0.00999999978);
#else
        u_xlatb12.x = u_xlat12.x<0.00999999978;
#endif
        if(u_xlatb12.x){
            SV_TARGET0 = vec4(0.0, 0.0, 0.0, 1.0);
            return;
        }
    } else {
        u_xlat0.x = vs_TEXCOORD0.y;
    }
    u_xlat0.y = vs_TEXCOORD0.x;
    u_xlat16_1.xyz = texture(_SkinDiffuseY, u_xlat0.yx).xyz;
    u_xlat0.x = _SSSScale * _CustomDepthTexture_TexelSize.y;
    u_xlat0.x = u_xlat0.x * 4.0;
    u_xlat6.x = _ScaleOffset + 1.0;
    u_xlat6.x = max(u_xlat6.x, 9.99999975e-06);
    u_xlat10_12 = texture(_CustomDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat12.x = _ZBufferParams.z * u_xlat10_12 + _ZBufferParams.w;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat6.x * u_xlat12.x;
    u_xlat18 = _DistanceToProjectionWindow / u_xlat12.x;
    u_xlat2.y = u_xlat18 * u_xlat0.x;
    u_xlat3.xyz = u_xlat16_1.xyz * _Kernel[0].xyz;
    u_xlat0.x = u_xlat0.x * _DistanceToProjectionWindow;
    u_xlat0.x = u_xlat0.x * 300.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(1.0<_SampleStep);
#else
    u_xlatb18 = 1.0<_SampleStep;
#endif
    if(u_xlatb18){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[1].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_18 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat18 = _ZBufferParams.z * u_xlat10_18 + _ZBufferParams.w;
        u_xlat18 = float(1.0) / u_xlat18;
        u_xlat18 = (-u_xlat18) * u_xlat6.x + u_xlat12.x;
        u_xlat18 = u_xlat0.x * abs(u_xlat18);
#ifdef UNITY_ADRENO_ES3
        u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
        u_xlat18 = (-u_xlat18) + 1.0;
        u_xlat18 = u_xlat16_19 * u_xlat18;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[1].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 2;
    } else {
        u_xlati18 = 1;
    }
    u_xlat21 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21<_SampleStep);
#else
    u_xlatb21 = u_xlat21<_SampleStep;
#endif
    if(u_xlatb21){
        u_xlat2.z = 0.0;
        u_xlat4.xy = _Kernel[2].ww * u_xlat2.zy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_14 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat14 = _ZBufferParams.z * u_xlat10_14 + _ZBufferParams.w;
        u_xlat14 = float(1.0) / u_xlat14;
        u_xlat14 = (-u_xlat14) * u_xlat6.x + u_xlat12.x;
        u_xlat14 = u_xlat0.x * abs(u_xlat14);
#ifdef UNITY_ADRENO_ES3
        u_xlat14 = min(max(u_xlat14, 0.0), 1.0);
#else
        u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
#endif
        u_xlat14 = (-u_xlat14) + 1.0;
        u_xlat14 = u_xlat16_19 * u_xlat14;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat14) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[2].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 3;
    }
    u_xlat14 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14<_SampleStep);
#else
    u_xlatb14 = u_xlat14<_SampleStep;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    if(u_xlatb14){
        u_xlat2.w = 0.0;
        u_xlat4.xy = _Kernel[3].ww * u_xlat2.wy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[3].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 4;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[4].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[4].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 5;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[5].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[5].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 6;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[6].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[6].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 7;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[7].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[7].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 8;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[8].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[8].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 9;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[9].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[9].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 10;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[10].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[10].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 11;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[11].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[11].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 12;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[12].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[12].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 13;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[13].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[13].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 14;
    }
    u_xlat20 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat20<_SampleStep);
#else
    u_xlatb20 = u_xlat20<_SampleStep;
#endif
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[14].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
#ifdef UNITY_ADRENO_ES3
        u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[14].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 15;
    }
    u_xlat18 = float(u_xlati18);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18<_SampleStep);
#else
    u_xlatb18 = u_xlat18<_SampleStep;
#endif
    u_xlatb18 = u_xlatb18 && u_xlatb14;
    if(u_xlatb18){
        u_xlat2.x = 0.0;
        u_xlat2.xy = _Kernel[15].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture(_SkinDiffuseY, u_xlat2.xy).xyz;
        u_xlat16_19 = texture(_SkinMask, u_xlat2.xy).x;
        u_xlat10_18 = texture(_CustomDepthTexture, u_xlat2.xy).x;
        u_xlat18 = _ZBufferParams.z * u_xlat10_18 + _ZBufferParams.w;
        u_xlat18 = float(1.0) / u_xlat18;
        u_xlat6.x = (-u_xlat18) * u_xlat6.x + u_xlat12.x;
        u_xlat0.x = u_xlat0.x * abs(u_xlat6.x);
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat0.x = u_xlat16_19 * u_xlat0.x;
        u_xlat6.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[15].xyz * u_xlat0.xyz + u_xlat3.xyz;
    }
    SV_TARGET0.xyz = u_xlat3.xyz;
    SV_TARGET0.w = 1.0;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _ZBufferParams;
uniform 	float _SSSScale;
uniform 	float _SampleStep;
uniform 	float _DistanceToProjectionWindow;
uniform 	float _ScaleOffset;
uniform 	vec4 _Kernel[16];
uniform 	vec4 _CustomDepthTexture_TexelSize;
uniform 	vec4 _SeparateSSSValidUVRect;
uniform mediump sampler2D _SkinDiffuseY;
uniform mediump sampler2D _SkinMask;
uniform highp sampler2D _CustomDepthTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_TARGET0 gl_FragData[0]
vec3 u_xlat0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
vec2 u_xlat12;
lowp float u_xlat10_12;
bvec2 u_xlatb12;
mediump float u_xlat16_13;
float u_xlat14;
lowp float u_xlat10_14;
bool u_xlatb14;
float u_xlat18;
lowp float u_xlat10_18;
int u_xlati18;
bool u_xlatb18;
mediump float u_xlat16_19;
float u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlatb0.xy = lessThan(_SeparateSSSValidUVRect.xyxx, _SeparateSSSValidUVRect.zwzz).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlatb6.xy = lessThan(vs_TEXCOORD0.xyxx, _SeparateSSSValidUVRect.xyxx).xy;
    u_xlatb6.x = u_xlatb6.y || u_xlatb6.x;
    u_xlatb12.xy = lessThan(_SeparateSSSValidUVRect.zwzw, vs_TEXCOORD0.xyxy).xy;
    u_xlatb12.x = u_xlatb12.y || u_xlatb12.x;
    u_xlatb6.x = u_xlatb12.x || u_xlatb6.x;
    u_xlatb0.x = u_xlatb6.x && u_xlatb0.x;
    if(u_xlatb0.x){
        SV_TARGET0 = vec4(0.0, 0.0, 0.0, 1.0);
        return;
    }
    u_xlat16_1.x = texture2D(_SkinMask, vs_TEXCOORD0.xy).x;
    u_xlatb0.x = u_xlat16_1.x<0.00999999978;
    if(u_xlatb0.x){
        u_xlat0.x = 0.0;
        u_xlat0.y = _CustomDepthTexture_TexelSize.y;
        u_xlat12.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
        u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
        u_xlat16_7 = texture2D(_SkinMask, u_xlat12.xy).x;
        u_xlat16_13 = texture2D(_SkinMask, u_xlat0.xy).x;
        u_xlatb0.x = u_xlat16_1.x<u_xlat16_7;
        u_xlat12.x = max(u_xlat16_7, u_xlat16_1.x);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat12.y : vs_TEXCOORD0.y;
        u_xlatb18 = u_xlat12.x<u_xlat16_13;
        u_xlat12.x = max(u_xlat16_13, u_xlat12.x);
        u_xlat0.x = (u_xlatb18) ? u_xlat0.y : u_xlat0.x;
        u_xlatb12.x = u_xlat12.x<0.00999999978;
        if(u_xlatb12.x){
            SV_TARGET0 = vec4(0.0, 0.0, 0.0, 1.0);
            return;
        }
    } else {
        u_xlat0.x = vs_TEXCOORD0.y;
    }
    u_xlat0.y = vs_TEXCOORD0.x;
    u_xlat16_1.xyz = texture2D(_SkinDiffuseY, u_xlat0.yx).xyz;
    u_xlat0.x = _SSSScale * _CustomDepthTexture_TexelSize.y;
    u_xlat0.x = u_xlat0.x * 4.0;
    u_xlat6.x = _ScaleOffset + 1.0;
    u_xlat6.x = max(u_xlat6.x, 9.99999975e-06);
    u_xlat10_12 = texture2D(_CustomDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat12.x = _ZBufferParams.z * u_xlat10_12 + _ZBufferParams.w;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat6.x * u_xlat12.x;
    u_xlat18 = _DistanceToProjectionWindow / u_xlat12.x;
    u_xlat2.y = u_xlat18 * u_xlat0.x;
    u_xlat3.xyz = u_xlat16_1.xyz * _Kernel[0].xyz;
    u_xlat0.x = u_xlat0.x * _DistanceToProjectionWindow;
    u_xlat0.x = u_xlat0.x * 300.0;
    u_xlatb18 = 1.0<_SampleStep;
    if(u_xlatb18){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[1].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_18 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat18 = _ZBufferParams.z * u_xlat10_18 + _ZBufferParams.w;
        u_xlat18 = float(1.0) / u_xlat18;
        u_xlat18 = (-u_xlat18) * u_xlat6.x + u_xlat12.x;
        u_xlat18 = u_xlat0.x * abs(u_xlat18);
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlat18 = (-u_xlat18) + 1.0;
        u_xlat18 = u_xlat16_19 * u_xlat18;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[1].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 2;
    } else {
        u_xlati18 = 1;
    }
    u_xlat21 = float(u_xlati18);
    u_xlatb21 = u_xlat21<_SampleStep;
    if(u_xlatb21){
        u_xlat2.z = 0.0;
        u_xlat4.xy = _Kernel[2].ww * u_xlat2.zy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_14 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat14 = _ZBufferParams.z * u_xlat10_14 + _ZBufferParams.w;
        u_xlat14 = float(1.0) / u_xlat14;
        u_xlat14 = (-u_xlat14) * u_xlat6.x + u_xlat12.x;
        u_xlat14 = u_xlat0.x * abs(u_xlat14);
        u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
        u_xlat14 = (-u_xlat14) + 1.0;
        u_xlat14 = u_xlat16_19 * u_xlat14;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat14) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[2].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 3;
    }
    u_xlat14 = float(u_xlati18);
    u_xlatb14 = u_xlat14<_SampleStep;
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    if(u_xlatb14){
        u_xlat2.w = 0.0;
        u_xlat4.xy = _Kernel[3].ww * u_xlat2.wy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[3].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 4;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[4].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[4].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 5;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[5].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[5].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 6;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[6].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[6].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 7;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[7].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[7].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 8;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[8].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[8].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 9;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[9].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[9].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 10;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[10].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[10].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 11;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[11].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[11].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 12;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[12].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[12].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 13;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[13].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[13].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 14;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[14].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[14].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 15;
    }
    u_xlat18 = float(u_xlati18);
    u_xlatb18 = u_xlat18<_SampleStep;
    u_xlatb18 = u_xlatb18 && u_xlatb14;
    if(u_xlatb18){
        u_xlat2.x = 0.0;
        u_xlat2.xy = _Kernel[15].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat2.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat2.xy).x;
        u_xlat10_18 = texture2D(_CustomDepthTexture, u_xlat2.xy).x;
        u_xlat18 = _ZBufferParams.z * u_xlat10_18 + _ZBufferParams.w;
        u_xlat18 = float(1.0) / u_xlat18;
        u_xlat6.x = (-u_xlat18) * u_xlat6.x + u_xlat12.x;
        u_xlat0.x = u_xlat0.x * abs(u_xlat6.x);
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat0.x = u_xlat16_19 * u_xlat0.x;
        u_xlat6.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[15].xyz * u_xlat0.xyz + u_xlat3.xyz;
    }
    SV_TARGET0.xyz = u_xlat3.xyz;
    SV_TARGET0.w = 1.0;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
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
uniform 	vec4 _ZBufferParams;
uniform 	float _SSSScale;
uniform 	float _SampleStep;
uniform 	float _DistanceToProjectionWindow;
uniform 	float _ScaleOffset;
uniform 	vec4 _Kernel[16];
uniform 	vec4 _CustomDepthTexture_TexelSize;
uniform 	vec4 _SeparateSSSValidUVRect;
uniform mediump sampler2D _SkinDiffuseY;
uniform mediump sampler2D _SkinMask;
uniform highp sampler2D _CustomDepthTexture;
varying highp vec4 vs_TEXCOORD0;
#define SV_TARGET0 gl_FragData[0]
vec3 u_xlat0;
bvec2 u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_7;
vec2 u_xlat12;
lowp float u_xlat10_12;
bvec2 u_xlatb12;
mediump float u_xlat16_13;
float u_xlat14;
lowp float u_xlat10_14;
bool u_xlatb14;
float u_xlat18;
lowp float u_xlat10_18;
int u_xlati18;
bool u_xlatb18;
mediump float u_xlat16_19;
float u_xlat20;
lowp float u_xlat10_20;
bool u_xlatb20;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlatb0.xy = lessThan(_SeparateSSSValidUVRect.xyxx, _SeparateSSSValidUVRect.zwzz).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlatb6.xy = lessThan(vs_TEXCOORD0.xyxx, _SeparateSSSValidUVRect.xyxx).xy;
    u_xlatb6.x = u_xlatb6.y || u_xlatb6.x;
    u_xlatb12.xy = lessThan(_SeparateSSSValidUVRect.zwzw, vs_TEXCOORD0.xyxy).xy;
    u_xlatb12.x = u_xlatb12.y || u_xlatb12.x;
    u_xlatb6.x = u_xlatb12.x || u_xlatb6.x;
    u_xlatb0.x = u_xlatb6.x && u_xlatb0.x;
    if(u_xlatb0.x){
        SV_TARGET0 = vec4(0.0, 0.0, 0.0, 1.0);
        return;
    }
    u_xlat16_1.x = texture2D(_SkinMask, vs_TEXCOORD0.xy).x;
    u_xlatb0.x = u_xlat16_1.x<0.00999999978;
    if(u_xlatb0.x){
        u_xlat0.x = 0.0;
        u_xlat0.y = _CustomDepthTexture_TexelSize.y;
        u_xlat12.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
        u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
        u_xlat16_7 = texture2D(_SkinMask, u_xlat12.xy).x;
        u_xlat16_13 = texture2D(_SkinMask, u_xlat0.xy).x;
        u_xlatb0.x = u_xlat16_1.x<u_xlat16_7;
        u_xlat12.x = max(u_xlat16_7, u_xlat16_1.x);
        u_xlat0.x = (u_xlatb0.x) ? u_xlat12.y : vs_TEXCOORD0.y;
        u_xlatb18 = u_xlat12.x<u_xlat16_13;
        u_xlat12.x = max(u_xlat16_13, u_xlat12.x);
        u_xlat0.x = (u_xlatb18) ? u_xlat0.y : u_xlat0.x;
        u_xlatb12.x = u_xlat12.x<0.00999999978;
        if(u_xlatb12.x){
            SV_TARGET0 = vec4(0.0, 0.0, 0.0, 1.0);
            return;
        }
    } else {
        u_xlat0.x = vs_TEXCOORD0.y;
    }
    u_xlat0.y = vs_TEXCOORD0.x;
    u_xlat16_1.xyz = texture2D(_SkinDiffuseY, u_xlat0.yx).xyz;
    u_xlat0.x = _SSSScale * _CustomDepthTexture_TexelSize.y;
    u_xlat0.x = u_xlat0.x * 4.0;
    u_xlat6.x = _ScaleOffset + 1.0;
    u_xlat6.x = max(u_xlat6.x, 9.99999975e-06);
    u_xlat10_12 = texture2D(_CustomDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat12.x = _ZBufferParams.z * u_xlat10_12 + _ZBufferParams.w;
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat6.x * u_xlat12.x;
    u_xlat18 = _DistanceToProjectionWindow / u_xlat12.x;
    u_xlat2.y = u_xlat18 * u_xlat0.x;
    u_xlat3.xyz = u_xlat16_1.xyz * _Kernel[0].xyz;
    u_xlat0.x = u_xlat0.x * _DistanceToProjectionWindow;
    u_xlat0.x = u_xlat0.x * 300.0;
    u_xlatb18 = 1.0<_SampleStep;
    if(u_xlatb18){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[1].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_18 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat18 = _ZBufferParams.z * u_xlat10_18 + _ZBufferParams.w;
        u_xlat18 = float(1.0) / u_xlat18;
        u_xlat18 = (-u_xlat18) * u_xlat6.x + u_xlat12.x;
        u_xlat18 = u_xlat0.x * abs(u_xlat18);
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlat18 = (-u_xlat18) + 1.0;
        u_xlat18 = u_xlat16_19 * u_xlat18;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat18) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[1].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 2;
    } else {
        u_xlati18 = 1;
    }
    u_xlat21 = float(u_xlati18);
    u_xlatb21 = u_xlat21<_SampleStep;
    if(u_xlatb21){
        u_xlat2.z = 0.0;
        u_xlat4.xy = _Kernel[2].ww * u_xlat2.zy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_14 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat14 = _ZBufferParams.z * u_xlat10_14 + _ZBufferParams.w;
        u_xlat14 = float(1.0) / u_xlat14;
        u_xlat14 = (-u_xlat14) * u_xlat6.x + u_xlat12.x;
        u_xlat14 = u_xlat0.x * abs(u_xlat14);
        u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
        u_xlat14 = (-u_xlat14) + 1.0;
        u_xlat14 = u_xlat16_19 * u_xlat14;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat14) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[2].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 3;
    }
    u_xlat14 = float(u_xlati18);
    u_xlatb14 = u_xlat14<_SampleStep;
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    if(u_xlatb14){
        u_xlat2.w = 0.0;
        u_xlat4.xy = _Kernel[3].ww * u_xlat2.wy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[3].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 4;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[4].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[4].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 5;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[5].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[5].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 6;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[6].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[6].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 7;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[7].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[7].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 8;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[8].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[8].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 9;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[9].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[9].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 10;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[10].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[10].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 11;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[11].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[11].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 12;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[12].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[12].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 13;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[13].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[13].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 14;
    }
    u_xlat20 = float(u_xlati18);
    u_xlatb20 = u_xlat20<_SampleStep;
    u_xlatb14 = u_xlatb20 && u_xlatb14;
    if(u_xlatb14){
        u_xlat2.x = 0.0;
        u_xlat4.xy = _Kernel[14].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat4.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat4.xy).x;
        u_xlat10_20 = texture2D(_CustomDepthTexture, u_xlat4.xy).x;
        u_xlat20 = _ZBufferParams.z * u_xlat10_20 + _ZBufferParams.w;
        u_xlat20 = float(1.0) / u_xlat20;
        u_xlat20 = (-u_xlat20) * u_xlat6.x + u_xlat12.x;
        u_xlat20 = u_xlat0.x * abs(u_xlat20);
        u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
        u_xlat20 = (-u_xlat20) + 1.0;
        u_xlat20 = u_xlat16_19 * u_xlat20;
        u_xlat4.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat4.xyz = vec3(u_xlat20) * u_xlat4.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[14].xyz * u_xlat4.xyz + u_xlat3.xyz;
        u_xlati18 = 15;
    }
    u_xlat18 = float(u_xlati18);
    u_xlatb18 = u_xlat18<_SampleStep;
    u_xlatb18 = u_xlatb18 && u_xlatb14;
    if(u_xlatb18){
        u_xlat2.x = 0.0;
        u_xlat2.xy = _Kernel[15].ww * u_xlat2.xy + vs_TEXCOORD0.xy;
        u_xlat16_5.xyz = texture2D(_SkinDiffuseY, u_xlat2.xy).xyz;
        u_xlat16_19 = texture2D(_SkinMask, u_xlat2.xy).x;
        u_xlat10_18 = texture2D(_CustomDepthTexture, u_xlat2.xy).x;
        u_xlat18 = _ZBufferParams.z * u_xlat10_18 + _ZBufferParams.w;
        u_xlat18 = float(1.0) / u_xlat18;
        u_xlat6.x = (-u_xlat18) * u_xlat6.x + u_xlat12.x;
        u_xlat0.x = u_xlat0.x * abs(u_xlat6.x);
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        u_xlat0.x = (-u_xlat0.x) + 1.0;
        u_xlat0.x = u_xlat16_19 * u_xlat0.x;
        u_xlat6.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_1.xyz;
        u_xlat3.xyz = _Kernel[15].xyz * u_xlat0.xyz + u_xlat3.xyz;
    }
    SV_TARGET0.xyz = u_xlat3.xyz;
    SV_TARGET0.w = 1.0;
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