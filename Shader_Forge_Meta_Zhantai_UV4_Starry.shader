//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Shader Forge/Meta_Zhantai_UV4_Starry" {
Properties {

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

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "ForwardBase"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 ZWrite Off
  GpuProgramID 13359
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
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
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
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Light;
UNITY_LOCATION(6) uniform mediump sampler2D _StarryTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec3 u_xlatb2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
int u_xlati13;
vec2 u_xlat15;
mediump float u_xlat16_15;
bool u_xlatb15;
float u_xlat22;
float u_xlat23;
float u_xlat24;
bool u_xlatb24;
bool u_xlatb26;
vec2 u_xlat27;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
bool u_xlatb34;
float u_xlat35;
int u_xlati35;
bool u_xlatb35;
float u_xlat37;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat33 = u_xlat33 + u_xlat33;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat33)) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb1 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb1){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat23 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb34 = !!(u_xlat23>=1.0);
#else
        u_xlatb34 = u_xlat23>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb2.x = !!(0.0>=u_xlat23);
#else
        u_xlatb2.x = 0.0>=u_xlat23;
#endif
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb34 = u_xlatb2.y || u_xlatb34;
        u_xlatb34 = u_xlatb2.z || u_xlatb34;
        if(u_xlatb34){
            u_xlat34 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb2.x = !!(0.0<_UsePCF);
#else
            u_xlatb2.x = 0.0<_UsePCF;
#endif
            if(u_xlatb2.x){
                u_xlat2.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat24 = u_xlat2.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat15.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_15 = textureLod(_CustomShadowTex, u_xlat15.xy, 0.0).x;
                        u_xlat15.x = (-u_xlat16_15) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb15 = !!(u_xlat23<u_xlat15.x);
#else
                        u_xlatb15 = u_xlat23<u_xlat15.x;
#endif
                        u_xlat15.x = (u_xlatb15) ? _CustomShadowStrength : 1.0;
                        u_xlat24 = u_xlat24 + u_xlat15.x;
                    }
                    u_xlat2.x = u_xlat24;
                }
                u_xlat34 = u_xlat2.x * 0.111111112;
            } else {
                u_xlat16_1 = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb1 = !!(u_xlat23<u_xlat1.x);
#else
                u_xlatb1 = u_xlat23<u_xlat1.x;
#endif
                u_xlat34 = (u_xlatb1) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat34 = 1.0;
    }
    u_xlat1.x = u_xlat34 + -1.0;
    u_xlat1.x = _ReceiveShadowsStrength * u_xlat1.x + 1.0;
    u_xlat12.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_12.xyz = texture(_Diff, u_xlat12.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat13.xyz = u_xlat16_12.xyz * u_xlat16_2.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat5.xyz = u_xlat5.xyz * vec3(_Cube_FW);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat5.xyz);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat37 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_2.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat13.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_4.xyz = texture(_Light, u_xlat4.xy).xyz;
    u_xlat5.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat5.xy = u_xlat5.xy + (-vs_TEXCOORD0.xy);
    u_xlat5.xy = vec2(_IsScreenPos) * u_xlat5.xy + vs_TEXCOORD0.xy;
    u_xlat35 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat35 = u_xlat35 * _Time.y;
    u_xlat35 = cos(u_xlat35);
    u_xlat35 = sin(u_xlat35);
    u_xlat27.xy = vec2(u_xlat35) * _Starry_Speed.xxyz.yz + u_xlat5.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(_ViewDir==6.0);
#else
    u_xlatb35 = _ViewDir==6.0;
#endif
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat6.xyz = u_xlat0.xyz * vec3(u_xlat35);
    } else {
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat7.xyz = u_xlat0.xzy * vec3(u_xlat35);
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat8.xyz = u_xlat0.zyx * vec3(u_xlat35);
        u_xlat0.w = (-u_xlat0.z);
        u_xlat35 = dot(u_xlat0.xyw, u_xlat0.xyw);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat9.xyz = u_xlat0.xyw * vec3(u_xlat35);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat10.xyz = u_xlat0.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat33 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat10.xyz = vec3(u_xlat33) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb33 = !!(_ViewDir==1.0);
#else
        u_xlatb33 = _ViewDir==1.0;
#endif
        u_xlat0.xyz = u_xlat0.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat0.xyz = bool(u_xlatb33) ? u_xlat0.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat0.xyz = (u_xlatb3.w) ? u_xlat10.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.z) ? u_xlat9.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.y) ? u_xlat8.xyz : u_xlat0.xyz;
        u_xlat6.xyz = (u_xlatb3.x) ? u_xlat7.xyz : u_xlat0.xyz;
    }
    u_xlat0.x = u_xlat6.z + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.82842708;
    u_xlat0.xy = u_xlat6.xy / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale);
    u_xlat22 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat22 = u_xlat22 * 3.14159274;
    u_xlat6.x = sin(u_xlat22);
    u_xlat7.x = cos(u_xlat22);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat0.xy, u_xlat8.xy);
    u_xlat0.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_0.xyz = texture(_StarryTex, u_xlat0.xy).xyz;
    u_xlat5.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlat27.xy = (-u_xlat5.xy) + u_xlat27.xy;
    u_xlat5.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat27.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_5.xyz = texture(_StarryTex, u_xlat5.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_5.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat12.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat33 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat33 = sqrt(u_xlat33);
    u_xlat33 = u_xlat33 / _FogDistance;
    u_xlat2.x = max(_FogFade, 0.0);
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * u_xlat2.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = min(u_xlat33, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33);
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat0.xyz + u_xlat12.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _Alpha;
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
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
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
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Light;
UNITY_LOCATION(6) uniform mediump sampler2D _StarryTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bvec3 u_xlatb2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
int u_xlati13;
vec2 u_xlat15;
mediump float u_xlat16_15;
bool u_xlatb15;
float u_xlat22;
float u_xlat23;
float u_xlat24;
bool u_xlatb24;
bool u_xlatb26;
vec2 u_xlat27;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
bool u_xlatb34;
float u_xlat35;
int u_xlati35;
bool u_xlatb35;
float u_xlat37;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat33 = u_xlat33 + u_xlat33;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat33)) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb1 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb1){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat23 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb34 = !!(u_xlat23>=1.0);
#else
        u_xlatb34 = u_xlat23>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb2.x = !!(0.0>=u_xlat23);
#else
        u_xlatb2.x = 0.0>=u_xlat23;
#endif
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb34 = u_xlatb2.y || u_xlatb34;
        u_xlatb34 = u_xlatb2.z || u_xlatb34;
        if(u_xlatb34){
            u_xlat34 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb2.x = !!(0.0<_UsePCF);
#else
            u_xlatb2.x = 0.0<_UsePCF;
#endif
            if(u_xlatb2.x){
                u_xlat2.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat24 = u_xlat2.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat15.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_15 = textureLod(_CustomShadowTex, u_xlat15.xy, 0.0).x;
                        u_xlat15.x = (-u_xlat16_15) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb15 = !!(u_xlat23<u_xlat15.x);
#else
                        u_xlatb15 = u_xlat23<u_xlat15.x;
#endif
                        u_xlat15.x = (u_xlatb15) ? _CustomShadowStrength : 1.0;
                        u_xlat24 = u_xlat24 + u_xlat15.x;
                    }
                    u_xlat2.x = u_xlat24;
                }
                u_xlat34 = u_xlat2.x * 0.111111112;
            } else {
                u_xlat16_1 = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb1 = !!(u_xlat23<u_xlat1.x);
#else
                u_xlatb1 = u_xlat23<u_xlat1.x;
#endif
                u_xlat34 = (u_xlatb1) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat34 = 1.0;
    }
    u_xlat1.x = u_xlat34 + -1.0;
    u_xlat1.x = _ReceiveShadowsStrength * u_xlat1.x + 1.0;
    u_xlat12.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_12.xyz = texture(_Diff, u_xlat12.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat13.xyz = u_xlat16_12.xyz * u_xlat16_2.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat5.xyz = u_xlat5.xyz * vec3(_Cube_FW);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat5.xyz);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat37 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_2.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat13.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_4.xyz = texture(_Light, u_xlat4.xy).xyz;
    u_xlat5.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat5.xy = u_xlat5.xy + (-vs_TEXCOORD0.xy);
    u_xlat5.xy = vec2(_IsScreenPos) * u_xlat5.xy + vs_TEXCOORD0.xy;
    u_xlat35 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat35 = u_xlat35 * _Time.y;
    u_xlat35 = cos(u_xlat35);
    u_xlat35 = sin(u_xlat35);
    u_xlat27.xy = vec2(u_xlat35) * _Starry_Speed.xxyz.yz + u_xlat5.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(_ViewDir==6.0);
#else
    u_xlatb35 = _ViewDir==6.0;
