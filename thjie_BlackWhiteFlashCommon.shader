//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "thjie/BlackWhiteFlashCommon" {
Properties {

[Space(20)] _UseBlackWhiteFlash ("UseBlackWhiteFlash", Float) = 0.0

[Space(20)] _MainTex ("Screen", 2D) = "black" { }

_MainAlpha ("MainAlpha", Range(0, 1)) = 1.0

_VoronoTex ("VoronoTex1", 2D) = "black" { }

[Space(20)] _UseBlackWhiteColor ("UseBlackWhiteColor", Float) = 1.0

_Color1 ("Color1", Color) = (1,1,1,0)

_Color2 ("Color2", Color) = (0,0,0,0)

_RevertColor ("RevertColor", Float) = 0.0

[Space(20)] [Toggle] _UseRayLine ("UseRayLine", Float) = 0.0

[Toggle] _OptRayLine ("优化射线(只采样一次噪波图)", Float) = 0.0

_centerU ("centerU", Range(0, 1)) = 0.5

_centerV ("centerV", Range(0, 1)) = 0.5

_LineTilingU ("LineTilingU", Range(0.01, 1)) = 0.5

_LineTilingV ("LineTilingV", Range(0.01, 1)) = 0.5

_LineUVScale ("LineUVScale", Range(0.01, 5)) = 3.0

_LineColorScale ("LineColorScale", Range(-1, 3)) = 0.0

_LineOffset ("LineOffset", Range(0, 5)) = 0.0

_BlurFactor ("BlurFactor", Range(0, 1)) = 0.0

_Soft ("Soft", Range(0, 1)) = 0.5

_StepFactor ("StepFactor", Range(0, 2)) = 0.6000000238418579

[Space(20)] [Toggle] _UseLogo ("UseLogo", Float) = 0.0

_Logo ("Logo", 2D) = "white" { }

_Logo_ST ("Logo_ST", Vector) = (3,3,0,0.1)

_LogoAlpha ("LogoAlpha", Range(0, 1)) = 0.20000000298023224

[Space(20)] [Toggle] _UseTexAR ("UseTexAR", Float) = 1.0

_Tex ("Tex", 2D) = "white" { }

_TexRotator ("TexRotator", Range(0, 1)) = 0.07500000298023224

_TexAlpha ("TexAlpha", Range(0, 1)) = 0.07000000029802322

_Tex_ST ("Tex_ST", Vector) = (300,300,0,0)

[Space(20)] [Toggle] _UseVignette ("UseVignette", Float) = 0.0

_VignettePower ("VignettePower", Range(1, 3)) = 1.5

_VignetteScale ("VignetteScale", Range(0, 3)) = 1.5

[Space(20)] [Toggle] _UseRedBlue ("UseRedBlue", Float) = 0.0

_RedBlueFactor ("RedBlueFactor", Range(0, 1.5)) = 0.0

[Space(20)] [Toggle] _UseZhenDong ("UseZhenDong", Float) = 0.0

_zhenfu ("zhenfu", Range(0, 1)) = 0.0

_zhenpin ("zhenpin", Range(0, 1)) = 0.0

}
SubShader {
 Pass {
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 39514
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
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
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	float _UseBlackWhiteFlash;
uniform 	mediump vec4 _MainTex_ST;
uniform 	float _MainAlpha;
uniform 	float _UseBlackWhiteColor;
uniform 	vec4 _Color1;
uniform 	vec4 _Color2;
uniform 	float _RevertColor;
uniform 	float _UseRayLine;
uniform 	float _OptRayLine;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	float _BlurFactor;
uniform 	float _StepFactor;
uniform 	float _Soft;
uniform 	float _LineColorScale;
uniform 	float _UseVignette;
uniform 	float _VignettePower;
uniform 	float _VignetteScale;
uniform 	float _UseRedBlue;
uniform 	float _RedBlueFactor;
uniform 	float _UseTexAR;
uniform 	vec4 _Tex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
uniform 	float _UseLogo;
uniform 	vec4 _Logo_ST;
uniform 	float _LogoAlpha;
uniform 	float _UseZhenDong;
uniform 	float _zhenpin;
uniform 	float _zhenfu;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _VoronoTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Tex;
UNITY_LOCATION(3) uniform mediump sampler2D _Logo;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec4 u_xlat5;
bvec2 u_xlatb5;
vec4 u_xlat6;
vec4 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec2 u_xlat12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
float u_xlat18;
float u_xlat21;
bool u_xlatb23;
vec2 u_xlat33;
bool u_xlatb33;
vec2 u_xlat34;
bool u_xlatb34;
vec2 u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
vec2 u_xlat42;
vec2 u_xlat43;
float u_xlat46;
float u_xlat48;
float u_xlat49;
float u_xlat50;
mediump float u_xlat16_50;
int u_xlati50;
bool u_xlatb50;
float u_xlat52;
bool u_xlatb52;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_UseBlackWhiteFlash==0.0);
#else
    u_xlatb1 = _UseBlackWhiteFlash==0.0;
#endif
    if(u_xlatb1){
        SV_Target0 = u_xlat16_0;
        return;
    }
    u_xlat16_2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.x = dot(u_xlat16_2.xy, u_xlat16_2.xy);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat1 = vs_TEXCOORD4.xyxy / vs_TEXCOORD4.wwww;
    u_xlat3.x = _centerU;
    u_xlat3.y = _centerV;
    u_xlat4 = (-u_xlat3.xyxy) + vec4(1.0, 1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(0.0<_UseZhenDong);
#else
    u_xlatb33 = 0.0<_UseZhenDong;
#endif
    u_xlat48 = _Time.y * _zhenpin;
    u_xlat5.xy = vec2(u_xlat48) * vec2(60.0, 42.0);
    u_xlat48 = cos(u_xlat5.x);
    u_xlat48 = u_xlat48 * _zhenfu;
    u_xlat6.x = u_xlat48 * 0.0500000007;
    u_xlat48 = sin(u_xlat5.y);
    u_xlat48 = u_xlat48 * _zhenfu;
    u_xlat6.y = u_xlat48 * 0.0500000007;
    u_xlat33.xy = bool(u_xlatb33) ? u_xlat6.xy : vec2(0.0, 0.0);
    u_xlat4 = u_xlat33.xyxy + u_xlat4;
    u_xlatb5.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseRayLine, _RevertColor, _UseRayLine, _UseRayLine)).xy;
    if(u_xlatb5.x){
        u_xlat35.xy = u_xlat33.xy + u_xlat3.xy;
        u_xlat6 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
        u_xlat35.xy = (-u_xlat35.xy) + vs_TEXCOORD0.xy;
        u_xlat7.x = dot(u_xlat35.xy, u_xlat35.xy);
        u_xlat7.x = sqrt(u_xlat7.x);
        u_xlat7.x = u_xlat7.x + u_xlat7.x;
        u_xlat7.xy = u_xlat6.xz * u_xlat7.xx;
        u_xlat6.x = min(abs(u_xlat35.y), abs(u_xlat35.x));
        u_xlat36 = max(abs(u_xlat35.y), abs(u_xlat35.x));
        u_xlat36 = float(1.0) / u_xlat36;
        u_xlat6.x = u_xlat36 * u_xlat6.x;
        u_xlat36 = u_xlat6.x * u_xlat6.x;
        u_xlat8.x = u_xlat36 * 0.0208350997 + -0.0851330012;
        u_xlat8.x = u_xlat36 * u_xlat8.x + 0.180141002;
        u_xlat8.x = u_xlat36 * u_xlat8.x + -0.330299497;
        u_xlat36 = u_xlat36 * u_xlat8.x + 0.999866009;
        u_xlat8.x = u_xlat36 * u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb23 = !!(abs(u_xlat35.y)<abs(u_xlat35.x));
#else
        u_xlatb23 = abs(u_xlat35.y)<abs(u_xlat35.x);
#endif
        u_xlat8.x = u_xlat8.x * -2.0 + 1.57079637;
        u_xlat8.x = u_xlatb23 ? u_xlat8.x : float(0.0);
        u_xlat6.x = u_xlat6.x * u_xlat36 + u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(u_xlat35.y<(-u_xlat35.y));
#else
        u_xlatb36 = u_xlat35.y<(-u_xlat35.y);
#endif
        u_xlat36 = u_xlatb36 ? -3.14159274 : float(0.0);
        u_xlat6.x = u_xlat36 + u_xlat6.x;
        u_xlat36 = min(u_xlat35.y, u_xlat35.x);
        u_xlat35.x = max(u_xlat35.y, u_xlat35.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb50 = !!(u_xlat36<(-u_xlat36));
#else
        u_xlatb50 = u_xlat36<(-u_xlat36);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb35 = !!(u_xlat35.x>=(-u_xlat35.x));
#else
        u_xlatb35 = u_xlat35.x>=(-u_xlat35.x);
#endif
        u_xlatb35 = u_xlatb35 && u_xlatb50;
        u_xlat35.x = (u_xlatb35) ? (-u_xlat6.x) : u_xlat6.x;
        u_xlat35.x = u_xlat35.x * 0.159235656;
        u_xlat7.zw = u_xlat6.yw * u_xlat35.xx;
        u_xlat16_35 = texture(_VoronoTex, u_xlat7.xz).x;
        u_xlat16_50 = texture(_VoronoTex, u_xlat7.yw).x;
        u_xlat6.x = (-u_xlat16_2.x) + 1.0;
        u_xlat21 = u_xlat6.x * u_xlat6.x;
        u_xlat6.x = u_xlat21 * u_xlat6.x;
        u_xlat35.x = u_xlat16_50 * u_xlat16_35;
        u_xlat35.x = u_xlat35.x * _LineUVScale;
        u_xlat35.x = u_xlat35.x * u_xlat6.x;
    } else {
        u_xlat35.x = 0.0;
    }
    u_xlat4 = (-u_xlat1.zwzw) + u_xlat4;
    u_xlat1 = u_xlat35.xxxx * u_xlat4 + u_xlat1;
    u_xlat4 = u_xlat33.xyxy + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat4 = (-u_xlat4) + vec4(1.0, 1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(_UseRedBlue==0.0);
#else
    u_xlatb50 = _UseRedBlue==0.0;
#endif
    u_xlat50 = (u_xlatb50) ? 0.0 : _RedBlueFactor;
    u_xlat6 = vec4(u_xlat50) * vec4(0.100000001, 0.100000001, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat7 = (-vec4(u_xlat50)) * vec4(0.100000001, 0.100000001, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat33.xy = (-u_xlat33.xy) + u_xlat1.zw;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat6 = u_xlat1.zwzw * u_xlat6 + u_xlat4;
    u_xlat1 = u_xlat1 * u_xlat7 + u_xlat4;
    u_xlat4.x = _BlurFactor * 0.00600000005;
    u_xlat3.xy = (-u_xlat3.xy) + u_xlat33.xy;
    u_xlat3.xy = u_xlat3.xy * u_xlat4.xx;
    u_xlatb4.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseRedBlue, _UseTexAR, _UseRedBlue, _UseRedBlue)).xy;
    u_xlat7.x = float(0.0);
    u_xlat7.y = float(0.0);
    u_xlat7.z = float(0.0);
    u_xlat8.x = float(0.0);
    u_xlat8.y = float(0.0);
    u_xlat8.z = float(0.0);
    u_xlat9.x = float(0.0);
    u_xlat9.y = float(0.0);
    u_xlat9.z = float(0.0);
    u_xlat10.x = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat10.z = float(0.0);
    u_xlat11.x = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat11.z = float(0.0);
    u_xlat34.xy = u_xlat33.xy;
    u_xlat12.xy = u_xlat6.xy;
    u_xlat42.xy = u_xlat1.xy;
    u_xlat13.xy = u_xlat6.zw;
    u_xlat43.xy = u_xlat1.zw;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<5 ; u_xlati_loop_1++)
    {
        u_xlat52 = float(u_xlati_loop_1);
        u_xlat12.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat12.xy;
        u_xlat16_14.xyz = texture(_MainTex, u_xlat12.xy).xyz;
        u_xlat8.xyz = u_xlat8.xyz + u_xlat16_14.xyz;
        if(u_xlatb4.x){
            u_xlat34.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat34.xy;
            u_xlat16_14.xyz = texture(_MainTex, u_xlat34.xy).xyz;
            u_xlat7.xyz = u_xlat7.xyz + u_xlat16_14.xyz;
            u_xlat42.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat42.xy;
            u_xlat16_14.xyz = texture(_MainTex, u_xlat42.xy).xyz;
            u_xlat9.xyz = u_xlat9.xyz + u_xlat16_14.xyz;
            u_xlat13.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat13.xy;
            u_xlat16_14.xyz = texture(_MainTex, u_xlat13.xy).xyz;
            u_xlat10.xyz = u_xlat10.xyz + u_xlat16_14.xyz;
            u_xlat43.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat43.xy;
            u_xlat16_14.xyz = texture(_MainTex, u_xlat43.xy).xyz;
            u_xlat11.xyz = u_xlat11.xyz + u_xlat16_14.xyz;
        }
    }
    u_xlat1.xyw = u_xlat8.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat3.xyz = _Color2.xyz;
    u_xlat3.w = _Color1.x;
    u_xlat6.xyz = _Color1.xyz;
    u_xlat6.w = _Color2.x;
    u_xlat3 = (u_xlatb5.y) ? u_xlat3 : u_xlat6;
    u_xlat6.yz = (u_xlatb5.y) ? _Color1.yz : _Color2.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(0.0<_UseBlackWhiteColor);
#else
    u_xlatb34 = 0.0<_UseBlackWhiteColor;
#endif
    if(u_xlatb34){
        if(u_xlatb5.x){
#ifdef UNITY_ADRENO_ES3
            u_xlatb34 = !!(0.0<_OptRayLine);
#else
            u_xlatb34 = 0.0<_OptRayLine;
#endif
            if(!u_xlatb34){
                u_xlat34.x = log2(u_xlat16_2.x);
                u_xlat34.x = u_xlat34.x * 0.100000001;
                u_xlat34.x = exp2(u_xlat34.x);
                u_xlat35.x = u_xlat34.x * _LineColorScale;
            }
        } else {
            u_xlat35.x = 0.0;
        }
        u_xlat5.xyw = u_xlat8.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
        u_xlat5.xyw = min(max(u_xlat5.xyw, 0.0), 1.0);
#else
        u_xlat5.xyw = clamp(u_xlat5.xyw, 0.0, 1.0);
#endif
        u_xlat34.x = dot(u_xlat5.xyw, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat34.x = u_xlat34.x + (-_StepFactor);
        u_xlat49 = float(1.0) / (-_Soft);
        u_xlat34.x = u_xlat49 * u_xlat34.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat34.x = min(max(u_xlat34.x, 0.0), 1.0);
#else
        u_xlat34.x = clamp(u_xlat34.x, 0.0, 1.0);
#endif
        u_xlat49 = u_xlat34.x * -2.0 + 3.0;
        u_xlat34.x = u_xlat34.x * u_xlat34.x;
        u_xlat34.x = u_xlat34.x * u_xlat49;
        u_xlat6.x = u_xlat3.w;
        u_xlat5.xyw = (-u_xlat3.xyz) + u_xlat6.xyz;
        u_xlat1.xyw = u_xlat34.xxx * u_xlat5.xyw + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.xyw = min(max(u_xlat1.xyw, 0.0), 1.0);
#else
        u_xlat1.xyw = clamp(u_xlat1.xyw, 0.0, 1.0);
#endif
    } else {
        u_xlat35.x = 0.0;
    }
    if(u_xlatb4.x){
        u_xlat4.xzw = u_xlat7.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
        u_xlat4.xzw = min(max(u_xlat4.xzw, 0.0), 1.0);
#else
        u_xlat4.xzw = clamp(u_xlat4.xzw, 0.0, 1.0);
#endif
        u_xlat4.x = dot(u_xlat4.xzw, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat4.x = u_xlat4.x + (-_StepFactor);
        u_xlat34.x = float(1.0) / (-_Soft);
        u_xlat4.x = u_xlat34.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
        u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
        u_xlat49 = u_xlat4.x * -2.0 + 3.0;
        u_xlat4.x = u_xlat4.x * u_xlat4.x;
        u_xlat4.x = u_xlat4.x * u_xlat49;
        u_xlat5.xy = (-u_xlat3.yz) + u_xlat6.yz;
        u_xlat1.y = u_xlat4.x * u_xlat5.x + u_xlat3.y;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.y = min(max(u_xlat1.y, 0.0), 1.0);
#else
        u_xlat1.y = clamp(u_xlat1.y, 0.0, 1.0);
#endif
        u_xlat6.xyz = u_xlat9.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
        u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
        u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
        u_xlat18 = dot(u_xlat6.xyz, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat18 = u_xlat18 + (-_StepFactor);
        u_xlat18 = u_xlat34.x * u_xlat18;
#ifdef UNITY_ADRENO_ES3
        u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
        u_xlat4.x = u_xlat18 * -2.0 + 3.0;
        u_xlat18 = u_xlat18 * u_xlat18;
        u_xlat18 = u_xlat18 * u_xlat4.x;
        u_xlat1.z = u_xlat18 * u_xlat5.y + u_xlat3.z;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.z = min(max(u_xlat1.z, 0.0), 1.0);
#else
        u_xlat1.z = clamp(u_xlat1.z, 0.0, 1.0);
#endif
        u_xlat6.xyz = u_xlat10.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
        u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
        u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
        u_xlat18 = dot(u_xlat6.xyz, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat18 = u_xlat18 + (-_StepFactor);
        u_xlat18 = u_xlat34.x * u_xlat18;
#ifdef UNITY_ADRENO_ES3
        u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
        u_xlat4.x = u_xlat18 * -2.0 + 3.0;
        u_xlat18 = u_xlat18 * u_xlat18;
        u_xlat18 = u_xlat18 * u_xlat4.x;
        u_xlat48 = (-u_xlat3.x) + u_xlat3.w;
        u_xlat6.x = u_xlat18 * u_xlat48 + u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
        u_xlat3.xyw = u_xlat11.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
        u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
        u_xlat3.x = dot(u_xlat3.xyw, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat3.x = u_xlat3.x + (-_StepFactor);
        u_xlat3.x = u_xlat34.x * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
        u_xlat18 = u_xlat3.x * -2.0 + 3.0;
        u_xlat3.x = u_xlat3.x * u_xlat3.x;
        u_xlat3.x = u_xlat3.x * u_xlat18;
        u_xlat6.z = u_xlat3.x * u_xlat5.y + u_xlat3.z;
#ifdef UNITY_ADRENO_ES3
        u_xlat6.z = min(max(u_xlat6.z, 0.0), 1.0);
#else
        u_xlat6.z = clamp(u_xlat6.z, 0.0, 1.0);
#endif
        u_xlat3.xy = (-u_xlat1.xz) + u_xlat6.xz;
        u_xlat3.xz = u_xlat3.xy * vec2(0.699999988, 0.699999988);
        u_xlat3.y = 0.0;
        u_xlat3.xyz = u_xlat1.xyz + u_xlat3.xyz;
    } else {
        u_xlat1.xyz = (-u_xlat16_0.xyz) + u_xlat1.xyw;
        u_xlat3.xyz = vec3(_MainAlpha) * u_xlat1.xyz + u_xlat16_0.xyz;
    }
    u_xlat3.w = 1.0;
    u_xlat1 = (-u_xlat16_0) + u_xlat3;
    u_xlat0 = vec4(_MainAlpha) * u_xlat1 + u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_UseVignette);
#else
    u_xlatb1 = 0.0<_UseVignette;
#endif
    u_xlat16.x = log2(u_xlat16_2.x);
    u_xlat16.x = u_xlat16.x * _VignettePower;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat2 = u_xlat0 * u_xlat16.xxxx;
    u_xlat0 = (bool(u_xlatb1)) ? u_xlat2 : u_xlat0;
    if(u_xlatb4.y){
        u_xlat1.x = _TexRotator * 6.28318548;
        u_xlat3.x = cos(u_xlat1.x);
        u_xlat1.x = sin(u_xlat1.x);
        u_xlat16.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
        u_xlat4.x = (-u_xlat1.x);
        u_xlat4.y = u_xlat3.x;
        u_xlat4.z = u_xlat1.x;
        u_xlat3.x = dot(u_xlat16.xy, u_xlat4.yz);
        u_xlat3.y = dot(u_xlat16.xy, u_xlat4.xy);
        u_xlat16_1.xy = texture(_Tex, u_xlat3.xy).xw;
        u_xlat1.x = min(u_xlat16_1.x, u_xlat16_1.y);
        u_xlat1 = (-u_xlat0) + u_xlat1.xxxx;
        u_xlat0 = vec4(vec4(_TexAlpha, _TexAlpha, _TexAlpha, _TexAlpha)) * u_xlat1 + u_xlat0;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_UseLogo);
#else
    u_xlatb1 = 0.0<_UseLogo;
#endif
    if(u_xlatb1){
        u_xlat1.yz = vs_TEXCOORD0.yx * _Logo_ST.yx + _Logo_ST.wz;
        u_xlat46 = _Logo_ST.x + -1.0;
        u_xlat1.x = (-u_xlat46) + u_xlat1.z;
        u_xlat1.xy = u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
        u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
        u_xlat16_1.x = texture(_Logo, u_xlat1.xy).w;
        u_xlat16.x = u_xlat16_1.x * _LogoAlpha;
#ifdef UNITY_ADRENO_ES3
        u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
        u_xlat2 = (-u_xlat0) + u_xlat16_1.xxxx;
        u_xlat0 = u_xlat16.xxxx * u_xlat2 + u_xlat0;
    }
    SV_Target0 = u_xlat0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
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
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	float _UseBlackWhiteFlash;
uniform 	mediump vec4 _MainTex_ST;
uniform 	float _MainAlpha;
uniform 	float _UseBlackWhiteColor;
uniform 	vec4 _Color1;
uniform 	vec4 _Color2;
uniform 	float _RevertColor;
uniform 	float _UseRayLine;
uniform 	float _OptRayLine;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	float _BlurFactor;
uniform 	float _StepFactor;
uniform 	float _Soft;
uniform 	float _LineColorScale;
uniform 	float _UseVignette;
uniform 	float _VignettePower;
uniform 	float _VignetteScale;
uniform 	float _UseRedBlue;
uniform 	float _RedBlueFactor;
uniform 	float _UseTexAR;
uniform 	vec4 _Tex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
uniform 	float _UseLogo;
uniform 	vec4 _Logo_ST;
uniform 	float _LogoAlpha;
uniform 	float _UseZhenDong;
uniform 	float _zhenpin;
uniform 	float _zhenfu;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _VoronoTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Tex;
UNITY_LOCATION(3) uniform mediump sampler2D _Logo;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec4 u_xlat5;
bvec2 u_xlatb5;
vec4 u_xlat6;
vec4 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec2 u_xlat12;
vec2 u_xlat13;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
float u_xlat18;
float u_xlat21;
bool u_xlatb23;
vec2 u_xlat33;
bool u_xlatb33;
vec2 u_xlat34;
bool u_xlatb34;
vec2 u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
vec2 u_xlat42;
vec2 u_xlat43;
float u_xlat46;
float u_xlat48;
float u_xlat49;
float u_xlat50;
mediump float u_xlat16_50;
int u_xlati50;
bool u_xlatb50;
float u_xlat52;
bool u_xlatb52;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_UseBlackWhiteFlash==0.0);
#else
    u_xlatb1 = _UseBlackWhiteFlash==0.0;
#endif
    if(u_xlatb1){
        SV_Target0 = u_xlat16_0;
        return;
    }
    u_xlat16_2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.x = dot(u_xlat16_2.xy, u_xlat16_2.xy);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat1 = vs_TEXCOORD4.xyxy / vs_TEXCOORD4.wwww;
    u_xlat3.x = _centerU;
    u_xlat3.y = _centerV;
    u_xlat4 = (-u_xlat3.xyxy) + vec4(1.0, 1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(0.0<_UseZhenDong);
#else
    u_xlatb33 = 0.0<_UseZhenDong;
#endif
    u_xlat48 = _Time.y * _zhenpin;
    u_xlat5.xy = vec2(u_xlat48) * vec2(60.0, 42.0);
    u_xlat48 = cos(u_xlat5.x);
    u_xlat48 = u_xlat48 * _zhenfu;
    u_xlat6.x = u_xlat48 * 0.0500000007;
    u_xlat48 = sin(u_xlat5.y);
    u_xlat48 = u_xlat48 * _zhenfu;
    u_xlat6.y = u_xlat48 * 0.0500000007;
    u_xlat33.xy = bool(u_xlatb33) ? u_xlat6.xy : vec2(0.0, 0.0);
    u_xlat4 = u_xlat33.xyxy + u_xlat4;
    u_xlatb5.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseRayLine, _RevertColor, _UseRayLine, _UseRayLine)).xy;
    if(u_xlatb5.x){
        u_xlat35.xy = u_xlat33.xy + u_xlat3.xy;
        u_xlat6 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
        u_xlat35.xy = (-u_xlat35.xy) + vs_TEXCOORD0.xy;
        u_xlat7.x = dot(u_xlat35.xy, u_xlat35.xy);
        u_xlat7.x = sqrt(u_xlat7.x);
        u_xlat7.x = u_xlat7.x + u_xlat7.x;
        u_xlat7.xy = u_xlat6.xz * u_xlat7.xx;
        u_xlat6.x = min(abs(u_xlat35.y), abs(u_xlat35.x));
        u_xlat36 = max(abs(u_xlat35.y), abs(u_xlat35.x));
        u_xlat36 = float(1.0) / u_xlat36;
        u_xlat6.x = u_xlat36 * u_xlat6.x;
        u_xlat36 = u_xlat6.x * u_xlat6.x;
        u_xlat8.x = u_xlat36 * 0.0208350997 + -0.0851330012;
        u_xlat8.x = u_xlat36 * u_xlat8.x + 0.180141002;
        u_xlat8.x = u_xlat36 * u_xlat8.x + -0.330299497;
        u_xlat36 = u_xlat36 * u_xlat8.x + 0.999866009;
        u_xlat8.x = u_xlat36 * u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb23 = !!(abs(u_xlat35.y)<abs(u_xlat35.x));
#else
        u_xlatb23 = abs(u_xlat35.y)<abs(u_xlat35.x);
#endif
        u_xlat8.x = u_xlat8.x * -2.0 + 1.57079637;
        u_xlat8.x = u_xlatb23 ? u_xlat8.x : float(0.0);
        u_xlat6.x = u_xlat6.x * u_xlat36 + u_xlat8.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(u_xlat35.y<(-u_xlat35.y));
#else
        u_xlatb36 = u_xlat35.y<(-u_xlat35.y);
#endif
        u_xlat36 = u_xlatb36 ? -3.14159274 : float(0.0);
        u_xlat6.x = u_xlat36 + u_xlat6.x;
        u_xlat36 = min(u_xlat35.y, u_xlat35.x);
        u_xlat35.x = max(u_xlat35.y, u_xlat35.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb50 = !!(u_xlat36<(-u_xlat36));
#else
        u_xlatb50 = u_xlat36<(-u_xlat36);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb35 = !!(u_xlat35.x>=(-u_xlat35.x));
#else
        u_xlatb35 = u_xlat35.x>=(-u_xlat35.x);
#endif
        u_xlatb35 = u_xlatb35 && u_xlatb50;
        u_xlat35.x = (u_xlatb35) ? (-u_xlat6.x) : u_xlat6.x;
        u_xlat35.x = u_xlat35.x * 0.159235656;
        u_xlat7.zw = u_xlat6.yw * u_xlat35.xx;
        u_xlat16_35 = texture(_VoronoTex, u_xlat7.xz).x;
        u_xlat16_50 = texture(_VoronoTex, u_xlat7.yw).x;
        u_xlat6.x = (-u_xlat16_2.x) + 1.0;
        u_xlat21 = u_xlat6.x * u_xlat6.x;
        u_xlat6.x = u_xlat21 * u_xlat6.x;
        u_xlat35.x = u_xlat16_50 * u_xlat16_35;
        u_xlat35.x = u_xlat35.x * _LineUVScale;
        u_xlat35.x = u_xlat35.x * u_xlat6.x;
    } else {
        u_xlat35.x = 0.0;
    }
    u_xlat4 = (-u_xlat1.zwzw) + u_xlat4;
    u_xlat1 = u_xlat35.xxxx * u_xlat4 + u_xlat1;
    u_xlat4 = u_xlat33.xyxy + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat4 = (-u_xlat4) + vec4(1.0, 1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb50 = !!(_UseRedBlue==0.0);
#else
    u_xlatb50 = _UseRedBlue==0.0;
#endif
    u_xlat50 = (u_xlatb50) ? 0.0 : _RedBlueFactor;
    u_xlat6 = vec4(u_xlat50) * vec4(0.100000001, 0.100000001, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat7 = (-vec4(u_xlat50)) * vec4(0.100000001, 0.100000001, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat33.xy = (-u_xlat33.xy) + u_xlat1.zw;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat6 = u_xlat1.zwzw * u_xlat6 + u_xlat4;
    u_xlat1 = u_xlat1 * u_xlat7 + u_xlat4;
    u_xlat4.x = _BlurFactor * 0.00600000005;
    u_xlat3.xy = (-u_xlat3.xy) + u_xlat33.xy;
    u_xlat3.xy = u_xlat3.xy * u_xlat4.xx;
    u_xlatb4.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseRedBlue, _UseTexAR, _UseRedBlue, _UseRedBlue)).xy;
    u_xlat7.x = float(0.0);
    u_xlat7.y = float(0.0);
    u_xlat7.z = float(0.0);
    u_xlat8.x = float(0.0);
    u_xlat8.y = float(0.0);
    u_xlat8.z = float(0.0);
    u_xlat9.x = float(0.0);
    u_xlat9.y = float(0.0);
    u_xlat9.z = float(0.0);
    u_xlat10.x = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat10.z = float(0.0);
    u_xlat11.x = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat11.z = float(0.0);
    u_xlat34.xy = u_xlat33.xy;
    u_xlat12.xy = u_xlat6.xy;
    u_xlat42.xy = u_xlat1.xy;
    u_xlat13.xy = u_xlat6.zw;
    u_xlat43.xy = u_xlat1.zw;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<5 ; u_xlati_loop_1++)
    {
        u_xlat52 = float(u_xlati_loop_1);
        u_xlat12.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat12.xy;
        u_xlat16_14.xyz = texture(_MainTex, u_xlat12.xy).xyz;
        u_xlat8.xyz = u_xlat8.xyz + u_xlat16_14.xyz;
        if(u_xlatb4.x){
            u_xlat34.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat34.xy;
            u_xlat16_14.xyz = texture(_MainTex, u_xlat34.xy).xyz;
            u_xlat7.xyz = u_xlat7.xyz + u_xlat16_14.xyz;
            u_xlat42.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat42.xy;
            u_xlat16_14.xyz = texture(_MainTex, u_xlat42.xy).xyz;
            u_xlat9.xyz = u_xlat9.xyz + u_xlat16_14.xyz;
            u_xlat13.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat13.xy;
            u_xlat16_14.xyz = texture(_MainTex, u_xlat13.xy).xyz;
            u_xlat10.xyz = u_xlat10.xyz + u_xlat16_14.xyz;
            u_xlat43.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat43.xy;
            u_xlat16_14.xyz = texture(_MainTex, u_xlat43.xy).xyz;
            u_xlat11.xyz = u_xlat11.xyz + u_xlat16_14.xyz;
        }
    }
    u_xlat1.xyw = u_xlat8.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat3.xyz = _Color2.xyz;
    u_xlat3.w = _Color1.x;
    u_xlat6.xyz = _Color1.xyz;
    u_xlat6.w = _Color2.x;
    u_xlat3 = (u_xlatb5.y) ? u_xlat3 : u_xlat6;
    u_xlat6.yz = (u_xlatb5.y) ? _Color1.yz : _Color2.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(0.0<_UseBlackWhiteColor);
#else
    u_xlatb34 = 0.0<_UseBlackWhiteColor;
#endif
    if(u_xlatb34){
        if(u_xlatb5.x){
#ifdef UNITY_ADRENO_ES3
            u_xlatb34 = !!(0.0<_OptRayLine);
#else
            u_xlatb34 = 0.0<_OptRayLine;
#endif
            if(!u_xlatb34){
                u_xlat34.x = log2(u_xlat16_2.x);
                u_xlat34.x = u_xlat34.x * 0.100000001;
                u_xlat34.x = exp2(u_xlat34.x);
                u_xlat35.x = u_xlat34.x * _LineColorScale;
            }
        } else {
            u_xlat35.x = 0.0;
        }
        u_xlat5.xyw = u_xlat8.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
        u_xlat5.xyw = min(max(u_xlat5.xyw, 0.0), 1.0);
#else
        u_xlat5.xyw = clamp(u_xlat5.xyw, 0.0, 1.0);
#endif
        u_xlat34.x = dot(u_xlat5.xyw, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat34.x = u_xlat34.x + (-_StepFactor);
        u_xlat49 = float(1.0) / (-_Soft);
        u_xlat34.x = u_xlat49 * u_xlat34.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat34.x = min(max(u_xlat34.x, 0.0), 1.0);
#else
        u_xlat34.x = clamp(u_xlat34.x, 0.0, 1.0);
#endif
        u_xlat49 = u_xlat34.x * -2.0 + 3.0;
        u_xlat34.x = u_xlat34.x * u_xlat34.x;
        u_xlat34.x = u_xlat34.x * u_xlat49;
        u_xlat6.x = u_xlat3.w;
        u_xlat5.xyw = (-u_xlat3.xyz) + u_xlat6.xyz;
        u_xlat1.xyw = u_xlat34.xxx * u_xlat5.xyw + u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.xyw = min(max(u_xlat1.xyw, 0.0), 1.0);
#else
        u_xlat1.xyw = clamp(u_xlat1.xyw, 0.0, 1.0);
#endif
    } else {
        u_xlat35.x = 0.0;
    }
    if(u_xlatb4.x){
        u_xlat4.xzw = u_xlat7.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
        u_xlat4.xzw = min(max(u_xlat4.xzw, 0.0), 1.0);
#else
        u_xlat4.xzw = clamp(u_xlat4.xzw, 0.0, 1.0);
#endif
        u_xlat4.x = dot(u_xlat4.xzw, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat4.x = u_xlat4.x + (-_StepFactor);
        u_xlat34.x = float(1.0) / (-_Soft);
        u_xlat4.x = u_xlat34.x * u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
        u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
        u_xlat49 = u_xlat4.x * -2.0 + 3.0;
        u_xlat4.x = u_xlat4.x * u_xlat4.x;
        u_xlat4.x = u_xlat4.x * u_xlat49;
        u_xlat5.xy = (-u_xlat3.yz) + u_xlat6.yz;
        u_xlat1.y = u_xlat4.x * u_xlat5.x + u_xlat3.y;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.y = min(max(u_xlat1.y, 0.0), 1.0);
#else
        u_xlat1.y = clamp(u_xlat1.y, 0.0, 1.0);
#endif
        u_xlat6.xyz = u_xlat9.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
        u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
        u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
        u_xlat18 = dot(u_xlat6.xyz, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat18 = u_xlat18 + (-_StepFactor);
        u_xlat18 = u_xlat34.x * u_xlat18;
#ifdef UNITY_ADRENO_ES3
        u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
        u_xlat4.x = u_xlat18 * -2.0 + 3.0;
        u_xlat18 = u_xlat18 * u_xlat18;
        u_xlat18 = u_xlat18 * u_xlat4.x;
        u_xlat1.z = u_xlat18 * u_xlat5.y + u_xlat3.z;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.z = min(max(u_xlat1.z, 0.0), 1.0);
#else
        u_xlat1.z = clamp(u_xlat1.z, 0.0, 1.0);
#endif
        u_xlat6.xyz = u_xlat10.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
        u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
        u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
        u_xlat18 = dot(u_xlat6.xyz, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat18 = u_xlat18 + (-_StepFactor);
        u_xlat18 = u_xlat34.x * u_xlat18;
#ifdef UNITY_ADRENO_ES3
        u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
        u_xlat4.x = u_xlat18 * -2.0 + 3.0;
        u_xlat18 = u_xlat18 * u_xlat18;
        u_xlat18 = u_xlat18 * u_xlat4.x;
        u_xlat48 = (-u_xlat3.x) + u_xlat3.w;
        u_xlat6.x = u_xlat18 * u_xlat48 + u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
        u_xlat3.xyw = u_xlat11.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
        u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
        u_xlat3.x = dot(u_xlat3.xyw, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat3.x = u_xlat3.x + (-_StepFactor);
        u_xlat3.x = u_xlat34.x * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
        u_xlat18 = u_xlat3.x * -2.0 + 3.0;
        u_xlat3.x = u_xlat3.x * u_xlat3.x;
        u_xlat3.x = u_xlat3.x * u_xlat18;
        u_xlat6.z = u_xlat3.x * u_xlat5.y + u_xlat3.z;
#ifdef UNITY_ADRENO_ES3
        u_xlat6.z = min(max(u_xlat6.z, 0.0), 1.0);
#else
        u_xlat6.z = clamp(u_xlat6.z, 0.0, 1.0);
#endif
        u_xlat3.xy = (-u_xlat1.xz) + u_xlat6.xz;
        u_xlat3.xz = u_xlat3.xy * vec2(0.699999988, 0.699999988);
        u_xlat3.y = 0.0;
        u_xlat3.xyz = u_xlat1.xyz + u_xlat3.xyz;
    } else {
        u_xlat1.xyz = (-u_xlat16_0.xyz) + u_xlat1.xyw;
        u_xlat3.xyz = vec3(_MainAlpha) * u_xlat1.xyz + u_xlat16_0.xyz;
    }
    u_xlat3.w = 1.0;
    u_xlat1 = (-u_xlat16_0) + u_xlat3;
    u_xlat0 = vec4(_MainAlpha) * u_xlat1 + u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_UseVignette);
#else
    u_xlatb1 = 0.0<_UseVignette;
#endif
    u_xlat16.x = log2(u_xlat16_2.x);
    u_xlat16.x = u_xlat16.x * _VignettePower;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat2 = u_xlat0 * u_xlat16.xxxx;
    u_xlat0 = (bool(u_xlatb1)) ? u_xlat2 : u_xlat0;
    if(u_xlatb4.y){
        u_xlat1.x = _TexRotator * 6.28318548;
        u_xlat3.x = cos(u_xlat1.x);
        u_xlat1.x = sin(u_xlat1.x);
        u_xlat16.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
        u_xlat4.x = (-u_xlat1.x);
        u_xlat4.y = u_xlat3.x;
        u_xlat4.z = u_xlat1.x;
        u_xlat3.x = dot(u_xlat16.xy, u_xlat4.yz);
        u_xlat3.y = dot(u_xlat16.xy, u_xlat4.xy);
        u_xlat16_1.xy = texture(_Tex, u_xlat3.xy).xw;
        u_xlat1.x = min(u_xlat16_1.x, u_xlat16_1.y);
        u_xlat1 = (-u_xlat0) + u_xlat1.xxxx;
        u_xlat0 = vec4(vec4(_TexAlpha, _TexAlpha, _TexAlpha, _TexAlpha)) * u_xlat1 + u_xlat0;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_UseLogo);
#else
    u_xlatb1 = 0.0<_UseLogo;
#endif
    if(u_xlatb1){
        u_xlat1.yz = vs_TEXCOORD0.yx * _Logo_ST.yx + _Logo_ST.wz;
        u_xlat46 = _Logo_ST.x + -1.0;
        u_xlat1.x = (-u_xlat46) + u_xlat1.z;
        u_xlat1.xy = u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
        u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
        u_xlat16_1.x = texture(_Logo, u_xlat1.xy).w;
        u_xlat16.x = u_xlat16_1.x * _LogoAlpha;
#ifdef UNITY_ADRENO_ES3
        u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
        u_xlat2 = (-u_xlat0) + u_xlat16_1.xxxx;
        u_xlat0 = u_xlat16.xxxx * u_xlat2 + u_xlat0;
    }
    SV_Target0 = u_xlat0;
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
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
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
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	float _UseBlackWhiteFlash;
uniform 	mediump vec4 _MainTex_ST;
uniform 	float _MainAlpha;
uniform 	float _UseBlackWhiteColor;
uniform 	vec4 _Color1;
uniform 	vec4 _Color2;
uniform 	float _RevertColor;
uniform 	float _UseRayLine;
uniform 	float _OptRayLine;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	float _BlurFactor;
uniform 	float _StepFactor;
uniform 	float _Soft;
uniform 	float _LineColorScale;
uniform 	float _UseVignette;
uniform 	float _VignettePower;
uniform 	float _VignetteScale;
uniform 	float _UseRedBlue;
uniform 	float _RedBlueFactor;
uniform 	float _UseTexAR;
uniform 	vec4 _Tex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
uniform 	float _UseLogo;
uniform 	vec4 _Logo_ST;
uniform 	float _LogoAlpha;
uniform 	float _UseZhenDong;
uniform 	float _zhenpin;
uniform 	float _zhenfu;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _VoronoTex;
uniform lowp sampler2D _Tex;
uniform lowp sampler2D _Logo;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec2 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec4 u_xlat5;
bvec2 u_xlatb5;
vec4 u_xlat6;
vec4 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec2 u_xlat12;
vec2 u_xlat13;
lowp vec3 u_xlat10_14;
vec2 u_xlat16;
float u_xlat18;
float u_xlat21;
bool u_xlatb23;
vec2 u_xlat33;
bool u_xlatb33;
vec2 u_xlat34;
bool u_xlatb34;
vec2 u_xlat35;
lowp float u_xlat10_35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
vec2 u_xlat42;
vec2 u_xlat43;
float u_xlat46;
float u_xlat48;
float u_xlat49;
float u_xlat50;
lowp float u_xlat10_50;
int u_xlati50;
bool u_xlatb50;
float u_xlat52;
bool u_xlatb52;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16_0.xy);
    u_xlatb1 = _UseBlackWhiteFlash==0.0;
    if(u_xlatb1){
        SV_Target0 = u_xlat10_0;
        return;
    }
    u_xlat16_2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.x = dot(u_xlat16_2.xy, u_xlat16_2.xy);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat1 = vs_TEXCOORD4.xyxy / vs_TEXCOORD4.wwww;
    u_xlat3.x = _centerU;
    u_xlat3.y = _centerV;
    u_xlat4 = (-u_xlat3.xyxy) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlatb33 = 0.0<_UseZhenDong;
    u_xlat48 = _Time.y * _zhenpin;
    u_xlat5.xy = vec2(u_xlat48) * vec2(60.0, 42.0);
    u_xlat48 = cos(u_xlat5.x);
    u_xlat48 = u_xlat48 * _zhenfu;
    u_xlat6.x = u_xlat48 * 0.0500000007;
    u_xlat48 = sin(u_xlat5.y);
    u_xlat48 = u_xlat48 * _zhenfu;
    u_xlat6.y = u_xlat48 * 0.0500000007;
    u_xlat33.xy = bool(u_xlatb33) ? u_xlat6.xy : vec2(0.0, 0.0);
    u_xlat4 = u_xlat33.xyxy + u_xlat4;
    u_xlatb5.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseRayLine, _RevertColor, _UseRayLine, _UseRayLine)).xy;
    if(u_xlatb5.x){
        u_xlat35.xy = u_xlat33.xy + u_xlat3.xy;
        u_xlat6 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
        u_xlat35.xy = (-u_xlat35.xy) + vs_TEXCOORD0.xy;
        u_xlat7.x = dot(u_xlat35.xy, u_xlat35.xy);
        u_xlat7.x = sqrt(u_xlat7.x);
        u_xlat7.x = u_xlat7.x + u_xlat7.x;
        u_xlat7.xy = u_xlat6.xz * u_xlat7.xx;
        u_xlat6.x = min(abs(u_xlat35.y), abs(u_xlat35.x));
        u_xlat36 = max(abs(u_xlat35.y), abs(u_xlat35.x));
        u_xlat36 = float(1.0) / u_xlat36;
        u_xlat6.x = u_xlat36 * u_xlat6.x;
        u_xlat36 = u_xlat6.x * u_xlat6.x;
        u_xlat8.x = u_xlat36 * 0.0208350997 + -0.0851330012;
        u_xlat8.x = u_xlat36 * u_xlat8.x + 0.180141002;
        u_xlat8.x = u_xlat36 * u_xlat8.x + -0.330299497;
        u_xlat36 = u_xlat36 * u_xlat8.x + 0.999866009;
        u_xlat8.x = u_xlat36 * u_xlat6.x;
        u_xlatb23 = abs(u_xlat35.y)<abs(u_xlat35.x);
        u_xlat8.x = u_xlat8.x * -2.0 + 1.57079637;
        u_xlat8.x = u_xlatb23 ? u_xlat8.x : float(0.0);
        u_xlat6.x = u_xlat6.x * u_xlat36 + u_xlat8.x;
        u_xlatb36 = u_xlat35.y<(-u_xlat35.y);
        u_xlat36 = u_xlatb36 ? -3.14159274 : float(0.0);
        u_xlat6.x = u_xlat36 + u_xlat6.x;
        u_xlat36 = min(u_xlat35.y, u_xlat35.x);
        u_xlat35.x = max(u_xlat35.y, u_xlat35.x);
        u_xlatb50 = u_xlat36<(-u_xlat36);
        u_xlatb35 = u_xlat35.x>=(-u_xlat35.x);
        u_xlatb35 = u_xlatb35 && u_xlatb50;
        u_xlat35.x = (u_xlatb35) ? (-u_xlat6.x) : u_xlat6.x;
        u_xlat35.x = u_xlat35.x * 0.159235656;
        u_xlat7.zw = u_xlat6.yw * u_xlat35.xx;
        u_xlat10_35 = texture2D(_VoronoTex, u_xlat7.xz).x;
        u_xlat10_50 = texture2D(_VoronoTex, u_xlat7.yw).x;
        u_xlat6.x = (-u_xlat16_2.x) + 1.0;
        u_xlat21 = u_xlat6.x * u_xlat6.x;
        u_xlat6.x = u_xlat21 * u_xlat6.x;
        u_xlat35.x = u_xlat10_50 * u_xlat10_35;
        u_xlat35.x = u_xlat35.x * _LineUVScale;
        u_xlat35.x = u_xlat35.x * u_xlat6.x;
    } else {
        u_xlat35.x = 0.0;
    }
    u_xlat4 = (-u_xlat1.zwzw) + u_xlat4;
    u_xlat1 = u_xlat35.xxxx * u_xlat4 + u_xlat1;
    u_xlat4 = u_xlat33.xyxy + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat4 = (-u_xlat4) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlatb50 = _UseRedBlue==0.0;
    u_xlat50 = (u_xlatb50) ? 0.0 : _RedBlueFactor;
    u_xlat6 = vec4(u_xlat50) * vec4(0.100000001, 0.100000001, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat7 = (-vec4(u_xlat50)) * vec4(0.100000001, 0.100000001, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat33.xy = (-u_xlat33.xy) + u_xlat1.zw;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat6 = u_xlat1.zwzw * u_xlat6 + u_xlat4;
    u_xlat1 = u_xlat1 * u_xlat7 + u_xlat4;
    u_xlat4.x = _BlurFactor * 0.00600000005;
    u_xlat3.xy = (-u_xlat3.xy) + u_xlat33.xy;
    u_xlat3.xy = u_xlat3.xy * u_xlat4.xx;
    u_xlatb4.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseRedBlue, _UseTexAR, _UseRedBlue, _UseRedBlue)).xy;
    u_xlat7.x = float(0.0);
    u_xlat7.y = float(0.0);
    u_xlat7.z = float(0.0);
    u_xlat8.x = float(0.0);
    u_xlat8.y = float(0.0);
    u_xlat8.z = float(0.0);
    u_xlat9.x = float(0.0);
    u_xlat9.y = float(0.0);
    u_xlat9.z = float(0.0);
    u_xlat10.x = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat10.z = float(0.0);
    u_xlat11.x = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat11.z = float(0.0);
    u_xlat34.xy = u_xlat33.xy;
    u_xlat12.xy = u_xlat6.xy;
    u_xlat42.xy = u_xlat1.xy;
    u_xlat13.xy = u_xlat6.zw;
    u_xlat43.xy = u_xlat1.zw;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<5 ; u_xlati_loop_1++)
    {
        u_xlat52 = float(u_xlati_loop_1);
        u_xlat12.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat12.xy;
        u_xlat10_14.xyz = texture2D(_MainTex, u_xlat12.xy).xyz;
        u_xlat8.xyz = u_xlat8.xyz + u_xlat10_14.xyz;
        if(u_xlatb4.x){
            u_xlat34.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat34.xy;
            u_xlat10_14.xyz = texture2D(_MainTex, u_xlat34.xy).xyz;
            u_xlat7.xyz = u_xlat7.xyz + u_xlat10_14.xyz;
            u_xlat42.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat42.xy;
            u_xlat10_14.xyz = texture2D(_MainTex, u_xlat42.xy).xyz;
            u_xlat9.xyz = u_xlat9.xyz + u_xlat10_14.xyz;
            u_xlat13.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat13.xy;
            u_xlat10_14.xyz = texture2D(_MainTex, u_xlat13.xy).xyz;
            u_xlat10.xyz = u_xlat10.xyz + u_xlat10_14.xyz;
            u_xlat43.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat43.xy;
            u_xlat10_14.xyz = texture2D(_MainTex, u_xlat43.xy).xyz;
            u_xlat11.xyz = u_xlat11.xyz + u_xlat10_14.xyz;
        }
    }
    u_xlat1.xyw = u_xlat8.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat3.xyz = _Color2.xyz;
    u_xlat3.w = _Color1.x;
    u_xlat6.xyz = _Color1.xyz;
    u_xlat6.w = _Color2.x;
    u_xlat3 = (u_xlatb5.y) ? u_xlat3 : u_xlat6;
    u_xlat6.yz = (u_xlatb5.y) ? _Color1.yz : _Color2.yz;
    u_xlatb34 = 0.0<_UseBlackWhiteColor;
    if(u_xlatb34){
        if(u_xlatb5.x){
            u_xlatb34 = 0.0<_OptRayLine;
            if(!u_xlatb34){
                u_xlat34.x = log2(u_xlat16_2.x);
                u_xlat34.x = u_xlat34.x * 0.100000001;
                u_xlat34.x = exp2(u_xlat34.x);
                u_xlat35.x = u_xlat34.x * _LineColorScale;
            }
        } else {
            u_xlat35.x = 0.0;
        }
        u_xlat5.xyw = u_xlat8.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
        u_xlat5.xyw = clamp(u_xlat5.xyw, 0.0, 1.0);
        u_xlat34.x = dot(u_xlat5.xyw, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat34.x = u_xlat34.x + (-_StepFactor);
        u_xlat49 = float(1.0) / (-_Soft);
        u_xlat34.x = u_xlat49 * u_xlat34.x;
        u_xlat34.x = clamp(u_xlat34.x, 0.0, 1.0);
        u_xlat49 = u_xlat34.x * -2.0 + 3.0;
        u_xlat34.x = u_xlat34.x * u_xlat34.x;
        u_xlat34.x = u_xlat34.x * u_xlat49;
        u_xlat6.x = u_xlat3.w;
        u_xlat5.xyw = (-u_xlat3.xyz) + u_xlat6.xyz;
        u_xlat1.xyw = u_xlat34.xxx * u_xlat5.xyw + u_xlat3.xyz;
        u_xlat1.xyw = clamp(u_xlat1.xyw, 0.0, 1.0);
    } else {
        u_xlat35.x = 0.0;
    }
    if(u_xlatb4.x){
        u_xlat4.xzw = u_xlat7.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
        u_xlat4.xzw = clamp(u_xlat4.xzw, 0.0, 1.0);
        u_xlat4.x = dot(u_xlat4.xzw, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat4.x = u_xlat4.x + (-_StepFactor);
        u_xlat34.x = float(1.0) / (-_Soft);
        u_xlat4.x = u_xlat34.x * u_xlat4.x;
        u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
        u_xlat49 = u_xlat4.x * -2.0 + 3.0;
        u_xlat4.x = u_xlat4.x * u_xlat4.x;
        u_xlat4.x = u_xlat4.x * u_xlat49;
        u_xlat5.xy = (-u_xlat3.yz) + u_xlat6.yz;
        u_xlat1.y = u_xlat4.x * u_xlat5.x + u_xlat3.y;
        u_xlat1.y = clamp(u_xlat1.y, 0.0, 1.0);
        u_xlat6.xyz = u_xlat9.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
        u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
        u_xlat18 = dot(u_xlat6.xyz, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat18 = u_xlat18 + (-_StepFactor);
        u_xlat18 = u_xlat34.x * u_xlat18;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlat4.x = u_xlat18 * -2.0 + 3.0;
        u_xlat18 = u_xlat18 * u_xlat18;
        u_xlat18 = u_xlat18 * u_xlat4.x;
        u_xlat1.z = u_xlat18 * u_xlat5.y + u_xlat3.z;
        u_xlat1.z = clamp(u_xlat1.z, 0.0, 1.0);
        u_xlat6.xyz = u_xlat10.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
        u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
        u_xlat18 = dot(u_xlat6.xyz, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat18 = u_xlat18 + (-_StepFactor);
        u_xlat18 = u_xlat34.x * u_xlat18;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlat4.x = u_xlat18 * -2.0 + 3.0;
        u_xlat18 = u_xlat18 * u_xlat18;
        u_xlat18 = u_xlat18 * u_xlat4.x;
        u_xlat48 = (-u_xlat3.x) + u_xlat3.w;
        u_xlat6.x = u_xlat18 * u_xlat48 + u_xlat3.x;
        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
        u_xlat3.xyw = u_xlat11.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
        u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
        u_xlat3.x = dot(u_xlat3.xyw, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat3.x = u_xlat3.x + (-_StepFactor);
        u_xlat3.x = u_xlat34.x * u_xlat3.x;
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
        u_xlat18 = u_xlat3.x * -2.0 + 3.0;
        u_xlat3.x = u_xlat3.x * u_xlat3.x;
        u_xlat3.x = u_xlat3.x * u_xlat18;
        u_xlat6.z = u_xlat3.x * u_xlat5.y + u_xlat3.z;
        u_xlat6.z = clamp(u_xlat6.z, 0.0, 1.0);
        u_xlat3.xy = (-u_xlat1.xz) + u_xlat6.xz;
        u_xlat3.xz = u_xlat3.xy * vec2(0.699999988, 0.699999988);
        u_xlat3.y = 0.0;
        u_xlat3.xyz = u_xlat1.xyz + u_xlat3.xyz;
    } else {
        u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat1.xyw;
        u_xlat3.xyz = vec3(_MainAlpha) * u_xlat1.xyz + u_xlat10_0.xyz;
    }
    u_xlat3.w = 1.0;
    u_xlat1 = (-u_xlat10_0) + u_xlat3;
    u_xlat0 = vec4(_MainAlpha) * u_xlat1 + u_xlat10_0;
    u_xlatb1 = 0.0<_UseVignette;
    u_xlat16.x = log2(u_xlat16_2.x);
    u_xlat16.x = u_xlat16.x * _VignettePower;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * _VignetteScale;
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat2 = u_xlat0 * u_xlat16.xxxx;
    u_xlat0 = (bool(u_xlatb1)) ? u_xlat2 : u_xlat0;
    if(u_xlatb4.y){
        u_xlat1.x = _TexRotator * 6.28318548;
        u_xlat3.x = cos(u_xlat1.x);
        u_xlat1.x = sin(u_xlat1.x);
        u_xlat16.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
        u_xlat4.x = (-u_xlat1.x);
        u_xlat4.y = u_xlat3.x;
        u_xlat4.z = u_xlat1.x;
        u_xlat3.x = dot(u_xlat16.xy, u_xlat4.yz);
        u_xlat3.y = dot(u_xlat16.xy, u_xlat4.xy);
        u_xlat10_1.xy = texture2D(_Tex, u_xlat3.xy).xw;
        u_xlat1.x = min(u_xlat10_1.x, u_xlat10_1.y);
        u_xlat1 = (-u_xlat0) + u_xlat1.xxxx;
        u_xlat0 = vec4(vec4(_TexAlpha, _TexAlpha, _TexAlpha, _TexAlpha)) * u_xlat1 + u_xlat0;
    }
    u_xlatb1 = 0.0<_UseLogo;
    if(u_xlatb1){
        u_xlat1.yz = vs_TEXCOORD0.yx * _Logo_ST.yx + _Logo_ST.wz;
        u_xlat46 = _Logo_ST.x + -1.0;
        u_xlat1.x = (-u_xlat46) + u_xlat1.z;
        u_xlat1.xy = u_xlat1.xy;
        u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
        u_xlat10_1.x = texture2D(_Logo, u_xlat1.xy).w;
        u_xlat16.x = u_xlat10_1.x * _LogoAlpha;
        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
        u_xlat2 = (-u_xlat0) + u_xlat10_1.xxxx;
        u_xlat0 = u_xlat16.xxxx * u_xlat2 + u_xlat0;
    }
    SV_Target0 = u_xlat0;
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
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
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
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	float _UseBlackWhiteFlash;
uniform 	mediump vec4 _MainTex_ST;
uniform 	float _MainAlpha;
uniform 	float _UseBlackWhiteColor;
uniform 	vec4 _Color1;
uniform 	vec4 _Color2;
uniform 	float _RevertColor;
uniform 	float _UseRayLine;
uniform 	float _OptRayLine;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	float _BlurFactor;
uniform 	float _StepFactor;
uniform 	float _Soft;
uniform 	float _LineColorScale;
uniform 	float _UseVignette;
uniform 	float _VignettePower;
uniform 	float _VignetteScale;
uniform 	float _UseRedBlue;
uniform 	float _RedBlueFactor;
uniform 	float _UseTexAR;
uniform 	vec4 _Tex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
uniform 	float _UseLogo;
uniform 	vec4 _Logo_ST;
uniform 	float _LogoAlpha;
uniform 	float _UseZhenDong;
uniform 	float _zhenpin;
uniform 	float _zhenfu;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _VoronoTex;
uniform lowp sampler2D _Tex;
uniform lowp sampler2D _Logo;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec2 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec2 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec4 u_xlat5;
bvec2 u_xlatb5;
vec4 u_xlat6;
vec4 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec2 u_xlat12;
vec2 u_xlat13;
lowp vec3 u_xlat10_14;
vec2 u_xlat16;
float u_xlat18;
float u_xlat21;
bool u_xlatb23;
vec2 u_xlat33;
bool u_xlatb33;
vec2 u_xlat34;
bool u_xlatb34;
vec2 u_xlat35;
lowp float u_xlat10_35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
vec2 u_xlat42;
vec2 u_xlat43;
float u_xlat46;
float u_xlat48;
float u_xlat49;
float u_xlat50;
lowp float u_xlat10_50;
int u_xlati50;
bool u_xlatb50;
float u_xlat52;
bool u_xlatb52;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat16_0.xy);
    u_xlatb1 = _UseBlackWhiteFlash==0.0;
    if(u_xlatb1){
        SV_Target0 = u_xlat10_0;
        return;
    }
    u_xlat16_2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.x = dot(u_xlat16_2.xy, u_xlat16_2.xy);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat1 = vs_TEXCOORD4.xyxy / vs_TEXCOORD4.wwww;
    u_xlat3.x = _centerU;
    u_xlat3.y = _centerV;
    u_xlat4 = (-u_xlat3.xyxy) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlatb33 = 0.0<_UseZhenDong;
    u_xlat48 = _Time.y * _zhenpin;
    u_xlat5.xy = vec2(u_xlat48) * vec2(60.0, 42.0);
    u_xlat48 = cos(u_xlat5.x);
    u_xlat48 = u_xlat48 * _zhenfu;
    u_xlat6.x = u_xlat48 * 0.0500000007;
    u_xlat48 = sin(u_xlat5.y);
    u_xlat48 = u_xlat48 * _zhenfu;
    u_xlat6.y = u_xlat48 * 0.0500000007;
    u_xlat33.xy = bool(u_xlatb33) ? u_xlat6.xy : vec2(0.0, 0.0);
    u_xlat4 = u_xlat33.xyxy + u_xlat4;
    u_xlatb5.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseRayLine, _RevertColor, _UseRayLine, _UseRayLine)).xy;
    if(u_xlatb5.x){
        u_xlat35.xy = u_xlat33.xy + u_xlat3.xy;
        u_xlat6 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
        u_xlat35.xy = (-u_xlat35.xy) + vs_TEXCOORD0.xy;
        u_xlat7.x = dot(u_xlat35.xy, u_xlat35.xy);
        u_xlat7.x = sqrt(u_xlat7.x);
        u_xlat7.x = u_xlat7.x + u_xlat7.x;
        u_xlat7.xy = u_xlat6.xz * u_xlat7.xx;
        u_xlat6.x = min(abs(u_xlat35.y), abs(u_xlat35.x));
        u_xlat36 = max(abs(u_xlat35.y), abs(u_xlat35.x));
        u_xlat36 = float(1.0) / u_xlat36;
        u_xlat6.x = u_xlat36 * u_xlat6.x;
        u_xlat36 = u_xlat6.x * u_xlat6.x;
        u_xlat8.x = u_xlat36 * 0.0208350997 + -0.0851330012;
        u_xlat8.x = u_xlat36 * u_xlat8.x + 0.180141002;
        u_xlat8.x = u_xlat36 * u_xlat8.x + -0.330299497;
        u_xlat36 = u_xlat36 * u_xlat8.x + 0.999866009;
        u_xlat8.x = u_xlat36 * u_xlat6.x;
        u_xlatb23 = abs(u_xlat35.y)<abs(u_xlat35.x);
        u_xlat8.x = u_xlat8.x * -2.0 + 1.57079637;
        u_xlat8.x = u_xlatb23 ? u_xlat8.x : float(0.0);
        u_xlat6.x = u_xlat6.x * u_xlat36 + u_xlat8.x;
        u_xlatb36 = u_xlat35.y<(-u_xlat35.y);
        u_xlat36 = u_xlatb36 ? -3.14159274 : float(0.0);
        u_xlat6.x = u_xlat36 + u_xlat6.x;
        u_xlat36 = min(u_xlat35.y, u_xlat35.x);
        u_xlat35.x = max(u_xlat35.y, u_xlat35.x);
        u_xlatb50 = u_xlat36<(-u_xlat36);
        u_xlatb35 = u_xlat35.x>=(-u_xlat35.x);
        u_xlatb35 = u_xlatb35 && u_xlatb50;
        u_xlat35.x = (u_xlatb35) ? (-u_xlat6.x) : u_xlat6.x;
        u_xlat35.x = u_xlat35.x * 0.159235656;
        u_xlat7.zw = u_xlat6.yw * u_xlat35.xx;
        u_xlat10_35 = texture2D(_VoronoTex, u_xlat7.xz).x;
        u_xlat10_50 = texture2D(_VoronoTex, u_xlat7.yw).x;
        u_xlat6.x = (-u_xlat16_2.x) + 1.0;
        u_xlat21 = u_xlat6.x * u_xlat6.x;
        u_xlat6.x = u_xlat21 * u_xlat6.x;
        u_xlat35.x = u_xlat10_50 * u_xlat10_35;
        u_xlat35.x = u_xlat35.x * _LineUVScale;
        u_xlat35.x = u_xlat35.x * u_xlat6.x;
    } else {
        u_xlat35.x = 0.0;
    }
    u_xlat4 = (-u_xlat1.zwzw) + u_xlat4;
    u_xlat1 = u_xlat35.xxxx * u_xlat4 + u_xlat1;
    u_xlat4 = u_xlat33.xyxy + vec4(0.5, 0.5, 0.5, 0.5);
    u_xlat4 = (-u_xlat4) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlatb50 = _UseRedBlue==0.0;
    u_xlat50 = (u_xlatb50) ? 0.0 : _RedBlueFactor;
    u_xlat6 = vec4(u_xlat50) * vec4(0.100000001, 0.100000001, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat7 = (-vec4(u_xlat50)) * vec4(0.100000001, 0.100000001, 0.0500000007, 0.0500000007) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat33.xy = (-u_xlat33.xy) + u_xlat1.zw;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat6 = u_xlat1.zwzw * u_xlat6 + u_xlat4;
    u_xlat1 = u_xlat1 * u_xlat7 + u_xlat4;
    u_xlat4.x = _BlurFactor * 0.00600000005;
    u_xlat3.xy = (-u_xlat3.xy) + u_xlat33.xy;
    u_xlat3.xy = u_xlat3.xy * u_xlat4.xx;
    u_xlatb4.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseRedBlue, _UseTexAR, _UseRedBlue, _UseRedBlue)).xy;
    u_xlat7.x = float(0.0);
    u_xlat7.y = float(0.0);
    u_xlat7.z = float(0.0);
    u_xlat8.x = float(0.0);
    u_xlat8.y = float(0.0);
    u_xlat8.z = float(0.0);
    u_xlat9.x = float(0.0);
    u_xlat9.y = float(0.0);
    u_xlat9.z = float(0.0);
    u_xlat10.x = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat10.z = float(0.0);
    u_xlat11.x = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat11.z = float(0.0);
    u_xlat34.xy = u_xlat33.xy;
    u_xlat12.xy = u_xlat6.xy;
    u_xlat42.xy = u_xlat1.xy;
    u_xlat13.xy = u_xlat6.zw;
    u_xlat43.xy = u_xlat1.zw;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<5 ; u_xlati_loop_1++)
    {
        u_xlat52 = float(u_xlati_loop_1);
        u_xlat12.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat12.xy;
        u_xlat10_14.xyz = texture2D(_MainTex, u_xlat12.xy).xyz;
        u_xlat8.xyz = u_xlat8.xyz + u_xlat10_14.xyz;
        if(u_xlatb4.x){
            u_xlat34.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat34.xy;
            u_xlat10_14.xyz = texture2D(_MainTex, u_xlat34.xy).xyz;
            u_xlat7.xyz = u_xlat7.xyz + u_xlat10_14.xyz;
            u_xlat42.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat42.xy;
            u_xlat10_14.xyz = texture2D(_MainTex, u_xlat42.xy).xyz;
            u_xlat9.xyz = u_xlat9.xyz + u_xlat10_14.xyz;
            u_xlat13.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat13.xy;
            u_xlat10_14.xyz = texture2D(_MainTex, u_xlat13.xy).xyz;
            u_xlat10.xyz = u_xlat10.xyz + u_xlat10_14.xyz;
            u_xlat43.xy = (-u_xlat3.xy) * vec2(u_xlat52) + u_xlat43.xy;
            u_xlat10_14.xyz = texture2D(_MainTex, u_xlat43.xy).xyz;
            u_xlat11.xyz = u_xlat11.xyz + u_xlat10_14.xyz;
        }
    }
    u_xlat1.xyw = u_xlat8.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat3.xyz = _Color2.xyz;
    u_xlat3.w = _Color1.x;
    u_xlat6.xyz = _Color1.xyz;
    u_xlat6.w = _Color2.x;
    u_xlat3 = (u_xlatb5.y) ? u_xlat3 : u_xlat6;
    u_xlat6.yz = (u_xlatb5.y) ? _Color1.yz : _Color2.yz;
    u_xlatb34 = 0.0<_UseBlackWhiteColor;
    if(u_xlatb34){
        if(u_xlatb5.x){
            u_xlatb34 = 0.0<_OptRayLine;
            if(!u_xlatb34){
                u_xlat34.x = log2(u_xlat16_2.x);
                u_xlat34.x = u_xlat34.x * 0.100000001;
                u_xlat34.x = exp2(u_xlat34.x);
                u_xlat35.x = u_xlat34.x * _LineColorScale;
            }
        } else {
            u_xlat35.x = 0.0;
        }
        u_xlat5.xyw = u_xlat8.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
        u_xlat5.xyw = clamp(u_xlat5.xyw, 0.0, 1.0);
        u_xlat34.x = dot(u_xlat5.xyw, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat34.x = u_xlat34.x + (-_StepFactor);
        u_xlat49 = float(1.0) / (-_Soft);
        u_xlat34.x = u_xlat49 * u_xlat34.x;
        u_xlat34.x = clamp(u_xlat34.x, 0.0, 1.0);
        u_xlat49 = u_xlat34.x * -2.0 + 3.0;
        u_xlat34.x = u_xlat34.x * u_xlat34.x;
        u_xlat34.x = u_xlat34.x * u_xlat49;
        u_xlat6.x = u_xlat3.w;
        u_xlat5.xyw = (-u_xlat3.xyz) + u_xlat6.xyz;
        u_xlat1.xyw = u_xlat34.xxx * u_xlat5.xyw + u_xlat3.xyz;
        u_xlat1.xyw = clamp(u_xlat1.xyw, 0.0, 1.0);
    } else {
        u_xlat35.x = 0.0;
    }
    if(u_xlatb4.x){
        u_xlat4.xzw = u_xlat7.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
        u_xlat4.xzw = clamp(u_xlat4.xzw, 0.0, 1.0);
        u_xlat4.x = dot(u_xlat4.xzw, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat4.x = u_xlat4.x + (-_StepFactor);
        u_xlat34.x = float(1.0) / (-_Soft);
        u_xlat4.x = u_xlat34.x * u_xlat4.x;
        u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
        u_xlat49 = u_xlat4.x * -2.0 + 3.0;
        u_xlat4.x = u_xlat4.x * u_xlat4.x;
        u_xlat4.x = u_xlat4.x * u_xlat49;
        u_xlat5.xy = (-u_xlat3.yz) + u_xlat6.yz;
        u_xlat1.y = u_xlat4.x * u_xlat5.x + u_xlat3.y;
        u_xlat1.y = clamp(u_xlat1.y, 0.0, 1.0);
        u_xlat6.xyz = u_xlat9.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
        u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
        u_xlat18 = dot(u_xlat6.xyz, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat18 = u_xlat18 + (-_StepFactor);
        u_xlat18 = u_xlat34.x * u_xlat18;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlat4.x = u_xlat18 * -2.0 + 3.0;
        u_xlat18 = u_xlat18 * u_xlat18;
        u_xlat18 = u_xlat18 * u_xlat4.x;
        u_xlat1.z = u_xlat18 * u_xlat5.y + u_xlat3.z;
        u_xlat1.z = clamp(u_xlat1.z, 0.0, 1.0);
        u_xlat6.xyz = u_xlat10.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
        u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
        u_xlat18 = dot(u_xlat6.xyz, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat18 = u_xlat18 + (-_StepFactor);
        u_xlat18 = u_xlat34.x * u_xlat18;
        u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
        u_xlat4.x = u_xlat18 * -2.0 + 3.0;
        u_xlat18 = u_xlat18 * u_xlat18;
        u_xlat18 = u_xlat18 * u_xlat4.x;
        u_xlat48 = (-u_xlat3.x) + u_xlat3.w;
        u_xlat6.x = u_xlat18 * u_xlat48 + u_xlat3.x;
        u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
        u_xlat3.xyw = u_xlat11.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat35.xxx;
        u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
        u_xlat3.x = dot(u_xlat3.xyw, vec3(0.298999995, 0.587000012, 0.114));
        u_xlat3.x = u_xlat3.x + (-_StepFactor);
        u_xlat3.x = u_xlat34.x * u_xlat3.x;
        u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
        u_xlat18 = u_xlat3.x * -2.0 + 3.0;
        u_xlat3.x = u_xlat3.x * u_xlat3.x;
        u_xlat3.x = u_xlat3.x * u_xlat18;
        u_xlat6.z = u_xlat3.x * u_xlat5.y + u_xlat3.z;
        u_xlat6.z = clamp(u_xlat6.z, 0.0, 1.0);
        u_xlat3.xy = (-u_xlat1.xz) + u_xlat6.xz;
        u_xlat3.xz = u_xlat3.xy * vec2(0.699999988, 0.699999988);
        u_xlat3.y = 0.0;
        u_xlat3.xyz = u_xlat1.xyz + u_xlat3.xyz;
    } else {
        u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat1.xyw;
        u_xlat3.xyz = vec3(_MainAlpha) * u_xlat1.xyz + u_xlat10_0.xyz;
    }
    u_xlat3.w = 1.0;
    u_xlat1 = (-u_xlat10_0) + u_xlat3;
    u_xlat0 = vec4(_MainAlpha) * u_xlat1 + u_xlat10_0;
    u_xlatb1 = 0.0<_UseVignette;
    u_xlat16.x = log2(u_xlat16_2.x);
    u_xlat16.x = u_xlat16.x * _VignettePower;
    u_xlat16.x = exp2(u_xlat16.x);
    u_xlat16.x = u_xlat16.x * _VignetteScale;
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
    u_xlat16.x = (-u_xlat16.x) + 1.0;
    u_xlat2 = u_xlat0 * u_xlat16.xxxx;
    u_xlat0 = (bool(u_xlatb1)) ? u_xlat2 : u_xlat0;
    if(u_xlatb4.y){
        u_xlat1.x = _TexRotator * 6.28318548;
        u_xlat3.x = cos(u_xlat1.x);
        u_xlat1.x = sin(u_xlat1.x);
        u_xlat16.xy = vs_TEXCOORD0.xy * _Tex_ST.xy + _Tex_ST.zw;
        u_xlat4.x = (-u_xlat1.x);
        u_xlat4.y = u_xlat3.x;
        u_xlat4.z = u_xlat1.x;
        u_xlat3.x = dot(u_xlat16.xy, u_xlat4.yz);
        u_xlat3.y = dot(u_xlat16.xy, u_xlat4.xy);
        u_xlat10_1.xy = texture2D(_Tex, u_xlat3.xy).xw;
        u_xlat1.x = min(u_xlat10_1.x, u_xlat10_1.y);
        u_xlat1 = (-u_xlat0) + u_xlat1.xxxx;
        u_xlat0 = vec4(vec4(_TexAlpha, _TexAlpha, _TexAlpha, _TexAlpha)) * u_xlat1 + u_xlat0;
    }
    u_xlatb1 = 0.0<_UseLogo;
    if(u_xlatb1){
        u_xlat1.yz = vs_TEXCOORD0.yx * _Logo_ST.yx + _Logo_ST.wz;
        u_xlat46 = _Logo_ST.x + -1.0;
        u_xlat1.x = (-u_xlat46) + u_xlat1.z;
        u_xlat1.xy = u_xlat1.xy;
        u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
        u_xlat10_1.x = texture2D(_Logo, u_xlat1.xy).w;
        u_xlat16.x = u_xlat10_1.x * _LogoAlpha;
        u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
        u_xlat2 = (-u_xlat0) + u_xlat10_1.xxxx;
        u_xlat0 = u_xlat16.xxxx * u_xlat2 + u_xlat0;
    }
    SV_Target0 = u_xlat0;
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