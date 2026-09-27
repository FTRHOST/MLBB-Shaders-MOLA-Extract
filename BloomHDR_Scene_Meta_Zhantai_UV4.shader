//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "BloomHDR/Scene/Meta_Zhantai_UV4" {
Properties {

_Usage ("仅能用于25年上半年SPD新皮肤", Float) = 1.0

_Diff ("Diff", 2D) = "white" { }

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

[Toggle(_FOG_ON)] _FOG_ON ("雾开关", Float) = 0.0

[Enum(Off,0,ON,1)] _CameraON ("CameraON", Float) = 0.0

_FogColor ("FogColor", Color) = (1,1,1,1)

_FogHigh ("FogHigh", Float) = 0.0

_FogHightStart ("FogHightStart", Float) = 0.0

_FogHightEnd ("FogHightEnd", Float) = 0.0

_FogLinearStart ("FogLinearStart", Float) = 0.0

_FogLinearEnd ("FogLinearEnd", Float) = 0.0

_FogGradient ("FogGradient", 2D) = "white" { }

_FogPosition ("FogPosition", Vector) = (0,0,0,0)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "ForwardBase"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 ZWrite Off
  GpuProgramID 31158
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD5.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Light;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
mediump float u_xlat16_23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb21 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb21){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat21 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(u_xlat21>=1.0);
#else
        u_xlatb15 = u_xlat21>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(0.0>=u_xlat21);
#else
        u_xlatb22 = 0.0>=u_xlat21;
#endif
        u_xlatb15 = u_xlatb22 || u_xlatb15;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb15 = u_xlatb2.y || u_xlatb15;
        u_xlatb15 = u_xlatb2.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(0.0<_UsePCF);
#else
            u_xlatb22 = 0.0<_UsePCF;
#endif
            if(u_xlatb22){
                u_xlat22 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat9.x = u_xlat22;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat11.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_23 = textureLod(_CustomShadowTex, u_xlat11.xy, 0.0).x;
                        u_xlat23 = (-u_xlat16_23) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb23 = !!(u_xlat21<u_xlat23);
#else
                        u_xlatb23 = u_xlat21<u_xlat23;
#endif
                        u_xlat23 = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat9.x = u_xlat23 + u_xlat9.x;
                    }
                    u_xlat22 = u_xlat9.x;
                }
                u_xlat15 = u_xlat22 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb21 = !!(u_xlat21<u_xlat1.x);
#else
                u_xlatb21 = u_xlat21<u_xlat1.x;
#endif
                u_xlat15 = (u_xlatb21) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat15 = 1.0;
    }
    u_xlat21 = u_xlat15 + -1.0;
    u_xlat21 = _ReceiveShadowsStrength * u_xlat21 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_4 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat16_5.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat9.xyz);
    u_xlat16_5.xyz = u_xlat9.xyz * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = max(u_xlat16_3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb0 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD5.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Light;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
mediump float u_xlat16_23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb21 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb21){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat21 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(u_xlat21>=1.0);
#else
        u_xlatb15 = u_xlat21>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(0.0>=u_xlat21);
#else
        u_xlatb22 = 0.0>=u_xlat21;
#endif
        u_xlatb15 = u_xlatb22 || u_xlatb15;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb15 = u_xlatb2.y || u_xlatb15;
        u_xlatb15 = u_xlatb2.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(0.0<_UsePCF);
#else
            u_xlatb22 = 0.0<_UsePCF;
#endif
            if(u_xlatb22){
                u_xlat22 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat9.x = u_xlat22;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat11.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_23 = textureLod(_CustomShadowTex, u_xlat11.xy, 0.0).x;
                        u_xlat23 = (-u_xlat16_23) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb23 = !!(u_xlat21<u_xlat23);
#else
                        u_xlatb23 = u_xlat21<u_xlat23;
#endif
                        u_xlat23 = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat9.x = u_xlat23 + u_xlat9.x;
                    }
                    u_xlat22 = u_xlat9.x;
                }
                u_xlat15 = u_xlat22 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb21 = !!(u_xlat21<u_xlat1.x);
#else
                u_xlatb21 = u_xlat21<u_xlat1.x;
