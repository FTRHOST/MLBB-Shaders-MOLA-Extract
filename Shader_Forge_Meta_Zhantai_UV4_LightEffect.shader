//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Shader Forge/Meta_Zhantai_UV4_LightEffect" {
Properties {

_Diff ("Diff", 2D) = "white" { }

_light_PW ("light_PW", Float) = 5.0

_Light ("Light", 2D) = "white" { }

_Cubemap ("Cubemap", Cube) = "_Skybox" { }

_Em_G_CU_R_MASK ("Em_G_CU_R_MASK", 2D) = "white" { }

_Cube_FW ("Cube_FW", Float) = 0.4000000059604645

_Cube_power ("Cube_power", Float) = 8.0

_ES_PW ("ES_PW", Float) = 2.0

[Enum(Off, 0, On, 1)] _ZWrite ("ZWrite", Float) = 0.0

_ReceiveShadowsStrength ("ReceiveShadowsStrength", Float) = 1.0

[Enum(UV2, 0, ScreenUV, 1)] _LightUVType ("灯光形状UV类型", Float) = 0.0

_Mask ("灯光形状", 2D) = "black" { }

_MaskScale ("灯光缩放", Range(0, 20)) = 1.0

_MaskOffset ("灯光偏移(XY)", Vector) = (0,0,0,0)

_MaskIntensity ("灯光强度", Range(0, 20)) = 1.0

_MaskColor ("灯光颜色", Color) = (1,1,1,1)

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
  GpuProgramID 8574
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
UNITY_LOCATION(0) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat11;
bool u_xlatb11;
int u_xlati12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
mediump float u_xlat16_17;
bool u_xlatb17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat15>=1.0);
#else
        u_xlatb11 = u_xlat15>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb16 = !!(0.0>=u_xlat15);
#else
        u_xlatb16 = 0.0>=u_xlat15;
#endif
        u_xlatb11 = u_xlatb16 || u_xlatb11;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb11 = u_xlatb2.y || u_xlatb11;
        u_xlatb11 = u_xlatb2.z || u_xlatb11;
        if(u_xlatb11){
            u_xlat11 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb16 = !!(0.0<_UsePCF);
#else
            u_xlatb16 = 0.0<_UsePCF;
#endif
            if(u_xlatb16){
                u_xlat16 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat3.x = float(u_xlati_loop_1);
                    u_xlat7.x = u_xlat16;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat3.y = float(u_xlati_loop_2);
                        u_xlat8.xy = u_xlat3.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_17 = textureLod(_CustomShadowTex, u_xlat8.xy, 0.0).x;
                        u_xlat17 = (-u_xlat16_17) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb17 = !!(u_xlat15<u_xlat17);
#else
                        u_xlatb17 = u_xlat15<u_xlat17;
#endif
                        u_xlat17 = (u_xlatb17) ? _CustomShadowStrength : 1.0;
                        u_xlat7.x = u_xlat17 + u_xlat7.x;
                    }
                    u_xlat16 = u_xlat7.x;
                }
                u_xlat11 = u_xlat16 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb15 = !!(u_xlat15<u_xlat1.x);
#else
                u_xlatb15 = u_xlat15<u_xlat1.x;
#endif
                u_xlat11 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat11 = 1.0;
    }
    u_xlat15 = u_xlat11 + -1.0;
    u_xlat15 = _ReceiveShadowsStrength * u_xlat15 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat4.xyz);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat0.xyz = u_xlat7.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_2.xyz = texture(_Light, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_LightUVType==0.0);
#else
    u_xlatb1 = _LightUVType==0.0;
#endif
    u_xlat6.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD1.xy : u_xlat6.xy;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
UNITY_LOCATION(0) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat11;
bool u_xlatb11;
int u_xlati12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
mediump float u_xlat16_17;
bool u_xlatb17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat15>=1.0);
#else
        u_xlatb11 = u_xlat15>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb16 = !!(0.0>=u_xlat15);
#else
        u_xlatb16 = 0.0>=u_xlat15;
#endif
        u_xlatb11 = u_xlatb16 || u_xlatb11;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb11 = u_xlatb2.y || u_xlatb11;
        u_xlatb11 = u_xlatb2.z || u_xlatb11;
        if(u_xlatb11){
            u_xlat11 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb16 = !!(0.0<_UsePCF);
#else
            u_xlatb16 = 0.0<_UsePCF;
#endif
            if(u_xlatb16){
                u_xlat16 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat3.x = float(u_xlati_loop_1);
                    u_xlat7.x = u_xlat16;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat3.y = float(u_xlati_loop_2);
                        u_xlat8.xy = u_xlat3.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_17 = textureLod(_CustomShadowTex, u_xlat8.xy, 0.0).x;
                        u_xlat17 = (-u_xlat16_17) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb17 = !!(u_xlat15<u_xlat17);
#else
                        u_xlatb17 = u_xlat15<u_xlat17;
#endif
                        u_xlat17 = (u_xlatb17) ? _CustomShadowStrength : 1.0;
                        u_xlat7.x = u_xlat17 + u_xlat7.x;
                    }
                    u_xlat16 = u_xlat7.x;
                }
                u_xlat11 = u_xlat16 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb15 = !!(u_xlat15<u_xlat1.x);
#else
                u_xlatb15 = u_xlat15<u_xlat1.x;
#endif
                u_xlat11 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat11 = 1.0;
    }
    u_xlat15 = u_xlat11 + -1.0;
    u_xlat15 = _ReceiveShadowsStrength * u_xlat15 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat4.xyz);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat0.xyz = u_xlat7.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_2.xyz = texture(_Light, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_LightUVType==0.0);
#else
    u_xlatb1 = _LightUVType==0.0;
#endif
    u_xlat6.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD1.xy : u_xlat6.xy;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec2 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat11;
bool u_xlatb11;
int u_xlati12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
lowp float u_xlat10_17;
bool u_xlatb17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat1.z) + 1.0;
        u_xlatb11 = u_xlat15>=1.0;
        u_xlatb16 = 0.0>=u_xlat15;
        u_xlatb11 = u_xlatb16 || u_xlatb11;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb11 = u_xlatb2.y || u_xlatb11;
        u_xlatb11 = u_xlatb2.z || u_xlatb11;
        if(u_xlatb11){
            u_xlat11 = 1.0;
        } else {
            u_xlatb16 = 0.0<_UsePCF;
            if(u_xlatb16){
                u_xlat16 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat3.x = float(u_xlati_loop_1);
                    u_xlat7.x = u_xlat16;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat3.y = float(u_xlati_loop_2);
                        u_xlat8.xy = u_xlat3.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_17 = texture2DLodEXT(_CustomShadowTex, u_xlat8.xy, 0.0).x;
                        u_xlat17 = (-u_xlat10_17) + 1.0;
                        u_xlatb17 = u_xlat15<u_xlat17;
                        u_xlat17 = (u_xlatb17) ? _CustomShadowStrength : 1.0;
                        u_xlat7.x = u_xlat17 + u_xlat7.x;
                    }
                    u_xlat16 = u_xlat7.x;
                }
                u_xlat11 = u_xlat16 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb15 = u_xlat15<u_xlat1.x;
                u_xlat11 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat11 = 1.0;
    }
    u_xlat15 = u_xlat11 + -1.0;
    u_xlat15 = _ReceiveShadowsStrength * u_xlat15 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat7.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat3.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat4.xyz);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xxx;
    u_xlat0.xyz = u_xlat7.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_2.xyz = texture2D(_Light, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat10_1.xyz + u_xlat0.xyz;
    u_xlatb1 = _LightUVType==0.0;
    u_xlat6.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD1.xy : u_xlat6.xy;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_light_PW);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec2 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat11;
bool u_xlatb11;
int u_xlati12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
lowp float u_xlat10_17;
bool u_xlatb17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat1.z) + 1.0;
        u_xlatb11 = u_xlat15>=1.0;
        u_xlatb16 = 0.0>=u_xlat15;
        u_xlatb11 = u_xlatb16 || u_xlatb11;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb11 = u_xlatb2.y || u_xlatb11;
        u_xlatb11 = u_xlatb2.z || u_xlatb11;
        if(u_xlatb11){
            u_xlat11 = 1.0;
        } else {
            u_xlatb16 = 0.0<_UsePCF;
            if(u_xlatb16){
                u_xlat16 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat3.x = float(u_xlati_loop_1);
                    u_xlat7.x = u_xlat16;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat3.y = float(u_xlati_loop_2);
                        u_xlat8.xy = u_xlat3.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_17 = texture2DLodEXT(_CustomShadowTex, u_xlat8.xy, 0.0).x;
                        u_xlat17 = (-u_xlat10_17) + 1.0;
                        u_xlatb17 = u_xlat15<u_xlat17;
                        u_xlat17 = (u_xlatb17) ? _CustomShadowStrength : 1.0;
                        u_xlat7.x = u_xlat17 + u_xlat7.x;
                    }
                    u_xlat16 = u_xlat7.x;
                }
                u_xlat11 = u_xlat16 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb15 = u_xlat15<u_xlat1.x;
                u_xlat11 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat11 = 1.0;
    }
    u_xlat15 = u_xlat11 + -1.0;
    u_xlat15 = _ReceiveShadowsStrength * u_xlat15 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat7.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat3.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat4.xyz);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xxx;
    u_xlat0.xyz = u_xlat7.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_2.xyz = texture2D(_Light, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat10_1.xyz + u_xlat0.xyz;
    u_xlatb1 = _LightUVType==0.0;
    u_xlat6.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD1.xy : u_xlat6.xy;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_light_PW);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat1.zw;
    vs_TEXCOORD4.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform 	vec4 _ShadowOffsets[4];