#endif
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat6.xyz = u_xlat0.xyz * vec3(u_xlat35);
    } else {
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat7.xyz = u_xlat0.xzy * vec3(u_xlat35);
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat8.xyz = u_xlat0.zyx * vec3(u_xlat35);
        u_xlat0.w = (-u_xlat0.z);
        u_xlat35 = dot(u_xlat0.xyw, u_xlat0.xyw);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat9.xyz = u_xlat0.xyw * vec3(u_xlat35);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat10.xyz = u_xlat0.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat33 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat10.xyz = vec3(u_xlat33) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb33 = !!(_ViewDir==1.0);
#else
        u_xlatb33 = _ViewDir==1.0;
#endif
        u_xlat0.xyz = u_xlat0.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat0.xyz = bool(u_xlatb33) ? u_xlat0.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat0.xyz = (u_xlatb3.w) ? u_xlat10.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.z) ? u_xlat9.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.y) ? u_xlat8.xyz : u_xlat0.xyz;
        u_xlat6.xyz = (u_xlatb3.x) ? u_xlat7.xyz : u_xlat0.xyz;
    }
    u_xlat0.x = u_xlat6.z + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.82842708;
    u_xlat0.xy = u_xlat6.xy / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale);
    u_xlat22 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat22 = u_xlat22 * 3.14159274;
    u_xlat6.x = sin(u_xlat22);
    u_xlat7.x = cos(u_xlat22);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat0.xy, u_xlat8.xy);
    u_xlat0.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_0.xyz = texture(_StarryTex, u_xlat0.xy).xyz;
    u_xlat5.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlat27.xy = (-u_xlat5.xy) + u_xlat27.xy;
    u_xlat5.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat27.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_5.xyz = texture(_StarryTex, u_xlat5.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_5.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat12.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat33 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat33 = sqrt(u_xlat33);
    u_xlat33 = u_xlat33 / _FogDistance;
    u_xlat2.x = max(_FogFade, 0.0);
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * u_xlat2.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = min(u_xlat33, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33);
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat0.xyz + u_xlat12.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _Alpha;
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
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
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
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat12;
lowp vec3 u_xlat10_12;
vec3 u_xlat13;
int u_xlati13;
vec2 u_xlat15;
lowp float u_xlat10_15;
bool u_xlatb15;
float u_xlat22;
float u_xlat23;
float u_xlat24;
bool u_xlatb24;
bool u_xlatb26;
vec2 u_xlat27;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
bool u_xlatb34;
float u_xlat35;
int u_xlati35;
bool u_xlatb35;
float u_xlat37;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat33 = u_xlat33 + u_xlat33;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat33)) + (-u_xlat1.xyz);
    u_xlatb1 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb1){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat23 = (-u_xlat1.z) + 1.0;
        u_xlatb34 = u_xlat23>=1.0;
        u_xlatb2.x = 0.0>=u_xlat23;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb34 = u_xlatb2.y || u_xlatb34;
        u_xlatb34 = u_xlatb2.z || u_xlatb34;
        if(u_xlatb34){
            u_xlat34 = 1.0;
        } else {
            u_xlatb2.x = 0.0<_UsePCF;
            if(u_xlatb2.x){
                u_xlat2.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat24 = u_xlat2.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat15.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_15 = texture2DLodEXT(_CustomShadowTex, u_xlat15.xy, 0.0).x;
                        u_xlat15.x = (-u_xlat10_15) + 1.0;
                        u_xlatb15 = u_xlat23<u_xlat15.x;
                        u_xlat15.x = (u_xlatb15) ? _CustomShadowStrength : 1.0;
                        u_xlat24 = u_xlat24 + u_xlat15.x;
                    }
                    u_xlat2.x = u_xlat24;
                }
                u_xlat34 = u_xlat2.x * 0.111111112;
            } else {
                u_xlat10_1 = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1) + 1.0;
                u_xlatb1 = u_xlat23<u_xlat1.x;
                u_xlat34 = (u_xlatb1) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat34 = 1.0;
    }
    u_xlat1.x = u_xlat34 + -1.0;
    u_xlat1.x = _ReceiveShadowsStrength * u_xlat1.x + 1.0;
    u_xlat12.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_12.xyz = texture2D(_Diff, u_xlat12.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat13.xyz = u_xlat10_12.xyz * u_xlat10_2.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat5.xyz = u_xlat5.xyz * vec3(_Cube_FW);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat5.xyz);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat37 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_2.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat13.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_4.xyz = texture2D(_Light, u_xlat4.xy).xyz;
    u_xlat5.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat5.xy = u_xlat5.xy + (-vs_TEXCOORD0.xy);
    u_xlat5.xy = vec2(_IsScreenPos) * u_xlat5.xy + vs_TEXCOORD0.xy;
    u_xlat35 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat35 = u_xlat35 * _Time.y;
    u_xlat35 = cos(u_xlat35);
    u_xlat35 = sin(u_xlat35);
    u_xlat27.xy = vec2(u_xlat35) * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlatb35 = _ViewDir==6.0;
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat6.xyz = u_xlat0.xyz * vec3(u_xlat35);
    } else {
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat7.xyz = u_xlat0.xzy * vec3(u_xlat35);
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat8.xyz = u_xlat0.zyx * vec3(u_xlat35);
        u_xlat0.w = (-u_xlat0.z);
        u_xlat35 = dot(u_xlat0.xyw, u_xlat0.xyw);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat9.xyz = u_xlat0.xyw * vec3(u_xlat35);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat10.xyz = u_xlat0.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat33 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat10.xyz = vec3(u_xlat33) * u_xlat10.xyz;
        u_xlatb33 = _ViewDir==1.0;
        u_xlat0.xyz = u_xlat0.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat0.xyz = bool(u_xlatb33) ? u_xlat0.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat0.xyz = (u_xlatb3.w) ? u_xlat10.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.z) ? u_xlat9.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.y) ? u_xlat8.xyz : u_xlat0.xyz;
        u_xlat6.xyz = (u_xlatb3.x) ? u_xlat7.xyz : u_xlat0.xyz;
    }
    u_xlat0.x = u_xlat6.z + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.82842708;
    u_xlat0.xy = u_xlat6.xy / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale);
    u_xlat22 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat22 = u_xlat22 * 3.14159274;
    u_xlat6.x = sin(u_xlat22);
    u_xlat7.x = cos(u_xlat22);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat0.xy, u_xlat8.xy);
    u_xlat0.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat10_0.xyz = texture2D(_StarryTex, u_xlat0.xy).xyz;
    u_xlat5.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlat27.xy = (-u_xlat5.xy) + u_xlat27.xy;
    u_xlat5.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat27.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_5.xyz = texture2D(_StarryTex, u_xlat5.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat10_5.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat0.xyz + u_xlat10_5.xyz;
    u_xlat5.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat10_12.xyz * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat12.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat33 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat33 = sqrt(u_xlat33);
    u_xlat33 = u_xlat33 / _FogDistance;
    u_xlat2.x = max(_FogFade, 0.0);
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * u_xlat2.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = min(u_xlat33, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33);
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat0.xyz + u_xlat12.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _Alpha;
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
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
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
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat12;
lowp vec3 u_xlat10_12;
vec3 u_xlat13;
int u_xlati13;
vec2 u_xlat15;
lowp float u_xlat10_15;
bool u_xlatb15;
float u_xlat22;
float u_xlat23;
float u_xlat24;
bool u_xlatb24;
bool u_xlatb26;
vec2 u_xlat27;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
bool u_xlatb34;
float u_xlat35;
int u_xlati35;
bool u_xlatb35;
float u_xlat37;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat33 = u_xlat33 + u_xlat33;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat33)) + (-u_xlat1.xyz);
    u_xlatb1 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb1){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat23 = (-u_xlat1.z) + 1.0;
        u_xlatb34 = u_xlat23>=1.0;
        u_xlatb2.x = 0.0>=u_xlat23;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb34 = u_xlatb2.y || u_xlatb34;
        u_xlatb34 = u_xlatb2.z || u_xlatb34;
        if(u_xlatb34){
            u_xlat34 = 1.0;
        } else {
            u_xlatb2.x = 0.0<_UsePCF;
            if(u_xlatb2.x){
                u_xlat2.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat24 = u_xlat2.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat15.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_15 = texture2DLodEXT(_CustomShadowTex, u_xlat15.xy, 0.0).x;
                        u_xlat15.x = (-u_xlat10_15) + 1.0;
                        u_xlatb15 = u_xlat23<u_xlat15.x;
                        u_xlat15.x = (u_xlatb15) ? _CustomShadowStrength : 1.0;
                        u_xlat24 = u_xlat24 + u_xlat15.x;
                    }
                    u_xlat2.x = u_xlat24;
                }
                u_xlat34 = u_xlat2.x * 0.111111112;
            } else {
                u_xlat10_1 = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1) + 1.0;
                u_xlatb1 = u_xlat23<u_xlat1.x;
                u_xlat34 = (u_xlatb1) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat34 = 1.0;
    }
    u_xlat1.x = u_xlat34 + -1.0;
    u_xlat1.x = _ReceiveShadowsStrength * u_xlat1.x + 1.0;
    u_xlat12.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_12.xyz = texture2D(_Diff, u_xlat12.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat13.xyz = u_xlat10_12.xyz * u_xlat10_2.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat5.xyz = u_xlat5.xyz * vec3(_Cube_FW);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat5.xyz);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat37 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_2.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat13.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_4.xyz = texture2D(_Light, u_xlat4.xy).xyz;
    u_xlat5.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat5.xy = u_xlat5.xy + (-vs_TEXCOORD0.xy);
    u_xlat5.xy = vec2(_IsScreenPos) * u_xlat5.xy + vs_TEXCOORD0.xy;
    u_xlat35 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat35 = u_xlat35 * _Time.y;
    u_xlat35 = cos(u_xlat35);
    u_xlat35 = sin(u_xlat35);
    u_xlat27.xy = vec2(u_xlat35) * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlatb35 = _ViewDir==6.0;
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat6.xyz = u_xlat0.xyz * vec3(u_xlat35);
    } else {
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat7.xyz = u_xlat0.xzy * vec3(u_xlat35);
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat8.xyz = u_xlat0.zyx * vec3(u_xlat35);
        u_xlat0.w = (-u_xlat0.z);
        u_xlat35 = dot(u_xlat0.xyw, u_xlat0.xyw);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat9.xyz = u_xlat0.xyw * vec3(u_xlat35);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat10.xyz = u_xlat0.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat33 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat10.xyz = vec3(u_xlat33) * u_xlat10.xyz;
        u_xlatb33 = _ViewDir==1.0;
        u_xlat0.xyz = u_xlat0.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat0.xyz = bool(u_xlatb33) ? u_xlat0.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat0.xyz = (u_xlatb3.w) ? u_xlat10.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.z) ? u_xlat9.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.y) ? u_xlat8.xyz : u_xlat0.xyz;
        u_xlat6.xyz = (u_xlatb3.x) ? u_xlat7.xyz : u_xlat0.xyz;
    }
    u_xlat0.x = u_xlat6.z + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.82842708;
    u_xlat0.xy = u_xlat6.xy / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale);
    u_xlat22 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat22 = u_xlat22 * 3.14159274;
    u_xlat6.x = sin(u_xlat22);
    u_xlat7.x = cos(u_xlat22);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat0.xy, u_xlat8.xy);
    u_xlat0.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat10_0.xyz = texture2D(_StarryTex, u_xlat0.xy).xyz;
    u_xlat5.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlat27.xy = (-u_xlat5.xy) + u_xlat27.xy;
    u_xlat5.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat27.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_5.xyz = texture2D(_StarryTex, u_xlat5.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat10_5.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat0.xyz + u_xlat10_5.xyz;
    u_xlat5.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat10_12.xyz * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat12.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat33 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat33 = sqrt(u_xlat33);
    u_xlat33 = u_xlat33 / _FogDistance;
    u_xlat2.x = max(_FogFade, 0.0);
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * u_xlat2.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = min(u_xlat33, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33);
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat0.xyz + u_xlat12.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _Alpha;
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
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat17;
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
    vs_TEXCOORD2 = u_xlat0;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat17 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    vs_TEXCOORD5.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD7 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
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
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Light;
UNITY_LOCATION(6) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(7) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(8) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec3 u_xlatb2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
int u_xlati13;
vec2 u_xlat15;
mediump float u_xlat16_15;
bool u_xlatb15;
float u_xlat22;
float u_xlat23;
float u_xlat24;
bool u_xlatb24;
bool u_xlatb26;
vec2 u_xlat27;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
bool u_xlatb34;
float u_xlat35;
int u_xlati35;
bool u_xlatb35;
float u_xlat37;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat33 = u_xlat33 + u_xlat33;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat33)) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb1 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb1){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat23 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb34 = !!(u_xlat23>=1.0);
#else
        u_xlatb34 = u_xlat23>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb2.x = !!(0.0>=u_xlat23);
#else
        u_xlatb2.x = 0.0>=u_xlat23;
#endif
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb34 = u_xlatb2.y || u_xlatb34;
        u_xlatb34 = u_xlatb2.z || u_xlatb34;
        if(u_xlatb34){
            u_xlat34 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb2.x = !!(0.0<_UsePCF);
#else
            u_xlatb2.x = 0.0<_UsePCF;
#endif
            if(u_xlatb2.x){
                u_xlat2.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat24 = u_xlat2.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat15.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_15 = textureLod(_CustomShadowTex, u_xlat15.xy, 0.0).x;
                        u_xlat15.x = (-u_xlat16_15) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb15 = !!(u_xlat23<u_xlat15.x);
#else
                        u_xlatb15 = u_xlat23<u_xlat15.x;
#endif
                        u_xlat15.x = (u_xlatb15) ? _CustomShadowStrength : 1.0;
                        u_xlat24 = u_xlat24 + u_xlat15.x;
                    }
                    u_xlat2.x = u_xlat24;
                }
                u_xlat34 = u_xlat2.x * 0.111111112;
            } else {
                u_xlat16_1 = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb1 = !!(u_xlat23<u_xlat1.x);
#else
                u_xlatb1 = u_xlat23<u_xlat1.x;
#endif
                u_xlat34 = (u_xlatb1) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyz = vs_TEXCOORD7.xyz / vs_TEXCOORD7.www;
        u_xlat2.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.z);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat1.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat12.x = (-_LightShadowData.x) + 1.0;
        u_xlat34 = u_xlat1.x * u_xlat12.x + _LightShadowData.x;
    }
    u_xlat1.x = u_xlat34 + -1.0;
    u_xlat1.x = _ReceiveShadowsStrength * u_xlat1.x + 1.0;
    u_xlat12.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_12.xyz = texture(_Diff, u_xlat12.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat13.xyz = u_xlat16_12.xyz * u_xlat16_2.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat5.xyz = u_xlat5.xyz * vec3(_Cube_FW);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat5.xyz);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat37 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_2.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat13.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_4.xyz = texture(_Light, u_xlat4.xy).xyz;
    u_xlat5.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat5.xy = u_xlat5.xy + (-vs_TEXCOORD0.xy);
    u_xlat5.xy = vec2(_IsScreenPos) * u_xlat5.xy + vs_TEXCOORD0.xy;
    u_xlat35 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat35 = u_xlat35 * _Time.y;
    u_xlat35 = cos(u_xlat35);
    u_xlat35 = sin(u_xlat35);
    u_xlat27.xy = vec2(u_xlat35) * _Starry_Speed.xxyz.yz + u_xlat5.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(_ViewDir==6.0);
#else
    u_xlatb35 = _ViewDir==6.0;
#endif
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat6.xyz = u_xlat0.xyz * vec3(u_xlat35);
    } else {
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat7.xyz = u_xlat0.xzy * vec3(u_xlat35);
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat8.xyz = u_xlat0.zyx * vec3(u_xlat35);
        u_xlat0.w = (-u_xlat0.z);
        u_xlat35 = dot(u_xlat0.xyw, u_xlat0.xyw);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat9.xyz = u_xlat0.xyw * vec3(u_xlat35);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat10.xyz = u_xlat0.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat33 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat10.xyz = vec3(u_xlat33) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb33 = !!(_ViewDir==1.0);
#else
        u_xlatb33 = _ViewDir==1.0;
#endif
        u_xlat0.xyz = u_xlat0.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat0.xyz = bool(u_xlatb33) ? u_xlat0.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat0.xyz = (u_xlatb3.w) ? u_xlat10.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.z) ? u_xlat9.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.y) ? u_xlat8.xyz : u_xlat0.xyz;
        u_xlat6.xyz = (u_xlatb3.x) ? u_xlat7.xyz : u_xlat0.xyz;
    }
    u_xlat0.x = u_xlat6.z + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.82842708;
    u_xlat0.xy = u_xlat6.xy / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale);
    u_xlat22 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat22 = u_xlat22 * 3.14159274;
    u_xlat6.x = sin(u_xlat22);
    u_xlat7.x = cos(u_xlat22);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat0.xy, u_xlat8.xy);
    u_xlat0.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_0.xyz = texture(_StarryTex, u_xlat0.xy).xyz;
    u_xlat5.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlat27.xy = (-u_xlat5.xy) + u_xlat27.xy;
    u_xlat5.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat27.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_5.xyz = texture(_StarryTex, u_xlat5.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_5.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat12.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat33 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat33 = sqrt(u_xlat33);
    u_xlat33 = u_xlat33 / _FogDistance;
    u_xlat2.x = max(_FogFade, 0.0);
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * u_xlat2.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = min(u_xlat33, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33);
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat0.xyz + u_xlat12.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _Alpha;
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
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat17;
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
    vs_TEXCOORD2 = u_xlat0;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat17 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    vs_TEXCOORD5.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD7 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
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
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Light;
UNITY_LOCATION(6) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(7) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(8) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bvec3 u_xlatb2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
int u_xlati13;
vec2 u_xlat15;
mediump float u_xlat16_15;
bool u_xlatb15;
float u_xlat22;
float u_xlat23;
float u_xlat24;
bool u_xlatb24;
bool u_xlatb26;
vec2 u_xlat27;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
bool u_xlatb34;
float u_xlat35;
int u_xlati35;
bool u_xlatb35;
float u_xlat37;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat33 = u_xlat33 + u_xlat33;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat33)) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb1 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb1){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat23 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb34 = !!(u_xlat23>=1.0);
#else
        u_xlatb34 = u_xlat23>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb2.x = !!(0.0>=u_xlat23);
#else
        u_xlatb2.x = 0.0>=u_xlat23;
#endif
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb34 = u_xlatb2.y || u_xlatb34;
        u_xlatb34 = u_xlatb2.z || u_xlatb34;
        if(u_xlatb34){
            u_xlat34 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb2.x = !!(0.0<_UsePCF);
#else
            u_xlatb2.x = 0.0<_UsePCF;
#endif
            if(u_xlatb2.x){
                u_xlat2.x = float(0.0);
                for(int u_xlati_loop_1 = int(int(0xFFFFFFFFu)) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat24 = u_xlat2.x;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat15.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_15 = textureLod(_CustomShadowTex, u_xlat15.xy, 0.0).x;
                        u_xlat15.x = (-u_xlat16_15) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb15 = !!(u_xlat23<u_xlat15.x);
#else
                        u_xlatb15 = u_xlat23<u_xlat15.x;
#endif
                        u_xlat15.x = (u_xlatb15) ? _CustomShadowStrength : 1.0;
                        u_xlat24 = u_xlat24 + u_xlat15.x;
                    }
                    u_xlat2.x = u_xlat24;
                }
                u_xlat34 = u_xlat2.x * 0.111111112;
            } else {
                u_xlat16_1 = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb1 = !!(u_xlat23<u_xlat1.x);
#else
                u_xlatb1 = u_xlat23<u_xlat1.x;
#endif
                u_xlat34 = (u_xlatb1) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyz = vs_TEXCOORD7.xyz / vs_TEXCOORD7.www;
        u_xlat2.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.z);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat1.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat12.x = (-_LightShadowData.x) + 1.0;
        u_xlat34 = u_xlat1.x * u_xlat12.x + _LightShadowData.x;
    }
    u_xlat1.x = u_xlat34 + -1.0;
    u_xlat1.x = _ReceiveShadowsStrength * u_xlat1.x + 1.0;
    u_xlat12.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_12.xyz = texture(_Diff, u_xlat12.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat13.xyz = u_xlat16_12.xyz * u_xlat16_2.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat5.xyz = u_xlat5.xyz * vec3(_Cube_FW);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat5.xyz);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat37 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_2.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat13.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_4.xyz = texture(_Light, u_xlat4.xy).xyz;
    u_xlat5.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat5.xy = u_xlat5.xy + (-vs_TEXCOORD0.xy);
    u_xlat5.xy = vec2(_IsScreenPos) * u_xlat5.xy + vs_TEXCOORD0.xy;
    u_xlat35 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat35 = u_xlat35 * _Time.y;
    u_xlat35 = cos(u_xlat35);
    u_xlat35 = sin(u_xlat35);
    u_xlat27.xy = vec2(u_xlat35) * _Starry_Speed.xxyz.yz + u_xlat5.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(_ViewDir==6.0);
#else
    u_xlatb35 = _ViewDir==6.0;