#endif
                u_xlat15 = (u_xlatb21) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat15 = 1.0;
    }
    u_xlat21 = u_xlat15 + -1.0;
    u_xlat21 = _ReceiveShadowsStrength * u_xlat21 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_4 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat16_5.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat9.xyz);
    u_xlat16_5.xyz = u_xlat9.xyz * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = max(u_xlat16_3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb0 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD5.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
lowp float u_xlat10_23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
    u_xlatb21 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb21){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat21 = (-u_xlat1.z) + 1.0;
        u_xlatb15 = u_xlat21>=1.0;
        u_xlatb22 = 0.0>=u_xlat21;
        u_xlatb15 = u_xlatb22 || u_xlatb15;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb15 = u_xlatb2.y || u_xlatb15;
        u_xlatb15 = u_xlatb2.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
            u_xlatb22 = 0.0<_UsePCF;
            if(u_xlatb22){
                u_xlat22 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat9.x = u_xlat22;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat11.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_23 = texture2DLodEXT(_CustomShadowTex, u_xlat11.xy, 0.0).x;
                        u_xlat23 = (-u_xlat10_23) + 1.0;
                        u_xlatb23 = u_xlat21<u_xlat23;
                        u_xlat23 = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat9.x = u_xlat23 + u_xlat9.x;
                    }
                    u_xlat22 = u_xlat9.x;
                }
                u_xlat15 = u_xlat22 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb21 = u_xlat21<u_xlat1.x;
                u_xlat15 = (u_xlatb21) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat15 = 1.0;
    }
    u_xlat21 = u_xlat15 + -1.0;
    u_xlat21 = _ReceiveShadowsStrength * u_xlat21 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat16_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_4 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat16_5.xyz = u_xlat10_4.www * u_xlat10_4.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat9.xyz);
    u_xlat16_5.xyz = u_xlat9.xyz * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
    u_xlat16_5.xyz = max(u_xlat16_3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
    u_xlatb0 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD5.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
lowp float u_xlat10_23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
    u_xlatb21 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb21){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat21 = (-u_xlat1.z) + 1.0;
        u_xlatb15 = u_xlat21>=1.0;
        u_xlatb22 = 0.0>=u_xlat21;
        u_xlatb15 = u_xlatb22 || u_xlatb15;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb15 = u_xlatb2.y || u_xlatb15;
        u_xlatb15 = u_xlatb2.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
            u_xlatb22 = 0.0<_UsePCF;
            if(u_xlatb22){
                u_xlat22 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat9.x = u_xlat22;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat11.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_23 = texture2DLodEXT(_CustomShadowTex, u_xlat11.xy, 0.0).x;
                        u_xlat23 = (-u_xlat10_23) + 1.0;
                        u_xlatb23 = u_xlat21<u_xlat23;
                        u_xlat23 = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat9.x = u_xlat23 + u_xlat9.x;
                    }
                    u_xlat22 = u_xlat9.x;
                }
                u_xlat15 = u_xlat22 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb21 = u_xlat21<u_xlat1.x;
                u_xlat15 = (u_xlatb21) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat15 = 1.0;
    }
    u_xlat21 = u_xlat15 + -1.0;
    u_xlat21 = _ReceiveShadowsStrength * u_xlat21 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat16_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_4 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat16_5.xyz = u_xlat10_4.www * u_xlat10_4.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat9.xyz);
    u_xlat16_5.xyz = u_xlat9.xyz * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
    u_xlat16_5.xyz = max(u_xlat16_3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
    u_xlatb0 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _COLOR_MODE;
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
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Light;
UNITY_LOCATION(6) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(7) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
mediump float u_xlat16_23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb21 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb21){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat21 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(u_xlat21>=1.0);
#else
        u_xlatb15 = u_xlat21>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(0.0>=u_xlat21);
#else
        u_xlatb22 = 0.0>=u_xlat21;
#endif
        u_xlatb15 = u_xlatb22 || u_xlatb15;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb15 = u_xlatb2.y || u_xlatb15;
        u_xlatb15 = u_xlatb2.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(0.0<_UsePCF);
#else
            u_xlatb22 = 0.0<_UsePCF;
#endif
            if(u_xlatb22){
                u_xlat22 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat9.x = u_xlat22;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat11.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_23 = textureLod(_CustomShadowTex, u_xlat11.xy, 0.0).x;
                        u_xlat23 = (-u_xlat16_23) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb23 = !!(u_xlat21<u_xlat23);
#else
                        u_xlatb23 = u_xlat21<u_xlat23;
#endif
                        u_xlat23 = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat9.x = u_xlat23 + u_xlat9.x;
                    }
                    u_xlat22 = u_xlat9.x;
                }
                u_xlat15 = u_xlat22 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb21 = !!(u_xlat21<u_xlat1.x);
#else
                u_xlatb21 = u_xlat21<u_xlat1.x;
#endif
                u_xlat15 = (u_xlatb21) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat2.xyz = u_xlat1.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat4.xyz = u_xlat1.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat4.xyz = u_xlat1.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat1.xyw = u_xlat1.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.w);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat21 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat15 = u_xlat21 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat21 = u_xlat15 + -1.0;
    u_xlat21 = _ReceiveShadowsStrength * u_xlat21 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_4 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat16_5.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat9.xyz);
    u_xlat16_5.xyz = u_xlat9.xyz * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = max(u_xlat16_3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb0 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _COLOR_MODE;
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
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Light;
UNITY_LOCATION(6) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(7) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
mediump float u_xlat16_23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb21 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb21){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat21 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(u_xlat21>=1.0);
#else
        u_xlatb15 = u_xlat21>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(0.0>=u_xlat21);
#else
        u_xlatb22 = 0.0>=u_xlat21;
#endif
        u_xlatb15 = u_xlatb22 || u_xlatb15;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb15 = u_xlatb2.y || u_xlatb15;
        u_xlatb15 = u_xlatb2.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(0.0<_UsePCF);
#else
            u_xlatb22 = 0.0<_UsePCF;
#endif
            if(u_xlatb22){
                u_xlat22 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat9.x = u_xlat22;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat11.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_23 = textureLod(_CustomShadowTex, u_xlat11.xy, 0.0).x;
                        u_xlat23 = (-u_xlat16_23) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb23 = !!(u_xlat21<u_xlat23);
#else
                        u_xlatb23 = u_xlat21<u_xlat23;
#endif
                        u_xlat23 = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat9.x = u_xlat23 + u_xlat9.x;
                    }
                    u_xlat22 = u_xlat9.x;
                }
                u_xlat15 = u_xlat22 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb21 = !!(u_xlat21<u_xlat1.x);