UNITY_LOCATION(0) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _Mask;
UNITY_LOCATION(6) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(7) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat11;
bool u_xlatb11;
int u_xlati12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
mediump float u_xlat16_17;
bool u_xlatb17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat15>=1.0);
#else
        u_xlatb11 = u_xlat15>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb16 = !!(0.0>=u_xlat15);
#else
        u_xlatb16 = 0.0>=u_xlat15;
#endif
        u_xlatb11 = u_xlatb16 || u_xlatb11;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb11 = u_xlatb2.y || u_xlatb11;
        u_xlatb11 = u_xlatb2.z || u_xlatb11;
        if(u_xlatb11){
            u_xlat11 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb16 = !!(0.0<_UsePCF);
#else
            u_xlatb16 = 0.0<_UsePCF;
#endif
            if(u_xlatb16){
                u_xlat16 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat3.x = float(u_xlati_loop_1);
                    u_xlat7.x = u_xlat16;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat3.y = float(u_xlati_loop_2);
                        u_xlat8.xy = u_xlat3.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_17 = textureLod(_CustomShadowTex, u_xlat8.xy, 0.0).x;
                        u_xlat17 = (-u_xlat16_17) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb17 = !!(u_xlat15<u_xlat17);
#else
                        u_xlatb17 = u_xlat15<u_xlat17;
#endif
                        u_xlat17 = (u_xlatb17) ? _CustomShadowStrength : 1.0;
                        u_xlat7.x = u_xlat17 + u_xlat7.x;
                    }
                    u_xlat16 = u_xlat7.x;
                }
                u_xlat11 = u_xlat16 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb15 = !!(u_xlat15<u_xlat1.x);
#else
                u_xlatb15 = u_xlat15<u_xlat1.x;
#endif
                u_xlat11 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
        u_xlat2.xyz = u_xlat1.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat3.xyz = u_xlat1.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat3.xyz = u_xlat1.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat1.xyw = u_xlat1.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.w);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat15 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat11 = u_xlat15 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat15 = u_xlat11 + -1.0;
    u_xlat15 = _ReceiveShadowsStrength * u_xlat15 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat4.xyz);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat0.xyz = u_xlat7.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_2.xyz = texture(_Light, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_LightUVType==0.0);
#else
    u_xlatb1 = _LightUVType==0.0;
#endif
    u_xlat6.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD1.xy : u_xlat6.xy;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat1.zw;
    vs_TEXCOORD4.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform 	vec4 _ShadowOffsets[4];
UNITY_LOCATION(0) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _Mask;
UNITY_LOCATION(6) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(7) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat11;
bool u_xlatb11;
int u_xlati12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
mediump float u_xlat16_17;
bool u_xlatb17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat15>=1.0);
#else
        u_xlatb11 = u_xlat15>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb16 = !!(0.0>=u_xlat15);
#else
        u_xlatb16 = 0.0>=u_xlat15;
#endif
        u_xlatb11 = u_xlatb16 || u_xlatb11;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb11 = u_xlatb2.y || u_xlatb11;
        u_xlatb11 = u_xlatb2.z || u_xlatb11;
        if(u_xlatb11){
            u_xlat11 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb16 = !!(0.0<_UsePCF);
#else
            u_xlatb16 = 0.0<_UsePCF;
#endif
            if(u_xlatb16){
                u_xlat16 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat3.x = float(u_xlati_loop_1);
                    u_xlat7.x = u_xlat16;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat3.y = float(u_xlati_loop_2);
                        u_xlat8.xy = u_xlat3.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_17 = textureLod(_CustomShadowTex, u_xlat8.xy, 0.0).x;
                        u_xlat17 = (-u_xlat16_17) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb17 = !!(u_xlat15<u_xlat17);
#else
                        u_xlatb17 = u_xlat15<u_xlat17;
#endif
                        u_xlat17 = (u_xlatb17) ? _CustomShadowStrength : 1.0;
                        u_xlat7.x = u_xlat17 + u_xlat7.x;
                    }
                    u_xlat16 = u_xlat7.x;
                }
                u_xlat11 = u_xlat16 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb15 = !!(u_xlat15<u_xlat1.x);
#else
                u_xlatb15 = u_xlat15<u_xlat1.x;
#endif
                u_xlat11 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
        u_xlat2.xyz = u_xlat1.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat3.xyz = u_xlat1.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat3.xyz = u_xlat1.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat1.xyw = u_xlat1.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.w);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat15 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat11 = u_xlat15 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat15 = u_xlat11 + -1.0;
    u_xlat15 = _ReceiveShadowsStrength * u_xlat15 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat4.xyz);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat0.xyz = u_xlat7.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_2.xyz = texture(_Light, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_LightUVType==0.0);
#else
    u_xlatb1 = _LightUVType==0.0;
#endif
    u_xlat6.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD1.xy : u_xlat6.xy;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat1.zw;
    vs_TEXCOORD4.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform 	vec4 _ShadowOffsets[4];
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _Mask;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec2 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat11;
bool u_xlatb11;
int u_xlati12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
lowp float u_xlat10_17;
bool u_xlatb17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat1.z) + 1.0;
        u_xlatb11 = u_xlat15>=1.0;
        u_xlatb16 = 0.0>=u_xlat15;
        u_xlatb11 = u_xlatb16 || u_xlatb11;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb11 = u_xlatb2.y || u_xlatb11;
        u_xlatb11 = u_xlatb2.z || u_xlatb11;
        if(u_xlatb11){
            u_xlat11 = 1.0;
        } else {
            u_xlatb16 = 0.0<_UsePCF;
            if(u_xlatb16){
                u_xlat16 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat3.x = float(u_xlati_loop_1);
                    u_xlat7.x = u_xlat16;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat3.y = float(u_xlati_loop_2);
                        u_xlat8.xy = u_xlat3.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_17 = texture2DLodEXT(_CustomShadowTex, u_xlat8.xy, 0.0).x;
                        u_xlat17 = (-u_xlat10_17) + 1.0;
                        u_xlatb17 = u_xlat15<u_xlat17;
                        u_xlat17 = (u_xlatb17) ? _CustomShadowStrength : 1.0;
                        u_xlat7.x = u_xlat17 + u_xlat7.x;
                    }
                    u_xlat16 = u_xlat7.x;
                }
                u_xlat11 = u_xlat16 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb15 = u_xlat15<u_xlat1.x;
                u_xlat11 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
        u_xlat2.xyz = u_xlat1.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat3.xyz = u_xlat1.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat3.xyz = u_xlat1.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat1.xyw = u_xlat1.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.w);
        u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat15 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat11 = u_xlat15 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat15 = u_xlat11 + -1.0;
    u_xlat15 = _ReceiveShadowsStrength * u_xlat15 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat7.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat3.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat4.xyz);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xxx;
    u_xlat0.xyz = u_xlat7.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_2.xyz = texture2D(_Light, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat10_1.xyz + u_xlat0.xyz;
    u_xlatb1 = _LightUVType==0.0;
    u_xlat6.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD1.xy : u_xlat6.xy;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_light_PW);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat1.zw;
    vs_TEXCOORD4.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform 	vec4 _ShadowOffsets[4];
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _Mask;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec2 u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat11;
bool u_xlatb11;
int u_xlati12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
lowp float u_xlat10_17;
bool u_xlatb17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat1.z) + 1.0;
        u_xlatb11 = u_xlat15>=1.0;
        u_xlatb16 = 0.0>=u_xlat15;
        u_xlatb11 = u_xlatb16 || u_xlatb11;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb11 = u_xlatb2.y || u_xlatb11;
        u_xlatb11 = u_xlatb2.z || u_xlatb11;
        if(u_xlatb11){
            u_xlat11 = 1.0;
        } else {
            u_xlatb16 = 0.0<_UsePCF;
            if(u_xlatb16){
                u_xlat16 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat3.x = float(u_xlati_loop_1);
                    u_xlat7.x = u_xlat16;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat3.y = float(u_xlati_loop_2);
                        u_xlat8.xy = u_xlat3.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_17 = texture2DLodEXT(_CustomShadowTex, u_xlat8.xy, 0.0).x;
                        u_xlat17 = (-u_xlat10_17) + 1.0;
                        u_xlatb17 = u_xlat15<u_xlat17;
                        u_xlat17 = (u_xlatb17) ? _CustomShadowStrength : 1.0;
                        u_xlat7.x = u_xlat17 + u_xlat7.x;
                    }
                    u_xlat16 = u_xlat7.x;
                }
                u_xlat11 = u_xlat16 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb15 = u_xlat15<u_xlat1.x;
                u_xlat11 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
        u_xlat2.xyz = u_xlat1.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat3.xyz = u_xlat1.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat3.xyz = u_xlat1.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat1.xyw = u_xlat1.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.w);
        u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat15 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat11 = u_xlat15 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat15 = u_xlat11 + -1.0;
    u_xlat15 = _ReceiveShadowsStrength * u_xlat15 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat7.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat3.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat4.xyz);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xxx;
    u_xlat0.xyz = u_xlat7.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_2.xyz = texture2D(_Light, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat10_1.xyz + u_xlat0.xyz;
    u_xlatb1 = _LightUVType==0.0;
    u_xlat6.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD1.xy : u_xlat6.xy;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_light_PW);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15) + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