#endif
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat6.xyz = u_xlat0.xyz * vec3(u_xlat35);
    } else {
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat7.xyz = u_xlat0.xzy * vec3(u_xlat35);
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat8.xyz = u_xlat0.zyx * vec3(u_xlat35);
        u_xlat0.w = (-u_xlat0.z);
        u_xlat35 = dot(u_xlat0.xyw, u_xlat0.xyw);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat9.xyz = u_xlat0.xyw * vec3(u_xlat35);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat10.xyz = u_xlat0.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat33 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat10.xyz = vec3(u_xlat33) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb33 = !!(_ViewDir==1.0);
#else
        u_xlatb33 = _ViewDir==1.0;
#endif
        u_xlat0.xyz = u_xlat0.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat0.xyz = bool(u_xlatb33) ? u_xlat0.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat0.xyz = (u_xlatb3.w) ? u_xlat10.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.z) ? u_xlat9.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.y) ? u_xlat8.xyz : u_xlat0.xyz;
        u_xlat6.xyz = (u_xlatb3.x) ? u_xlat7.xyz : u_xlat0.xyz;
    }
    u_xlat0.x = u_xlat6.z + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.82842708;
    u_xlat0.xy = u_xlat6.xy / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale);
    u_xlat22 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat22 = u_xlat22 * 3.14159274;
    u_xlat6.x = sin(u_xlat22);
    u_xlat7.x = cos(u_xlat22);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat0.xy, u_xlat8.xy);
    u_xlat0.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_0.xyz = texture(_StarryTex, u_xlat0.xy).xyz;
    u_xlat5.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlat27.xy = (-u_xlat5.xy) + u_xlat27.xy;
    u_xlat5.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat27.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_5.xyz = texture(_StarryTex, u_xlat5.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_5.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat16_12.xyz * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat12.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat33 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat33 = sqrt(u_xlat33);
    u_xlat33 = u_xlat33 / _FogDistance;
    u_xlat2.x = max(_FogFade, 0.0);
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * u_xlat2.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = min(u_xlat33, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33);
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat0.xyz + u_xlat12.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _Alpha;
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
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat17;
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
    vs_TEXCOORD2 = u_xlat0;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat17 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    vs_TEXCOORD5.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD7 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
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
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
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
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat12;
lowp vec3 u_xlat10_12;
vec3 u_xlat13;
int u_xlati13;
vec2 u_xlat15;
lowp float u_xlat10_15;
bool u_xlatb15;
float u_xlat22;
float u_xlat23;
float u_xlat24;
bool u_xlatb24;
bool u_xlatb26;
vec2 u_xlat27;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
bool u_xlatb34;
float u_xlat35;
int u_xlati35;
bool u_xlatb35;
float u_xlat37;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat33 = u_xlat33 + u_xlat33;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat33)) + (-u_xlat1.xyz);
    u_xlatb1 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb1){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat23 = (-u_xlat1.z) + 1.0;
        u_xlatb34 = u_xlat23>=1.0;
        u_xlatb2.x = 0.0>=u_xlat23;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb34 = u_xlatb2.y || u_xlatb34;
        u_xlatb34 = u_xlatb2.z || u_xlatb34;
        if(u_xlatb34){
            u_xlat34 = 1.0;
        } else {
            u_xlatb2.x = 0.0<_UsePCF;
            if(u_xlatb2.x){
                u_xlat2.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat24 = u_xlat2.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat15.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_15 = texture2DLodEXT(_CustomShadowTex, u_xlat15.xy, 0.0).x;
                        u_xlat15.x = (-u_xlat10_15) + 1.0;
                        u_xlatb15 = u_xlat23<u_xlat15.x;
                        u_xlat15.x = (u_xlatb15) ? _CustomShadowStrength : 1.0;
                        u_xlat24 = u_xlat24 + u_xlat15.x;
                    }
                    u_xlat2.x = u_xlat24;
                }
                u_xlat34 = u_xlat2.x * 0.111111112;
            } else {
                u_xlat10_1 = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1) + 1.0;
                u_xlatb1 = u_xlat23<u_xlat1.x;
                u_xlat34 = (u_xlatb1) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyz = vs_TEXCOORD7.xyz / vs_TEXCOORD7.www;
        u_xlat2.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.z);
        u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat1.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat12.x = (-_LightShadowData.x) + 1.0;
        u_xlat34 = u_xlat1.x * u_xlat12.x + _LightShadowData.x;
    }
    u_xlat1.x = u_xlat34 + -1.0;
    u_xlat1.x = _ReceiveShadowsStrength * u_xlat1.x + 1.0;
    u_xlat12.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_12.xyz = texture2D(_Diff, u_xlat12.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat13.xyz = u_xlat10_12.xyz * u_xlat10_2.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat5.xyz = u_xlat5.xyz * vec3(_Cube_FW);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat5.xyz);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat37 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_2.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat13.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_4.xyz = texture2D(_Light, u_xlat4.xy).xyz;
    u_xlat5.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat5.xy = u_xlat5.xy + (-vs_TEXCOORD0.xy);
    u_xlat5.xy = vec2(_IsScreenPos) * u_xlat5.xy + vs_TEXCOORD0.xy;
    u_xlat35 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat35 = u_xlat35 * _Time.y;
    u_xlat35 = cos(u_xlat35);
    u_xlat35 = sin(u_xlat35);
    u_xlat27.xy = vec2(u_xlat35) * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlatb35 = _ViewDir==6.0;
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat6.xyz = u_xlat0.xyz * vec3(u_xlat35);
    } else {
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat7.xyz = u_xlat0.xzy * vec3(u_xlat35);
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat8.xyz = u_xlat0.zyx * vec3(u_xlat35);
        u_xlat0.w = (-u_xlat0.z);
        u_xlat35 = dot(u_xlat0.xyw, u_xlat0.xyw);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat9.xyz = u_xlat0.xyw * vec3(u_xlat35);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat10.xyz = u_xlat0.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat33 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat10.xyz = vec3(u_xlat33) * u_xlat10.xyz;
        u_xlatb33 = _ViewDir==1.0;
        u_xlat0.xyz = u_xlat0.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat0.xyz = bool(u_xlatb33) ? u_xlat0.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat0.xyz = (u_xlatb3.w) ? u_xlat10.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.z) ? u_xlat9.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.y) ? u_xlat8.xyz : u_xlat0.xyz;
        u_xlat6.xyz = (u_xlatb3.x) ? u_xlat7.xyz : u_xlat0.xyz;
    }
    u_xlat0.x = u_xlat6.z + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.82842708;
    u_xlat0.xy = u_xlat6.xy / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale);
    u_xlat22 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat22 = u_xlat22 * 3.14159274;
    u_xlat6.x = sin(u_xlat22);
    u_xlat7.x = cos(u_xlat22);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat0.xy, u_xlat8.xy);
    u_xlat0.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat10_0.xyz = texture2D(_StarryTex, u_xlat0.xy).xyz;
    u_xlat5.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlat27.xy = (-u_xlat5.xy) + u_xlat27.xy;
    u_xlat5.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat27.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_5.xyz = texture2D(_StarryTex, u_xlat5.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat10_5.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat0.xyz + u_xlat10_5.xyz;
    u_xlat5.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat10_12.xyz * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat12.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat33 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat33 = sqrt(u_xlat33);
    u_xlat33 = u_xlat33 / _FogDistance;
    u_xlat2.x = max(_FogFade, 0.0);
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * u_xlat2.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = min(u_xlat33, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33);
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat0.xyz + u_xlat12.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _Alpha;
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
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat17;
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
    vs_TEXCOORD2 = u_xlat0;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat17 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    vs_TEXCOORD5.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD7 = hlslcc_mtx4x4unity_WorldToShadow[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _CustomShadowTex_TexelSize;
uniform 	vec4 hlslcc_mtx4x4_CustomShadowMatrix[4];
uniform 	float _CustomShadowStrength;
uniform 	float _UsePCF;
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
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
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
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat12;
lowp vec3 u_xlat10_12;
vec3 u_xlat13;
int u_xlati13;
vec2 u_xlat15;
lowp float u_xlat10_15;
bool u_xlatb15;
float u_xlat22;
float u_xlat23;
float u_xlat24;
bool u_xlatb24;
bool u_xlatb26;
vec2 u_xlat27;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
bool u_xlatb34;
float u_xlat35;
int u_xlati35;
bool u_xlatb35;
float u_xlat37;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat33 = u_xlat33 + u_xlat33;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat33)) + (-u_xlat1.xyz);
    u_xlatb1 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb1){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat23 = (-u_xlat1.z) + 1.0;
        u_xlatb34 = u_xlat23>=1.0;
        u_xlatb2.x = 0.0>=u_xlat23;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb34 = u_xlatb34 || u_xlatb2.x;
        u_xlatb34 = u_xlatb2.y || u_xlatb34;
        u_xlatb34 = u_xlatb2.z || u_xlatb34;
        if(u_xlatb34){
            u_xlat34 = 1.0;
        } else {
            u_xlatb2.x = 0.0<_UsePCF;
            if(u_xlatb2.x){
                u_xlat2.x = float(0.0);
                for(int u_xlati_loop_1 = int(-1) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat24 = u_xlat2.x;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat15.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_15 = texture2DLodEXT(_CustomShadowTex, u_xlat15.xy, 0.0).x;
                        u_xlat15.x = (-u_xlat10_15) + 1.0;
                        u_xlatb15 = u_xlat23<u_xlat15.x;
                        u_xlat15.x = (u_xlatb15) ? _CustomShadowStrength : 1.0;
                        u_xlat24 = u_xlat24 + u_xlat15.x;
                    }
                    u_xlat2.x = u_xlat24;
                }
                u_xlat34 = u_xlat2.x * 0.111111112;
            } else {
                u_xlat10_1 = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1) + 1.0;
                u_xlatb1 = u_xlat23<u_xlat1.x;
                u_xlat34 = (u_xlatb1) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyz = vs_TEXCOORD7.xyz / vs_TEXCOORD7.www;
        u_xlat2.xyz = u_xlat1.xyz + _ShadowOffsets[0].xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[1].xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat4.xyz = u_xlat1.xyz + _ShadowOffsets[2].xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat1.xyz = u_xlat1.xyz + _ShadowOffsets[3].xyz;
        vec3 txVec3 = vec3(u_xlat1.xy,u_xlat1.z);
        u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat1.x = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat12.x = (-_LightShadowData.x) + 1.0;
        u_xlat34 = u_xlat1.x * u_xlat12.x + _LightShadowData.x;
    }
    u_xlat1.x = u_xlat34 + -1.0;
    u_xlat1.x = _ReceiveShadowsStrength * u_xlat1.x + 1.0;
    u_xlat12.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_12.xyz = texture2D(_Diff, u_xlat12.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat13.xyz = u_xlat10_12.xyz * u_xlat10_2.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat5.xyz = u_xlat5.xyz * vec3(_Cube_FW);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat5.xyz);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat37 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_2.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat13.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_4.xyz = texture2D(_Light, u_xlat4.xy).xyz;
    u_xlat5.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat5.xy = u_xlat5.xy + (-vs_TEXCOORD0.xy);
    u_xlat5.xy = vec2(_IsScreenPos) * u_xlat5.xy + vs_TEXCOORD0.xy;
    u_xlat35 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat35 = u_xlat35 * _Time.y;
    u_xlat35 = cos(u_xlat35);
    u_xlat35 = sin(u_xlat35);
    u_xlat27.xy = vec2(u_xlat35) * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlatb35 = _ViewDir==6.0;
    if(u_xlatb35){
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat6.xyz = u_xlat0.xyz * vec3(u_xlat35);
    } else {
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat7.xyz = u_xlat0.xzy * vec3(u_xlat35);
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat8.xyz = u_xlat0.zyx * vec3(u_xlat35);
        u_xlat0.w = (-u_xlat0.z);
        u_xlat35 = dot(u_xlat0.xyw, u_xlat0.xyw);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat9.xyz = u_xlat0.xyw * vec3(u_xlat35);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat10.xyz = u_xlat0.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat33 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat10.xyz = vec3(u_xlat33) * u_xlat10.xyz;
        u_xlatb33 = _ViewDir==1.0;
        u_xlat0.xyz = u_xlat0.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat35 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat35);
        u_xlat0.xyz = bool(u_xlatb33) ? u_xlat0.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat0.xyz = (u_xlatb3.w) ? u_xlat10.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.z) ? u_xlat9.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.y) ? u_xlat8.xyz : u_xlat0.xyz;
        u_xlat6.xyz = (u_xlatb3.x) ? u_xlat7.xyz : u_xlat0.xyz;
    }
    u_xlat0.x = u_xlat6.z + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.82842708;
    u_xlat0.xy = u_xlat6.xy / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale);
    u_xlat22 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat22 = u_xlat22 * 3.14159274;
    u_xlat6.x = sin(u_xlat22);
    u_xlat7.x = cos(u_xlat22);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat0.xy, u_xlat8.xy);
    u_xlat0.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat10_0.xyz = texture2D(_StarryTex, u_xlat0.xy).xyz;
    u_xlat5.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlat27.xy = (-u_xlat5.xy) + u_xlat27.xy;
    u_xlat5.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat27.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_5.xyz = texture2D(_StarryTex, u_xlat5.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat10_5.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat0.xyz + u_xlat10_5.xyz;
    u_xlat5.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat10_12.xyz * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat12.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat33 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat33 = sqrt(u_xlat33);
    u_xlat33 = u_xlat33 / _FogDistance;
    u_xlat2.x = max(_FogFade, 0.0);
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * u_xlat2.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = min(u_xlat33, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33);
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat0.xyz + u_xlat12.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _Alpha;
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
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _StarryTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat13;
float u_xlat22;
vec2 u_xlat27;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
bool u_xlatb34;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat33 = u_xlat33 + u_xlat33;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat33)) + (-u_xlat1.xyz);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat13.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat5.xyz = u_xlat5.xyz * vec3(_Cube_FW);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat5.xyz);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat34 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat4.xyz = vec3(u_xlat34) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_2.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat13.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_4.xyz = texture(_Light, u_xlat4.xy).xyz;
    u_xlat5.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat5.xy = u_xlat5.xy + (-vs_TEXCOORD0.xy);
    u_xlat5.xy = vec2(_IsScreenPos) * u_xlat5.xy + vs_TEXCOORD0.xy;
    u_xlat34 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat27.xy = vec2(u_xlat34) * _Starry_Speed.xxyz.yz + u_xlat5.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_ViewDir==6.0);
#else
    u_xlatb34 = _ViewDir==6.0;
#endif
    if(u_xlatb34){
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat6.xyz = u_xlat0.xyz * vec3(u_xlat34);
    } else {
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat7.xyz = u_xlat0.xzy * vec3(u_xlat34);
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat8.xyz = u_xlat0.zyx * vec3(u_xlat34);
        u_xlat0.w = (-u_xlat0.z);
        u_xlat34 = dot(u_xlat0.xyw, u_xlat0.xyw);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat9.xyz = u_xlat0.xyw * vec3(u_xlat34);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat10.xyz = u_xlat0.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat33 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat10.xyz = vec3(u_xlat33) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb33 = !!(_ViewDir==1.0);
#else
        u_xlatb33 = _ViewDir==1.0;
#endif
        u_xlat0.xyz = u_xlat0.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat34);
        u_xlat0.xyz = bool(u_xlatb33) ? u_xlat0.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat0.xyz = (u_xlatb3.w) ? u_xlat10.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.z) ? u_xlat9.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.y) ? u_xlat8.xyz : u_xlat0.xyz;
        u_xlat6.xyz = (u_xlatb3.x) ? u_xlat7.xyz : u_xlat0.xyz;
    }
    u_xlat0.x = u_xlat6.z + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.82842708;
    u_xlat0.xy = u_xlat6.xy / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale);
    u_xlat22 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat22 = u_xlat22 * 3.14159274;
    u_xlat6.x = sin(u_xlat22);
    u_xlat7.x = cos(u_xlat22);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat0.xy, u_xlat8.xy);
    u_xlat0.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_0.xyz = texture(_StarryTex, u_xlat0.xy).xyz;
    u_xlat5.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlat27.xy = (-u_xlat5.xy) + u_xlat27.xy;
    u_xlat5.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat27.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_5.xyz = texture(_StarryTex, u_xlat5.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_5.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = sqrt(u_xlat33);
    u_xlat33 = u_xlat33 / _FogDistance;
    u_xlat1.x = max(_FogFade, 0.0);
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * u_xlat1.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = min(u_xlat33, 1.0);
    u_xlat1.xyz = (-u_xlat0.xyz) + _FogColor.xyz;
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _Alpha;
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
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _StarryTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat13;
float u_xlat22;
vec2 u_xlat27;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
bool u_xlatb34;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat33 = u_xlat33 + u_xlat33;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat33)) + (-u_xlat1.xyz);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_2.xy = texture(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat13.xyz = u_xlat16_1.xyz * u_xlat16_2.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat5.xyz = u_xlat5.xyz * vec3(_Cube_FW);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat5.xyz);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat34 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat4.xyz = vec3(u_xlat34) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_2.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat13.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_4.xyz = texture(_Light, u_xlat4.xy).xyz;
    u_xlat5.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat5.xy = u_xlat5.xy + (-vs_TEXCOORD0.xy);
    u_xlat5.xy = vec2(_IsScreenPos) * u_xlat5.xy + vs_TEXCOORD0.xy;
    u_xlat34 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat27.xy = vec2(u_xlat34) * _Starry_Speed.xxyz.yz + u_xlat5.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(_ViewDir==6.0);