#else
                u_xlatb21 = u_xlat21<u_xlat1.x;
#endif
                u_xlat15 = (u_xlatb21) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat2.xyz = u_xlat1.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat4.xyz = u_xlat1.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat4.xyz = u_xlat1.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat1.xyw = u_xlat1.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.w);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat21 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat15 = u_xlat21 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat21 = u_xlat15 + -1.0;
    u_xlat21 = _ReceiveShadowsStrength * u_xlat21 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_4 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat16_5.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat9.xyz);
    u_xlat16_5.xyz = u_xlat9.xyz * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = max(u_xlat16_3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb0 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _COLOR_MODE;
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
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
lowp float u_xlat10_23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
    u_xlatb21 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb21){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat21 = (-u_xlat1.z) + 1.0;
        u_xlatb15 = u_xlat21>=1.0;
        u_xlatb22 = 0.0>=u_xlat21;
        u_xlatb15 = u_xlatb22 || u_xlatb15;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb15 = u_xlatb2.y || u_xlatb15;
        u_xlatb15 = u_xlatb2.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
            u_xlatb22 = 0.0<_UsePCF;
            if(u_xlatb22){
                u_xlat22 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat9.x = u_xlat22;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat11.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_23 = texture2DLodEXT(_CustomShadowTex, u_xlat11.xy, 0.0).x;
                        u_xlat23 = (-u_xlat10_23) + 1.0;
                        u_xlatb23 = u_xlat21<u_xlat23;
                        u_xlat23 = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat9.x = u_xlat23 + u_xlat9.x;
                    }
                    u_xlat22 = u_xlat9.x;
                }
                u_xlat15 = u_xlat22 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb21 = u_xlat21<u_xlat1.x;
                u_xlat15 = (u_xlatb21) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat2.xyz = u_xlat1.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat4.xyz = u_xlat1.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat4.xyz = u_xlat1.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat1.xyw = u_xlat1.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.w);
        u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat21 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat15 = u_xlat21 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat21 = u_xlat15 + -1.0;
    u_xlat21 = _ReceiveShadowsStrength * u_xlat21 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat16_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_4 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat16_5.xyz = u_xlat10_4.www * u_xlat10_4.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat9.xyz);
    u_xlat16_5.xyz = u_xlat9.xyz * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
    u_xlat16_5.xyz = max(u_xlat16_3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
    u_xlatb0 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _COLOR_MODE;
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
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
lowp float u_xlat10_23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
    u_xlatb21 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb21){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat21 = (-u_xlat1.z) + 1.0;
        u_xlatb15 = u_xlat21>=1.0;
        u_xlatb22 = 0.0>=u_xlat21;
        u_xlatb15 = u_xlatb22 || u_xlatb15;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb15 = u_xlatb2.y || u_xlatb15;
        u_xlatb15 = u_xlatb2.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
            u_xlatb22 = 0.0<_UsePCF;
            if(u_xlatb22){
                u_xlat22 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat9.x = u_xlat22;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat11.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_23 = texture2DLodEXT(_CustomShadowTex, u_xlat11.xy, 0.0).x;
                        u_xlat23 = (-u_xlat10_23) + 1.0;
                        u_xlatb23 = u_xlat21<u_xlat23;
                        u_xlat23 = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat9.x = u_xlat23 + u_xlat9.x;
                    }
                    u_xlat22 = u_xlat9.x;
                }
                u_xlat15 = u_xlat22 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb21 = u_xlat21<u_xlat1.x;
                u_xlat15 = (u_xlatb21) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat2.xyz = u_xlat1.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat4.xyz = u_xlat1.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat4.xyz = u_xlat1.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat1.xyw = u_xlat1.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.w);
        u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat21 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat15 = u_xlat21 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat21 = u_xlat15 + -1.0;
    u_xlat21 = _ReceiveShadowsStrength * u_xlat21 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat16_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_4 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat16_5.xyz = u_xlat10_4.www * u_xlat10_4.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat9.xyz);
    u_xlat16_5.xyz = u_xlat9.xyz * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
    u_xlat16_5.xyz = max(u_xlat16_3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
    u_xlatb0 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_FOG_ON" }
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
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD5.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogHightEnd;
uniform 	mediump float _FogHigh;
uniform 	mediump float _FogHightStart;
uniform 	mediump float _FogLinearEnd;
uniform 	mediump vec3 _FogPosition;
uniform 	mediump float _FogLinearStart;
uniform 	mediump float _CameraON;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Light;
UNITY_LOCATION(6) uniform mediump sampler2D _FogGradient;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
mediump float u_xlat16_23;
bool u_xlatb23;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb21 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb21){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat21 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(u_xlat21>=1.0);
#else
        u_xlatb15 = u_xlat21>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(0.0>=u_xlat21);
#else
        u_xlatb22 = 0.0>=u_xlat21;
#endif
        u_xlatb15 = u_xlatb22 || u_xlatb15;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb15 = u_xlatb2.y || u_xlatb15;
        u_xlatb15 = u_xlatb2.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(0.0<_UsePCF);
#else
            u_xlatb22 = 0.0<_UsePCF;
#endif
            if(u_xlatb22){
                u_xlat22 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat9.x = u_xlat22;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat11.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_23 = textureLod(_CustomShadowTex, u_xlat11.xy, 0.0).x;
                        u_xlat23 = (-u_xlat16_23) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb23 = !!(u_xlat21<u_xlat23);
#else
                        u_xlatb23 = u_xlat21<u_xlat23;
#endif
                        u_xlat23 = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat9.x = u_xlat23 + u_xlat9.x;
                    }
                    u_xlat22 = u_xlat9.x;
                }
                u_xlat15 = u_xlat22 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb21 = !!(u_xlat21<u_xlat1.x);