UNITY_LOCATION(0) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _FogGradient;
UNITY_LOCATION(6) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat11;
bool u_xlatb11;
int u_xlati12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
mediump float u_xlat16_17;
bool u_xlatb17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat15>=1.0);
#else
        u_xlatb11 = u_xlat15>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb16 = !!(0.0>=u_xlat15);
#else
        u_xlatb16 = 0.0>=u_xlat15;
#endif
        u_xlatb11 = u_xlatb16 || u_xlatb11;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb11 = u_xlatb2.y || u_xlatb11;
        u_xlatb11 = u_xlatb2.z || u_xlatb11;
        if(u_xlatb11){
            u_xlat11 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb16 = !!(0.0<_UsePCF);
#else
            u_xlatb16 = 0.0<_UsePCF;
#endif
            if(u_xlatb16){
                u_xlat16 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat3.x = float(u_xlati_loop_1);
                    u_xlat7.x = u_xlat16;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat3.y = float(u_xlati_loop_2);
                        u_xlat8.xy = u_xlat3.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_17 = textureLod(_CustomShadowTex, u_xlat8.xy, 0.0).x;
                        u_xlat17 = (-u_xlat16_17) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb17 = !!(u_xlat15<u_xlat17);
#else
                        u_xlatb17 = u_xlat15<u_xlat17;
#endif
                        u_xlat17 = (u_xlatb17) ? _CustomShadowStrength : 1.0;
                        u_xlat7.x = u_xlat17 + u_xlat7.x;
                    }
                    u_xlat16 = u_xlat7.x;
                }
                u_xlat11 = u_xlat16 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb15 = !!(u_xlat15<u_xlat1.x);
#else
                u_xlatb15 = u_xlat15<u_xlat1.x;
#endif
                u_xlat11 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat11 = 1.0;
    }
    u_xlat15 = u_xlat11 + -1.0;
    u_xlat15 = _ReceiveShadowsStrength * u_xlat15 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat4.xyz);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat0.xyz = u_xlat7.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_2.xyz = texture(_Light, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat15 = -abs(u_xlat15) + _FogHightEnd;
    u_xlat1.x = (-_FogHightStart) + _FogHightEnd;
    u_xlat15 = u_xlat15 / u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat1.xyz = vec3(_CameraON) * u_xlat1.xyz + _FogPosition.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD2.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + _FogLinearEnd;
    u_xlat6.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat1.x = u_xlat1.x / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat15 * u_xlat1.x;
    u_xlat1.y = 0.5;
    u_xlat16_6.xyz = texture(_FogGradient, u_xlat1.xy).xyz;
    u_xlat6.xyz = _FogColor.xyz * u_xlat16_6.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat6.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(_LightUVType==0.0);
#else
    u_xlatb15 = _LightUVType==0.0;
#endif
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb15)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
UNITY_LOCATION(0) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _FogGradient;
UNITY_LOCATION(6) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat11;
bool u_xlatb11;
int u_xlati12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
mediump float u_xlat16_17;
bool u_xlatb17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat15>=1.0);
#else
        u_xlatb11 = u_xlat15>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb16 = !!(0.0>=u_xlat15);
#else
        u_xlatb16 = 0.0>=u_xlat15;
#endif
        u_xlatb11 = u_xlatb16 || u_xlatb11;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb11 = u_xlatb2.y || u_xlatb11;
        u_xlatb11 = u_xlatb2.z || u_xlatb11;
        if(u_xlatb11){
            u_xlat11 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb16 = !!(0.0<_UsePCF);
#else
            u_xlatb16 = 0.0<_UsePCF;
#endif
            if(u_xlatb16){
                u_xlat16 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat3.x = float(u_xlati_loop_1);
                    u_xlat7.x = u_xlat16;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat3.y = float(u_xlati_loop_2);
                        u_xlat8.xy = u_xlat3.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_17 = textureLod(_CustomShadowTex, u_xlat8.xy, 0.0).x;
                        u_xlat17 = (-u_xlat16_17) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb17 = !!(u_xlat15<u_xlat17);
#else
                        u_xlatb17 = u_xlat15<u_xlat17;
#endif
                        u_xlat17 = (u_xlatb17) ? _CustomShadowStrength : 1.0;
                        u_xlat7.x = u_xlat17 + u_xlat7.x;
                    }
                    u_xlat16 = u_xlat7.x;
                }
                u_xlat11 = u_xlat16 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb15 = !!(u_xlat15<u_xlat1.x);
#else
                u_xlatb15 = u_xlat15<u_xlat1.x;
#endif
                u_xlat11 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat11 = 1.0;
    }
    u_xlat15 = u_xlat11 + -1.0;
    u_xlat15 = _ReceiveShadowsStrength * u_xlat15 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat4.xyz);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat0.xyz = u_xlat7.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_2.xyz = texture(_Light, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat15 = -abs(u_xlat15) + _FogHightEnd;
    u_xlat1.x = (-_FogHightStart) + _FogHightEnd;
    u_xlat15 = u_xlat15 / u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat1.xyz = vec3(_CameraON) * u_xlat1.xyz + _FogPosition.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD2.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + _FogLinearEnd;
    u_xlat6.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat1.x = u_xlat1.x / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat15 * u_xlat1.x;
    u_xlat1.y = 0.5;
    u_xlat16_6.xyz = texture(_FogGradient, u_xlat1.xy).xyz;
    u_xlat6.xyz = _FogColor.xyz * u_xlat16_6.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat6.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(_LightUVType==0.0);
#else
    u_xlatb15 = _LightUVType==0.0;
#endif
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb15)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _FogGradient;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat11;
bool u_xlatb11;
int u_xlati12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
lowp float u_xlat10_17;
bool u_xlatb17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat1.z) + 1.0;
        u_xlatb11 = u_xlat15>=1.0;
        u_xlatb16 = 0.0>=u_xlat15;
        u_xlatb11 = u_xlatb16 || u_xlatb11;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb11 = u_xlatb2.y || u_xlatb11;
        u_xlatb11 = u_xlatb2.z || u_xlatb11;
        if(u_xlatb11){
            u_xlat11 = 1.0;
        } else {
            u_xlatb16 = 0.0<_UsePCF;
            if(u_xlatb16){
                u_xlat16 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat3.x = float(u_xlati_loop_1);
                    u_xlat7.x = u_xlat16;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat3.y = float(u_xlati_loop_2);
                        u_xlat8.xy = u_xlat3.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_17 = texture2DLodEXT(_CustomShadowTex, u_xlat8.xy, 0.0).x;
                        u_xlat17 = (-u_xlat10_17) + 1.0;
                        u_xlatb17 = u_xlat15<u_xlat17;
                        u_xlat17 = (u_xlatb17) ? _CustomShadowStrength : 1.0;
                        u_xlat7.x = u_xlat17 + u_xlat7.x;
                    }
                    u_xlat16 = u_xlat7.x;
                }
                u_xlat11 = u_xlat16 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb15 = u_xlat15<u_xlat1.x;
                u_xlat11 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat11 = 1.0;
    }
    u_xlat15 = u_xlat11 + -1.0;
    u_xlat15 = _ReceiveShadowsStrength * u_xlat15 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat7.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat3.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat4.xyz);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xxx;
    u_xlat0.xyz = u_xlat7.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_2.xyz = texture2D(_Light, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat10_1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat15 = -abs(u_xlat15) + _FogHightEnd;
    u_xlat1.x = (-_FogHightStart) + _FogHightEnd;
    u_xlat15 = u_xlat15 / u_xlat1.x;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat1.xyz = vec3(_CameraON) * u_xlat1.xyz + _FogPosition.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD2.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + _FogLinearEnd;
    u_xlat6.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat1.x = u_xlat1.x / u_xlat6.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat15 * u_xlat1.x;
    u_xlat1.y = 0.5;
    u_xlat10_6.xyz = texture2D(_FogGradient, u_xlat1.xy).xyz;
    u_xlat6.xyz = _FogColor.xyz * u_xlat10_6.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat6.xyz + u_xlat0.xyz;
    u_xlatb15 = _LightUVType==0.0;
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb15)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_light_PW);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _FogGradient;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat11;
bool u_xlatb11;
int u_xlati12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
lowp float u_xlat10_17;
bool u_xlatb17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat1.z) + 1.0;
        u_xlatb11 = u_xlat15>=1.0;
        u_xlatb16 = 0.0>=u_xlat15;
        u_xlatb11 = u_xlatb16 || u_xlatb11;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb11 = u_xlatb2.y || u_xlatb11;
        u_xlatb11 = u_xlatb2.z || u_xlatb11;
        if(u_xlatb11){
            u_xlat11 = 1.0;
        } else {
            u_xlatb16 = 0.0<_UsePCF;
            if(u_xlatb16){
                u_xlat16 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat3.x = float(u_xlati_loop_1);
                    u_xlat7.x = u_xlat16;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat3.y = float(u_xlati_loop_2);
                        u_xlat8.xy = u_xlat3.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_17 = texture2DLodEXT(_CustomShadowTex, u_xlat8.xy, 0.0).x;
                        u_xlat17 = (-u_xlat10_17) + 1.0;
                        u_xlatb17 = u_xlat15<u_xlat17;
                        u_xlat17 = (u_xlatb17) ? _CustomShadowStrength : 1.0;
                        u_xlat7.x = u_xlat17 + u_xlat7.x;
                    }
                    u_xlat16 = u_xlat7.x;
                }
                u_xlat11 = u_xlat16 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb15 = u_xlat15<u_xlat1.x;
                u_xlat11 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat11 = 1.0;
    }
    u_xlat15 = u_xlat11 + -1.0;
    u_xlat15 = _ReceiveShadowsStrength * u_xlat15 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat7.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat3.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat4.xyz);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xxx;
    u_xlat0.xyz = u_xlat7.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_2.xyz = texture2D(_Light, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat10_1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat15 = -abs(u_xlat15) + _FogHightEnd;
    u_xlat1.x = (-_FogHightStart) + _FogHightEnd;
    u_xlat15 = u_xlat15 / u_xlat1.x;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat1.xyz = vec3(_CameraON) * u_xlat1.xyz + _FogPosition.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD2.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + _FogLinearEnd;
    u_xlat6.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat1.x = u_xlat1.x / u_xlat6.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat15 * u_xlat1.x;
    u_xlat1.y = 0.5;
    u_xlat10_6.xyz = texture2D(_FogGradient, u_xlat1.xy).xyz;
    u_xlat6.xyz = _FogColor.xyz * u_xlat10_6.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat6.xyz + u_xlat0.xyz;
    u_xlatb15 = _LightUVType==0.0;
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb15)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_light_PW);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat1.zw;
    vs_TEXCOORD4.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform 	vec4 _ShadowOffsets[4];