#else
    u_xlatb34 = _ViewDir==6.0;
#endif
    if(u_xlatb34){
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat6.xyz = u_xlat0.xyz * vec3(u_xlat34);
    } else {
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat7.xyz = u_xlat0.xzy * vec3(u_xlat34);
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat8.xyz = u_xlat0.zyx * vec3(u_xlat34);
        u_xlat0.w = (-u_xlat0.z);
        u_xlat34 = dot(u_xlat0.xyw, u_xlat0.xyw);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat9.xyz = u_xlat0.xyw * vec3(u_xlat34);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat10.xyz = u_xlat0.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat33 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat10.xyz = vec3(u_xlat33) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb33 = !!(_ViewDir==1.0);
#else
        u_xlatb33 = _ViewDir==1.0;
#endif
        u_xlat0.xyz = u_xlat0.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat34);
        u_xlat0.xyz = bool(u_xlatb33) ? u_xlat0.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat0.xyz = (u_xlatb3.w) ? u_xlat10.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.z) ? u_xlat9.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.y) ? u_xlat8.xyz : u_xlat0.xyz;
        u_xlat6.xyz = (u_xlatb3.x) ? u_xlat7.xyz : u_xlat0.xyz;
    }
    u_xlat0.x = u_xlat6.z + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.82842708;
    u_xlat0.xy = u_xlat6.xy / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale);
    u_xlat22 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat22 = u_xlat22 * 3.14159274;
    u_xlat6.x = sin(u_xlat22);
    u_xlat7.x = cos(u_xlat22);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat0.xy, u_xlat8.xy);
    u_xlat0.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat16_0.xyz = texture(_StarryTex, u_xlat0.xy).xyz;
    u_xlat5.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlat27.xy = (-u_xlat5.xy) + u_xlat27.xy;
    u_xlat5.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat27.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_5.xyz = texture(_StarryTex, u_xlat5.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_5.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat0.xyz + u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat4.xyz = u_xlat16_4.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = sqrt(u_xlat33);
    u_xlat33 = u_xlat33 / _FogDistance;
    u_xlat1.x = max(_FogFade, 0.0);
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * u_xlat1.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = min(u_xlat33, 1.0);
    u_xlat1.xyz = (-u_xlat0.xyz) + _FogColor.xyz;
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _Alpha;
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
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat13;
float u_xlat22;
vec2 u_xlat27;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
bool u_xlatb34;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat33 = u_xlat33 + u_xlat33;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat33)) + (-u_xlat1.xyz);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat13.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat5.xyz = u_xlat5.xyz * vec3(_Cube_FW);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat5.xyz);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat34 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat4.xyz = vec3(u_xlat34) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_2.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat13.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_4.xyz = texture2D(_Light, u_xlat4.xy).xyz;
    u_xlat5.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat5.xy = u_xlat5.xy + (-vs_TEXCOORD0.xy);
    u_xlat5.xy = vec2(_IsScreenPos) * u_xlat5.xy + vs_TEXCOORD0.xy;
    u_xlat34 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat27.xy = vec2(u_xlat34) * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlatb34 = _ViewDir==6.0;
    if(u_xlatb34){
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat6.xyz = u_xlat0.xyz * vec3(u_xlat34);
    } else {
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat7.xyz = u_xlat0.xzy * vec3(u_xlat34);
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat8.xyz = u_xlat0.zyx * vec3(u_xlat34);
        u_xlat0.w = (-u_xlat0.z);
        u_xlat34 = dot(u_xlat0.xyw, u_xlat0.xyw);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat9.xyz = u_xlat0.xyw * vec3(u_xlat34);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat10.xyz = u_xlat0.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat33 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat10.xyz = vec3(u_xlat33) * u_xlat10.xyz;
        u_xlatb33 = _ViewDir==1.0;
        u_xlat0.xyz = u_xlat0.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat34);
        u_xlat0.xyz = bool(u_xlatb33) ? u_xlat0.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat0.xyz = (u_xlatb3.w) ? u_xlat10.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.z) ? u_xlat9.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.y) ? u_xlat8.xyz : u_xlat0.xyz;
        u_xlat6.xyz = (u_xlatb3.x) ? u_xlat7.xyz : u_xlat0.xyz;
    }
    u_xlat0.x = u_xlat6.z + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.82842708;
    u_xlat0.xy = u_xlat6.xy / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale);
    u_xlat22 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat22 = u_xlat22 * 3.14159274;
    u_xlat6.x = sin(u_xlat22);
    u_xlat7.x = cos(u_xlat22);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat0.xy, u_xlat8.xy);
    u_xlat0.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat10_0.xyz = texture2D(_StarryTex, u_xlat0.xy).xyz;
    u_xlat5.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlat27.xy = (-u_xlat5.xy) + u_xlat27.xy;
    u_xlat5.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat27.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_5.xyz = texture2D(_StarryTex, u_xlat5.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat10_5.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat0.xyz + u_xlat10_5.xyz;
    u_xlat5.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = sqrt(u_xlat33);
    u_xlat33 = u_xlat33 / _FogDistance;
    u_xlat1.x = max(_FogFade, 0.0);
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * u_xlat1.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = min(u_xlat33, 1.0);
    u_xlat1.xyz = (-u_xlat0.xyz) + _FogColor.xyz;
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _Alpha;
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
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat13;
float u_xlat22;
vec2 u_xlat27;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
bool u_xlatb34;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat33 = u_xlat33 + u_xlat33;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat33)) + (-u_xlat1.xyz);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_2.xy = texture2D(_Em_G_CU_R_MASK, u_xlat2.xy).xy;
    u_xlat13.xyz = u_xlat10_1.xyz * u_xlat10_2.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat5.xyz = u_xlat5.xyz * vec3(_Cube_FW);
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat5.xyz);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat34 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat4.xyz = vec3(u_xlat34) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat10_2.xxx * u_xlat4.xyz;
    u_xlat2.xyz = u_xlat13.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_4.xyz = texture2D(_Light, u_xlat4.xy).xyz;
    u_xlat5.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat5.xy = u_xlat5.xy + (-vs_TEXCOORD0.xy);
    u_xlat5.xy = vec2(_IsScreenPos) * u_xlat5.xy + vs_TEXCOORD0.xy;
    u_xlat34 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat27.xy = vec2(u_xlat34) * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlatb34 = _ViewDir==6.0;
    if(u_xlatb34){
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat6.xyz = u_xlat0.xyz * vec3(u_xlat34);
    } else {
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat7.xyz = u_xlat0.xzy * vec3(u_xlat34);
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat8.xyz = u_xlat0.zyx * vec3(u_xlat34);
        u_xlat0.w = (-u_xlat0.z);
        u_xlat34 = dot(u_xlat0.xyw, u_xlat0.xyw);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat9.xyz = u_xlat0.xyw * vec3(u_xlat34);
        u_xlatb3 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat10.xyz = u_xlat0.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat33 = dot(u_xlat10.xyz, u_xlat10.xyz);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat10.xyz = vec3(u_xlat33) * u_xlat10.xyz;
        u_xlatb33 = _ViewDir==1.0;
        u_xlat0.xyz = u_xlat0.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat34);
        u_xlat0.xyz = bool(u_xlatb33) ? u_xlat0.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat0.xyz = (u_xlatb3.w) ? u_xlat10.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.z) ? u_xlat9.xyz : u_xlat0.xyz;
        u_xlat0.xyz = (u_xlatb3.y) ? u_xlat8.xyz : u_xlat0.xyz;
        u_xlat6.xyz = (u_xlatb3.x) ? u_xlat7.xyz : u_xlat0.xyz;
    }
    u_xlat0.x = u_xlat6.z + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.82842708;
    u_xlat0.xy = u_xlat6.xy / u_xlat0.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale);
    u_xlat22 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat22 = u_xlat22 * 3.14159274;
    u_xlat6.x = sin(u_xlat22);
    u_xlat7.x = cos(u_xlat22);
    u_xlat8.x = (-u_xlat6.x);
    u_xlat8.y = u_xlat7.x;
    u_xlat8.z = u_xlat6.x;
    u_xlat6.x = dot(u_xlat0.xy, u_xlat8.yz);
    u_xlat6.y = dot(u_xlat0.xy, u_xlat8.xy);
    u_xlat0.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat10_0.xyz = texture2D(_StarryTex, u_xlat0.xy).xyz;
    u_xlat5.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat5.xy;
    u_xlat27.xy = (-u_xlat5.xy) + u_xlat27.xy;
    u_xlat5.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat27.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_5.xyz = texture2D(_StarryTex, u_xlat5.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat10_5.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat0.xyz + u_xlat10_5.xyz;
    u_xlat5.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat4.xyz = u_xlat10_4.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat10_1.xyz * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = sqrt(u_xlat33);
    u_xlat33 = u_xlat33 / _FogDistance;
    u_xlat1.x = max(_FogFade, 0.0);
    u_xlat33 = log2(u_xlat33);
    u_xlat33 = u_xlat33 * u_xlat1.x;
    u_xlat33 = exp2(u_xlat33);
    u_xlat33 = min(u_xlat33, 1.0);
    u_xlat1.xyz = (-u_xlat0.xyz) + _FogColor.xyz;
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _Alpha;
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
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(6) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(7) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump float u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump float u_xlat10_12;
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec2 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
mediump float u_xlat10_24;
float u_xlat26;
mediump float u_xlat16_30;
vec3 u_xlat40;
mediump float u_xlat10_48;
bool u_xlatb48;
float u_xlat49;
mediump vec2 u_xlat16_54;
mediump vec2 u_xlat16_55;
mediump vec2 u_xlat16_56;
mediump vec2 u_xlat16_57;
mediump vec2 u_xlat16_61;
vec2 u_xlat66;
float u_xlat72;
bool u_xlatb72;
float u_xlat73;
bool u_xlatb73;
mediump float u_xlat16_78;
float u_xlat88;
bool u_xlatb88;
float u_xlat89;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat72 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat1.xyz = vec3(u_xlat72) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat72 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat2.xyz = vec3(u_xlat72) * u_xlat2.xyz;
    u_xlat72 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat72 = u_xlat72 + u_xlat72;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat72)) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb72 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat2.xxx + vs_TEXCOORD2.xyz;
    u_xlat0.xyz = (bool(u_xlatb72)) ? u_xlat0.xyz : vs_TEXCOORD2.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
    u_xlat3 = u_xlat0.yyyy * u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat4 * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat5 + u_xlat0;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat26 = max((-u_xlat0.w), u_xlat2.x);
    u_xlat26 = (-u_xlat2.x) + u_xlat26;
    u_xlat0.z = _ShadowBias.y * u_xlat26 + u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat16_6 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(_softShadowQuality==1.0);
#else
    u_xlatb48 = _softShadowQuality==1.0;