#else
                u_xlatb21 = u_xlat21<u_xlat1.x;
#endif
                u_xlat15 = (u_xlatb21) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat15 = 1.0;
    }
    u_xlat21 = u_xlat15 + -1.0;
    u_xlat21 = _ReceiveShadowsStrength * u_xlat21 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_4 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat16_5.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat9.xyz);
    u_xlat16_5.xyz = u_xlat9.xyz * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat0.x = -abs(u_xlat0.x) + _FogHightEnd;
    u_xlat16_24 = (-_FogHightStart) + _FogHightEnd;
    u_xlat0.x = u_xlat0.x / u_xlat16_24;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_24 = (-u_xlat0.x) + 1.0;
    u_xlat16_24 = (-u_xlat16_24) + 1.0;
    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat0.xyz = vec3(_CameraON) * u_xlat0.xyz + _FogPosition.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _FogLinearEnd;
    u_xlat16_5.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat0.x = u_xlat0.x / u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = (-u_xlat0.x) + 1.0;
    u_xlat16_5.x = u_xlat16_24 * u_xlat16_5.x;
    u_xlat16_5.y = 0.5;
    u_xlat16_0.xyz = texture(_FogGradient, u_xlat16_5.xy).xyz;
    u_xlat0.xyz = _FogColor.xyz * u_xlat16_0.xyz + (-u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat16_5.xxx * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = max(u_xlat16_3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb0 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_FOG_ON" }
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
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD5.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogHightEnd;
uniform 	mediump float _FogHigh;
uniform 	mediump float _FogHightStart;
uniform 	mediump float _FogLinearEnd;
uniform 	mediump vec3 _FogPosition;
uniform 	mediump float _FogLinearStart;
uniform 	mediump float _CameraON;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Light;
UNITY_LOCATION(6) uniform mediump sampler2D _FogGradient;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
mediump float u_xlat16_23;
bool u_xlatb23;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb21 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb21){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat21 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(u_xlat21>=1.0);
#else
        u_xlatb15 = u_xlat21>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(0.0>=u_xlat21);
#else
        u_xlatb22 = 0.0>=u_xlat21;
#endif
        u_xlatb15 = u_xlatb22 || u_xlatb15;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb15 = u_xlatb2.y || u_xlatb15;
        u_xlatb15 = u_xlatb2.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(0.0<_UsePCF);
#else
            u_xlatb22 = 0.0<_UsePCF;
#endif
            if(u_xlatb22){
                u_xlat22 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat9.x = u_xlat22;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat11.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_23 = textureLod(_CustomShadowTex, u_xlat11.xy, 0.0).x;
                        u_xlat23 = (-u_xlat16_23) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb23 = !!(u_xlat21<u_xlat23);
#else
                        u_xlatb23 = u_xlat21<u_xlat23;
#endif
                        u_xlat23 = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat9.x = u_xlat23 + u_xlat9.x;
                    }
                    u_xlat22 = u_xlat9.x;
                }
                u_xlat15 = u_xlat22 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb21 = !!(u_xlat21<u_xlat1.x);
#else
                u_xlatb21 = u_xlat21<u_xlat1.x;
#endif
                u_xlat15 = (u_xlatb21) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat15 = 1.0;
    }
    u_xlat21 = u_xlat15 + -1.0;
    u_xlat21 = _ReceiveShadowsStrength * u_xlat21 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_4 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat16_5.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat9.xyz);
    u_xlat16_5.xyz = u_xlat9.xyz * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat0.x = -abs(u_xlat0.x) + _FogHightEnd;
    u_xlat16_24 = (-_FogHightStart) + _FogHightEnd;
    u_xlat0.x = u_xlat0.x / u_xlat16_24;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_24 = (-u_xlat0.x) + 1.0;
    u_xlat16_24 = (-u_xlat16_24) + 1.0;
    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat0.xyz = vec3(_CameraON) * u_xlat0.xyz + _FogPosition.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _FogLinearEnd;
    u_xlat16_5.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat0.x = u_xlat0.x / u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = (-u_xlat0.x) + 1.0;
    u_xlat16_5.x = u_xlat16_24 * u_xlat16_5.x;
    u_xlat16_5.y = 0.5;
    u_xlat16_0.xyz = texture(_FogGradient, u_xlat16_5.xy).xyz;
    u_xlat0.xyz = _FogColor.xyz * u_xlat16_0.xyz + (-u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat16_5.xxx * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = max(u_xlat16_3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb0 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_FOG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD5.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogHightEnd;
uniform 	mediump float _FogHigh;
uniform 	mediump float _FogHightStart;
uniform 	mediump float _FogLinearEnd;
uniform 	mediump vec3 _FogPosition;
uniform 	mediump float _FogLinearStart;
uniform 	mediump float _CameraON;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _FogGradient;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
lowp float u_xlat10_23;
bool u_xlatb23;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
    u_xlatb21 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb21){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat21 = (-u_xlat1.z) + 1.0;
        u_xlatb15 = u_xlat21>=1.0;
        u_xlatb22 = 0.0>=u_xlat21;
        u_xlatb15 = u_xlatb22 || u_xlatb15;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb15 = u_xlatb2.y || u_xlatb15;
        u_xlatb15 = u_xlatb2.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
            u_xlatb22 = 0.0<_UsePCF;
            if(u_xlatb22){
                u_xlat22 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat9.x = u_xlat22;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat11.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_23 = texture2DLodEXT(_CustomShadowTex, u_xlat11.xy, 0.0).x;
                        u_xlat23 = (-u_xlat10_23) + 1.0;
                        u_xlatb23 = u_xlat21<u_xlat23;
                        u_xlat23 = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat9.x = u_xlat23 + u_xlat9.x;
                    }
                    u_xlat22 = u_xlat9.x;
                }
                u_xlat15 = u_xlat22 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb21 = u_xlat21<u_xlat1.x;
                u_xlat15 = (u_xlatb21) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat15 = 1.0;
    }
    u_xlat21 = u_xlat15 + -1.0;
    u_xlat21 = _ReceiveShadowsStrength * u_xlat21 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat16_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_4 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat16_5.xyz = u_xlat10_4.www * u_xlat10_4.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat9.xyz);
    u_xlat16_5.xyz = u_xlat9.xyz * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat0.x = -abs(u_xlat0.x) + _FogHightEnd;
    u_xlat16_24 = (-_FogHightStart) + _FogHightEnd;
    u_xlat0.x = u_xlat0.x / u_xlat16_24;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_24 = (-u_xlat0.x) + 1.0;
    u_xlat16_24 = (-u_xlat16_24) + 1.0;
    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat0.xyz = vec3(_CameraON) * u_xlat0.xyz + _FogPosition.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _FogLinearEnd;
    u_xlat16_5.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat0.x = u_xlat0.x / u_xlat16_5.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.x = (-u_xlat0.x) + 1.0;
    u_xlat16_5.x = u_xlat16_24 * u_xlat16_5.x;
    u_xlat16_5.y = 0.5;
    u_xlat10_0.xyz = texture2D(_FogGradient, u_xlat16_5.xy).xyz;
    u_xlat0.xyz = _FogColor.xyz * u_xlat10_0.xyz + (-u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat16_5.xxx * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
    u_xlat16_5.xyz = max(u_xlat16_3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
    u_xlatb0 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_FOG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD5.xyz = vec3(u_xlat9) * u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	vec4 _Normal_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogHightEnd;
uniform 	mediump float _FogHigh;
uniform 	mediump float _FogHightStart;
uniform 	mediump float _FogLinearEnd;
uniform 	mediump vec3 _FogPosition;
uniform 	mediump float _FogLinearStart;
uniform 	mediump float _CameraON;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _FogGradient;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
lowp float u_xlat10_23;
bool u_xlatb23;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
    u_xlatb21 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb21){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat21 = (-u_xlat1.z) + 1.0;
        u_xlatb15 = u_xlat21>=1.0;
        u_xlatb22 = 0.0>=u_xlat21;
        u_xlatb15 = u_xlatb22 || u_xlatb15;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb15 = u_xlatb2.y || u_xlatb15;
        u_xlatb15 = u_xlatb2.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
            u_xlatb22 = 0.0<_UsePCF;
            if(u_xlatb22){
                u_xlat22 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat9.x = u_xlat22;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat11.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_23 = texture2DLodEXT(_CustomShadowTex, u_xlat11.xy, 0.0).x;
                        u_xlat23 = (-u_xlat10_23) + 1.0;
                        u_xlatb23 = u_xlat21<u_xlat23;
                        u_xlat23 = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat9.x = u_xlat23 + u_xlat9.x;
                    }
                    u_xlat22 = u_xlat9.x;
                }
                u_xlat15 = u_xlat22 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb21 = u_xlat21<u_xlat1.x;
                u_xlat15 = (u_xlatb21) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat15 = 1.0;
    }
    u_xlat21 = u_xlat15 + -1.0;
    u_xlat21 = _ReceiveShadowsStrength * u_xlat21 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat16_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_4 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat16_5.xyz = u_xlat10_4.www * u_xlat10_4.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat9.xyz);
    u_xlat16_5.xyz = u_xlat9.xyz * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat0.x = -abs(u_xlat0.x) + _FogHightEnd;
    u_xlat16_24 = (-_FogHightStart) + _FogHightEnd;
    u_xlat0.x = u_xlat0.x / u_xlat16_24;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_24 = (-u_xlat0.x) + 1.0;
    u_xlat16_24 = (-u_xlat16_24) + 1.0;
    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat0.xyz = vec3(_CameraON) * u_xlat0.xyz + _FogPosition.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _FogLinearEnd;
    u_xlat16_5.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat0.x = u_xlat0.x / u_xlat16_5.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.x = (-u_xlat0.x) + 1.0;
    u_xlat16_5.x = u_xlat16_24 * u_xlat16_5.x;
    u_xlat16_5.y = 0.5;
    u_xlat10_0.xyz = texture2D(_FogGradient, u_xlat16_5.xy).xyz;
    u_xlat0.xyz = _FogColor.xyz * u_xlat10_0.xyz + (-u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat16_5.xxx * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
    u_xlat16_5.xyz = max(u_xlat16_3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
    u_xlatb0 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_FOG_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _COLOR_MODE;
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
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogHightEnd;
uniform 	mediump float _FogHigh;
uniform 	mediump float _FogHightStart;
uniform 	mediump float _FogLinearEnd;
uniform 	mediump vec3 _FogPosition;
uniform 	mediump float _FogLinearStart;
uniform 	mediump float _CameraON;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Light;
UNITY_LOCATION(6) uniform mediump sampler2D _FogGradient;
UNITY_LOCATION(7) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(8) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
mediump float u_xlat16_23;
bool u_xlatb23;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb21 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb21){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat21 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(u_xlat21>=1.0);
#else
        u_xlatb15 = u_xlat21>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(0.0>=u_xlat21);
#else
        u_xlatb22 = 0.0>=u_xlat21;
#endif
        u_xlatb15 = u_xlatb22 || u_xlatb15;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb15 = u_xlatb2.y || u_xlatb15;
        u_xlatb15 = u_xlatb2.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(0.0<_UsePCF);
#else
            u_xlatb22 = 0.0<_UsePCF;
#endif
            if(u_xlatb22){
                u_xlat22 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat9.x = u_xlat22;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat11.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_23 = textureLod(_CustomShadowTex, u_xlat11.xy, 0.0).x;
                        u_xlat23 = (-u_xlat16_23) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb23 = !!(u_xlat21<u_xlat23);
#else
                        u_xlatb23 = u_xlat21<u_xlat23;
#endif
                        u_xlat23 = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat9.x = u_xlat23 + u_xlat9.x;
                    }
                    u_xlat22 = u_xlat9.x;
                }
                u_xlat15 = u_xlat22 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb21 = !!(u_xlat21<u_xlat1.x);
#else
                u_xlatb21 = u_xlat21<u_xlat1.x;
#endif
                u_xlat15 = (u_xlatb21) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat2.xyz = u_xlat1.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat4.xyz = u_xlat1.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat4.xyz = u_xlat1.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat1.xyw = u_xlat1.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.w);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat21 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat15 = u_xlat21 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat21 = u_xlat15 + -1.0;
    u_xlat21 = _ReceiveShadowsStrength * u_xlat21 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_4 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat16_5.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat9.xyz);
    u_xlat16_5.xyz = u_xlat9.xyz * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat0.x = -abs(u_xlat0.x) + _FogHightEnd;
    u_xlat16_24 = (-_FogHightStart) + _FogHightEnd;
    u_xlat0.x = u_xlat0.x / u_xlat16_24;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_24 = (-u_xlat0.x) + 1.0;
    u_xlat16_24 = (-u_xlat16_24) + 1.0;
    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat0.xyz = vec3(_CameraON) * u_xlat0.xyz + _FogPosition.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _FogLinearEnd;
    u_xlat16_5.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat0.x = u_xlat0.x / u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = (-u_xlat0.x) + 1.0;
    u_xlat16_5.x = u_xlat16_24 * u_xlat16_5.x;
    u_xlat16_5.y = 0.5;
    u_xlat16_0.xyz = texture(_FogGradient, u_xlat16_5.xy).xyz;
    u_xlat0.xyz = _FogColor.xyz * u_xlat16_0.xyz + (-u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat16_5.xxx * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = max(u_xlat16_3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb0 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_FOG_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _COLOR_MODE;
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
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogHightEnd;
uniform 	mediump float _FogHigh;
uniform 	mediump float _FogHightStart;
uniform 	mediump float _FogLinearEnd;
uniform 	mediump vec3 _FogPosition;
uniform 	mediump float _FogLinearStart;
uniform 	mediump float _CameraON;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Light;
UNITY_LOCATION(6) uniform mediump sampler2D _FogGradient;
UNITY_LOCATION(7) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(8) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD9;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
mediump float u_xlat16_23;
bool u_xlatb23;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb21 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb21){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat21 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(u_xlat21>=1.0);
#else
        u_xlatb15 = u_xlat21>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb22 = !!(0.0>=u_xlat21);
#else
        u_xlatb22 = 0.0>=u_xlat21;
#endif
        u_xlatb15 = u_xlatb22 || u_xlatb15;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb15 = u_xlatb2.y || u_xlatb15;
        u_xlatb15 = u_xlatb2.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(0.0<_UsePCF);
#else
            u_xlatb22 = 0.0<_UsePCF;
#endif
            if(u_xlatb22){
                u_xlat22 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat9.x = u_xlat22;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat11.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_23 = textureLod(_CustomShadowTex, u_xlat11.xy, 0.0).x;
                        u_xlat23 = (-u_xlat16_23) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb23 = !!(u_xlat21<u_xlat23);
#else
                        u_xlatb23 = u_xlat21<u_xlat23;
#endif
                        u_xlat23 = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat9.x = u_xlat23 + u_xlat9.x;
                    }
                    u_xlat22 = u_xlat9.x;
                }
                u_xlat15 = u_xlat22 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb21 = !!(u_xlat21<u_xlat1.x);
#else
                u_xlatb21 = u_xlat21<u_xlat1.x;
#endif
                u_xlat15 = (u_xlatb21) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat2.xyz = u_xlat1.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat4.xyz = u_xlat1.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat4.xyz = u_xlat1.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat1.xyw = u_xlat1.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.w);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat21 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat15 = u_xlat21 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat21 = u_xlat15 + -1.0;
    u_xlat21 = _ReceiveShadowsStrength * u_xlat21 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat16_3.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_4 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat16_5.xyz = u_xlat16_4.www * u_xlat16_4.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat9.xyz);
    u_xlat16_5.xyz = u_xlat9.xyz * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat0.x = -abs(u_xlat0.x) + _FogHightEnd;
    u_xlat16_24 = (-_FogHightStart) + _FogHightEnd;
    u_xlat0.x = u_xlat0.x / u_xlat16_24;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_24 = (-u_xlat0.x) + 1.0;
    u_xlat16_24 = (-u_xlat16_24) + 1.0;
    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat0.xyz = vec3(_CameraON) * u_xlat0.xyz + _FogPosition.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _FogLinearEnd;
    u_xlat16_5.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat0.x = u_xlat0.x / u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = (-u_xlat0.x) + 1.0;
    u_xlat16_5.x = u_xlat16_24 * u_xlat16_5.x;
    u_xlat16_5.y = 0.5;
    u_xlat16_0.xyz = texture(_FogGradient, u_xlat16_5.xy).xyz;
    u_xlat0.xyz = _FogColor.xyz * u_xlat16_0.xyz + (-u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat16_5.xxx * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = max(u_xlat16_3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb0 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_FOG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _COLOR_MODE;
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
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogHightEnd;
uniform 	mediump float _FogHigh;
uniform 	mediump float _FogHightStart;
uniform 	mediump float _FogLinearEnd;
uniform 	mediump vec3 _FogPosition;
uniform 	mediump float _FogLinearStart;
uniform 	mediump float _CameraON;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _FogGradient;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
lowp float u_xlat10_23;
bool u_xlatb23;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
    u_xlatb21 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb21){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat21 = (-u_xlat1.z) + 1.0;
        u_xlatb15 = u_xlat21>=1.0;
        u_xlatb22 = 0.0>=u_xlat21;
        u_xlatb15 = u_xlatb22 || u_xlatb15;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb15 = u_xlatb2.y || u_xlatb15;
        u_xlatb15 = u_xlatb2.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
            u_xlatb22 = 0.0<_UsePCF;
            if(u_xlatb22){
                u_xlat22 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat9.x = u_xlat22;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat11.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_23 = texture2DLodEXT(_CustomShadowTex, u_xlat11.xy, 0.0).x;
                        u_xlat23 = (-u_xlat10_23) + 1.0;
                        u_xlatb23 = u_xlat21<u_xlat23;
                        u_xlat23 = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat9.x = u_xlat23 + u_xlat9.x;
                    }
                    u_xlat22 = u_xlat9.x;
                }
                u_xlat15 = u_xlat22 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb21 = u_xlat21<u_xlat1.x;
                u_xlat15 = (u_xlatb21) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat2.xyz = u_xlat1.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat4.xyz = u_xlat1.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat4.xyz = u_xlat1.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat1.xyw = u_xlat1.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.w);
        u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat21 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat15 = u_xlat21 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat21 = u_xlat15 + -1.0;
    u_xlat21 = _ReceiveShadowsStrength * u_xlat21 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat16_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_4 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat16_5.xyz = u_xlat10_4.www * u_xlat10_4.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat9.xyz);
    u_xlat16_5.xyz = u_xlat9.xyz * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat0.x = -abs(u_xlat0.x) + _FogHightEnd;
    u_xlat16_24 = (-_FogHightStart) + _FogHightEnd;
    u_xlat0.x = u_xlat0.x / u_xlat16_24;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_24 = (-u_xlat0.x) + 1.0;
    u_xlat16_24 = (-u_xlat16_24) + 1.0;
    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat0.xyz = vec3(_CameraON) * u_xlat0.xyz + _FogPosition.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _FogLinearEnd;
    u_xlat16_5.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat0.x = u_xlat0.x / u_xlat16_5.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.x = (-u_xlat0.x) + 1.0;
    u_xlat16_5.x = u_xlat16_24 * u_xlat16_5.x;
    u_xlat16_5.y = 0.5;
    u_xlat10_0.xyz = texture2D(_FogGradient, u_xlat16_5.xy).xyz;
    u_xlat0.xyz = _FogColor.xyz * u_xlat10_0.xyz + (-u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat16_5.xxx * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
    u_xlat16_5.xyz = max(u_xlat16_3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
    u_xlatb0 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_FOG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD9;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD5.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD9 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
uniform 	mediump float _COLOR_MODE;
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
uniform 	mediump vec4 _FogColor;
uniform 	mediump float _FogHightEnd;
uniform 	mediump float _FogHigh;
uniform 	mediump float _FogHightStart;
uniform 	mediump float _FogLinearEnd;
uniform 	mediump vec3 _FogPosition;
uniform 	mediump float _FogLinearStart;
uniform 	mediump float _CameraON;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _FogGradient;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD9;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat11;
float u_xlat15;
bool u_xlatb15;
int u_xlati16;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
lowp float u_xlat10_23;
bool u_xlatb23;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat21)) + (-u_xlat1.xyz);
    u_xlatb21 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb21){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat21 = (-u_xlat1.z) + 1.0;
        u_xlatb15 = u_xlat21>=1.0;
        u_xlatb22 = 0.0>=u_xlat21;
        u_xlatb15 = u_xlatb22 || u_xlatb15;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb15 = u_xlatb15 || u_xlatb2.x;
        u_xlatb15 = u_xlatb2.y || u_xlatb15;
        u_xlatb15 = u_xlatb2.z || u_xlatb15;
        if(u_xlatb15){
            u_xlat15 = 1.0;
        } else {
            u_xlatb22 = 0.0<_UsePCF;
            if(u_xlatb22){
                u_xlat22 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat9.x = u_xlat22;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat11.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_23 = texture2DLodEXT(_CustomShadowTex, u_xlat11.xy, 0.0).x;
                        u_xlat23 = (-u_xlat10_23) + 1.0;
                        u_xlatb23 = u_xlat21<u_xlat23;
                        u_xlat23 = (u_xlatb23) ? _CustomShadowStrength : 1.0;
                        u_xlat9.x = u_xlat23 + u_xlat9.x;
                    }
                    u_xlat22 = u_xlat9.x;
                }
                u_xlat15 = u_xlat22 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb21 = u_xlat21<u_xlat1.x;
                u_xlat15 = (u_xlatb21) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD9.xyz / vs_TEXCOORD9.www;
        u_xlat2.xyz = u_xlat1.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat4.xyz = u_xlat1.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat4.xyz = u_xlat1.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat1.xyw = u_xlat1.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.w);
        u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat21 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat15 = u_xlat21 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat21 = u_xlat15 + -1.0;
    u_xlat21 = _ReceiveShadowsStrength * u_xlat21 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat16_3.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_4 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat16_5.xyz = u_xlat10_4.www * u_xlat10_4.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat9.xyz);
    u_xlat16_5.xyz = u_xlat9.xyz * u_xlat16_5.xyz + u_xlat9.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xxx;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat0.x = -abs(u_xlat0.x) + _FogHightEnd;
    u_xlat16_24 = (-_FogHightStart) + _FogHightEnd;
    u_xlat0.x = u_xlat0.x / u_xlat16_24;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_24 = (-u_xlat0.x) + 1.0;
    u_xlat16_24 = (-u_xlat16_24) + 1.0;
    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat0.xyz = vec3(_CameraON) * u_xlat0.xyz + _FogPosition.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _FogLinearEnd;
    u_xlat16_5.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat0.x = u_xlat0.x / u_xlat16_5.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.x = (-u_xlat0.x) + 1.0;
    u_xlat16_5.x = u_xlat16_24 * u_xlat16_5.x;
    u_xlat16_5.y = 0.5;
    u_xlat10_0.xyz = texture2D(_FogGradient, u_xlat16_5.xy).xyz;
    u_xlat0.xyz = _FogColor.xyz * u_xlat10_0.xyz + (-u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat16_5.xxx * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
    u_xlat16_5.xyz = max(u_xlat16_3.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
    u_xlatb0 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
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
Keywords { "DIRECTIONAL" "MODE_UNITY" "_FOG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_FOG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_FOG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "_FOG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_FOG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_FOG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_FOG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_UNITY" "SHADOWS_SCREEN" "_FOG_ON" }
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
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_FOG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_FOG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_FOG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_FOG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_FOG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_FOG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_FOG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_FOG_ON" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 66051
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
CustomEditor "Prometheus.PrometheusShaderGUI_ShowTemp"
}