UNITY_LOCATION(0) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _FogGradient;
UNITY_LOCATION(6) uniform mediump sampler2D _Mask;
UNITY_LOCATION(7) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(8) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat11;
bool u_xlatb11;
int u_xlati12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
mediump float u_xlat16_17;
bool u_xlatb17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat15>=1.0);
#else
        u_xlatb11 = u_xlat15>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb16 = !!(0.0>=u_xlat15);
#else
        u_xlatb16 = 0.0>=u_xlat15;
#endif
        u_xlatb11 = u_xlatb16 || u_xlatb11;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb11 = u_xlatb2.y || u_xlatb11;
        u_xlatb11 = u_xlatb2.z || u_xlatb11;
        if(u_xlatb11){
            u_xlat11 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb16 = !!(0.0<_UsePCF);
#else
            u_xlatb16 = 0.0<_UsePCF;
#endif
            if(u_xlatb16){
                u_xlat16 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat3.x = float(u_xlati_loop_1);
                    u_xlat7.x = u_xlat16;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat3.y = float(u_xlati_loop_2);
                        u_xlat8.xy = u_xlat3.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_17 = textureLod(_CustomShadowTex, u_xlat8.xy, 0.0).x;
                        u_xlat17 = (-u_xlat16_17) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb17 = !!(u_xlat15<u_xlat17);
#else
                        u_xlatb17 = u_xlat15<u_xlat17;
#endif
                        u_xlat17 = (u_xlatb17) ? _CustomShadowStrength : 1.0;
                        u_xlat7.x = u_xlat17 + u_xlat7.x;
                    }
                    u_xlat16 = u_xlat7.x;
                }
                u_xlat11 = u_xlat16 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb15 = !!(u_xlat15<u_xlat1.x);
#else
                u_xlatb15 = u_xlat15<u_xlat1.x;
#endif
                u_xlat11 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
        u_xlat2.xyz = u_xlat1.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat3.xyz = u_xlat1.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat3.xyz = u_xlat1.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat1.xyw = u_xlat1.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.w);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat15 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat11 = u_xlat15 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat15 = u_xlat11 + -1.0;
    u_xlat15 = _ReceiveShadowsStrength * u_xlat15 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat4.xyz);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat0.xyz = u_xlat7.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_2.xyz = texture(_Light, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat15 = -abs(u_xlat15) + _FogHightEnd;
    u_xlat1.x = (-_FogHightStart) + _FogHightEnd;
    u_xlat15 = u_xlat15 / u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat1.xyz = vec3(_CameraON) * u_xlat1.xyz + _FogPosition.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD2.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + _FogLinearEnd;
    u_xlat6.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat1.x = u_xlat1.x / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat15 * u_xlat1.x;
    u_xlat1.y = 0.5;
    u_xlat16_6.xyz = texture(_FogGradient, u_xlat1.xy).xyz;
    u_xlat6.xyz = _FogColor.xyz * u_xlat16_6.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat6.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(_LightUVType==0.0);
#else
    u_xlatb15 = _LightUVType==0.0;
#endif
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb15)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat1.zw;
    vs_TEXCOORD4.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform 	vec4 _ShadowOffsets[4];
UNITY_LOCATION(0) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _FogGradient;
UNITY_LOCATION(6) uniform mediump sampler2D _Mask;
UNITY_LOCATION(7) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(8) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat11;
bool u_xlatb11;
int u_xlati12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
mediump float u_xlat16_17;
bool u_xlatb17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat15>=1.0);
#else
        u_xlatb11 = u_xlat15>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb16 = !!(0.0>=u_xlat15);
#else
        u_xlatb16 = 0.0>=u_xlat15;
#endif
        u_xlatb11 = u_xlatb16 || u_xlatb11;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb11 = u_xlatb2.y || u_xlatb11;
        u_xlatb11 = u_xlatb2.z || u_xlatb11;
        if(u_xlatb11){
            u_xlat11 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb16 = !!(0.0<_UsePCF);
#else
            u_xlatb16 = 0.0<_UsePCF;
#endif
            if(u_xlatb16){
                u_xlat16 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat3.x = float(u_xlati_loop_1);
                    u_xlat7.x = u_xlat16;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat3.y = float(u_xlati_loop_2);
                        u_xlat8.xy = u_xlat3.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_17 = textureLod(_CustomShadowTex, u_xlat8.xy, 0.0).x;
                        u_xlat17 = (-u_xlat16_17) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb17 = !!(u_xlat15<u_xlat17);
#else
                        u_xlatb17 = u_xlat15<u_xlat17;
#endif
                        u_xlat17 = (u_xlatb17) ? _CustomShadowStrength : 1.0;
                        u_xlat7.x = u_xlat17 + u_xlat7.x;
                    }
                    u_xlat16 = u_xlat7.x;
                }
                u_xlat11 = u_xlat16 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb15 = !!(u_xlat15<u_xlat1.x);
#else
                u_xlatb15 = u_xlat15<u_xlat1.x;