#endif
    if(u_xlatb48){
        u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat2.z = 0.0;
        u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_30 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb48 = !!(_softShadowQuality==2.0);
#else
        u_xlatb48 = _softShadowQuality==2.0;
#endif
        if(u_xlatb48){
            u_xlat16_54.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_54.xy = floor(u_xlat16_54.xy);
            u_xlat16_7.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_54.xy);
            u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
            u_xlat16_55.xy = u_xlat16_3.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_8.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
            u_xlat16_56.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
            u_xlat16_9.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_56.xy;
            u_xlat16_7.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
            u_xlat16_7.xy = (-u_xlat16_7.xy) * u_xlat16_7.xy + u_xlat16_2.yw;
            u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
            u_xlat16_7.xy = u_xlat16_7.xy + vec2(1.0, 1.0);
            u_xlat16_3.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_4.xy = u_xlat16_56.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_5.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_7.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_2.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_3.z = u_xlat16_5.x;
            u_xlat16_3.w = u_xlat16_7.x;
            u_xlat16_4.z = u_xlat16_8.x;
            u_xlat16_4.w = u_xlat16_55.x;
            u_xlat16_2 = u_xlat16_3.zwxz + u_xlat16_4.zwxz;
            u_xlat16_5.z = u_xlat16_3.y;
            u_xlat16_5.w = u_xlat16_7.y;
            u_xlat16_8.z = u_xlat16_4.y;
            u_xlat16_8.w = u_xlat16_55.y;
            u_xlat16_7.xyz = u_xlat16_5.zyw + u_xlat16_8.zyw;
            u_xlat16_9.xyz = u_xlat16_4.xzw / u_xlat16_2.zwy;
            u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_8.xyz = u_xlat16_8.zyw / u_xlat16_7.xyz;
            u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_3.xyz = u_xlat16_9.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_4.xyz = u_xlat16_8.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_3.w = u_xlat16_4.x;
            u_xlat16_5 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.ywxw;
            u_xlat16_8.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.zw;
            u_xlat16_4.w = u_xlat16_3.y;
            u_xlat16_3.yw = u_xlat16_4.yz;
            u_xlat16_9 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xyzy;
            u_xlat16_4 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.wywz;
            u_xlat16_3 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xwzw;
            u_xlat16_10 = u_xlat16_2.zwyz * u_xlat16_7.xxxy;
            u_xlat16_11 = u_xlat16_2 * u_xlat16_7.yyzz;
            u_xlat16_54.x = u_xlat16_2.y * u_xlat16_7.z;
            vec3 txVec4 = vec3(u_xlat16_5.xy,u_xlat0.w);
            u_xlat10_48 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_5.zw,u_xlat0.w);
            u_xlat10_12 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_78 = u_xlat16_10.y * u_xlat10_12;
            u_xlat16_78 = u_xlat16_10.x * u_xlat10_48 + u_xlat16_78;
            vec3 txVec6 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_48 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_78 = u_xlat16_10.z * u_xlat10_48 + u_xlat16_78;
            vec3 txVec7 = vec3(u_xlat16_4.xy,u_xlat0.w);
            u_xlat10_48 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_78 = u_xlat16_10.w * u_xlat10_48 + u_xlat16_78;
            vec3 txVec8 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_48 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_78 = u_xlat16_11.x * u_xlat10_48 + u_xlat16_78;
            vec3 txVec9 = vec3(u_xlat16_9.zw,u_xlat0.w);
            u_xlat10_48 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_78 = u_xlat16_11.y * u_xlat10_48 + u_xlat16_78;
            vec3 txVec10 = vec3(u_xlat16_4.zw,u_xlat0.w);
            u_xlat10_48 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_78 = u_xlat16_11.z * u_xlat10_48 + u_xlat16_78;
            vec3 txVec11 = vec3(u_xlat16_3.xy,u_xlat0.w);
            u_xlat10_48 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_78 = u_xlat16_11.w * u_xlat10_48 + u_xlat16_78;
            vec3 txVec12 = vec3(u_xlat16_3.zw,u_xlat0.w);
            u_xlat10_48 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_30 = u_xlat16_54.x * u_xlat10_48 + u_xlat16_78;
        } else {
            u_xlat16_54.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_54.xy = floor(u_xlat16_54.xy);
            u_xlat16_7.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_54.xy);
            u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
            u_xlat16_4.yw = u_xlat16_3.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_55.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
            u_xlat16_8.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
            u_xlat16_56.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_56.xy) * u_xlat16_56.xy + u_xlat16_8.xy;
            u_xlat16_56.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
            u_xlat16_8.zw = (-u_xlat16_56.xy) * u_xlat16_56.xy + u_xlat16_2.yw;
            u_xlat16_8 = u_xlat16_8 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_2.z = u_xlat16_8.z * 0.0816320032;
            u_xlat16_3.xy = u_xlat16_55.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_55.xy = u_xlat16_8.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_3.z = u_xlat16_8.w * 0.0816320032;
            u_xlat16_2.x = u_xlat16_3.y;
            u_xlat16_2.yw = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_5.xz = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_5.y = u_xlat16_55.x;
            u_xlat16_5.w = u_xlat16_4.y;
            u_xlat16_2 = u_xlat16_2 + u_xlat16_5;
            u_xlat16_3.yw = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_4.xz = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_4.y = u_xlat16_55.y;
            u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
            u_xlat16_5 = u_xlat16_5 / u_xlat16_2;
            u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_4 = u_xlat16_4 / u_xlat16_3;
            u_xlat16_4 = u_xlat16_4 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_5 = u_xlat16_5.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_4 = u_xlat16_4.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_7.xzw = u_xlat16_5.yzw;
            u_xlat16_7.y = u_xlat16_4.x;
            u_xlat16_8 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_9.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_5.y = u_xlat16_7.y;
            u_xlat16_7.y = u_xlat16_4.z;
            u_xlat16_10 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_57.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_5.z = u_xlat16_7.y;
            u_xlat16_11 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyxz;
            u_xlat16_7.y = u_xlat16_4.w;
            u_xlat16_12 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_13.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_5.w = u_xlat16_7.y;
            u_xlat16_61.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xw;
            u_xlat16_4.xzw = u_xlat16_7.xzw;
            u_xlat16_7 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
            u_xlat16_14.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.wy;
            u_xlat16_4.x = u_xlat16_5.x;
            u_xlat16_54.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.xy;
            u_xlat16_4 = u_xlat16_2 * u_xlat16_3.xxxx;
            u_xlat16_5 = u_xlat16_2 * u_xlat16_3.yyyy;
            u_xlat16_15 = u_xlat16_2 * u_xlat16_3.zzzz;
            u_xlat16_2 = u_xlat16_2 * u_xlat16_3.wwww;
            vec3 txVec13 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_8.zw,u_xlat0.w);
            u_xlat10_24 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_8.x = u_xlat10_24 * u_xlat16_4.y;
            u_xlat16_8.x = u_xlat16_4.x * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec15 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_8.x = u_xlat16_4.z * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec16 = vec3(u_xlat16_11.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_8.x = u_xlat16_4.w * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec17 = vec3(u_xlat16_10.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_8.x = u_xlat16_5.x * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec18 = vec3(u_xlat16_10.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_8.x = u_xlat16_5.y * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec19 = vec3(u_xlat16_57.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_8.x = u_xlat16_5.z * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec20 = vec3(u_xlat16_11.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_8.x = u_xlat16_5.w * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec21 = vec3(u_xlat16_12.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_8.x = u_xlat16_15.x * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec22 = vec3(u_xlat16_12.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_8.x = u_xlat16_15.y * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec23 = vec3(u_xlat16_13.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_8.x = u_xlat16_15.z * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec24 = vec3(u_xlat16_61.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_8.x = u_xlat16_15.w * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec25 = vec3(u_xlat16_7.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_7.x = u_xlat16_2.x * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec26 = vec3(u_xlat16_7.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_7.x = u_xlat16_2.y * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec27 = vec3(u_xlat16_14.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_7.x = u_xlat16_2.z * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec28 = vec3(u_xlat16_54.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_30 = u_xlat16_2.w * u_xlat10_0 + u_xlat16_7.x;
        }
    }
    u_xlat16_54.x = (-u_xlat16_6) + 1.0;
    u_xlat16_6 = u_xlat16_30 * u_xlat16_54.x + u_xlat16_6;
    u_xlat0.x = u_xlat16_6 + -1.0;
    u_xlat0.x = _ReceiveShadowsStrength * u_xlat0.x + 1.0;
    u_xlat24.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_24.xyz = texture(_Diff, u_xlat24.xy).xyz;
    u_xlat16.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_16.xy = texture(_Em_G_CU_R_MASK, u_xlat16.xy).xy;
    u_xlat40.xyz = u_xlat16_24.xyz * u_xlat16_16.yyy;
    u_xlat16_2 = texture(_Cubemap, u_xlat1.xyz);
    u_xlat17.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat18.xyz = u_xlat17.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat18.xyz = u_xlat18.xyz * vec3(_Cube_FW);
    u_xlat17.xyz = u_xlat17.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat18.xyz);
    u_xlat17.xyz = u_xlat18.xyz * u_xlat17.xyz + u_xlat18.xyz;
    u_xlat89 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat17.xyz = vec3(u_xlat89) * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat16_16.xxx * u_xlat17.xyz;
    u_xlat16.xyz = u_xlat40.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat17.xyz;
    u_xlat17.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_17.xyz = texture(_Light, u_xlat17.xy).xyz;
    u_xlat18.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat18.xy = u_xlat18.xy + (-vs_TEXCOORD0.xy);
    u_xlat18.xy = vec2(_IsScreenPos) * u_xlat18.xy + vs_TEXCOORD0.xy;
    u_xlat88 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat88 = u_xlat88 * _Time.y;
    u_xlat88 = cos(u_xlat88);
    u_xlat88 = sin(u_xlat88);
    u_xlat66.xy = vec2(u_xlat88) * _Starry_Speed.xxyz.yz + u_xlat18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb88 = !!(_ViewDir==6.0);
#else
    u_xlatb88 = _ViewDir==6.0;
#endif
    if(u_xlatb88){
        u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat19.xyz = u_xlat1.xyz * vec3(u_xlat88);
    } else {
        u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat20.xyz = u_xlat1.xzy * vec3(u_xlat88);
        u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat21.xyz = u_xlat1.zyx * vec3(u_xlat88);
        u_xlat1.w = (-u_xlat1.z);
        u_xlat88 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat22.xyz = u_xlat1.xyw * vec3(u_xlat88);
        u_xlatb2 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat23.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat73 = dot(u_xlat23.xyz, u_xlat23.xyz);
        u_xlat73 = inversesqrt(u_xlat73);
        u_xlat23.xyz = vec3(u_xlat73) * u_xlat23.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb73 = !!(_ViewDir==1.0);
#else
        u_xlatb73 = _ViewDir==1.0;
#endif
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat88);
        u_xlat1.xyz = bool(u_xlatb73) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb2.w) ? u_xlat23.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb2.z) ? u_xlat22.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb2.y) ? u_xlat21.xyz : u_xlat1.xyz;
        u_xlat19.xyz = (u_xlatb2.x) ? u_xlat20.xyz : u_xlat1.xyz;
    }
    u_xlat1.x = u_xlat19.z + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 2.82842708;
    u_xlat1.xy = u_xlat19.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat49 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat49 = u_xlat49 * 3.14159274;
    u_xlat19.x = sin(u_xlat49);
    u_xlat20.x = cos(u_xlat49);
    u_xlat21.x = (-u_xlat19.x);
    u_xlat21.y = u_xlat20.x;
    u_xlat21.z = u_xlat19.x;
    u_xlat19.x = dot(u_xlat1.xy, u_xlat21.yz);
    u_xlat19.y = dot(u_xlat1.xy, u_xlat21.xy);
    u_xlat1.xy = u_xlat19.xy + vec2(0.5, 0.5);
    u_xlat16_1.xyz = texture(_StarryTex, u_xlat1.xy).xyz;
    u_xlat18.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat18.xy;
    u_xlat66.xy = (-u_xlat18.xy) + u_xlat66.xy;
    u_xlat18.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat66.xy + u_xlat18.xy;
    u_xlat18.xy = u_xlat18.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_18.xyz = texture(_StarryTex, u_xlat18.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + (-u_xlat16_18.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat16_18.xyz;
    u_xlat18.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat18.xyz = u_xlat1.xyz * u_xlat18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat18.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat17.xyz = u_xlat16_17.xyz * vec3(_light_PW);
    u_xlat24.xyz = u_xlat16_24.xyz * u_xlat17.xyz + u_xlat1.xyz;
    u_xlat24.xyz = u_xlat24.xyz + u_xlat16.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat24.xyz;
    u_xlat16.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat73 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 / _FogDistance;
    u_xlat16.x = max(_FogFade, 0.0);
    u_xlat73 = log2(u_xlat73);
    u_xlat73 = u_xlat73 * u_xlat16.x;
    u_xlat73 = exp2(u_xlat73);
    u_xlat73 = min(u_xlat73, 1.0);
    u_xlat0.xyz = (-u_xlat24.xyz) * u_xlat0.xxx + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat73);
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _Alpha;
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
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(4) uniform mediump sampler2D _Light;
UNITY_LOCATION(5) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(6) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(7) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump float u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
mediump float u_xlat10_12;
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec2 u_xlat16_16;
vec3 u_xlat17;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
mediump float u_xlat10_24;
float u_xlat26;
mediump float u_xlat16_30;
vec3 u_xlat40;
mediump float u_xlat10_48;
bool u_xlatb48;
float u_xlat49;
mediump vec2 u_xlat16_54;
mediump vec2 u_xlat16_55;
mediump vec2 u_xlat16_56;
mediump vec2 u_xlat16_57;
mediump vec2 u_xlat16_61;
vec2 u_xlat66;
float u_xlat72;
bool u_xlatb72;
float u_xlat73;
bool u_xlatb73;
mediump float u_xlat16_78;
float u_xlat88;
bool u_xlatb88;
float u_xlat89;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat72 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat1.xyz = vec3(u_xlat72) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat72 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat2.xyz = vec3(u_xlat72) * u_xlat2.xyz;
    u_xlat72 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat72 = u_xlat72 + u_xlat72;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat72)) + (-u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb72 = _ShadowBias.z!=0.0;
#endif
    u_xlat2.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat2.xxx + vs_TEXCOORD2.xyz;
    u_xlat0.xyz = (bool(u_xlatb72)) ? u_xlat0.xyz : vs_TEXCOORD2.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
    u_xlat3 = u_xlat0.yyyy * u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat4 * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat5 + u_xlat0;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat26 = max((-u_xlat0.w), u_xlat2.x);
    u_xlat26 = (-u_xlat2.x) + u_xlat26;
    u_xlat0.z = _ShadowBias.y * u_xlat26 + u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat16_6 = (-_ShadowBias.w) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(_softShadowQuality==1.0);
#else
    u_xlatb48 = _softShadowQuality==1.0;
#endif
    if(u_xlatb48){
        u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat2.z = 0.0;
        u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat16_30 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb48 = !!(_softShadowQuality==2.0);
#else
        u_xlatb48 = _softShadowQuality==2.0;
#endif
        if(u_xlatb48){
            u_xlat16_54.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_54.xy = floor(u_xlat16_54.xy);
            u_xlat16_7.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_54.xy);
            u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
            u_xlat16_55.xy = u_xlat16_3.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_8.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
            u_xlat16_56.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
            u_xlat16_9.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_56.xy;
            u_xlat16_7.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
            u_xlat16_7.xy = (-u_xlat16_7.xy) * u_xlat16_7.xy + u_xlat16_2.yw;
            u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
            u_xlat16_7.xy = u_xlat16_7.xy + vec2(1.0, 1.0);
            u_xlat16_3.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_4.xy = u_xlat16_56.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_5.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_7.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_2.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_3.z = u_xlat16_5.x;
            u_xlat16_3.w = u_xlat16_7.x;
            u_xlat16_4.z = u_xlat16_8.x;
            u_xlat16_4.w = u_xlat16_55.x;
            u_xlat16_2 = u_xlat16_3.zwxz + u_xlat16_4.zwxz;
            u_xlat16_5.z = u_xlat16_3.y;
            u_xlat16_5.w = u_xlat16_7.y;
            u_xlat16_8.z = u_xlat16_4.y;
            u_xlat16_8.w = u_xlat16_55.y;
            u_xlat16_7.xyz = u_xlat16_5.zyw + u_xlat16_8.zyw;
            u_xlat16_9.xyz = u_xlat16_4.xzw / u_xlat16_2.zwy;
            u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_8.xyz = u_xlat16_8.zyw / u_xlat16_7.xyz;
            u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_3.xyz = u_xlat16_9.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_4.xyz = u_xlat16_8.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_3.w = u_xlat16_4.x;
            u_xlat16_5 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.ywxw;
            u_xlat16_8.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.zw;
            u_xlat16_4.w = u_xlat16_3.y;
            u_xlat16_3.yw = u_xlat16_4.yz;
            u_xlat16_9 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xyzy;
            u_xlat16_4 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.wywz;
            u_xlat16_3 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xwzw;
            u_xlat16_10 = u_xlat16_2.zwyz * u_xlat16_7.xxxy;
            u_xlat16_11 = u_xlat16_2 * u_xlat16_7.yyzz;
            u_xlat16_54.x = u_xlat16_2.y * u_xlat16_7.z;
            vec3 txVec4 = vec3(u_xlat16_5.xy,u_xlat0.w);
            u_xlat10_48 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec4, 0.0);
            vec3 txVec5 = vec3(u_xlat16_5.zw,u_xlat0.w);
            u_xlat10_12 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_78 = u_xlat16_10.y * u_xlat10_12;
            u_xlat16_78 = u_xlat16_10.x * u_xlat10_48 + u_xlat16_78;
            vec3 txVec6 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_48 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec6, 0.0);
            u_xlat16_78 = u_xlat16_10.z * u_xlat10_48 + u_xlat16_78;
            vec3 txVec7 = vec3(u_xlat16_4.xy,u_xlat0.w);
            u_xlat10_48 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec7, 0.0);
            u_xlat16_78 = u_xlat16_10.w * u_xlat10_48 + u_xlat16_78;
            vec3 txVec8 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_48 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec8, 0.0);
            u_xlat16_78 = u_xlat16_11.x * u_xlat10_48 + u_xlat16_78;
            vec3 txVec9 = vec3(u_xlat16_9.zw,u_xlat0.w);
            u_xlat10_48 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec9, 0.0);
            u_xlat16_78 = u_xlat16_11.y * u_xlat10_48 + u_xlat16_78;
            vec3 txVec10 = vec3(u_xlat16_4.zw,u_xlat0.w);
            u_xlat10_48 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec10, 0.0);
            u_xlat16_78 = u_xlat16_11.z * u_xlat10_48 + u_xlat16_78;
            vec3 txVec11 = vec3(u_xlat16_3.xy,u_xlat0.w);
            u_xlat10_48 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec11, 0.0);
            u_xlat16_78 = u_xlat16_11.w * u_xlat10_48 + u_xlat16_78;
            vec3 txVec12 = vec3(u_xlat16_3.zw,u_xlat0.w);
            u_xlat10_48 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec12, 0.0);
            u_xlat16_30 = u_xlat16_54.x * u_xlat10_48 + u_xlat16_78;
        } else {
            u_xlat16_54.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_54.xy = floor(u_xlat16_54.xy);
            u_xlat16_7.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_54.xy);
            u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
            u_xlat16_4.yw = u_xlat16_3.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_55.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
            u_xlat16_8.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
            u_xlat16_56.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_56.xy) * u_xlat16_56.xy + u_xlat16_8.xy;
            u_xlat16_56.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
            u_xlat16_8.zw = (-u_xlat16_56.xy) * u_xlat16_56.xy + u_xlat16_2.yw;
            u_xlat16_8 = u_xlat16_8 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_2.z = u_xlat16_8.z * 0.0816320032;
            u_xlat16_3.xy = u_xlat16_55.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_55.xy = u_xlat16_8.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_3.z = u_xlat16_8.w * 0.0816320032;
            u_xlat16_2.x = u_xlat16_3.y;
            u_xlat16_2.yw = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_5.xz = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_5.y = u_xlat16_55.x;
            u_xlat16_5.w = u_xlat16_4.y;
            u_xlat16_2 = u_xlat16_2 + u_xlat16_5;
            u_xlat16_3.yw = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_4.xz = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_4.y = u_xlat16_55.y;
            u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
            u_xlat16_5 = u_xlat16_5 / u_xlat16_2;
            u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_4 = u_xlat16_4 / u_xlat16_3;
            u_xlat16_4 = u_xlat16_4 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_5 = u_xlat16_5.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_4 = u_xlat16_4.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_7.xzw = u_xlat16_5.yzw;
            u_xlat16_7.y = u_xlat16_4.x;
            u_xlat16_8 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_9.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_5.y = u_xlat16_7.y;
            u_xlat16_7.y = u_xlat16_4.z;
            u_xlat16_10 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_57.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_5.z = u_xlat16_7.y;
            u_xlat16_11 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyxz;
            u_xlat16_7.y = u_xlat16_4.w;
            u_xlat16_12 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_13.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_5.w = u_xlat16_7.y;
            u_xlat16_61.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xw;
            u_xlat16_4.xzw = u_xlat16_7.xzw;
            u_xlat16_7 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
            u_xlat16_14.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.wy;
            u_xlat16_4.x = u_xlat16_5.x;
            u_xlat16_54.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.xy;
            u_xlat16_4 = u_xlat16_2 * u_xlat16_3.xxxx;
            u_xlat16_5 = u_xlat16_2 * u_xlat16_3.yyyy;
            u_xlat16_15 = u_xlat16_2 * u_xlat16_3.zzzz;
            u_xlat16_2 = u_xlat16_2 * u_xlat16_3.wwww;
            vec3 txVec13 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec13, 0.0);
            vec3 txVec14 = vec3(u_xlat16_8.zw,u_xlat0.w);
            u_xlat10_24 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec14, 0.0);
            u_xlat16_8.x = u_xlat10_24 * u_xlat16_4.y;
            u_xlat16_8.x = u_xlat16_4.x * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec15 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec15, 0.0);
            u_xlat16_8.x = u_xlat16_4.z * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec16 = vec3(u_xlat16_11.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec16, 0.0);
            u_xlat16_8.x = u_xlat16_4.w * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec17 = vec3(u_xlat16_10.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec17, 0.0);
            u_xlat16_8.x = u_xlat16_5.x * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec18 = vec3(u_xlat16_10.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec18, 0.0);
            u_xlat16_8.x = u_xlat16_5.y * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec19 = vec3(u_xlat16_57.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec19, 0.0);
            u_xlat16_8.x = u_xlat16_5.z * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec20 = vec3(u_xlat16_11.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec20, 0.0);
            u_xlat16_8.x = u_xlat16_5.w * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec21 = vec3(u_xlat16_12.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec21, 0.0);
            u_xlat16_8.x = u_xlat16_15.x * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec22 = vec3(u_xlat16_12.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec22, 0.0);
            u_xlat16_8.x = u_xlat16_15.y * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec23 = vec3(u_xlat16_13.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec23, 0.0);
            u_xlat16_8.x = u_xlat16_15.z * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec24 = vec3(u_xlat16_61.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec24, 0.0);
            u_xlat16_8.x = u_xlat16_15.w * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec25 = vec3(u_xlat16_7.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec25, 0.0);
            u_xlat16_7.x = u_xlat16_2.x * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec26 = vec3(u_xlat16_7.zw,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec26, 0.0);
            u_xlat16_7.x = u_xlat16_2.y * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec27 = vec3(u_xlat16_14.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec27, 0.0);
            u_xlat16_7.x = u_xlat16_2.z * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec28 = vec3(u_xlat16_54.xy,u_xlat0.w);
            u_xlat10_0 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec28, 0.0);
            u_xlat16_30 = u_xlat16_2.w * u_xlat10_0 + u_xlat16_7.x;
        }
    }
    u_xlat16_54.x = (-u_xlat16_6) + 1.0;
    u_xlat16_6 = u_xlat16_30 * u_xlat16_54.x + u_xlat16_6;
    u_xlat0.x = u_xlat16_6 + -1.0;
    u_xlat0.x = _ReceiveShadowsStrength * u_xlat0.x + 1.0;
    u_xlat24.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_24.xyz = texture(_Diff, u_xlat24.xy).xyz;
    u_xlat16.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_16.xy = texture(_Em_G_CU_R_MASK, u_xlat16.xy).xy;
    u_xlat40.xyz = u_xlat16_24.xyz * u_xlat16_16.yyy;
    u_xlat16_2 = texture(_Cubemap, u_xlat1.xyz);
    u_xlat17.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat18.xyz = u_xlat17.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat18.xyz = u_xlat18.xyz * vec3(_Cube_FW);
    u_xlat17.xyz = u_xlat17.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat18.xyz);
    u_xlat17.xyz = u_xlat18.xyz * u_xlat17.xyz + u_xlat18.xyz;
    u_xlat89 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat17.xyz = vec3(u_xlat89) * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat16_16.xxx * u_xlat17.xyz;
    u_xlat16.xyz = u_xlat40.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat17.xyz;
    u_xlat17.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_17.xyz = texture(_Light, u_xlat17.xy).xyz;
    u_xlat18.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat18.xy = u_xlat18.xy + (-vs_TEXCOORD0.xy);
    u_xlat18.xy = vec2(_IsScreenPos) * u_xlat18.xy + vs_TEXCOORD0.xy;
    u_xlat88 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat88 = u_xlat88 * _Time.y;
    u_xlat88 = cos(u_xlat88);
    u_xlat88 = sin(u_xlat88);
    u_xlat66.xy = vec2(u_xlat88) * _Starry_Speed.xxyz.yz + u_xlat18.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb88 = !!(_ViewDir==6.0);
#else
    u_xlatb88 = _ViewDir==6.0;
#endif
    if(u_xlatb88){
        u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat19.xyz = u_xlat1.xyz * vec3(u_xlat88);
    } else {
        u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat20.xyz = u_xlat1.xzy * vec3(u_xlat88);
        u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat21.xyz = u_xlat1.zyx * vec3(u_xlat88);
        u_xlat1.w = (-u_xlat1.z);
        u_xlat88 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat22.xyz = u_xlat1.xyw * vec3(u_xlat88);
        u_xlatb2 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat23.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat73 = dot(u_xlat23.xyz, u_xlat23.xyz);
        u_xlat73 = inversesqrt(u_xlat73);
        u_xlat23.xyz = vec3(u_xlat73) * u_xlat23.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb73 = !!(_ViewDir==1.0);
#else
        u_xlatb73 = _ViewDir==1.0;
#endif
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat88);
        u_xlat1.xyz = bool(u_xlatb73) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb2.w) ? u_xlat23.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb2.z) ? u_xlat22.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb2.y) ? u_xlat21.xyz : u_xlat1.xyz;
        u_xlat19.xyz = (u_xlatb2.x) ? u_xlat20.xyz : u_xlat1.xyz;
    }
    u_xlat1.x = u_xlat19.z + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 2.82842708;
    u_xlat1.xy = u_xlat19.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat49 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat49 = u_xlat49 * 3.14159274;
    u_xlat19.x = sin(u_xlat49);
    u_xlat20.x = cos(u_xlat49);
    u_xlat21.x = (-u_xlat19.x);
    u_xlat21.y = u_xlat20.x;
    u_xlat21.z = u_xlat19.x;
    u_xlat19.x = dot(u_xlat1.xy, u_xlat21.yz);
    u_xlat19.y = dot(u_xlat1.xy, u_xlat21.xy);
    u_xlat1.xy = u_xlat19.xy + vec2(0.5, 0.5);
    u_xlat16_1.xyz = texture(_StarryTex, u_xlat1.xy).xyz;
    u_xlat18.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat18.xy;
    u_xlat66.xy = (-u_xlat18.xy) + u_xlat66.xy;
    u_xlat18.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat66.xy + u_xlat18.xy;
    u_xlat18.xy = u_xlat18.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_18.xyz = texture(_StarryTex, u_xlat18.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + (-u_xlat16_18.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat16_18.xyz;
    u_xlat18.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat18.xyz = u_xlat1.xyz * u_xlat18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat18.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat17.xyz = u_xlat16_17.xyz * vec3(_light_PW);
    u_xlat24.xyz = u_xlat16_24.xyz * u_xlat17.xyz + u_xlat1.xyz;
    u_xlat24.xyz = u_xlat24.xyz + u_xlat16.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat24.xyz;
    u_xlat16.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat73 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 / _FogDistance;
    u_xlat16.x = max(_FogFade, 0.0);
    u_xlat73 = log2(u_xlat73);
    u_xlat73 = u_xlat73 * u_xlat16.x;
    u_xlat73 = exp2(u_xlat73);
    u_xlat73 = min(u_xlat73, 1.0);
    u_xlat0.xyz = (-u_xlat24.xyz) * u_xlat0.xxx + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat73);
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _Alpha;
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
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump float u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
lowp float u_xlat10_12;
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
lowp vec2 u_xlat10_16;
vec3 u_xlat17;
lowp vec3 u_xlat10_17;
vec3 u_xlat18;
lowp vec3 u_xlat10_18;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec3 u_xlat24;
lowp vec3 u_xlat10_24;
float u_xlat26;
mediump float u_xlat16_30;
vec3 u_xlat40;
lowp float u_xlat10_48;
bool u_xlatb48;
float u_xlat49;
mediump vec2 u_xlat16_54;
mediump vec2 u_xlat16_55;
mediump vec2 u_xlat16_56;
mediump vec2 u_xlat16_57;
mediump vec2 u_xlat16_61;
vec2 u_xlat66;
float u_xlat72;
bool u_xlatb72;
float u_xlat73;
bool u_xlatb73;
mediump float u_xlat16_78;
float u_xlat88;
bool u_xlatb88;
float u_xlat89;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat72 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat1.xyz = vec3(u_xlat72) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat72 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat2.xyz = vec3(u_xlat72) * u_xlat2.xyz;
    u_xlat72 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat72 = u_xlat72 + u_xlat72;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat72)) + (-u_xlat1.xyz);
    u_xlatb72 = _ShadowBias.z!=0.0;
    u_xlat2.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat2.xxx + vs_TEXCOORD2.xyz;
    u_xlat0.xyz = (bool(u_xlatb72)) ? u_xlat0.xyz : vs_TEXCOORD2.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
    u_xlat3 = u_xlat0.yyyy * u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat4 * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat5 + u_xlat0;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat26 = max((-u_xlat0.w), u_xlat2.x);
    u_xlat26 = (-u_xlat2.x) + u_xlat26;
    u_xlat0.z = _ShadowBias.y * u_xlat26 + u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat16_6 = (-_ShadowBias.w) + 1.0;
    u_xlatb48 = _softShadowQuality==1.0;
    if(u_xlatb48){
        u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat2.z = 0.0;
        u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_30 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb48 = _softShadowQuality==2.0;
        if(u_xlatb48){
            u_xlat16_54.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_54.xy = floor(u_xlat16_54.xy);
            u_xlat16_7.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_54.xy);
            u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
            u_xlat16_55.xy = u_xlat16_3.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_8.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
            u_xlat16_56.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
            u_xlat16_9.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_56.xy;
            u_xlat16_7.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
            u_xlat16_7.xy = (-u_xlat16_7.xy) * u_xlat16_7.xy + u_xlat16_2.yw;
            u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
            u_xlat16_7.xy = u_xlat16_7.xy + vec2(1.0, 1.0);
            u_xlat16_3.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_4.xy = u_xlat16_56.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_5.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_7.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_2.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_3.z = u_xlat16_5.x;
            u_xlat16_3.w = u_xlat16_7.x;
            u_xlat16_4.z = u_xlat16_8.x;
            u_xlat16_4.w = u_xlat16_55.x;
            u_xlat16_2 = u_xlat16_3.zwxz + u_xlat16_4.zwxz;
            u_xlat16_5.z = u_xlat16_3.y;
            u_xlat16_5.w = u_xlat16_7.y;
            u_xlat16_8.z = u_xlat16_4.y;
            u_xlat16_8.w = u_xlat16_55.y;
            u_xlat16_7.xyz = u_xlat16_5.zyw + u_xlat16_8.zyw;
            u_xlat16_9.xyz = u_xlat16_4.xzw / u_xlat16_2.zwy;
            u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_8.xyz = u_xlat16_8.zyw / u_xlat16_7.xyz;
            u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_3.xyz = u_xlat16_9.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_4.xyz = u_xlat16_8.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_3.w = u_xlat16_4.x;
            u_xlat16_5 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.ywxw;
            u_xlat16_8.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.zw;
            u_xlat16_4.w = u_xlat16_3.y;
            u_xlat16_3.yw = u_xlat16_4.yz;
            u_xlat16_9 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xyzy;
            u_xlat16_4 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.wywz;
            u_xlat16_3 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xwzw;
            u_xlat16_10 = u_xlat16_2.zwyz * u_xlat16_7.xxxy;
            u_xlat16_11 = u_xlat16_2 * u_xlat16_7.yyzz;
            u_xlat16_54.x = u_xlat16_2.y * u_xlat16_7.z;
            vec3 txVec4 = vec3(u_xlat16_5.xy,u_xlat0.w);
            u_xlat10_48 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_5.zw,u_xlat0.w);
            u_xlat10_12 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_78 = u_xlat16_10.y * u_xlat10_12;
            u_xlat16_78 = u_xlat16_10.x * u_xlat10_48 + u_xlat16_78;
            vec3 txVec6 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_48 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_78 = u_xlat16_10.z * u_xlat10_48 + u_xlat16_78;
            vec3 txVec7 = vec3(u_xlat16_4.xy,u_xlat0.w);
            u_xlat10_48 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_78 = u_xlat16_10.w * u_xlat10_48 + u_xlat16_78;
            vec3 txVec8 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_48 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_78 = u_xlat16_11.x * u_xlat10_48 + u_xlat16_78;
            vec3 txVec9 = vec3(u_xlat16_9.zw,u_xlat0.w);
            u_xlat10_48 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_78 = u_xlat16_11.y * u_xlat10_48 + u_xlat16_78;
            vec3 txVec10 = vec3(u_xlat16_4.zw,u_xlat0.w);
            u_xlat10_48 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_78 = u_xlat16_11.z * u_xlat10_48 + u_xlat16_78;
            vec3 txVec11 = vec3(u_xlat16_3.xy,u_xlat0.w);
            u_xlat10_48 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_78 = u_xlat16_11.w * u_xlat10_48 + u_xlat16_78;
            vec3 txVec12 = vec3(u_xlat16_3.zw,u_xlat0.w);
            u_xlat10_48 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_30 = u_xlat16_54.x * u_xlat10_48 + u_xlat16_78;
        } else {
            u_xlat16_54.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_54.xy = floor(u_xlat16_54.xy);
            u_xlat16_7.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_54.xy);
            u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
            u_xlat16_4.yw = u_xlat16_3.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_55.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
            u_xlat16_8.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
            u_xlat16_56.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_56.xy) * u_xlat16_56.xy + u_xlat16_8.xy;
            u_xlat16_56.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
            u_xlat16_8.zw = (-u_xlat16_56.xy) * u_xlat16_56.xy + u_xlat16_2.yw;
            u_xlat16_8 = u_xlat16_8 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_2.z = u_xlat16_8.z * 0.0816320032;
            u_xlat16_3.xy = u_xlat16_55.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_55.xy = u_xlat16_8.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_3.z = u_xlat16_8.w * 0.0816320032;
            u_xlat16_2.x = u_xlat16_3.y;
            u_xlat16_2.yw = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_5.xz = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_5.y = u_xlat16_55.x;
            u_xlat16_5.w = u_xlat16_4.y;
            u_xlat16_2 = u_xlat16_2 + u_xlat16_5;
            u_xlat16_3.yw = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_4.xz = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_4.y = u_xlat16_55.y;
            u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
            u_xlat16_5 = u_xlat16_5 / u_xlat16_2;
            u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_4 = u_xlat16_4 / u_xlat16_3;
            u_xlat16_4 = u_xlat16_4 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_5 = u_xlat16_5.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_4 = u_xlat16_4.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_7.xzw = u_xlat16_5.yzw;
            u_xlat16_7.y = u_xlat16_4.x;
            u_xlat16_8 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_9.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_5.y = u_xlat16_7.y;
            u_xlat16_7.y = u_xlat16_4.z;
            u_xlat16_10 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_57.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_5.z = u_xlat16_7.y;
            u_xlat16_11 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyxz;
            u_xlat16_7.y = u_xlat16_4.w;
            u_xlat16_12 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_13.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_5.w = u_xlat16_7.y;
            u_xlat16_61.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xw;
            u_xlat16_4.xzw = u_xlat16_7.xzw;
            u_xlat16_7 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
            u_xlat16_14.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.wy;
            u_xlat16_4.x = u_xlat16_5.x;
            u_xlat16_54.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.xy;
            u_xlat16_4 = u_xlat16_2 * u_xlat16_3.xxxx;
            u_xlat16_5 = u_xlat16_2 * u_xlat16_3.yyyy;
            u_xlat16_15 = u_xlat16_2 * u_xlat16_3.zzzz;
            u_xlat16_2 = u_xlat16_2 * u_xlat16_3.wwww;
            vec3 txVec13 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_8.zw,u_xlat0.w);
            u_xlat10_24.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_8.x = u_xlat10_24.x * u_xlat16_4.y;
            u_xlat16_8.x = u_xlat16_4.x * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec15 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_8.x = u_xlat16_4.z * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec16 = vec3(u_xlat16_11.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_8.x = u_xlat16_4.w * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec17 = vec3(u_xlat16_10.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_8.x = u_xlat16_5.x * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec18 = vec3(u_xlat16_10.zw,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_8.x = u_xlat16_5.y * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec19 = vec3(u_xlat16_57.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_8.x = u_xlat16_5.z * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec20 = vec3(u_xlat16_11.zw,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_8.x = u_xlat16_5.w * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec21 = vec3(u_xlat16_12.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_8.x = u_xlat16_15.x * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec22 = vec3(u_xlat16_12.zw,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_8.x = u_xlat16_15.y * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec23 = vec3(u_xlat16_13.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_8.x = u_xlat16_15.z * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec24 = vec3(u_xlat16_61.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_8.x = u_xlat16_15.w * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec25 = vec3(u_xlat16_7.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_7.x = u_xlat16_2.x * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec26 = vec3(u_xlat16_7.zw,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_7.x = u_xlat16_2.y * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec27 = vec3(u_xlat16_14.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_7.x = u_xlat16_2.z * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec28 = vec3(u_xlat16_54.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_30 = u_xlat16_2.w * u_xlat10_0 + u_xlat16_7.x;
        }
    }
    u_xlat16_54.x = (-u_xlat16_6) + 1.0;
    u_xlat16_6 = u_xlat16_30 * u_xlat16_54.x + u_xlat16_6;
    u_xlat0.x = u_xlat16_6 + -1.0;
    u_xlat0.x = _ReceiveShadowsStrength * u_xlat0.x + 1.0;
    u_xlat24.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_24.xyz = texture2D(_Diff, u_xlat24.xy).xyz;
    u_xlat16.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_16.xy = texture2D(_Em_G_CU_R_MASK, u_xlat16.xy).xy;
    u_xlat40.xyz = u_xlat10_24.xyz * u_xlat10_16.yyy;
    u_xlat10_2 = textureCube(_Cubemap, u_xlat1.xyz);
    u_xlat17.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat18.xyz = u_xlat17.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat18.xyz = u_xlat18.xyz * vec3(_Cube_FW);
    u_xlat17.xyz = u_xlat17.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat18.xyz);
    u_xlat17.xyz = u_xlat18.xyz * u_xlat17.xyz + u_xlat18.xyz;
    u_xlat89 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat17.xyz = vec3(u_xlat89) * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat10_16.xxx * u_xlat17.xyz;
    u_xlat16.xyz = u_xlat40.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat17.xyz;
    u_xlat17.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_17.xyz = texture2D(_Light, u_xlat17.xy).xyz;
    u_xlat18.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat18.xy = u_xlat18.xy + (-vs_TEXCOORD0.xy);
    u_xlat18.xy = vec2(_IsScreenPos) * u_xlat18.xy + vs_TEXCOORD0.xy;
    u_xlat88 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat88 = u_xlat88 * _Time.y;
    u_xlat88 = cos(u_xlat88);
    u_xlat88 = sin(u_xlat88);
    u_xlat66.xy = vec2(u_xlat88) * _Starry_Speed.xxyz.yz + u_xlat18.xy;
    u_xlatb88 = _ViewDir==6.0;
    if(u_xlatb88){
        u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat19.xyz = u_xlat1.xyz * vec3(u_xlat88);
    } else {
        u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat20.xyz = u_xlat1.xzy * vec3(u_xlat88);
        u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat21.xyz = u_xlat1.zyx * vec3(u_xlat88);
        u_xlat1.w = (-u_xlat1.z);
        u_xlat88 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat22.xyz = u_xlat1.xyw * vec3(u_xlat88);
        u_xlatb2 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat23.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat73 = dot(u_xlat23.xyz, u_xlat23.xyz);
        u_xlat73 = inversesqrt(u_xlat73);
        u_xlat23.xyz = vec3(u_xlat73) * u_xlat23.xyz;
        u_xlatb73 = _ViewDir==1.0;
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat88);
        u_xlat1.xyz = bool(u_xlatb73) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb2.w) ? u_xlat23.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb2.z) ? u_xlat22.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb2.y) ? u_xlat21.xyz : u_xlat1.xyz;
        u_xlat19.xyz = (u_xlatb2.x) ? u_xlat20.xyz : u_xlat1.xyz;
    }
    u_xlat1.x = u_xlat19.z + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 2.82842708;
    u_xlat1.xy = u_xlat19.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat49 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat49 = u_xlat49 * 3.14159274;
    u_xlat19.x = sin(u_xlat49);
    u_xlat20.x = cos(u_xlat49);
    u_xlat21.x = (-u_xlat19.x);
    u_xlat21.y = u_xlat20.x;
    u_xlat21.z = u_xlat19.x;
    u_xlat19.x = dot(u_xlat1.xy, u_xlat21.yz);
    u_xlat19.y = dot(u_xlat1.xy, u_xlat21.xy);
    u_xlat1.xy = u_xlat19.xy + vec2(0.5, 0.5);
    u_xlat10_1.xyz = texture2D(_StarryTex, u_xlat1.xy).xyz;
    u_xlat18.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat18.xy;
    u_xlat66.xy = (-u_xlat18.xy) + u_xlat66.xy;
    u_xlat18.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat66.xy + u_xlat18.xy;
    u_xlat18.xy = u_xlat18.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_18.xyz = texture2D(_StarryTex, u_xlat18.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + (-u_xlat10_18.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat10_18.xyz;
    u_xlat18.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat18.xyz = u_xlat1.xyz * u_xlat18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat18.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat17.xyz = u_xlat10_17.xyz * vec3(_light_PW);
    u_xlat24.xyz = u_xlat10_24.xyz * u_xlat17.xyz + u_xlat1.xyz;
    u_xlat24.xyz = u_xlat24.xyz + u_xlat16.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat24.xyz;
    u_xlat16.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat73 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 / _FogDistance;
    u_xlat16.x = max(_FogFade, 0.0);
    u_xlat73 = log2(u_xlat73);
    u_xlat73 = u_xlat73 * u_xlat16.x;
    u_xlat73 = exp2(u_xlat73);
    u_xlat73 = min(u_xlat73, 1.0);
    u_xlat0.xyz = (-u_xlat24.xyz) * u_xlat0.xxx + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat73);
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _Alpha;
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
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
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
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform highp sampler2D _ShadowMapTexture;
uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
bvec4 u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
mediump float u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec4 u_xlat16_8;
mediump vec4 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
lowp float u_xlat10_12;
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
lowp vec2 u_xlat10_16;
vec3 u_xlat17;
lowp vec3 u_xlat10_17;
vec3 u_xlat18;
lowp vec3 u_xlat10_18;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec3 u_xlat24;
lowp vec3 u_xlat10_24;
float u_xlat26;
mediump float u_xlat16_30;
vec3 u_xlat40;
lowp float u_xlat10_48;
bool u_xlatb48;
float u_xlat49;
mediump vec2 u_xlat16_54;
mediump vec2 u_xlat16_55;
mediump vec2 u_xlat16_56;
mediump vec2 u_xlat16_57;
mediump vec2 u_xlat16_61;
vec2 u_xlat66;
float u_xlat72;
bool u_xlatb72;
float u_xlat73;
bool u_xlatb73;
mediump float u_xlat16_78;
float u_xlat88;
bool u_xlatb88;
float u_xlat89;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat72 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat1.xyz = vec3(u_xlat72) * u_xlat1.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat2.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * u_xlat0.xyz + u_xlat2.xyz;
    u_xlat72 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat2.xyz = vec3(u_xlat72) * u_xlat2.xyz;
    u_xlat72 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat72 = u_xlat72 + u_xlat72;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat72)) + (-u_xlat1.xyz);
    u_xlatb72 = _ShadowBias.z!=0.0;
    u_xlat2.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat2.xyz = u_xlat2.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat2.x = (-u_xlat2.x) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat2.xxx + vs_TEXCOORD2.xyz;
    u_xlat0.xyz = (bool(u_xlatb72)) ? u_xlat0.xyz : vs_TEXCOORD2.xyz;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat4;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat5;
    u_xlat3 = u_xlat0.yyyy * u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat4 * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat5 + u_xlat0;
    u_xlat2.x = _ShadowBias.x / u_xlat0.w;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat2.x = u_xlat0.z + (-u_xlat2.x);
    u_xlat26 = max((-u_xlat0.w), u_xlat2.x);
    u_xlat26 = (-u_xlat2.x) + u_xlat26;
    u_xlat0.z = _ShadowBias.y * u_xlat26 + u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat16_6 = (-_ShadowBias.w) + 1.0;
    u_xlatb48 = _softShadowQuality==1.0;
    if(u_xlatb48){
        u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
        u_xlat2.z = 0.0;
        u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
        vec3 txVec0 = vec3(u_xlat2.xy,u_xlat2.z);
        u_xlat2.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec0);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec1 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.y = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec1);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec2 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.z = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec2);
        u_xlat4.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
        u_xlat4.z = 0.0;
        u_xlat4.xyz = u_xlat0.xyw + u_xlat4.xyz;
        vec3 txVec3 = vec3(u_xlat4.xy,u_xlat4.z);
        u_xlat2.w = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec3);
        u_xlat16_30 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlatb48 = _softShadowQuality==2.0;
        if(u_xlatb48){
            u_xlat16_54.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_54.xy = floor(u_xlat16_54.xy);
            u_xlat16_7.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_54.xy);
            u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
            u_xlat16_55.xy = u_xlat16_3.yw * vec2(0.0799999982, 0.0799999982);
            u_xlat16_8.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
            u_xlat16_56.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
            u_xlat16_9.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
            u_xlat16_9.xy = (-u_xlat16_9.xy) * u_xlat16_9.xy + u_xlat16_56.xy;
            u_xlat16_7.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
            u_xlat16_7.xy = (-u_xlat16_7.xy) * u_xlat16_7.xy + u_xlat16_2.yw;
            u_xlat16_9.xy = u_xlat16_9.xy + vec2(1.0, 1.0);
            u_xlat16_7.xy = u_xlat16_7.xy + vec2(1.0, 1.0);
            u_xlat16_3.xy = u_xlat16_8.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_4.xy = u_xlat16_56.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_5.xy = u_xlat16_9.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_8.xy = u_xlat16_7.xy * vec2(0.159999996, 0.159999996);
            u_xlat16_7.xy = u_xlat16_2.yw * vec2(0.159999996, 0.159999996);
            u_xlat16_3.z = u_xlat16_5.x;
            u_xlat16_3.w = u_xlat16_7.x;
            u_xlat16_4.z = u_xlat16_8.x;
            u_xlat16_4.w = u_xlat16_55.x;
            u_xlat16_2 = u_xlat16_3.zwxz + u_xlat16_4.zwxz;
            u_xlat16_5.z = u_xlat16_3.y;
            u_xlat16_5.w = u_xlat16_7.y;
            u_xlat16_8.z = u_xlat16_4.y;
            u_xlat16_8.w = u_xlat16_55.y;
            u_xlat16_7.xyz = u_xlat16_5.zyw + u_xlat16_8.zyw;
            u_xlat16_9.xyz = u_xlat16_4.xzw / u_xlat16_2.zwy;
            u_xlat16_9.xyz = u_xlat16_9.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_8.xyz = u_xlat16_8.zyw / u_xlat16_7.xyz;
            u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-2.5, -0.5, 1.5);
            u_xlat16_3.xyz = u_xlat16_9.yxz * _ShadowMapTexture_TexelSize.xxx;
            u_xlat16_4.xyz = u_xlat16_8.xyz * _ShadowMapTexture_TexelSize.yyy;
            u_xlat16_3.w = u_xlat16_4.x;
            u_xlat16_5 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.ywxw;
            u_xlat16_8.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_3.zw;
            u_xlat16_4.w = u_xlat16_3.y;
            u_xlat16_3.yw = u_xlat16_4.yz;
            u_xlat16_9 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xyzy;
            u_xlat16_4 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.wywz;
            u_xlat16_3 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_3.xwzw;
            u_xlat16_10 = u_xlat16_2.zwyz * u_xlat16_7.xxxy;
            u_xlat16_11 = u_xlat16_2 * u_xlat16_7.yyzz;
            u_xlat16_54.x = u_xlat16_2.y * u_xlat16_7.z;
            vec3 txVec4 = vec3(u_xlat16_5.xy,u_xlat0.w);
            u_xlat10_48 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec4);
            vec3 txVec5 = vec3(u_xlat16_5.zw,u_xlat0.w);
            u_xlat10_12 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_78 = u_xlat16_10.y * u_xlat10_12;
            u_xlat16_78 = u_xlat16_10.x * u_xlat10_48 + u_xlat16_78;
            vec3 txVec6 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_48 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec6);
            u_xlat16_78 = u_xlat16_10.z * u_xlat10_48 + u_xlat16_78;
            vec3 txVec7 = vec3(u_xlat16_4.xy,u_xlat0.w);
            u_xlat10_48 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec7);
            u_xlat16_78 = u_xlat16_10.w * u_xlat10_48 + u_xlat16_78;
            vec3 txVec8 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_48 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec8);
            u_xlat16_78 = u_xlat16_11.x * u_xlat10_48 + u_xlat16_78;
            vec3 txVec9 = vec3(u_xlat16_9.zw,u_xlat0.w);
            u_xlat10_48 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec9);
            u_xlat16_78 = u_xlat16_11.y * u_xlat10_48 + u_xlat16_78;
            vec3 txVec10 = vec3(u_xlat16_4.zw,u_xlat0.w);
            u_xlat10_48 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec10);
            u_xlat16_78 = u_xlat16_11.z * u_xlat10_48 + u_xlat16_78;
            vec3 txVec11 = vec3(u_xlat16_3.xy,u_xlat0.w);
            u_xlat10_48 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec11);
            u_xlat16_78 = u_xlat16_11.w * u_xlat10_48 + u_xlat16_78;
            vec3 txVec12 = vec3(u_xlat16_3.zw,u_xlat0.w);
            u_xlat10_48 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec12);
            u_xlat16_30 = u_xlat16_54.x * u_xlat10_48 + u_xlat16_78;
        } else {
            u_xlat16_54.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
            u_xlat16_54.xy = floor(u_xlat16_54.xy);
            u_xlat16_7.xy = u_xlat0.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat16_54.xy);
            u_xlat16_2 = u_xlat16_7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
            u_xlat16_3 = u_xlat16_2.xxzz * u_xlat16_2.xxzz;
            u_xlat16_4.yw = u_xlat16_3.yw * vec2(0.0408160016, 0.0408160016);
            u_xlat16_55.xy = u_xlat16_3.xz * vec2(0.5, 0.5) + (-u_xlat16_7.xy);
            u_xlat16_8.xy = (-u_xlat16_7.xy) + vec2(1.0, 1.0);
            u_xlat16_56.xy = min(u_xlat16_7.xy, vec2(0.0, 0.0));
            u_xlat16_8.xy = (-u_xlat16_56.xy) * u_xlat16_56.xy + u_xlat16_8.xy;
            u_xlat16_56.xy = max(u_xlat16_7.xy, vec2(0.0, 0.0));
            u_xlat16_8.zw = (-u_xlat16_56.xy) * u_xlat16_56.xy + u_xlat16_2.yw;
            u_xlat16_8 = u_xlat16_8 + vec4(2.0, 2.0, 2.0, 2.0);
            u_xlat16_2.z = u_xlat16_8.z * 0.0816320032;
            u_xlat16_3.xy = u_xlat16_55.yx * vec2(0.0816320032, 0.0816320032);
            u_xlat16_55.xy = u_xlat16_8.xy * vec2(0.0816320032, 0.0816320032);
            u_xlat16_3.z = u_xlat16_8.w * 0.0816320032;
            u_xlat16_2.x = u_xlat16_3.y;
            u_xlat16_2.yw = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_5.xz = u_xlat16_7.xx * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_5.y = u_xlat16_55.x;
            u_xlat16_5.w = u_xlat16_4.y;
            u_xlat16_2 = u_xlat16_2 + u_xlat16_5;
            u_xlat16_3.yw = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.163264006, 0.0816320032);
            u_xlat16_4.xz = u_xlat16_7.yy * vec2(-0.0816320032, 0.0816320032) + vec2(0.0816320032, 0.163264006);
            u_xlat16_4.y = u_xlat16_55.y;
            u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
            u_xlat16_5 = u_xlat16_5 / u_xlat16_2;
            u_xlat16_5 = u_xlat16_5 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_4 = u_xlat16_4 / u_xlat16_3;
            u_xlat16_4 = u_xlat16_4 + vec4(-3.5, -1.5, 0.5, 2.5);
            u_xlat16_5 = u_xlat16_5.wxyz * _ShadowMapTexture_TexelSize.xxxx;
            u_xlat16_4 = u_xlat16_4.xwyz * _ShadowMapTexture_TexelSize.yyyy;
            u_xlat16_7.xzw = u_xlat16_5.yzw;
            u_xlat16_7.y = u_xlat16_4.x;
            u_xlat16_8 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_9.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_5.y = u_xlat16_7.y;
            u_xlat16_7.y = u_xlat16_4.z;
            u_xlat16_10 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_57.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_5.z = u_xlat16_7.y;
            u_xlat16_11 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_5.xyxz;
            u_xlat16_7.y = u_xlat16_4.w;
            u_xlat16_12 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_7.xyzy;
            u_xlat16_13.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_7.wy;
            u_xlat16_5.w = u_xlat16_7.y;
            u_xlat16_61.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_5.xw;
            u_xlat16_4.xzw = u_xlat16_7.xzw;
            u_xlat16_7 = u_xlat16_54.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat16_4.xyzy;
            u_xlat16_14.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.wy;
            u_xlat16_4.x = u_xlat16_5.x;
            u_xlat16_54.xy = u_xlat16_54.xy * _ShadowMapTexture_TexelSize.xy + u_xlat16_4.xy;
            u_xlat16_4 = u_xlat16_2 * u_xlat16_3.xxxx;
            u_xlat16_5 = u_xlat16_2 * u_xlat16_3.yyyy;
            u_xlat16_15 = u_xlat16_2 * u_xlat16_3.zzzz;
            u_xlat16_2 = u_xlat16_2 * u_xlat16_3.wwww;
            vec3 txVec13 = vec3(u_xlat16_8.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec13);
            vec3 txVec14 = vec3(u_xlat16_8.zw,u_xlat0.w);
            u_xlat10_24.x = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec14);
            u_xlat16_8.x = u_xlat10_24.x * u_xlat16_4.y;
            u_xlat16_8.x = u_xlat16_4.x * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec15 = vec3(u_xlat16_9.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec15);
            u_xlat16_8.x = u_xlat16_4.z * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec16 = vec3(u_xlat16_11.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec16);
            u_xlat16_8.x = u_xlat16_4.w * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec17 = vec3(u_xlat16_10.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec17);
            u_xlat16_8.x = u_xlat16_5.x * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec18 = vec3(u_xlat16_10.zw,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec18);
            u_xlat16_8.x = u_xlat16_5.y * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec19 = vec3(u_xlat16_57.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec19);
            u_xlat16_8.x = u_xlat16_5.z * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec20 = vec3(u_xlat16_11.zw,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec20);
            u_xlat16_8.x = u_xlat16_5.w * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec21 = vec3(u_xlat16_12.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec21);
            u_xlat16_8.x = u_xlat16_15.x * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec22 = vec3(u_xlat16_12.zw,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec22);
            u_xlat16_8.x = u_xlat16_15.y * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec23 = vec3(u_xlat16_13.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec23);
            u_xlat16_8.x = u_xlat16_15.z * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec24 = vec3(u_xlat16_61.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec24);
            u_xlat16_8.x = u_xlat16_15.w * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec25 = vec3(u_xlat16_7.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec25);
            u_xlat16_7.x = u_xlat16_2.x * u_xlat10_0 + u_xlat16_8.x;
            vec3 txVec26 = vec3(u_xlat16_7.zw,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec26);
            u_xlat16_7.x = u_xlat16_2.y * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec27 = vec3(u_xlat16_14.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec27);
            u_xlat16_7.x = u_xlat16_2.z * u_xlat10_0 + u_xlat16_7.x;
            vec3 txVec28 = vec3(u_xlat16_54.xy,u_xlat0.w);
            u_xlat10_0 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec28);
            u_xlat16_30 = u_xlat16_2.w * u_xlat10_0 + u_xlat16_7.x;
        }
    }
    u_xlat16_54.x = (-u_xlat16_6) + 1.0;
    u_xlat16_6 = u_xlat16_30 * u_xlat16_54.x + u_xlat16_6;
    u_xlat0.x = u_xlat16_6 + -1.0;
    u_xlat0.x = _ReceiveShadowsStrength * u_xlat0.x + 1.0;
    u_xlat24.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_24.xyz = texture2D(_Diff, u_xlat24.xy).xyz;
    u_xlat16.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_16.xy = texture2D(_Em_G_CU_R_MASK, u_xlat16.xy).xy;
    u_xlat40.xyz = u_xlat10_24.xyz * u_xlat10_16.yyy;
    u_xlat10_2 = textureCube(_Cubemap, u_xlat1.xyz);
    u_xlat17.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat18.xyz = u_xlat17.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat18.xyz = u_xlat18.xyz * vec3(_Cube_FW);
    u_xlat17.xyz = u_xlat17.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat18.xyz);
    u_xlat17.xyz = u_xlat18.xyz * u_xlat17.xyz + u_xlat18.xyz;
    u_xlat89 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat17.xyz = vec3(u_xlat89) * u_xlat17.xyz;
    u_xlat17.xyz = u_xlat10_16.xxx * u_xlat17.xyz;
    u_xlat16.xyz = u_xlat40.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat17.xyz;
    u_xlat17.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_17.xyz = texture2D(_Light, u_xlat17.xy).xyz;
    u_xlat18.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat18.xy = u_xlat18.xy + (-vs_TEXCOORD0.xy);
    u_xlat18.xy = vec2(_IsScreenPos) * u_xlat18.xy + vs_TEXCOORD0.xy;
    u_xlat88 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat88 = u_xlat88 * _Time.y;
    u_xlat88 = cos(u_xlat88);
    u_xlat88 = sin(u_xlat88);
    u_xlat66.xy = vec2(u_xlat88) * _Starry_Speed.xxyz.yz + u_xlat18.xy;
    u_xlatb88 = _ViewDir==6.0;
    if(u_xlatb88){
        u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat19.xyz = u_xlat1.xyz * vec3(u_xlat88);
    } else {
        u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat20.xyz = u_xlat1.xzy * vec3(u_xlat88);
        u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat21.xyz = u_xlat1.zyx * vec3(u_xlat88);
        u_xlat1.w = (-u_xlat1.z);
        u_xlat88 = dot(u_xlat1.xyw, u_xlat1.xyw);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat22.xyz = u_xlat1.xyw * vec3(u_xlat88);
        u_xlatb2 = equal(vec4(vec4(_ViewDir, _ViewDir, _ViewDir, _ViewDir)), vec4(5.0, 4.0, 3.0, 2.0));
        u_xlat23.xyz = u_xlat1.xzy * vec3(1.0, 1.0, -1.0);
        u_xlat73 = dot(u_xlat23.xyz, u_xlat23.xyz);
        u_xlat73 = inversesqrt(u_xlat73);
        u_xlat23.xyz = vec3(u_xlat73) * u_xlat23.xyz;
        u_xlatb73 = _ViewDir==1.0;
        u_xlat1.xyz = u_xlat1.zyx * vec3(1.0, 1.0, -1.0);
        u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
        u_xlat88 = inversesqrt(u_xlat88);
        u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat88);
        u_xlat1.xyz = bool(u_xlatb73) ? u_xlat1.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat1.xyz = (u_xlatb2.w) ? u_xlat23.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb2.z) ? u_xlat22.xyz : u_xlat1.xyz;
        u_xlat1.xyz = (u_xlatb2.y) ? u_xlat21.xyz : u_xlat1.xyz;
        u_xlat19.xyz = (u_xlatb2.x) ? u_xlat20.xyz : u_xlat1.xyz;
    }
    u_xlat1.x = u_xlat19.z + 1.0;
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 2.82842708;
    u_xlat1.xy = u_xlat19.xy / u_xlat1.xx;
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale);
    u_xlat49 = _StarryTexRotator * 0.00555555569 + -1.0;
    u_xlat49 = u_xlat49 * 3.14159274;
    u_xlat19.x = sin(u_xlat49);
    u_xlat20.x = cos(u_xlat49);
    u_xlat21.x = (-u_xlat19.x);
    u_xlat21.y = u_xlat20.x;
    u_xlat21.z = u_xlat19.x;
    u_xlat19.x = dot(u_xlat1.xy, u_xlat21.yz);
    u_xlat19.y = dot(u_xlat1.xy, u_xlat21.xy);
    u_xlat1.xy = u_xlat19.xy + vec2(0.5, 0.5);
    u_xlat10_1.xyz = texture2D(_StarryTex, u_xlat1.xy).xyz;
    u_xlat18.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat18.xy;
    u_xlat66.xy = (-u_xlat18.xy) + u_xlat66.xy;
    u_xlat18.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat66.xy + u_xlat18.xy;
    u_xlat18.xy = u_xlat18.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_18.xyz = texture2D(_StarryTex, u_xlat18.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + (-u_xlat10_18.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat1.xyz + u_xlat10_18.xyz;
    u_xlat18.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat18.xyz = u_xlat1.xyz * u_xlat18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat18.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Starry_Intensity, _Starry_Intensity, _Starry_Intensity));
    u_xlat17.xyz = u_xlat10_17.xyz * vec3(_light_PW);
    u_xlat24.xyz = u_xlat10_24.xyz * u_xlat17.xyz + u_xlat1.xyz;
    u_xlat24.xyz = u_xlat24.xyz + u_xlat16.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat24.xyz;
    u_xlat16.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat73 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 / _FogDistance;
    u_xlat16.x = max(_FogFade, 0.0);
    u_xlat73 = log2(u_xlat73);
    u_xlat73 = u_xlat73 * u_xlat16.x;
    u_xlat73 = exp2(u_xlat73);
    u_xlat73 = min(u_xlat73, 1.0);
    u_xlat0.xyz = (-u_xlat24.xyz) * u_xlat0.xxx + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat73);
    u_xlat0.xyz = vec3(vec3(_EnableCustomFog, _EnableCustomFog, _EnableCustomFog)) * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _Alpha;
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
  GpuProgramID 103350
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