#endif
                u_xlat11 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
        u_xlat2.xyz = u_xlat1.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat3.xyz = u_xlat1.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat3.xyz = u_xlat1.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat1.xyw = u_xlat1.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.w);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat15 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat11 = u_xlat15 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat15 = u_xlat11 + -1.0;
    u_xlat15 = _ReceiveShadowsStrength * u_xlat15 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat7.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat3.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat4.xyz);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat0.xyz = u_xlat7.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_2.xyz = texture(_Light, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat16_1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat15 = -abs(u_xlat15) + _FogHightEnd;
    u_xlat1.x = (-_FogHightStart) + _FogHightEnd;
    u_xlat15 = u_xlat15 / u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat1.xyz = vec3(_CameraON) * u_xlat1.xyz + _FogPosition.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD2.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + _FogLinearEnd;
    u_xlat6.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat1.x = u_xlat1.x / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat15 * u_xlat1.x;
    u_xlat1.y = 0.5;
    u_xlat16_6.xyz = texture(_FogGradient, u_xlat1.xy).xyz;
    u_xlat6.xyz = _FogColor.xyz * u_xlat16_6.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat6.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(_LightUVType==0.0);
#else
    u_xlatb15 = _LightUVType==0.0;
#endif
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb15)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat1.zw;
    vs_TEXCOORD4.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform 	vec4 _ShadowOffsets[4];
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _FogGradient;
uniform lowp sampler2D _Mask;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat11;
bool u_xlatb11;
int u_xlati12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
lowp float u_xlat10_17;
bool u_xlatb17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat1.z) + 1.0;
        u_xlatb11 = u_xlat15>=1.0;
        u_xlatb16 = 0.0>=u_xlat15;
        u_xlatb11 = u_xlatb16 || u_xlatb11;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb11 = u_xlatb2.y || u_xlatb11;
        u_xlatb11 = u_xlatb2.z || u_xlatb11;
        if(u_xlatb11){
            u_xlat11 = 1.0;
        } else {
            u_xlatb16 = 0.0<_UsePCF;
            if(u_xlatb16){
                u_xlat16 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat3.x = float(u_xlati_loop_1);
                    u_xlat7.x = u_xlat16;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat3.y = float(u_xlati_loop_2);
                        u_xlat8.xy = u_xlat3.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_17 = texture2DLodEXT(_CustomShadowTex, u_xlat8.xy, 0.0).x;
                        u_xlat17 = (-u_xlat10_17) + 1.0;
                        u_xlatb17 = u_xlat15<u_xlat17;
                        u_xlat17 = (u_xlatb17) ? _CustomShadowStrength : 1.0;
                        u_xlat7.x = u_xlat17 + u_xlat7.x;
                    }
                    u_xlat16 = u_xlat7.x;
                }
                u_xlat11 = u_xlat16 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb15 = u_xlat15<u_xlat1.x;
                u_xlat11 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
        u_xlat2.xyz = u_xlat1.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat3.xyz = u_xlat1.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat3.xyz = u_xlat1.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat1.xyw = u_xlat1.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.w);
        u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat15 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat11 = u_xlat15 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat15 = u_xlat11 + -1.0;
    u_xlat15 = _ReceiveShadowsStrength * u_xlat15 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat7.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat3.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat4.xyz);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xxx;
    u_xlat0.xyz = u_xlat7.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_2.xyz = texture2D(_Light, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat10_1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat15 = -abs(u_xlat15) + _FogHightEnd;
    u_xlat1.x = (-_FogHightStart) + _FogHightEnd;
    u_xlat15 = u_xlat15 / u_xlat1.x;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat1.xyz = vec3(_CameraON) * u_xlat1.xyz + _FogPosition.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD2.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + _FogLinearEnd;
    u_xlat6.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat1.x = u_xlat1.x / u_xlat6.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat15 * u_xlat1.x;
    u_xlat1.y = 0.5;
    u_xlat10_6.xyz = texture2D(_FogGradient, u_xlat1.xy).xyz;
    u_xlat6.xyz = _FogColor.xyz * u_xlat10_6.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat6.xyz + u_xlat0.xyz;
    u_xlatb15 = _LightUVType==0.0;
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb15)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_light_PW);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
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
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat1.zw;
    vs_TEXCOORD4.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD6 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform 	vec4 _ShadowOffsets[4];
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _FogGradient;
uniform lowp sampler2D _Mask;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
float u_xlat11;
bool u_xlatb11;
int u_xlati12;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
lowp float u_xlat10_17;
bool u_xlatb17;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
    u_xlatb15 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb15){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat15 = (-u_xlat1.z) + 1.0;
        u_xlatb11 = u_xlat15>=1.0;
        u_xlatb16 = 0.0>=u_xlat15;
        u_xlatb11 = u_xlatb16 || u_xlatb11;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb11 = u_xlatb11 || u_xlatb2.x;
        u_xlatb11 = u_xlatb2.y || u_xlatb11;
        u_xlatb11 = u_xlatb2.z || u_xlatb11;
        if(u_xlatb11){
            u_xlat11 = 1.0;
        } else {
            u_xlatb16 = 0.0<_UsePCF;
            if(u_xlatb16){
                u_xlat16 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat3.x = float(u_xlati_loop_1);
                    u_xlat7.x = u_xlat16;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat3.y = float(u_xlati_loop_2);
                        u_xlat8.xy = u_xlat3.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_17 = texture2DLodEXT(_CustomShadowTex, u_xlat8.xy, 0.0).x;
                        u_xlat17 = (-u_xlat10_17) + 1.0;
                        u_xlatb17 = u_xlat15<u_xlat17;
                        u_xlat17 = (u_xlatb17) ? _CustomShadowStrength : 1.0;
                        u_xlat7.x = u_xlat17 + u_xlat7.x;
                    }
                    u_xlat16 = u_xlat7.x;
                }
                u_xlat11 = u_xlat16 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb15 = u_xlat15<u_xlat1.x;
                u_xlat11 = (u_xlatb15) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD6.xyz / vs_TEXCOORD6.www;
        u_xlat2.xyz = u_xlat1.xyw + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat3.xyz = u_xlat1.xyw + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat3.xyz = u_xlat1.xyw + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
        u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat1.xyw = u_xlat1.xyw + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.w);
        u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat15 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat11 = u_xlat15 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat15 = u_xlat11 + -1.0;
    u_xlat15 = _ReceiveShadowsStrength * u_xlat15 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat7.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat3.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat4.xyz = u_xlat4.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat4.xyz);
    u_xlat3.xyz = u_xlat4.xyz * u_xlat3.xyz + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xxx;
    u_xlat0.xyz = u_xlat7.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_2.xyz = texture2D(_Light, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat10_1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat15 = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat15 = -abs(u_xlat15) + _FogHightEnd;
    u_xlat1.x = (-_FogHightStart) + _FogHightEnd;
    u_xlat15 = u_xlat15 / u_xlat1.x;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat1.xyz = vec3(_CameraON) * u_xlat1.xyz + _FogPosition.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD2.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + _FogLinearEnd;
    u_xlat6.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat1.x = u_xlat1.x / u_xlat6.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat15 * u_xlat1.x;
    u_xlat1.y = 0.5;
    u_xlat10_6.xyz = texture2D(_FogGradient, u_xlat1.xy).xyz;
    u_xlat6.xyz = _FogColor.xyz * u_xlat10_6.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat6.xyz + u_xlat0.xyz;
    u_xlatb15 = _LightUVType==0.0;
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb15)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_light_PW);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
UNITY_LOCATION(0) uniform mediump sampler2D _Diff;
UNITY_LOCATION(1) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _Light;
UNITY_LOCATION(4) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat9)) + (-u_xlat0.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_1.xy = texture(_Em_G_CU_R_MASK, u_xlat1.xy).xy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat1.xz = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xzw = texture(_Diff, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat16_1.xzw;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xzw + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_LightUVType==0.0);
#else
    u_xlatb9 = _LightUVType==0.0;
#endif
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb9)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_2.xyz = texture(_Light, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
UNITY_LOCATION(0) uniform mediump sampler2D _Diff;
UNITY_LOCATION(1) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _Light;
UNITY_LOCATION(4) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat9)) + (-u_xlat0.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_1.xy = texture(_Em_G_CU_R_MASK, u_xlat1.xy).xy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat1.xz = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xzw = texture(_Diff, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat16_1.xzw;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xzw + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_LightUVType==0.0);
#else
    u_xlatb9 = _LightUVType==0.0;
#endif
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb9)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_2.xyz = texture(_Light, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat9)) + (-u_xlat0.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_1.xy = texture2D(_Em_G_CU_R_MASK, u_xlat1.xy).xy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xxx;
    u_xlat1.xz = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xzw = texture2D(_Diff, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat10_1.yyy * u_xlat10_1.xzw;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat10_1.xzw + u_xlat0.xyz;
    u_xlatb9 = _LightUVType==0.0;
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb9)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_2.xyz = texture2D(_Light, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat9)) + (-u_xlat0.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_1.xy = texture2D(_Em_G_CU_R_MASK, u_xlat1.xy).xy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xxx;
    u_xlat1.xz = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xzw = texture2D(_Diff, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat10_1.yyy * u_xlat10_1.xzw;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat10_1.xzw + u_xlat0.xyz;
    u_xlatb9 = _LightUVType==0.0;
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb9)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_2.xyz = texture2D(_Light, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _Diff;
UNITY_LOCATION(1) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _Light;
UNITY_LOCATION(4) uniform mediump sampler2D _Mask;
UNITY_LOCATION(5) uniform highp sampler2D _ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump float u_xlat16_7;
float u_xlat8;
bool u_xlatb8;
mediump float u_xlat16_11;
bool u_xlatb13;
void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb13 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb13)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat5.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat5.x = (-u_xlat1.x) + u_xlat5.x;
    u_xlat0.z = _ShadowBias.y * u_xlat5.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat8 = texture(_ShadowMapTexture, u_xlat1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8>=u_xlat1.z);
#else
    u_xlatb8 = u_xlat8>=u_xlat1.z;
#endif
    u_xlat1.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat8 = texture(_ShadowMapTexture, u_xlat2.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8>=u_xlat2.z);
#else
    u_xlatb8 = u_xlat8>=u_xlat2.z;
#endif
    u_xlat1.y = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat8 = texture(_ShadowMapTexture, u_xlat2.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8>=u_xlat2.z);
#else
    u_xlatb8 = u_xlat8>=u_xlat2.z;
#endif
    u_xlat1.z = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat0.x = texture(_ShadowMapTexture, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=u_xlat0.z);
#else
    u_xlatb0 = u_xlat0.x>=u_xlat0.z;
#endif
    u_xlat1.w = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_3 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7 = (-_ShadowBias.w) + 1.0;
    u_xlat16_11 = (-u_xlat16_7) + 1.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_11 + u_xlat16_7;
    u_xlat0.x = u_xlat16_3 + -1.0;
    u_xlat0.x = _ReceiveShadowsStrength * u_xlat0.x + 1.0;
    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
    u_xlat1.x = dot((-u_xlat4.xyz), vs_TEXCOORD3.xyz);
    u_xlat1.x = u_xlat1.x + u_xlat1.x;
    u_xlat4.xyz = vs_TEXCOORD3.xyz * (-u_xlat1.xxx) + (-u_xlat4.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat4.xyz);
    u_xlat4.x = u_xlat4.y * 0.400000006 + 0.600000024;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat2.xyz = u_xlat2.xyz * vec3(_Cube_FW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_1.xy = texture(_Em_G_CU_R_MASK, u_xlat1.xy).xy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_1.xxx;
    u_xlat1.xz = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xzw = texture(_Diff, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat16_1.xzw;
    u_xlat4.xyz = u_xlat2.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_1.xzw + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_LightUVType==0.0);
#else
    u_xlatb1 = _LightUVType==0.0;
#endif
    u_xlat5.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD1.xy : u_xlat5.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_2.xyz = texture(_Light, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _Diff;
UNITY_LOCATION(1) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _Light;
UNITY_LOCATION(4) uniform mediump sampler2D _Mask;
UNITY_LOCATION(5) uniform highp sampler2D _ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump float u_xlat16_7;
float u_xlat8;
bool u_xlatb8;
mediump float u_xlat16_11;
bool u_xlatb13;
void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb13 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb13)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat5.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat5.x = (-u_xlat1.x) + u_xlat5.x;
    u_xlat0.z = _ShadowBias.y * u_xlat5.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat8 = texture(_ShadowMapTexture, u_xlat1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8>=u_xlat1.z);
#else
    u_xlatb8 = u_xlat8>=u_xlat1.z;
#endif
    u_xlat1.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat8 = texture(_ShadowMapTexture, u_xlat2.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8>=u_xlat2.z);
#else
    u_xlatb8 = u_xlat8>=u_xlat2.z;
#endif
    u_xlat1.y = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat8 = texture(_ShadowMapTexture, u_xlat2.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8>=u_xlat2.z);
#else
    u_xlatb8 = u_xlat8>=u_xlat2.z;
#endif
    u_xlat1.z = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat0.x = texture(_ShadowMapTexture, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=u_xlat0.z);
#else
    u_xlatb0 = u_xlat0.x>=u_xlat0.z;
#endif
    u_xlat1.w = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_3 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7 = (-_ShadowBias.w) + 1.0;
    u_xlat16_11 = (-u_xlat16_7) + 1.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_11 + u_xlat16_7;
    u_xlat0.x = u_xlat16_3 + -1.0;
    u_xlat0.x = _ReceiveShadowsStrength * u_xlat0.x + 1.0;
    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
    u_xlat1.x = dot((-u_xlat4.xyz), vs_TEXCOORD3.xyz);
    u_xlat1.x = u_xlat1.x + u_xlat1.x;
    u_xlat4.xyz = vs_TEXCOORD3.xyz * (-u_xlat1.xxx) + (-u_xlat4.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat4.xyz);
    u_xlat4.x = u_xlat4.y * 0.400000006 + 0.600000024;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat2.xyz = u_xlat2.xyz * vec3(_Cube_FW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_1.xy = texture(_Em_G_CU_R_MASK, u_xlat1.xy).xy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_1.xxx;
    u_xlat1.xz = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xzw = texture(_Diff, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat16_1.xzw;
    u_xlat4.xyz = u_xlat2.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_1.xzw + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_LightUVType==0.0);
#else
    u_xlatb1 = _LightUVType==0.0;
#endif
    u_xlat5.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD1.xy : u_xlat5.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_2.xyz = texture(_Light, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _Mask;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
mediump float u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump float u_xlat16_7;
float u_xlat8;
bool u_xlatb8;
mediump float u_xlat16_11;
bool u_xlatb13;
void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
    u_xlatb13 = _ShadowBias.z!=0.0;
    u_xlat1.xyz = (bool(u_xlatb13)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat5.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat5.x = (-u_xlat1.x) + u_xlat5.x;
    u_xlat0.z = _ShadowBias.y * u_xlat5.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat8 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb8 = u_xlat8>=u_xlat1.z;
    u_xlat1.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat8 = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb8 = u_xlat8>=u_xlat2.z;
    u_xlat1.y = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat8 = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb8 = u_xlat8>=u_xlat2.z;
    u_xlat1.z = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x>=u_xlat0.z;
    u_xlat1.w = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_3 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7 = (-_ShadowBias.w) + 1.0;
    u_xlat16_11 = (-u_xlat16_7) + 1.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_11 + u_xlat16_7;
    u_xlat0.x = u_xlat16_3 + -1.0;
    u_xlat0.x = _ReceiveShadowsStrength * u_xlat0.x + 1.0;
    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
    u_xlat1.x = dot((-u_xlat4.xyz), vs_TEXCOORD3.xyz);
    u_xlat1.x = u_xlat1.x + u_xlat1.x;
    u_xlat4.xyz = vs_TEXCOORD3.xyz * (-u_xlat1.xxx) + (-u_xlat4.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat4.xyz);
    u_xlat4.x = u_xlat4.y * 0.400000006 + 0.600000024;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat2.xyz = u_xlat2.xyz * vec3(_Cube_FW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_1.xy = texture2D(_Em_G_CU_R_MASK, u_xlat1.xy).xy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10_1.xxx;
    u_xlat1.xz = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xzw = texture2D(_Diff, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat10_1.yyy * u_xlat10_1.xzw;
    u_xlat4.xyz = u_xlat2.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_1.xzw + u_xlat4.xyz;
    u_xlatb1 = _LightUVType==0.0;
    u_xlat5.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD1.xy : u_xlat5.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_2.xyz = texture2D(_Light, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _Mask;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
mediump float u_xlat16_3;
vec3 u_xlat4;
vec2 u_xlat5;
mediump float u_xlat16_7;
float u_xlat8;
bool u_xlatb8;
mediump float u_xlat16_11;
bool u_xlatb13;
void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
    u_xlatb13 = _ShadowBias.z!=0.0;
    u_xlat1.xyz = (bool(u_xlatb13)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat5.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat5.x = (-u_xlat1.x) + u_xlat5.x;
    u_xlat0.z = _ShadowBias.y * u_xlat5.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat8 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb8 = u_xlat8>=u_xlat1.z;
    u_xlat1.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat8 = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb8 = u_xlat8>=u_xlat2.z;
    u_xlat1.y = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat8 = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb8 = u_xlat8>=u_xlat2.z;
    u_xlat1.z = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x>=u_xlat0.z;
    u_xlat1.w = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_3 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7 = (-_ShadowBias.w) + 1.0;
    u_xlat16_11 = (-u_xlat16_7) + 1.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_11 + u_xlat16_7;
    u_xlat0.x = u_xlat16_3 + -1.0;
    u_xlat0.x = _ReceiveShadowsStrength * u_xlat0.x + 1.0;
    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
    u_xlat1.x = dot((-u_xlat4.xyz), vs_TEXCOORD3.xyz);
    u_xlat1.x = u_xlat1.x + u_xlat1.x;
    u_xlat4.xyz = vs_TEXCOORD3.xyz * (-u_xlat1.xxx) + (-u_xlat4.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat4.xyz);
    u_xlat4.x = u_xlat4.y * 0.400000006 + 0.600000024;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat2.xyz = u_xlat2.xyz * vec3(_Cube_FW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_1.xy = texture2D(_Em_G_CU_R_MASK, u_xlat1.xy).xy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10_1.xxx;
    u_xlat1.xz = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xzw = texture2D(_Diff, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat10_1.yyy * u_xlat10_1.xzw;
    u_xlat4.xyz = u_xlat2.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_1.xzw + u_xlat4.xyz;
    u_xlatb1 = _LightUVType==0.0;
    u_xlat5.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb1)) ? vs_TEXCOORD1.xy : u_xlat5.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_2.xyz = texture2D(_Light, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_FOG_ON" }
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
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
UNITY_LOCATION(0) uniform mediump sampler2D _Diff;
UNITY_LOCATION(1) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _Light;
UNITY_LOCATION(4) uniform mediump sampler2D _FogGradient;
UNITY_LOCATION(5) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat9)) + (-u_xlat0.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_1.xy = texture(_Em_G_CU_R_MASK, u_xlat1.xy).xy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat1.xz = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xzw = texture(_Diff, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat16_1.xzw;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xzw + u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat1.xyz = vec3(_CameraON) * u_xlat1.xyz + _FogPosition.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD2.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = (-u_xlat9) + _FogLinearEnd;
    u_xlat1.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat9 = u_xlat9 / u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat1.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat1.x = -abs(u_xlat1.x) + _FogHightEnd;
    u_xlat4.x = (-_FogHightStart) + _FogHightEnd;
    u_xlat1.x = u_xlat1.x / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat9 * u_xlat1.x;
    u_xlat1.y = 0.5;
    u_xlat16_4.xyz = texture(_FogGradient, u_xlat1.xy).xyz;
    u_xlat4.xyz = _FogColor.xyz * u_xlat16_4.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_LightUVType==0.0);
#else
    u_xlatb9 = _LightUVType==0.0;
#endif
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb9)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_2.xyz = texture(_Light, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_FOG_ON" }
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
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
UNITY_LOCATION(0) uniform mediump sampler2D _Diff;
UNITY_LOCATION(1) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _Light;
UNITY_LOCATION(4) uniform mediump sampler2D _FogGradient;
UNITY_LOCATION(5) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat9)) + (-u_xlat0.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_1.xy = texture(_Em_G_CU_R_MASK, u_xlat1.xy).xy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat1.xz = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xzw = texture(_Diff, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat16_1.xzw;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xzw + u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat1.xyz = vec3(_CameraON) * u_xlat1.xyz + _FogPosition.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD2.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = (-u_xlat9) + _FogLinearEnd;
    u_xlat1.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat9 = u_xlat9 / u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat1.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat1.x = -abs(u_xlat1.x) + _FogHightEnd;
    u_xlat4.x = (-_FogHightStart) + _FogHightEnd;
    u_xlat1.x = u_xlat1.x / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat9 * u_xlat1.x;
    u_xlat1.y = 0.5;
    u_xlat16_4.xyz = texture(_FogGradient, u_xlat1.xy).xyz;
    u_xlat4.xyz = _FogColor.xyz * u_xlat16_4.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_LightUVType==0.0);
#else
    u_xlatb9 = _LightUVType==0.0;
#endif
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb9)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_2.xyz = texture(_Light, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_FOG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _FogGradient;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat9)) + (-u_xlat0.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_1.xy = texture2D(_Em_G_CU_R_MASK, u_xlat1.xy).xy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xxx;
    u_xlat1.xz = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xzw = texture2D(_Diff, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat10_1.yyy * u_xlat10_1.xzw;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat10_1.xzw + u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat1.xyz = vec3(_CameraON) * u_xlat1.xyz + _FogPosition.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD2.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = (-u_xlat9) + _FogLinearEnd;
    u_xlat1.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat9 = u_xlat9 / u_xlat1.x;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat1.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat1.x = -abs(u_xlat1.x) + _FogHightEnd;
    u_xlat4.x = (-_FogHightStart) + _FogHightEnd;
    u_xlat1.x = u_xlat1.x / u_xlat4.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat9 * u_xlat1.x;
    u_xlat1.y = 0.5;
    u_xlat10_4.xyz = texture2D(_FogGradient, u_xlat1.xy).xyz;
    u_xlat4.xyz = _FogColor.xyz * u_xlat10_4.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz + u_xlat0.xyz;
    u_xlatb9 = _LightUVType==0.0;
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb9)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_2.xyz = texture2D(_Light, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "_FOG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _FogGradient;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-u_xlat0.xyz), vs_TEXCOORD3.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * (-vec3(u_xlat9)) + (-u_xlat0.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat0.x = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat1.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Cube_FW);
    u_xlat3.xyz = u_xlat3.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_1.xy = texture2D(_Em_G_CU_R_MASK, u_xlat1.xy).xy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xxx;
    u_xlat1.xz = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xzw = texture2D(_Diff, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat10_1.yyy * u_xlat10_1.xzw;
    u_xlat0.xyz = u_xlat2.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat10_1.xzw + u_xlat0.xyz;
    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat1.xyz = vec3(_CameraON) * u_xlat1.xyz + _FogPosition.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD2.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = (-u_xlat9) + _FogLinearEnd;
    u_xlat1.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat9 = u_xlat9 / u_xlat1.x;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat1.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat1.x = -abs(u_xlat1.x) + _FogHightEnd;
    u_xlat4.x = (-_FogHightStart) + _FogHightEnd;
    u_xlat1.x = u_xlat1.x / u_xlat4.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat9 * u_xlat1.x;
    u_xlat1.y = 0.5;
    u_xlat10_4.xyz = texture2D(_FogGradient, u_xlat1.xy).xyz;
    u_xlat4.xyz = _FogColor.xyz * u_xlat10_4.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat4.xyz + u_xlat0.xyz;
    u_xlatb9 = _LightUVType==0.0;
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb9)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_2.xyz = texture2D(_Light, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_FOG_ON" }
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
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _Diff;
UNITY_LOCATION(1) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _Light;
UNITY_LOCATION(4) uniform mediump sampler2D _FogGradient;
UNITY_LOCATION(5) uniform mediump sampler2D _Mask;
UNITY_LOCATION(6) uniform highp sampler2D _ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_7;
float u_xlat8;
bool u_xlatb8;
mediump float u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
bool u_xlatb13;
void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb13 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb13)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat5.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat5.x = (-u_xlat1.x) + u_xlat5.x;
    u_xlat0.z = _ShadowBias.y * u_xlat5.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat8 = texture(_ShadowMapTexture, u_xlat1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8>=u_xlat1.z);
#else
    u_xlatb8 = u_xlat8>=u_xlat1.z;
#endif
    u_xlat1.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat8 = texture(_ShadowMapTexture, u_xlat2.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8>=u_xlat2.z);
#else
    u_xlatb8 = u_xlat8>=u_xlat2.z;
#endif
    u_xlat1.y = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat8 = texture(_ShadowMapTexture, u_xlat2.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8>=u_xlat2.z);
#else
    u_xlatb8 = u_xlat8>=u_xlat2.z;
#endif
    u_xlat1.z = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat0.x = texture(_ShadowMapTexture, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=u_xlat0.z);
#else
    u_xlatb0 = u_xlat0.x>=u_xlat0.z;
#endif
    u_xlat1.w = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_3 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7 = (-_ShadowBias.w) + 1.0;
    u_xlat16_11 = (-u_xlat16_7) + 1.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_11 + u_xlat16_7;
    u_xlat0.x = u_xlat16_3 + -1.0;
    u_xlat0.x = _ReceiveShadowsStrength * u_xlat0.x + 1.0;
    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
    u_xlat1.x = dot((-u_xlat4.xyz), vs_TEXCOORD3.xyz);
    u_xlat1.x = u_xlat1.x + u_xlat1.x;
    u_xlat4.xyz = vs_TEXCOORD3.xyz * (-u_xlat1.xxx) + (-u_xlat4.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat4.xyz);
    u_xlat4.x = u_xlat4.y * 0.400000006 + 0.600000024;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat2.xyz = u_xlat2.xyz * vec3(_Cube_FW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_1.xy = texture(_Em_G_CU_R_MASK, u_xlat1.xy).xy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_1.xxx;
    u_xlat1.xz = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xzw = texture(_Diff, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat16_1.xzw;
    u_xlat4.xyz = u_xlat2.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_1.xzw + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat1.xyz = vec3(_CameraON) * u_xlat1.xyz + _FogPosition.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD2.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat12 = (-u_xlat12) + _FogLinearEnd;
    u_xlat1.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat12 = u_xlat12 / u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat1.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat1.x = -abs(u_xlat1.x) + _FogHightEnd;
    u_xlat5.x = (-_FogHightStart) + _FogHightEnd;
    u_xlat1.x = u_xlat1.x / u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat12 * u_xlat1.x;
    u_xlat1.y = 0.5;
    u_xlat16_5.xyz = texture(_FogGradient, u_xlat1.xy).xyz;
    u_xlat5.xyz = _FogColor.xyz * u_xlat16_5.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat5.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(_LightUVType==0.0);
#else
    u_xlatb12 = _LightUVType==0.0;
#endif
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb12)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_2.xyz = texture(_Light, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_FOG_ON" }
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
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _Diff;
UNITY_LOCATION(1) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(2) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(3) uniform mediump sampler2D _Light;
UNITY_LOCATION(4) uniform mediump sampler2D _FogGradient;
UNITY_LOCATION(5) uniform mediump sampler2D _Mask;
UNITY_LOCATION(6) uniform highp sampler2D _ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_7;
float u_xlat8;
bool u_xlatb8;
mediump float u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
bool u_xlatb13;
void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb13 = _ShadowBias.z!=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb13)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat5.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat5.x = (-u_xlat1.x) + u_xlat5.x;
    u_xlat0.z = _ShadowBias.y * u_xlat5.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat8 = texture(_ShadowMapTexture, u_xlat1.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8>=u_xlat1.z);
#else
    u_xlatb8 = u_xlat8>=u_xlat1.z;
#endif
    u_xlat1.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat8 = texture(_ShadowMapTexture, u_xlat2.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8>=u_xlat2.z);
#else
    u_xlatb8 = u_xlat8>=u_xlat2.z;
#endif
    u_xlat1.y = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat8 = texture(_ShadowMapTexture, u_xlat2.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8>=u_xlat2.z);
#else
    u_xlatb8 = u_xlat8>=u_xlat2.z;
#endif
    u_xlat1.z = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat0.x = texture(_ShadowMapTexture, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=u_xlat0.z);
#else
    u_xlatb0 = u_xlat0.x>=u_xlat0.z;
#endif
    u_xlat1.w = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_3 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7 = (-_ShadowBias.w) + 1.0;
    u_xlat16_11 = (-u_xlat16_7) + 1.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_11 + u_xlat16_7;
    u_xlat0.x = u_xlat16_3 + -1.0;
    u_xlat0.x = _ReceiveShadowsStrength * u_xlat0.x + 1.0;
    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
    u_xlat1.x = dot((-u_xlat4.xyz), vs_TEXCOORD3.xyz);
    u_xlat1.x = u_xlat1.x + u_xlat1.x;
    u_xlat4.xyz = vs_TEXCOORD3.xyz * (-u_xlat1.xxx) + (-u_xlat4.xyz);
    u_xlat16_1 = texture(_Cubemap, u_xlat4.xyz);
    u_xlat4.x = u_xlat4.y * 0.400000006 + 0.600000024;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat2.xyz = u_xlat2.xyz * vec3(_Cube_FW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_1.xy = texture(_Em_G_CU_R_MASK, u_xlat1.xy).xy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_1.xxx;
    u_xlat1.xz = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xzw = texture(_Diff, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat16_1.yyy * u_xlat16_1.xzw;
    u_xlat4.xyz = u_xlat2.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_1.xzw + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat1.xyz = vec3(_CameraON) * u_xlat1.xyz + _FogPosition.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD2.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat12 = (-u_xlat12) + _FogLinearEnd;
    u_xlat1.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat12 = u_xlat12 / u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat1.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat1.x = -abs(u_xlat1.x) + _FogHightEnd;
    u_xlat5.x = (-_FogHightStart) + _FogHightEnd;
    u_xlat1.x = u_xlat1.x / u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat12 * u_xlat1.x;
    u_xlat1.y = 0.5;
    u_xlat16_5.xyz = texture(_FogGradient, u_xlat1.xy).xyz;
    u_xlat5.xyz = _FogColor.xyz * u_xlat16_5.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat5.xyz + u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(_LightUVType==0.0);
#else
    u_xlatb12 = _LightUVType==0.0;
#endif
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb12)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat16_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat16_1.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_2.xyz = texture(_Light, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_FOG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _FogGradient;
uniform lowp sampler2D _Mask;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
mediump float u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
mediump float u_xlat16_7;
float u_xlat8;
bool u_xlatb8;
mediump float u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
bool u_xlatb13;
void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
    u_xlatb13 = _ShadowBias.z!=0.0;
    u_xlat1.xyz = (bool(u_xlatb13)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat5.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat5.x = (-u_xlat1.x) + u_xlat5.x;
    u_xlat0.z = _ShadowBias.y * u_xlat5.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat8 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb8 = u_xlat8>=u_xlat1.z;
    u_xlat1.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat8 = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb8 = u_xlat8>=u_xlat2.z;
    u_xlat1.y = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat8 = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb8 = u_xlat8>=u_xlat2.z;
    u_xlat1.z = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x>=u_xlat0.z;
    u_xlat1.w = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_3 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7 = (-_ShadowBias.w) + 1.0;
    u_xlat16_11 = (-u_xlat16_7) + 1.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_11 + u_xlat16_7;
    u_xlat0.x = u_xlat16_3 + -1.0;
    u_xlat0.x = _ReceiveShadowsStrength * u_xlat0.x + 1.0;
    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
    u_xlat1.x = dot((-u_xlat4.xyz), vs_TEXCOORD3.xyz);
    u_xlat1.x = u_xlat1.x + u_xlat1.x;
    u_xlat4.xyz = vs_TEXCOORD3.xyz * (-u_xlat1.xxx) + (-u_xlat4.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat4.xyz);
    u_xlat4.x = u_xlat4.y * 0.400000006 + 0.600000024;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat2.xyz = u_xlat2.xyz * vec3(_Cube_FW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_1.xy = texture2D(_Em_G_CU_R_MASK, u_xlat1.xy).xy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10_1.xxx;
    u_xlat1.xz = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xzw = texture2D(_Diff, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat10_1.yyy * u_xlat10_1.xzw;
    u_xlat4.xyz = u_xlat2.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_1.xzw + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat1.xyz = vec3(_CameraON) * u_xlat1.xyz + _FogPosition.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD2.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat12 = (-u_xlat12) + _FogLinearEnd;
    u_xlat1.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat12 = u_xlat12 / u_xlat1.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat1.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat1.x = -abs(u_xlat1.x) + _FogHightEnd;
    u_xlat5.x = (-_FogHightStart) + _FogHightEnd;
    u_xlat1.x = u_xlat1.x / u_xlat5.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat12 * u_xlat1.x;
    u_xlat1.y = 0.5;
    u_xlat10_5.xyz = texture2D(_FogGradient, u_xlat1.xy).xyz;
    u_xlat5.xyz = _FogColor.xyz * u_xlat10_5.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat5.xyz + u_xlat0.xyz;
    u_xlatb12 = _LightUVType==0.0;
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb12)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_2.xyz = texture2D(_Light, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "MODE_CUSTOM" "SHADOWS_SCREEN" "_FOG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD2.xy;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Em_G_CU_R_MASK_ST;
uniform 	float _Cube_FW;
uniform 	float _Cube_power;
uniform 	float _ES_PW;
uniform 	float _ReceiveShadowsStrength;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform 	mediump float _LightUVType;
uniform 	mediump float _MaskScale;
uniform 	mediump float _MaskIntensity;
uniform 	vec4 _MaskOffset;
uniform 	vec4 _MaskColor;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _FogGradient;
uniform lowp sampler2D _Mask;
uniform highp sampler2D _ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
mediump float u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
mediump float u_xlat16_7;
float u_xlat8;
bool u_xlatb8;
mediump float u_xlat16_11;
float u_xlat12;
bool u_xlatb12;
bool u_xlatb13;
void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat0;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = (-u_xlat1.x) * u_xlat1.x + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _ShadowBias.z;
    u_xlat1.xyz = (-vs_TEXCOORD3.xyz) * u_xlat1.xxx + vs_TEXCOORD2.xyz;
    u_xlatb13 = _ShadowBias.z!=0.0;
    u_xlat1.xyz = (bool(u_xlatb13)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
    u_xlat0 = u_xlat0 * u_xlat1.yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.xxxx + u_xlat0;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat2;
    u_xlat0 = u_xlat2 * u_xlat1.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat1;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat5.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat5.x = (-u_xlat1.x) + u_xlat5.x;
    u_xlat0.z = _ShadowBias.y * u_xlat5.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    u_xlat8 = texture2D(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlatb8 = u_xlat8>=u_xlat1.z;
    u_xlat1.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat8 = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb8 = u_xlat8>=u_xlat2.z;
    u_xlat1.y = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat8 = texture2D(_ShadowMapTexture, u_xlat2.xy).x;
    u_xlatb8 = u_xlat8>=u_xlat2.z;
    u_xlat1.z = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    u_xlat0.x = texture2D(_ShadowMapTexture, u_xlat0.xy).x;
    u_xlatb0 = u_xlat0.x>=u_xlat0.z;
    u_xlat1.w = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_3 = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7 = (-_ShadowBias.w) + 1.0;
    u_xlat16_11 = (-u_xlat16_7) + 1.0;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_11 + u_xlat16_7;
    u_xlat0.x = u_xlat16_3 + -1.0;
    u_xlat0.x = _ReceiveShadowsStrength * u_xlat0.x + 1.0;
    u_xlat4.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xxx;
    u_xlat1.x = dot((-u_xlat4.xyz), vs_TEXCOORD3.xyz);
    u_xlat1.x = u_xlat1.x + u_xlat1.x;
    u_xlat4.xyz = vs_TEXCOORD3.xyz * (-u_xlat1.xxx) + (-u_xlat4.xyz);
    u_xlat10_1 = textureCube(_Cubemap, u_xlat4.xyz);
    u_xlat4.x = u_xlat4.y * 0.400000006 + 0.600000024;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat2.xyz = u_xlat2.xyz * vec3(_Cube_FW);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat2.xyz * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_1.xy = texture2D(_Em_G_CU_R_MASK, u_xlat1.xy).xy;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10_1.xxx;
    u_xlat1.xz = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xzw = texture2D(_Diff, u_xlat1.xz).xyz;
    u_xlat2.xyz = u_xlat10_1.yyy * u_xlat10_1.xzw;
    u_xlat4.xyz = u_xlat2.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_1.xzw + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat1.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat1.xyz = vec3(_CameraON) * u_xlat1.xyz + _FogPosition.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) + vs_TEXCOORD2.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat12 = (-u_xlat12) + _FogLinearEnd;
    u_xlat1.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat12 = u_xlat12 / u_xlat1.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat1.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat1.x = -abs(u_xlat1.x) + _FogHightEnd;
    u_xlat5.x = (-_FogHightStart) + _FogHightEnd;
    u_xlat1.x = u_xlat1.x / u_xlat5.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = u_xlat12 * u_xlat1.x;
    u_xlat1.y = 0.5;
    u_xlat10_5.xyz = texture2D(_FogGradient, u_xlat1.xy).xyz;
    u_xlat5.xyz = _FogColor.xyz * u_xlat10_5.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = u_xlat1.xxx * u_xlat5.xyz + u_xlat0.xyz;
    u_xlatb12 = _LightUVType==0.0;
    u_xlat1.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat1.xy = (bool(u_xlatb12)) ? vs_TEXCOORD1.xy : u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MaskScale) + _MaskOffset.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy);
    u_xlat1.xyz = u_xlat10_1.xyz * vec3(vec3(_MaskIntensity, _MaskIntensity, _MaskIntensity));
    u_xlat1.xyz = u_xlat1.xyz * _MaskColor.xyz;
    u_xlat1.xyz = u_xlat10_1.www * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD5.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_2.xyz = texture2D(_Light, u_xlat2.xy).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat1.xyz * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
  GpuProgramID 125023
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
CustomEditor "ShaderForgeMaterialInspector"
}