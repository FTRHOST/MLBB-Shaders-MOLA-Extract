//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Shader Forge/Meta_Zhantai_UV4_Starry_DoubleMix" {
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

_Starry_Intensity ("星空强度", Float) = 1.0

[MaterialToggle] _IsScreenPos ("打开屏幕UV坐标|关闭正常UV坐标", Float) = 1.0

[MaterialToggle] _IsLoopUv ("打开循环UV移动|关闭线性UV移动", Float) = 1.0

_MatcapUVScale ("视觉纹理UV缩放", Float) = 1.0

[MaterialToggle] _UseViewDir ("使用视觉纹理", Float) = 0.0

_Starry_Speed ("星空流动(xy:速度 z:循环间隔)", Vector) = (0,0,0,0)

[Space(20)] [Header(Other)] _Diff2 ("Diff2", 2D) = "white" { }

_light_PW2 ("light_PW2", Float) = 5.0

_Em_G_CU_R_MASK2 ("Em_G_CU_R_MASK2", 2D) = "white" { }

_Cube_FW2 ("Cube_FW2", Float) = 0.4000000059604645

_Cube_power2 ("Cube_power2", Float) = 8.0

_ES_PW2 ("ES_PW2", Float) = 2.0

[Space(10)] [Header(Starry)] _StarryTex2 ("星空纹理2", 2D) = "black" { }

_Starry_Intensity2 ("星空强度2", Float) = 1.0

[MaterialToggle] _IsScreenPos2 ("打开屏幕UV坐标|关闭正常UV坐标2", Float) = 1.0

[MaterialToggle] _IsLoopUv2 ("打开循环UV移动|关闭线性UV移动2", Float) = 1.0

_MatcapUVScale2 ("视觉纹理UV缩放2", Float) = 1.0

[MaterialToggle] _UseViewDir2 ("使用视觉纹理2", Float) = 0.0

_Starry_Speed2 ("星空流动(xy:速度 z:循环间隔)2", Vector) = (0,0,0,0)

[Space(10)] [Header(Dissolve)] _DissolveTex ("双混合遮罩", 2D) = "white" { }

_Dissolve ("溶解进度", Range(0, 2)) = 1.0

_SoftEdge ("溶解软边", Float) = 1.0

_DissolveEdge ("溶解边缘", Float) = 1.0

_EdgeColor ("溶解边缘颜色", Color) = (1,1,1,1)

_EdgeColorStrength ("溶解边缘色强度", Float) = 1.0

_NoiseTex ("双混合噪点扰动贴图", 2D) = "white" { }

_Noise_Speed_Strength ("噪点贴图UV速度_强度|XY速度|ZW强度", Vector) = (0,0,1,1)

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
  GpuProgramID 5674
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
uniform 	vec4 _Diff2_ST;
uniform 	vec4 _Em_G_CU_R_MASK2_ST;
uniform 	float _Cube_power2;
uniform 	float _ES_PW2;
uniform 	vec4 _StarryTex_ST;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	vec4 _StarryTex2_ST;
uniform 	float _Starry_Intensity2;
uniform 	mediump float _IsScreenPos2;
uniform 	mediump float _IsLoopUv2;
uniform 	mediump float _UseViewDir2;
uniform 	float _MatcapUVScale2;
uniform 	vec3 _Starry_Speed2;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _SoftEdge;
uniform 	float _DissolveEdge;
uniform 	vec4 _EdgeColor;
uniform 	float _Dissolve;
uniform 	float _EdgeColorStrength;
uniform 	vec4 _Noise_Speed_Strength;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform mediump sampler2D _Diff2;
UNITY_LOCATION(4) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(5) uniform mediump sampler2D _Em_G_CU_R_MASK2;
UNITY_LOCATION(6) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(7) uniform mediump sampler2D _Light;
UNITY_LOCATION(8) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(9) uniform mediump sampler2D _StarryTex2;
UNITY_LOCATION(10) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(11) uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
float u_xlat22;
float u_xlat23;
bool u_xlatb23;
vec2 u_xlat24;
int u_xlati24;
vec2 u_xlat26;
mediump vec2 u_xlat16_26;
vec2 u_xlat29;
vec2 u_xlat30;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
mediump float u_xlat16_34;
bool u_xlatb34;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
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
    u_xlatb33 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb33 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb33){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat33 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb23 = !!(u_xlat33>=1.0);
#else
        u_xlatb23 = u_xlat33>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb34 = !!(0.0>=u_xlat33);
#else
        u_xlatb34 = 0.0>=u_xlat33;
#endif
        u_xlatb23 = u_xlatb34 || u_xlatb23;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb23 = u_xlatb23 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb23 = u_xlatb23 || u_xlatb2.x;
        u_xlatb23 = u_xlatb2.y || u_xlatb23;
        u_xlatb23 = u_xlatb2.z || u_xlatb23;
        if(u_xlatb23){
            u_xlat23 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb34 = !!(0.0<_UsePCF);
#else
            u_xlatb34 = 0.0<_UsePCF;
#endif
            if(u_xlatb34){
                u_xlat34 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat13.x = u_xlat34;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat15.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_35 = textureLod(_CustomShadowTex, u_xlat15.xy, 0.0).x;
                        u_xlat35 = (-u_xlat16_35) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb35 = !!(u_xlat33<u_xlat35);
#else
                        u_xlatb35 = u_xlat33<u_xlat35;
#endif
                        u_xlat35 = (u_xlatb35) ? _CustomShadowStrength : 1.0;
                        u_xlat13.x = u_xlat35 + u_xlat13.x;
                    }
                    u_xlat34 = u_xlat13.x;
                }
                u_xlat23 = u_xlat34 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb33 = !!(u_xlat33<u_xlat1.x);
#else
                u_xlatb33 = u_xlat33<u_xlat1.x;
#endif
                u_xlat23 = (u_xlatb33) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat23 = 1.0;
    }
    u_xlat33 = u_xlat23 + -1.0;
    u_xlat33 = _ReceiveShadowsStrength * u_xlat33 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff2_ST.xy + _Diff2_ST.zw;
    u_xlat16_2.xyz = texture(_Diff2, u_xlat2.xy).xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_4.xy = texture(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat26.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK2_ST.xy + _Em_G_CU_R_MASK2_ST.zw;
    u_xlat16_26.xy = texture(_Em_G_CU_R_MASK2, u_xlat26.xy).xy;
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat16_4.yyy;
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat16_26.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat7.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2));
    u_xlat8.xyz = u_xlat8.xyz * vec3(_Cube_FW);
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat10.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat10.xyz + u_xlat8.xyz;
    u_xlat34 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat8.xyz = vec3(u_xlat34) * u_xlat8.xyz;
    u_xlat4.xyw = u_xlat16_4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2)) + (-u_xlat9.xyz);
    u_xlat7.xyz = u_xlat9.xyz * u_xlat7.xyz + u_xlat9.xyz;
    u_xlat7.xyz = vec3(u_xlat34) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_26.xxx * u_xlat7.xyz;
    u_xlat4.xyz = u_xlat5.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyw;
    u_xlat5.xyz = u_xlat6.xyz * vec3(vec3(_ES_PW2, _ES_PW2, _ES_PW2)) + u_xlat7.xyz;
    u_xlat6.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_6.xyz = texture(_Light, u_xlat6.xy).xyz;
    u_xlat7.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat7.xy = u_xlat7.xy + (-vs_TEXCOORD0.xy);
    u_xlat29.xy = u_xlat7.xy * vec2(_IsScreenPos);
    u_xlat7.xy = vec2(_IsScreenPos) * u_xlat7.xy + vs_TEXCOORD0.xy;
    u_xlat29.xy = vec2(_IsScreenPos2) * u_xlat29.xy + vs_TEXCOORD0.xy;
    u_xlat34 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat8.xy = vec2(u_xlat34) * _Starry_Speed.xxyz.yz + u_xlat7.xy;
    u_xlat34 = (-_Starry_Speed2.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat30.xy = vec2(u_xlat34) * _Starry_Speed2.xxyz.yz + u_xlat29.xy;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat34);
    u_xlat22 = u_xlat0.z * u_xlat34 + 1.0;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = u_xlat22 * 2.82842708;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat22);
    u_xlat9.xy = u_xlat0.xy * vec2(_MatcapUVScale) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale2) + vec2(0.5, 0.5);
    u_xlat16_9.xyz = texture(_StarryTex, u_xlat9.xy).xyz;
    u_xlat16_0.xyz = texture(_StarryTex2, u_xlat0.xy).xyz;
    u_xlat7.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat7.xy;
    u_xlat8.xy = (-u_xlat7.xy) + u_xlat8.xy;
    u_xlat7.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat8.xy + u_xlat7.xy;
    u_xlat29.xy = _Time.yy * _Starry_Speed2.xxyz.yz + u_xlat29.xy;
    u_xlat8.xy = (-u_xlat29.xy) + u_xlat30.xy;
    u_xlat29.xy = vec2(vec2(_IsLoopUv2, _IsLoopUv2)) * u_xlat8.xy + u_xlat29.xy;
    u_xlat7.xy = u_xlat7.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_8.xyz = texture(_StarryTex, u_xlat7.xy).xyz;
    u_xlat7.xy = u_xlat29.xy * _StarryTex2_ST.xy + _StarryTex2_ST.zw;
    u_xlat16_7.xyz = texture(_StarryTex2, u_xlat7.xy).xyz;
    u_xlat9.xyz = (-u_xlat16_8.xyz) + u_xlat16_9.xyz;
    u_xlat8.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat9.xyz + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_7.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir2, _UseViewDir2, _UseViewDir2)) * u_xlat0.xyz + u_xlat16_7.xyz;
    u_xlat7.xyz = u_xlat8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat8.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat0.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(_Starry_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Starry_Intensity2);
    u_xlat6.xyz = u_xlat16_6.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat6.xyz + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat6.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    u_xlat2.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat2.xy = _Noise_Speed_Strength.xy * _Time.yy + u_xlat2.xy;
    u_xlat16_34 = texture(_NoiseTex, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat24.xy = vec2(u_xlat16_34) + (-u_xlat2.xy);
    u_xlat2.xy = _Noise_Speed_Strength.zw * u_xlat24.xy + u_xlat2.xy;
    u_xlat16_2.xy = texture(_DissolveTex, u_xlat2.xy).xw;
    u_xlat34 = (-u_xlat16_2.x) * u_xlat16_2.y + 1.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * 0.526315808;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat2.x = (-_SoftEdge) * 0.49000001 + 1.0;
    u_xlat13.xy = vec2(_SoftEdge, _DissolveEdge) * vec2(0.49000001, 1.00999999) + vec2(-1.0, -0.00999999978);
    u_xlat13.x = _Dissolve * (-u_xlat13.x) + u_xlat13.x;
    u_xlat34 = u_xlat34 + (-u_xlat13.x);
    u_xlat13.x = _SoftEdge * 0.49000001 + (-u_xlat2.x);
    u_xlat35 = (-u_xlat2.x) + u_xlat34;
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat35 = u_xlat13.x * u_xlat35;
#ifdef UNITY_ADRENO_ES3
    u_xlat35 = min(max(u_xlat35, 0.0), 1.0);
#else
    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat35 * -2.0 + 3.0;
    u_xlat35 = u_xlat35 * u_xlat35;
    u_xlat35 = (-u_xlat4.x) * u_xlat35 + 1.0;
    u_xlat35 = max(u_xlat35, 0.0);
    u_xlat34 = (-u_xlat13.y) + u_xlat34;
    u_xlat34 = (-u_xlat2.x) + u_xlat34;
    u_xlat34 = u_xlat13.x * u_xlat34;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat34 * -2.0 + 3.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.0>=_Dissolve);
#else
    u_xlatb2.x = 0.0>=_Dissolve;
#endif
    u_xlat13.x = min(u_xlat34, 1.0);
    u_xlat13.x = u_xlat13.x * u_xlat35;
    u_xlat13.xyz = u_xlat13.xxx * _EdgeColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(vec3(_EdgeColorStrength, _EdgeColorStrength, _EdgeColorStrength));
    u_xlat2.xyz = (u_xlatb2.x) ? vec3(0.0, 0.0, 0.0) : u_xlat13.xyz;
    u_xlat0.xyz = (-u_xlat1.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat34) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat34 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat34 = u_xlat34 / _FogDistance;
    u_xlat2.x = max(_FogFade, 0.0);
    u_xlat34 = log2(u_xlat34);
    u_xlat34 = u_xlat34 * u_xlat2.x;
    u_xlat34 = exp2(u_xlat34);
    u_xlat34 = min(u_xlat34, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	vec4 _Diff2_ST;
uniform 	vec4 _Em_G_CU_R_MASK2_ST;
uniform 	float _Cube_power2;
uniform 	float _ES_PW2;
uniform 	vec4 _StarryTex_ST;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	vec4 _StarryTex2_ST;
uniform 	float _Starry_Intensity2;
uniform 	mediump float _IsScreenPos2;
uniform 	mediump float _IsLoopUv2;
uniform 	mediump float _UseViewDir2;
uniform 	float _MatcapUVScale2;
uniform 	vec3 _Starry_Speed2;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _SoftEdge;
uniform 	float _DissolveEdge;
uniform 	vec4 _EdgeColor;
uniform 	float _Dissolve;
uniform 	float _EdgeColorStrength;
uniform 	vec4 _Noise_Speed_Strength;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform mediump sampler2D _Diff2;
UNITY_LOCATION(4) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(5) uniform mediump sampler2D _Em_G_CU_R_MASK2;
UNITY_LOCATION(6) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(7) uniform mediump sampler2D _Light;
UNITY_LOCATION(8) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(9) uniform mediump sampler2D _StarryTex2;
UNITY_LOCATION(10) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(11) uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
float u_xlat22;
float u_xlat23;
bool u_xlatb23;
vec2 u_xlat24;
int u_xlati24;
vec2 u_xlat26;
mediump vec2 u_xlat16_26;
vec2 u_xlat29;
vec2 u_xlat30;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
mediump float u_xlat16_34;
bool u_xlatb34;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
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
    u_xlatb33 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb33 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb33){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat33 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb23 = !!(u_xlat33>=1.0);
#else
        u_xlatb23 = u_xlat33>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb34 = !!(0.0>=u_xlat33);
#else
        u_xlatb34 = 0.0>=u_xlat33;
#endif
        u_xlatb23 = u_xlatb34 || u_xlatb23;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb23 = u_xlatb23 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb23 = u_xlatb23 || u_xlatb2.x;
        u_xlatb23 = u_xlatb2.y || u_xlatb23;
        u_xlatb23 = u_xlatb2.z || u_xlatb23;
        if(u_xlatb23){
            u_xlat23 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb34 = !!(0.0<_UsePCF);
#else
            u_xlatb34 = 0.0<_UsePCF;
#endif
            if(u_xlatb34){
                u_xlat34 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat13.x = u_xlat34;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat15.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_35 = textureLod(_CustomShadowTex, u_xlat15.xy, 0.0).x;
                        u_xlat35 = (-u_xlat16_35) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb35 = !!(u_xlat33<u_xlat35);
#else
                        u_xlatb35 = u_xlat33<u_xlat35;
#endif
                        u_xlat35 = (u_xlatb35) ? _CustomShadowStrength : 1.0;
                        u_xlat13.x = u_xlat35 + u_xlat13.x;
                    }
                    u_xlat34 = u_xlat13.x;
                }
                u_xlat23 = u_xlat34 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb33 = !!(u_xlat33<u_xlat1.x);
#else
                u_xlatb33 = u_xlat33<u_xlat1.x;
#endif
                u_xlat23 = (u_xlatb33) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat23 = 1.0;
    }
    u_xlat33 = u_xlat23 + -1.0;
    u_xlat33 = _ReceiveShadowsStrength * u_xlat33 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff2_ST.xy + _Diff2_ST.zw;
    u_xlat16_2.xyz = texture(_Diff2, u_xlat2.xy).xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_4.xy = texture(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat26.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK2_ST.xy + _Em_G_CU_R_MASK2_ST.zw;
    u_xlat16_26.xy = texture(_Em_G_CU_R_MASK2, u_xlat26.xy).xy;
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat16_4.yyy;
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat16_26.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat7.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2));
    u_xlat8.xyz = u_xlat8.xyz * vec3(_Cube_FW);
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat10.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat10.xyz + u_xlat8.xyz;
    u_xlat34 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat8.xyz = vec3(u_xlat34) * u_xlat8.xyz;
    u_xlat4.xyw = u_xlat16_4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2)) + (-u_xlat9.xyz);
    u_xlat7.xyz = u_xlat9.xyz * u_xlat7.xyz + u_xlat9.xyz;
    u_xlat7.xyz = vec3(u_xlat34) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_26.xxx * u_xlat7.xyz;
    u_xlat4.xyz = u_xlat5.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyw;
    u_xlat5.xyz = u_xlat6.xyz * vec3(vec3(_ES_PW2, _ES_PW2, _ES_PW2)) + u_xlat7.xyz;
    u_xlat6.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_6.xyz = texture(_Light, u_xlat6.xy).xyz;
    u_xlat7.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat7.xy = u_xlat7.xy + (-vs_TEXCOORD0.xy);
    u_xlat29.xy = u_xlat7.xy * vec2(_IsScreenPos);
    u_xlat7.xy = vec2(_IsScreenPos) * u_xlat7.xy + vs_TEXCOORD0.xy;
    u_xlat29.xy = vec2(_IsScreenPos2) * u_xlat29.xy + vs_TEXCOORD0.xy;
    u_xlat34 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat8.xy = vec2(u_xlat34) * _Starry_Speed.xxyz.yz + u_xlat7.xy;
    u_xlat34 = (-_Starry_Speed2.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat30.xy = vec2(u_xlat34) * _Starry_Speed2.xxyz.yz + u_xlat29.xy;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat34);
    u_xlat22 = u_xlat0.z * u_xlat34 + 1.0;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = u_xlat22 * 2.82842708;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat22);
    u_xlat9.xy = u_xlat0.xy * vec2(_MatcapUVScale) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale2) + vec2(0.5, 0.5);
    u_xlat16_9.xyz = texture(_StarryTex, u_xlat9.xy).xyz;
    u_xlat16_0.xyz = texture(_StarryTex2, u_xlat0.xy).xyz;
    u_xlat7.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat7.xy;
    u_xlat8.xy = (-u_xlat7.xy) + u_xlat8.xy;
    u_xlat7.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat8.xy + u_xlat7.xy;
    u_xlat29.xy = _Time.yy * _Starry_Speed2.xxyz.yz + u_xlat29.xy;
    u_xlat8.xy = (-u_xlat29.xy) + u_xlat30.xy;
    u_xlat29.xy = vec2(vec2(_IsLoopUv2, _IsLoopUv2)) * u_xlat8.xy + u_xlat29.xy;
    u_xlat7.xy = u_xlat7.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_8.xyz = texture(_StarryTex, u_xlat7.xy).xyz;
    u_xlat7.xy = u_xlat29.xy * _StarryTex2_ST.xy + _StarryTex2_ST.zw;
    u_xlat16_7.xyz = texture(_StarryTex2, u_xlat7.xy).xyz;
    u_xlat9.xyz = (-u_xlat16_8.xyz) + u_xlat16_9.xyz;
    u_xlat8.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat9.xyz + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_7.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir2, _UseViewDir2, _UseViewDir2)) * u_xlat0.xyz + u_xlat16_7.xyz;
    u_xlat7.xyz = u_xlat8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat8.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat0.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(_Starry_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Starry_Intensity2);
    u_xlat6.xyz = u_xlat16_6.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat6.xyz + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat6.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    u_xlat2.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat2.xy = _Noise_Speed_Strength.xy * _Time.yy + u_xlat2.xy;
    u_xlat16_34 = texture(_NoiseTex, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat24.xy = vec2(u_xlat16_34) + (-u_xlat2.xy);
    u_xlat2.xy = _Noise_Speed_Strength.zw * u_xlat24.xy + u_xlat2.xy;
    u_xlat16_2.xy = texture(_DissolveTex, u_xlat2.xy).xw;
    u_xlat34 = (-u_xlat16_2.x) * u_xlat16_2.y + 1.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * 0.526315808;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat2.x = (-_SoftEdge) * 0.49000001 + 1.0;
    u_xlat13.xy = vec2(_SoftEdge, _DissolveEdge) * vec2(0.49000001, 1.00999999) + vec2(-1.0, -0.00999999978);
    u_xlat13.x = _Dissolve * (-u_xlat13.x) + u_xlat13.x;
    u_xlat34 = u_xlat34 + (-u_xlat13.x);
    u_xlat13.x = _SoftEdge * 0.49000001 + (-u_xlat2.x);
    u_xlat35 = (-u_xlat2.x) + u_xlat34;
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat35 = u_xlat13.x * u_xlat35;
#ifdef UNITY_ADRENO_ES3
    u_xlat35 = min(max(u_xlat35, 0.0), 1.0);
#else
    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat35 * -2.0 + 3.0;
    u_xlat35 = u_xlat35 * u_xlat35;
    u_xlat35 = (-u_xlat4.x) * u_xlat35 + 1.0;
    u_xlat35 = max(u_xlat35, 0.0);
    u_xlat34 = (-u_xlat13.y) + u_xlat34;
    u_xlat34 = (-u_xlat2.x) + u_xlat34;
    u_xlat34 = u_xlat13.x * u_xlat34;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat34 * -2.0 + 3.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.0>=_Dissolve);
#else
    u_xlatb2.x = 0.0>=_Dissolve;
#endif
    u_xlat13.x = min(u_xlat34, 1.0);
    u_xlat13.x = u_xlat13.x * u_xlat35;
    u_xlat13.xyz = u_xlat13.xxx * _EdgeColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(vec3(_EdgeColorStrength, _EdgeColorStrength, _EdgeColorStrength));
    u_xlat2.xyz = (u_xlatb2.x) ? vec3(0.0, 0.0, 0.0) : u_xlat13.xyz;
    u_xlat0.xyz = (-u_xlat1.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat34) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat34 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat34 = u_xlat34 / _FogDistance;
    u_xlat2.x = max(_FogFade, 0.0);
    u_xlat34 = log2(u_xlat34);
    u_xlat34 = u_xlat34 * u_xlat2.x;
    u_xlat34 = exp2(u_xlat34);
    u_xlat34 = min(u_xlat34, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	vec4 _Diff2_ST;
uniform 	vec4 _Em_G_CU_R_MASK2_ST;
uniform 	float _Cube_power2;
uniform 	float _ES_PW2;
uniform 	vec4 _StarryTex_ST;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	vec4 _StarryTex2_ST;
uniform 	float _Starry_Intensity2;
uniform 	mediump float _IsScreenPos2;
uniform 	mediump float _IsLoopUv2;
uniform 	mediump float _UseViewDir2;
uniform 	float _MatcapUVScale2;
uniform 	vec3 _Starry_Speed2;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _SoftEdge;
uniform 	float _DissolveEdge;
uniform 	vec4 _EdgeColor;
uniform 	float _Dissolve;
uniform 	float _EdgeColorStrength;
uniform 	vec4 _Noise_Speed_Strength;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Diff2;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp sampler2D _Em_G_CU_R_MASK2;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform lowp sampler2D _StarryTex2;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec2 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
vec3 u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
float u_xlat22;
float u_xlat23;
bool u_xlatb23;
vec2 u_xlat24;
int u_xlati24;
vec2 u_xlat26;
lowp vec2 u_xlat10_26;
vec2 u_xlat29;
vec2 u_xlat30;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
lowp float u_xlat10_34;
bool u_xlatb34;
float u_xlat35;
lowp float u_xlat10_35;
bool u_xlatb35;
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
    u_xlatb33 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb33){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat33 = (-u_xlat1.z) + 1.0;
        u_xlatb23 = u_xlat33>=1.0;
        u_xlatb34 = 0.0>=u_xlat33;
        u_xlatb23 = u_xlatb34 || u_xlatb23;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb23 = u_xlatb23 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb23 = u_xlatb23 || u_xlatb2.x;
        u_xlatb23 = u_xlatb2.y || u_xlatb23;
        u_xlatb23 = u_xlatb2.z || u_xlatb23;
        if(u_xlatb23){
            u_xlat23 = 1.0;
        } else {
            u_xlatb34 = 0.0<_UsePCF;
            if(u_xlatb34){
                u_xlat34 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat13.x = u_xlat34;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat15.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_35 = texture2DLodEXT(_CustomShadowTex, u_xlat15.xy, 0.0).x;
                        u_xlat35 = (-u_xlat10_35) + 1.0;
                        u_xlatb35 = u_xlat33<u_xlat35;
                        u_xlat35 = (u_xlatb35) ? _CustomShadowStrength : 1.0;
                        u_xlat13.x = u_xlat35 + u_xlat13.x;
                    }
                    u_xlat34 = u_xlat13.x;
                }
                u_xlat23 = u_xlat34 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb33 = u_xlat33<u_xlat1.x;
                u_xlat23 = (u_xlatb33) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat23 = 1.0;
    }
    u_xlat33 = u_xlat23 + -1.0;
    u_xlat33 = _ReceiveShadowsStrength * u_xlat33 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff2_ST.xy + _Diff2_ST.zw;
    u_xlat10_2.xyz = texture2D(_Diff2, u_xlat2.xy).xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_4.xy = texture2D(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat26.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK2_ST.xy + _Em_G_CU_R_MASK2_ST.zw;
    u_xlat10_26.xy = texture2D(_Em_G_CU_R_MASK2, u_xlat26.xy).xy;
    u_xlat5.xyz = u_xlat10_1.xyz * u_xlat10_4.yyy;
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat10_26.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat7.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2));
    u_xlat8.xyz = u_xlat8.xyz * vec3(_Cube_FW);
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat10.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat10.xyz + u_xlat8.xyz;
    u_xlat34 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat8.xyz = vec3(u_xlat34) * u_xlat8.xyz;
    u_xlat4.xyw = u_xlat10_4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2)) + (-u_xlat9.xyz);
    u_xlat7.xyz = u_xlat9.xyz * u_xlat7.xyz + u_xlat9.xyz;
    u_xlat7.xyz = vec3(u_xlat34) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat10_26.xxx * u_xlat7.xyz;
    u_xlat4.xyz = u_xlat5.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyw;
    u_xlat5.xyz = u_xlat6.xyz * vec3(vec3(_ES_PW2, _ES_PW2, _ES_PW2)) + u_xlat7.xyz;
    u_xlat6.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_6.xyz = texture2D(_Light, u_xlat6.xy).xyz;
    u_xlat7.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat7.xy = u_xlat7.xy + (-vs_TEXCOORD0.xy);
    u_xlat29.xy = u_xlat7.xy * vec2(_IsScreenPos);
    u_xlat7.xy = vec2(_IsScreenPos) * u_xlat7.xy + vs_TEXCOORD0.xy;
    u_xlat29.xy = vec2(_IsScreenPos2) * u_xlat29.xy + vs_TEXCOORD0.xy;
    u_xlat34 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat8.xy = vec2(u_xlat34) * _Starry_Speed.xxyz.yz + u_xlat7.xy;
    u_xlat34 = (-_Starry_Speed2.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat30.xy = vec2(u_xlat34) * _Starry_Speed2.xxyz.yz + u_xlat29.xy;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat34);
    u_xlat22 = u_xlat0.z * u_xlat34 + 1.0;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = u_xlat22 * 2.82842708;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat22);
    u_xlat9.xy = u_xlat0.xy * vec2(_MatcapUVScale) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale2) + vec2(0.5, 0.5);
    u_xlat10_9.xyz = texture2D(_StarryTex, u_xlat9.xy).xyz;
    u_xlat10_0.xyz = texture2D(_StarryTex2, u_xlat0.xy).xyz;
    u_xlat7.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat7.xy;
    u_xlat8.xy = (-u_xlat7.xy) + u_xlat8.xy;
    u_xlat7.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat8.xy + u_xlat7.xy;
    u_xlat29.xy = _Time.yy * _Starry_Speed2.xxyz.yz + u_xlat29.xy;
    u_xlat8.xy = (-u_xlat29.xy) + u_xlat30.xy;
    u_xlat29.xy = vec2(vec2(_IsLoopUv2, _IsLoopUv2)) * u_xlat8.xy + u_xlat29.xy;
    u_xlat7.xy = u_xlat7.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_8.xyz = texture2D(_StarryTex, u_xlat7.xy).xyz;
    u_xlat7.xy = u_xlat29.xy * _StarryTex2_ST.xy + _StarryTex2_ST.zw;
    u_xlat10_7.xyz = texture2D(_StarryTex2, u_xlat7.xy).xyz;
    u_xlat9.xyz = (-u_xlat10_8.xyz) + u_xlat10_9.xyz;
    u_xlat8.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat9.xyz + u_xlat10_8.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat10_7.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir2, _UseViewDir2, _UseViewDir2)) * u_xlat0.xyz + u_xlat10_7.xyz;
    u_xlat7.xyz = u_xlat8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat8.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat0.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(_Starry_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Starry_Intensity2);
    u_xlat6.xyz = u_xlat10_6.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat6.xyz + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat10_2.xyz * u_xlat6.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    u_xlat2.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat2.xy = _Noise_Speed_Strength.xy * _Time.yy + u_xlat2.xy;
    u_xlat10_34 = texture2D(_NoiseTex, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat24.xy = vec2(u_xlat10_34) + (-u_xlat2.xy);
    u_xlat2.xy = _Noise_Speed_Strength.zw * u_xlat24.xy + u_xlat2.xy;
    u_xlat10_2.xy = texture2D(_DissolveTex, u_xlat2.xy).xw;
    u_xlat34 = (-u_xlat10_2.x) * u_xlat10_2.y + 1.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * 0.526315808;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat2.x = (-_SoftEdge) * 0.49000001 + 1.0;
    u_xlat13.xy = vec2(_SoftEdge, _DissolveEdge) * vec2(0.49000001, 1.00999999) + vec2(-1.0, -0.00999999978);
    u_xlat13.x = _Dissolve * (-u_xlat13.x) + u_xlat13.x;
    u_xlat34 = u_xlat34 + (-u_xlat13.x);
    u_xlat13.x = _SoftEdge * 0.49000001 + (-u_xlat2.x);
    u_xlat35 = (-u_xlat2.x) + u_xlat34;
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat35 = u_xlat13.x * u_xlat35;
    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
    u_xlat4.x = u_xlat35 * -2.0 + 3.0;
    u_xlat35 = u_xlat35 * u_xlat35;
    u_xlat35 = (-u_xlat4.x) * u_xlat35 + 1.0;
    u_xlat35 = max(u_xlat35, 0.0);
    u_xlat34 = (-u_xlat13.y) + u_xlat34;
    u_xlat34 = (-u_xlat2.x) + u_xlat34;
    u_xlat34 = u_xlat13.x * u_xlat34;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat2.x = u_xlat34 * -2.0 + 3.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * u_xlat2.x;
    u_xlatb2.x = 0.0>=_Dissolve;
    u_xlat13.x = min(u_xlat34, 1.0);
    u_xlat13.x = u_xlat13.x * u_xlat35;
    u_xlat13.xyz = u_xlat13.xxx * _EdgeColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(vec3(_EdgeColorStrength, _EdgeColorStrength, _EdgeColorStrength));
    u_xlat2.xyz = (u_xlatb2.x) ? vec3(0.0, 0.0, 0.0) : u_xlat13.xyz;
    u_xlat0.xyz = (-u_xlat1.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat34) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat34 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat34 = u_xlat34 / _FogDistance;
    u_xlat2.x = max(_FogFade, 0.0);
    u_xlat34 = log2(u_xlat34);
    u_xlat34 = u_xlat34 * u_xlat2.x;
    u_xlat34 = exp2(u_xlat34);
    u_xlat34 = min(u_xlat34, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	vec4 _Diff2_ST;
uniform 	vec4 _Em_G_CU_R_MASK2_ST;
uniform 	float _Cube_power2;
uniform 	float _ES_PW2;
uniform 	vec4 _StarryTex_ST;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	vec4 _StarryTex2_ST;
uniform 	float _Starry_Intensity2;
uniform 	mediump float _IsScreenPos2;
uniform 	mediump float _IsLoopUv2;
uniform 	mediump float _UseViewDir2;
uniform 	float _MatcapUVScale2;
uniform 	vec3 _Starry_Speed2;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _SoftEdge;
uniform 	float _DissolveEdge;
uniform 	vec4 _EdgeColor;
uniform 	float _Dissolve;
uniform 	float _EdgeColorStrength;
uniform 	vec4 _Noise_Speed_Strength;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Diff2;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp sampler2D _Em_G_CU_R_MASK2;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform lowp sampler2D _StarryTex2;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec2 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
vec3 u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
float u_xlat22;
float u_xlat23;
bool u_xlatb23;
vec2 u_xlat24;
int u_xlati24;
vec2 u_xlat26;
lowp vec2 u_xlat10_26;
vec2 u_xlat29;
vec2 u_xlat30;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
lowp float u_xlat10_34;
bool u_xlatb34;
float u_xlat35;
lowp float u_xlat10_35;
bool u_xlatb35;
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
    u_xlatb33 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb33){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat33 = (-u_xlat1.z) + 1.0;
        u_xlatb23 = u_xlat33>=1.0;
        u_xlatb34 = 0.0>=u_xlat33;
        u_xlatb23 = u_xlatb34 || u_xlatb23;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb23 = u_xlatb23 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb23 = u_xlatb23 || u_xlatb2.x;
        u_xlatb23 = u_xlatb2.y || u_xlatb23;
        u_xlatb23 = u_xlatb2.z || u_xlatb23;
        if(u_xlatb23){
            u_xlat23 = 1.0;
        } else {
            u_xlatb34 = 0.0<_UsePCF;
            if(u_xlatb34){
                u_xlat34 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat13.x = u_xlat34;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat15.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_35 = texture2DLodEXT(_CustomShadowTex, u_xlat15.xy, 0.0).x;
                        u_xlat35 = (-u_xlat10_35) + 1.0;
                        u_xlatb35 = u_xlat33<u_xlat35;
                        u_xlat35 = (u_xlatb35) ? _CustomShadowStrength : 1.0;
                        u_xlat13.x = u_xlat35 + u_xlat13.x;
                    }
                    u_xlat34 = u_xlat13.x;
                }
                u_xlat23 = u_xlat34 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb33 = u_xlat33<u_xlat1.x;
                u_xlat23 = (u_xlatb33) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat23 = 1.0;
    }
    u_xlat33 = u_xlat23 + -1.0;
    u_xlat33 = _ReceiveShadowsStrength * u_xlat33 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff2_ST.xy + _Diff2_ST.zw;
    u_xlat10_2.xyz = texture2D(_Diff2, u_xlat2.xy).xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_4.xy = texture2D(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat26.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK2_ST.xy + _Em_G_CU_R_MASK2_ST.zw;
    u_xlat10_26.xy = texture2D(_Em_G_CU_R_MASK2, u_xlat26.xy).xy;
    u_xlat5.xyz = u_xlat10_1.xyz * u_xlat10_4.yyy;
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat10_26.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat7.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2));
    u_xlat8.xyz = u_xlat8.xyz * vec3(_Cube_FW);
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat10.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat10.xyz + u_xlat8.xyz;
    u_xlat34 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat8.xyz = vec3(u_xlat34) * u_xlat8.xyz;
    u_xlat4.xyw = u_xlat10_4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2)) + (-u_xlat9.xyz);
    u_xlat7.xyz = u_xlat9.xyz * u_xlat7.xyz + u_xlat9.xyz;
    u_xlat7.xyz = vec3(u_xlat34) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat10_26.xxx * u_xlat7.xyz;
    u_xlat4.xyz = u_xlat5.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyw;
    u_xlat5.xyz = u_xlat6.xyz * vec3(vec3(_ES_PW2, _ES_PW2, _ES_PW2)) + u_xlat7.xyz;
    u_xlat6.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_6.xyz = texture2D(_Light, u_xlat6.xy).xyz;
    u_xlat7.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat7.xy = u_xlat7.xy + (-vs_TEXCOORD0.xy);
    u_xlat29.xy = u_xlat7.xy * vec2(_IsScreenPos);
    u_xlat7.xy = vec2(_IsScreenPos) * u_xlat7.xy + vs_TEXCOORD0.xy;
    u_xlat29.xy = vec2(_IsScreenPos2) * u_xlat29.xy + vs_TEXCOORD0.xy;
    u_xlat34 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat8.xy = vec2(u_xlat34) * _Starry_Speed.xxyz.yz + u_xlat7.xy;
    u_xlat34 = (-_Starry_Speed2.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat30.xy = vec2(u_xlat34) * _Starry_Speed2.xxyz.yz + u_xlat29.xy;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat34);
    u_xlat22 = u_xlat0.z * u_xlat34 + 1.0;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = u_xlat22 * 2.82842708;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat22);
    u_xlat9.xy = u_xlat0.xy * vec2(_MatcapUVScale) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale2) + vec2(0.5, 0.5);
    u_xlat10_9.xyz = texture2D(_StarryTex, u_xlat9.xy).xyz;
    u_xlat10_0.xyz = texture2D(_StarryTex2, u_xlat0.xy).xyz;
    u_xlat7.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat7.xy;
    u_xlat8.xy = (-u_xlat7.xy) + u_xlat8.xy;
    u_xlat7.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat8.xy + u_xlat7.xy;
    u_xlat29.xy = _Time.yy * _Starry_Speed2.xxyz.yz + u_xlat29.xy;
    u_xlat8.xy = (-u_xlat29.xy) + u_xlat30.xy;
    u_xlat29.xy = vec2(vec2(_IsLoopUv2, _IsLoopUv2)) * u_xlat8.xy + u_xlat29.xy;
    u_xlat7.xy = u_xlat7.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_8.xyz = texture2D(_StarryTex, u_xlat7.xy).xyz;
    u_xlat7.xy = u_xlat29.xy * _StarryTex2_ST.xy + _StarryTex2_ST.zw;
    u_xlat10_7.xyz = texture2D(_StarryTex2, u_xlat7.xy).xyz;
    u_xlat9.xyz = (-u_xlat10_8.xyz) + u_xlat10_9.xyz;
    u_xlat8.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat9.xyz + u_xlat10_8.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat10_7.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir2, _UseViewDir2, _UseViewDir2)) * u_xlat0.xyz + u_xlat10_7.xyz;
    u_xlat7.xyz = u_xlat8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat8.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat0.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(_Starry_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Starry_Intensity2);
    u_xlat6.xyz = u_xlat10_6.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat6.xyz + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat10_2.xyz * u_xlat6.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    u_xlat2.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat2.xy = _Noise_Speed_Strength.xy * _Time.yy + u_xlat2.xy;
    u_xlat10_34 = texture2D(_NoiseTex, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat24.xy = vec2(u_xlat10_34) + (-u_xlat2.xy);
    u_xlat2.xy = _Noise_Speed_Strength.zw * u_xlat24.xy + u_xlat2.xy;
    u_xlat10_2.xy = texture2D(_DissolveTex, u_xlat2.xy).xw;
    u_xlat34 = (-u_xlat10_2.x) * u_xlat10_2.y + 1.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * 0.526315808;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat2.x = (-_SoftEdge) * 0.49000001 + 1.0;
    u_xlat13.xy = vec2(_SoftEdge, _DissolveEdge) * vec2(0.49000001, 1.00999999) + vec2(-1.0, -0.00999999978);
    u_xlat13.x = _Dissolve * (-u_xlat13.x) + u_xlat13.x;
    u_xlat34 = u_xlat34 + (-u_xlat13.x);
    u_xlat13.x = _SoftEdge * 0.49000001 + (-u_xlat2.x);
    u_xlat35 = (-u_xlat2.x) + u_xlat34;
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat35 = u_xlat13.x * u_xlat35;
    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
    u_xlat4.x = u_xlat35 * -2.0 + 3.0;
    u_xlat35 = u_xlat35 * u_xlat35;
    u_xlat35 = (-u_xlat4.x) * u_xlat35 + 1.0;
    u_xlat35 = max(u_xlat35, 0.0);
    u_xlat34 = (-u_xlat13.y) + u_xlat34;
    u_xlat34 = (-u_xlat2.x) + u_xlat34;
    u_xlat34 = u_xlat13.x * u_xlat34;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat2.x = u_xlat34 * -2.0 + 3.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * u_xlat2.x;
    u_xlatb2.x = 0.0>=_Dissolve;
    u_xlat13.x = min(u_xlat34, 1.0);
    u_xlat13.x = u_xlat13.x * u_xlat35;
    u_xlat13.xyz = u_xlat13.xxx * _EdgeColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(vec3(_EdgeColorStrength, _EdgeColorStrength, _EdgeColorStrength));
    u_xlat2.xyz = (u_xlatb2.x) ? vec3(0.0, 0.0, 0.0) : u_xlat13.xyz;
    u_xlat0.xyz = (-u_xlat1.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat34) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat34 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat34 = u_xlat34 / _FogDistance;
    u_xlat2.x = max(_FogFade, 0.0);
    u_xlat34 = log2(u_xlat34);
    u_xlat34 = u_xlat34 * u_xlat2.x;
    u_xlat34 = exp2(u_xlat34);
    u_xlat34 = min(u_xlat34, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	vec4 _Diff2_ST;
uniform 	vec4 _Em_G_CU_R_MASK2_ST;
uniform 	float _Cube_power2;
uniform 	float _ES_PW2;
uniform 	vec4 _StarryTex_ST;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	vec4 _StarryTex2_ST;
uniform 	float _Starry_Intensity2;
uniform 	mediump float _IsScreenPos2;
uniform 	mediump float _IsLoopUv2;
uniform 	mediump float _UseViewDir2;
uniform 	float _MatcapUVScale2;
uniform 	vec3 _Starry_Speed2;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _SoftEdge;
uniform 	float _DissolveEdge;
uniform 	vec4 _EdgeColor;
uniform 	float _Dissolve;
uniform 	float _EdgeColorStrength;
uniform 	vec4 _Noise_Speed_Strength;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform mediump sampler2D _Diff2;
UNITY_LOCATION(4) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(5) uniform mediump sampler2D _Em_G_CU_R_MASK2;
UNITY_LOCATION(6) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(7) uniform mediump sampler2D _Light;
UNITY_LOCATION(8) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(9) uniform mediump sampler2D _StarryTex2;
UNITY_LOCATION(10) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(11) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(12) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(13) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
float u_xlat22;
float u_xlat23;
bool u_xlatb23;
vec2 u_xlat24;
int u_xlati24;
vec2 u_xlat26;
mediump vec2 u_xlat16_26;
vec2 u_xlat29;
vec2 u_xlat30;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
mediump float u_xlat16_34;
bool u_xlatb34;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
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
    u_xlatb33 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb33 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb33){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat33 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb23 = !!(u_xlat33>=1.0);
#else
        u_xlatb23 = u_xlat33>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb34 = !!(0.0>=u_xlat33);
#else
        u_xlatb34 = 0.0>=u_xlat33;
#endif
        u_xlatb23 = u_xlatb34 || u_xlatb23;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb23 = u_xlatb23 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb23 = u_xlatb23 || u_xlatb2.x;
        u_xlatb23 = u_xlatb2.y || u_xlatb23;
        u_xlatb23 = u_xlatb2.z || u_xlatb23;
        if(u_xlatb23){
            u_xlat23 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb34 = !!(0.0<_UsePCF);
#else
            u_xlatb34 = 0.0<_UsePCF;
#endif
            if(u_xlatb34){
                u_xlat34 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat13.x = u_xlat34;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat15.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_35 = textureLod(_CustomShadowTex, u_xlat15.xy, 0.0).x;
                        u_xlat35 = (-u_xlat16_35) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb35 = !!(u_xlat33<u_xlat35);
#else
                        u_xlatb35 = u_xlat33<u_xlat35;
#endif
                        u_xlat35 = (u_xlatb35) ? _CustomShadowStrength : 1.0;
                        u_xlat13.x = u_xlat35 + u_xlat13.x;
                    }
                    u_xlat34 = u_xlat13.x;
                }
                u_xlat23 = u_xlat34 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb33 = !!(u_xlat33<u_xlat1.x);
#else
                u_xlatb33 = u_xlat33<u_xlat1.x;
#endif
                u_xlat23 = (u_xlatb33) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD7.xyz / vs_TEXCOORD7.www;
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
        u_xlat33 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat23 = u_xlat33 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat33 = u_xlat23 + -1.0;
    u_xlat33 = _ReceiveShadowsStrength * u_xlat33 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff2_ST.xy + _Diff2_ST.zw;
    u_xlat16_2.xyz = texture(_Diff2, u_xlat2.xy).xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_4.xy = texture(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat26.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK2_ST.xy + _Em_G_CU_R_MASK2_ST.zw;
    u_xlat16_26.xy = texture(_Em_G_CU_R_MASK2, u_xlat26.xy).xy;
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat16_4.yyy;
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat16_26.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat7.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2));
    u_xlat8.xyz = u_xlat8.xyz * vec3(_Cube_FW);
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat10.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat10.xyz + u_xlat8.xyz;
    u_xlat34 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat8.xyz = vec3(u_xlat34) * u_xlat8.xyz;
    u_xlat4.xyw = u_xlat16_4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2)) + (-u_xlat9.xyz);
    u_xlat7.xyz = u_xlat9.xyz * u_xlat7.xyz + u_xlat9.xyz;
    u_xlat7.xyz = vec3(u_xlat34) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_26.xxx * u_xlat7.xyz;
    u_xlat4.xyz = u_xlat5.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyw;
    u_xlat5.xyz = u_xlat6.xyz * vec3(vec3(_ES_PW2, _ES_PW2, _ES_PW2)) + u_xlat7.xyz;
    u_xlat6.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_6.xyz = texture(_Light, u_xlat6.xy).xyz;
    u_xlat7.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat7.xy = u_xlat7.xy + (-vs_TEXCOORD0.xy);
    u_xlat29.xy = u_xlat7.xy * vec2(_IsScreenPos);
    u_xlat7.xy = vec2(_IsScreenPos) * u_xlat7.xy + vs_TEXCOORD0.xy;
    u_xlat29.xy = vec2(_IsScreenPos2) * u_xlat29.xy + vs_TEXCOORD0.xy;
    u_xlat34 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat8.xy = vec2(u_xlat34) * _Starry_Speed.xxyz.yz + u_xlat7.xy;
    u_xlat34 = (-_Starry_Speed2.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat30.xy = vec2(u_xlat34) * _Starry_Speed2.xxyz.yz + u_xlat29.xy;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat34);
    u_xlat22 = u_xlat0.z * u_xlat34 + 1.0;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = u_xlat22 * 2.82842708;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat22);
    u_xlat9.xy = u_xlat0.xy * vec2(_MatcapUVScale) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale2) + vec2(0.5, 0.5);
    u_xlat16_9.xyz = texture(_StarryTex, u_xlat9.xy).xyz;
    u_xlat16_0.xyz = texture(_StarryTex2, u_xlat0.xy).xyz;
    u_xlat7.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat7.xy;
    u_xlat8.xy = (-u_xlat7.xy) + u_xlat8.xy;
    u_xlat7.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat8.xy + u_xlat7.xy;
    u_xlat29.xy = _Time.yy * _Starry_Speed2.xxyz.yz + u_xlat29.xy;
    u_xlat8.xy = (-u_xlat29.xy) + u_xlat30.xy;
    u_xlat29.xy = vec2(vec2(_IsLoopUv2, _IsLoopUv2)) * u_xlat8.xy + u_xlat29.xy;
    u_xlat7.xy = u_xlat7.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_8.xyz = texture(_StarryTex, u_xlat7.xy).xyz;
    u_xlat7.xy = u_xlat29.xy * _StarryTex2_ST.xy + _StarryTex2_ST.zw;
    u_xlat16_7.xyz = texture(_StarryTex2, u_xlat7.xy).xyz;
    u_xlat9.xyz = (-u_xlat16_8.xyz) + u_xlat16_9.xyz;
    u_xlat8.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat9.xyz + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_7.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir2, _UseViewDir2, _UseViewDir2)) * u_xlat0.xyz + u_xlat16_7.xyz;
    u_xlat7.xyz = u_xlat8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat8.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat0.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(_Starry_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Starry_Intensity2);
    u_xlat6.xyz = u_xlat16_6.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat6.xyz + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat6.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    u_xlat2.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat2.xy = _Noise_Speed_Strength.xy * _Time.yy + u_xlat2.xy;
    u_xlat16_34 = texture(_NoiseTex, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat24.xy = vec2(u_xlat16_34) + (-u_xlat2.xy);
    u_xlat2.xy = _Noise_Speed_Strength.zw * u_xlat24.xy + u_xlat2.xy;
    u_xlat16_2.xy = texture(_DissolveTex, u_xlat2.xy).xw;
    u_xlat34 = (-u_xlat16_2.x) * u_xlat16_2.y + 1.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * 0.526315808;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat2.x = (-_SoftEdge) * 0.49000001 + 1.0;
    u_xlat13.xy = vec2(_SoftEdge, _DissolveEdge) * vec2(0.49000001, 1.00999999) + vec2(-1.0, -0.00999999978);
    u_xlat13.x = _Dissolve * (-u_xlat13.x) + u_xlat13.x;
    u_xlat34 = u_xlat34 + (-u_xlat13.x);
    u_xlat13.x = _SoftEdge * 0.49000001 + (-u_xlat2.x);
    u_xlat35 = (-u_xlat2.x) + u_xlat34;
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat35 = u_xlat13.x * u_xlat35;
#ifdef UNITY_ADRENO_ES3
    u_xlat35 = min(max(u_xlat35, 0.0), 1.0);
#else
    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat35 * -2.0 + 3.0;
    u_xlat35 = u_xlat35 * u_xlat35;
    u_xlat35 = (-u_xlat4.x) * u_xlat35 + 1.0;
    u_xlat35 = max(u_xlat35, 0.0);
    u_xlat34 = (-u_xlat13.y) + u_xlat34;
    u_xlat34 = (-u_xlat2.x) + u_xlat34;
    u_xlat34 = u_xlat13.x * u_xlat34;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat34 * -2.0 + 3.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.0>=_Dissolve);
#else
    u_xlatb2.x = 0.0>=_Dissolve;
#endif
    u_xlat13.x = min(u_xlat34, 1.0);
    u_xlat13.x = u_xlat13.x * u_xlat35;
    u_xlat13.xyz = u_xlat13.xxx * _EdgeColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(vec3(_EdgeColorStrength, _EdgeColorStrength, _EdgeColorStrength));
    u_xlat2.xyz = (u_xlatb2.x) ? vec3(0.0, 0.0, 0.0) : u_xlat13.xyz;
    u_xlat0.xyz = (-u_xlat1.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat34) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat34 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat34 = u_xlat34 / _FogDistance;
    u_xlat2.x = max(_FogFade, 0.0);
    u_xlat34 = log2(u_xlat34);
    u_xlat34 = u_xlat34 * u_xlat2.x;
    u_xlat34 = exp2(u_xlat34);
    u_xlat34 = min(u_xlat34, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	vec4 _Diff2_ST;
uniform 	vec4 _Em_G_CU_R_MASK2_ST;
uniform 	float _Cube_power2;
uniform 	float _ES_PW2;
uniform 	vec4 _StarryTex_ST;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	vec4 _StarryTex2_ST;
uniform 	float _Starry_Intensity2;
uniform 	mediump float _IsScreenPos2;
uniform 	mediump float _IsLoopUv2;
uniform 	mediump float _UseViewDir2;
uniform 	float _MatcapUVScale2;
uniform 	vec3 _Starry_Speed2;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _SoftEdge;
uniform 	float _DissolveEdge;
uniform 	vec4 _EdgeColor;
uniform 	float _Dissolve;
uniform 	float _EdgeColorStrength;
uniform 	vec4 _Noise_Speed_Strength;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _USE_CUSTOM_SHADOWMAP;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomShadowTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff;
UNITY_LOCATION(3) uniform mediump sampler2D _Diff2;
UNITY_LOCATION(4) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(5) uniform mediump sampler2D _Em_G_CU_R_MASK2;
UNITY_LOCATION(6) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(7) uniform mediump sampler2D _Light;
UNITY_LOCATION(8) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(9) uniform mediump sampler2D _StarryTex2;
UNITY_LOCATION(10) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(11) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(12) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(13) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
float u_xlat22;
float u_xlat23;
bool u_xlatb23;
vec2 u_xlat24;
int u_xlati24;
vec2 u_xlat26;
mediump vec2 u_xlat16_26;
vec2 u_xlat29;
vec2 u_xlat30;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
mediump float u_xlat16_34;
bool u_xlatb34;
float u_xlat35;
mediump float u_xlat16_35;
bool u_xlatb35;
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
    u_xlatb33 = !!(0.0<_USE_CUSTOM_SHADOWMAP);
#else
    u_xlatb33 = 0.0<_USE_CUSTOM_SHADOWMAP;
#endif
    if(u_xlatb33){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat33 = (-u_xlat1.z) + 1.0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb23 = !!(u_xlat33>=1.0);
#else
        u_xlatb23 = u_xlat33>=1.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb34 = !!(0.0>=u_xlat33);
#else
        u_xlatb34 = 0.0>=u_xlat33;
#endif
        u_xlatb23 = u_xlatb34 || u_xlatb23;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb23 = u_xlatb23 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb23 = u_xlatb23 || u_xlatb2.x;
        u_xlatb23 = u_xlatb2.y || u_xlatb23;
        u_xlatb23 = u_xlatb2.z || u_xlatb23;
        if(u_xlatb23){
            u_xlat23 = 1.0;
        } else {
#ifdef UNITY_ADRENO_ES3
            u_xlatb34 = !!(0.0<_UsePCF);
#else
            u_xlatb34 = 0.0<_UsePCF;
#endif
            if(u_xlatb34){
                u_xlat34 = 0.0;
                for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat13.x = u_xlat34;
                    for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat15.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat16_35 = textureLod(_CustomShadowTex, u_xlat15.xy, 0.0).x;
                        u_xlat35 = (-u_xlat16_35) + 1.0;
#ifdef UNITY_ADRENO_ES3
                        u_xlatb35 = !!(u_xlat33<u_xlat35);
#else
                        u_xlatb35 = u_xlat33<u_xlat35;
#endif
                        u_xlat35 = (u_xlatb35) ? _CustomShadowStrength : 1.0;
                        u_xlat13.x = u_xlat35 + u_xlat13.x;
                    }
                    u_xlat34 = u_xlat13.x;
                }
                u_xlat23 = u_xlat34 * 0.111111112;
            } else {
                u_xlat16_1.x = textureLod(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
                u_xlatb33 = !!(u_xlat33<u_xlat1.x);
#else
                u_xlatb33 = u_xlat33<u_xlat1.x;
#endif
                u_xlat23 = (u_xlatb33) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD7.xyz / vs_TEXCOORD7.www;
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
        u_xlat33 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat23 = u_xlat33 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat33 = u_xlat23 + -1.0;
    u_xlat33 = _ReceiveShadowsStrength * u_xlat33 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_1.xyz = texture(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff2_ST.xy + _Diff2_ST.zw;
    u_xlat16_2.xyz = texture(_Diff2, u_xlat2.xy).xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_4.xy = texture(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat26.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK2_ST.xy + _Em_G_CU_R_MASK2_ST.zw;
    u_xlat16_26.xy = texture(_Em_G_CU_R_MASK2, u_xlat26.xy).xy;
    u_xlat5.xyz = u_xlat16_1.xyz * u_xlat16_4.yyy;
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat16_26.yyy;
    u_xlat16_3 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat7.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2));
    u_xlat8.xyz = u_xlat8.xyz * vec3(_Cube_FW);
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat10.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat10.xyz + u_xlat8.xyz;
    u_xlat34 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat8.xyz = vec3(u_xlat34) * u_xlat8.xyz;
    u_xlat4.xyw = u_xlat16_4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2)) + (-u_xlat9.xyz);
    u_xlat7.xyz = u_xlat9.xyz * u_xlat7.xyz + u_xlat9.xyz;
    u_xlat7.xyz = vec3(u_xlat34) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_26.xxx * u_xlat7.xyz;
    u_xlat4.xyz = u_xlat5.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyw;
    u_xlat5.xyz = u_xlat6.xyz * vec3(vec3(_ES_PW2, _ES_PW2, _ES_PW2)) + u_xlat7.xyz;
    u_xlat6.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_6.xyz = texture(_Light, u_xlat6.xy).xyz;
    u_xlat7.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat7.xy = u_xlat7.xy + (-vs_TEXCOORD0.xy);
    u_xlat29.xy = u_xlat7.xy * vec2(_IsScreenPos);
    u_xlat7.xy = vec2(_IsScreenPos) * u_xlat7.xy + vs_TEXCOORD0.xy;
    u_xlat29.xy = vec2(_IsScreenPos2) * u_xlat29.xy + vs_TEXCOORD0.xy;
    u_xlat34 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat8.xy = vec2(u_xlat34) * _Starry_Speed.xxyz.yz + u_xlat7.xy;
    u_xlat34 = (-_Starry_Speed2.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat30.xy = vec2(u_xlat34) * _Starry_Speed2.xxyz.yz + u_xlat29.xy;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat34);
    u_xlat22 = u_xlat0.z * u_xlat34 + 1.0;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = u_xlat22 * 2.82842708;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat22);
    u_xlat9.xy = u_xlat0.xy * vec2(_MatcapUVScale) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale2) + vec2(0.5, 0.5);
    u_xlat16_9.xyz = texture(_StarryTex, u_xlat9.xy).xyz;
    u_xlat16_0.xyz = texture(_StarryTex2, u_xlat0.xy).xyz;
    u_xlat7.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat7.xy;
    u_xlat8.xy = (-u_xlat7.xy) + u_xlat8.xy;
    u_xlat7.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat8.xy + u_xlat7.xy;
    u_xlat29.xy = _Time.yy * _Starry_Speed2.xxyz.yz + u_xlat29.xy;
    u_xlat8.xy = (-u_xlat29.xy) + u_xlat30.xy;
    u_xlat29.xy = vec2(vec2(_IsLoopUv2, _IsLoopUv2)) * u_xlat8.xy + u_xlat29.xy;
    u_xlat7.xy = u_xlat7.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_8.xyz = texture(_StarryTex, u_xlat7.xy).xyz;
    u_xlat7.xy = u_xlat29.xy * _StarryTex2_ST.xy + _StarryTex2_ST.zw;
    u_xlat16_7.xyz = texture(_StarryTex2, u_xlat7.xy).xyz;
    u_xlat9.xyz = (-u_xlat16_8.xyz) + u_xlat16_9.xyz;
    u_xlat8.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat9.xyz + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_7.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir2, _UseViewDir2, _UseViewDir2)) * u_xlat0.xyz + u_xlat16_7.xyz;
    u_xlat7.xyz = u_xlat8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat8.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat0.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(_Starry_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Starry_Intensity2);
    u_xlat6.xyz = u_xlat16_6.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat6.xyz + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * u_xlat6.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    u_xlat2.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat2.xy = _Noise_Speed_Strength.xy * _Time.yy + u_xlat2.xy;
    u_xlat16_34 = texture(_NoiseTex, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat24.xy = vec2(u_xlat16_34) + (-u_xlat2.xy);
    u_xlat2.xy = _Noise_Speed_Strength.zw * u_xlat24.xy + u_xlat2.xy;
    u_xlat16_2.xy = texture(_DissolveTex, u_xlat2.xy).xw;
    u_xlat34 = (-u_xlat16_2.x) * u_xlat16_2.y + 1.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * 0.526315808;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat2.x = (-_SoftEdge) * 0.49000001 + 1.0;
    u_xlat13.xy = vec2(_SoftEdge, _DissolveEdge) * vec2(0.49000001, 1.00999999) + vec2(-1.0, -0.00999999978);
    u_xlat13.x = _Dissolve * (-u_xlat13.x) + u_xlat13.x;
    u_xlat34 = u_xlat34 + (-u_xlat13.x);
    u_xlat13.x = _SoftEdge * 0.49000001 + (-u_xlat2.x);
    u_xlat35 = (-u_xlat2.x) + u_xlat34;
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat35 = u_xlat13.x * u_xlat35;
#ifdef UNITY_ADRENO_ES3
    u_xlat35 = min(max(u_xlat35, 0.0), 1.0);
#else
    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat35 * -2.0 + 3.0;
    u_xlat35 = u_xlat35 * u_xlat35;
    u_xlat35 = (-u_xlat4.x) * u_xlat35 + 1.0;
    u_xlat35 = max(u_xlat35, 0.0);
    u_xlat34 = (-u_xlat13.y) + u_xlat34;
    u_xlat34 = (-u_xlat2.x) + u_xlat34;
    u_xlat34 = u_xlat13.x * u_xlat34;
#ifdef UNITY_ADRENO_ES3
    u_xlat34 = min(max(u_xlat34, 0.0), 1.0);
#else
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat34 * -2.0 + 3.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(0.0>=_Dissolve);
#else
    u_xlatb2.x = 0.0>=_Dissolve;
#endif
    u_xlat13.x = min(u_xlat34, 1.0);
    u_xlat13.x = u_xlat13.x * u_xlat35;
    u_xlat13.xyz = u_xlat13.xxx * _EdgeColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(vec3(_EdgeColorStrength, _EdgeColorStrength, _EdgeColorStrength));
    u_xlat2.xyz = (u_xlatb2.x) ? vec3(0.0, 0.0, 0.0) : u_xlat13.xyz;
    u_xlat0.xyz = (-u_xlat1.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat34) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat34 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat34 = u_xlat34 / _FogDistance;
    u_xlat2.x = max(_FogFade, 0.0);
    u_xlat34 = log2(u_xlat34);
    u_xlat34 = u_xlat34 * u_xlat2.x;
    u_xlat34 = exp2(u_xlat34);
    u_xlat34 = min(u_xlat34, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	vec4 _Diff2_ST;
uniform 	vec4 _Em_G_CU_R_MASK2_ST;
uniform 	float _Cube_power2;
uniform 	float _ES_PW2;
uniform 	vec4 _StarryTex_ST;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	vec4 _StarryTex2_ST;
uniform 	float _Starry_Intensity2;
uniform 	mediump float _IsScreenPos2;
uniform 	mediump float _IsLoopUv2;
uniform 	mediump float _UseViewDir2;
uniform 	float _MatcapUVScale2;
uniform 	vec3 _Starry_Speed2;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _SoftEdge;
uniform 	float _DissolveEdge;
uniform 	vec4 _EdgeColor;
uniform 	float _Dissolve;
uniform 	float _EdgeColorStrength;
uniform 	vec4 _Noise_Speed_Strength;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Diff2;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp sampler2D _Em_G_CU_R_MASK2;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform lowp sampler2D _StarryTex2;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _DissolveTex;
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
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec2 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
vec3 u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
float u_xlat22;
float u_xlat23;
bool u_xlatb23;
vec2 u_xlat24;
int u_xlati24;
vec2 u_xlat26;
lowp vec2 u_xlat10_26;
vec2 u_xlat29;
vec2 u_xlat30;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
lowp float u_xlat10_34;
bool u_xlatb34;
float u_xlat35;
lowp float u_xlat10_35;
bool u_xlatb35;
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
    u_xlatb33 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb33){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat33 = (-u_xlat1.z) + 1.0;
        u_xlatb23 = u_xlat33>=1.0;
        u_xlatb34 = 0.0>=u_xlat33;
        u_xlatb23 = u_xlatb34 || u_xlatb23;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb23 = u_xlatb23 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb23 = u_xlatb23 || u_xlatb2.x;
        u_xlatb23 = u_xlatb2.y || u_xlatb23;
        u_xlatb23 = u_xlatb2.z || u_xlatb23;
        if(u_xlatb23){
            u_xlat23 = 1.0;
        } else {
            u_xlatb34 = 0.0<_UsePCF;
            if(u_xlatb34){
                u_xlat34 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat13.x = u_xlat34;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat15.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_35 = texture2DLodEXT(_CustomShadowTex, u_xlat15.xy, 0.0).x;
                        u_xlat35 = (-u_xlat10_35) + 1.0;
                        u_xlatb35 = u_xlat33<u_xlat35;
                        u_xlat35 = (u_xlatb35) ? _CustomShadowStrength : 1.0;
                        u_xlat13.x = u_xlat35 + u_xlat13.x;
                    }
                    u_xlat34 = u_xlat13.x;
                }
                u_xlat23 = u_xlat34 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb33 = u_xlat33<u_xlat1.x;
                u_xlat23 = (u_xlatb33) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD7.xyz / vs_TEXCOORD7.www;
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
        u_xlat33 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat23 = u_xlat33 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat33 = u_xlat23 + -1.0;
    u_xlat33 = _ReceiveShadowsStrength * u_xlat33 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff2_ST.xy + _Diff2_ST.zw;
    u_xlat10_2.xyz = texture2D(_Diff2, u_xlat2.xy).xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_4.xy = texture2D(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat26.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK2_ST.xy + _Em_G_CU_R_MASK2_ST.zw;
    u_xlat10_26.xy = texture2D(_Em_G_CU_R_MASK2, u_xlat26.xy).xy;
    u_xlat5.xyz = u_xlat10_1.xyz * u_xlat10_4.yyy;
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat10_26.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat7.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2));
    u_xlat8.xyz = u_xlat8.xyz * vec3(_Cube_FW);
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat10.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat10.xyz + u_xlat8.xyz;
    u_xlat34 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat8.xyz = vec3(u_xlat34) * u_xlat8.xyz;
    u_xlat4.xyw = u_xlat10_4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2)) + (-u_xlat9.xyz);
    u_xlat7.xyz = u_xlat9.xyz * u_xlat7.xyz + u_xlat9.xyz;
    u_xlat7.xyz = vec3(u_xlat34) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat10_26.xxx * u_xlat7.xyz;
    u_xlat4.xyz = u_xlat5.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyw;
    u_xlat5.xyz = u_xlat6.xyz * vec3(vec3(_ES_PW2, _ES_PW2, _ES_PW2)) + u_xlat7.xyz;
    u_xlat6.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_6.xyz = texture2D(_Light, u_xlat6.xy).xyz;
    u_xlat7.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat7.xy = u_xlat7.xy + (-vs_TEXCOORD0.xy);
    u_xlat29.xy = u_xlat7.xy * vec2(_IsScreenPos);
    u_xlat7.xy = vec2(_IsScreenPos) * u_xlat7.xy + vs_TEXCOORD0.xy;
    u_xlat29.xy = vec2(_IsScreenPos2) * u_xlat29.xy + vs_TEXCOORD0.xy;
    u_xlat34 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat8.xy = vec2(u_xlat34) * _Starry_Speed.xxyz.yz + u_xlat7.xy;
    u_xlat34 = (-_Starry_Speed2.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat30.xy = vec2(u_xlat34) * _Starry_Speed2.xxyz.yz + u_xlat29.xy;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat34);
    u_xlat22 = u_xlat0.z * u_xlat34 + 1.0;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = u_xlat22 * 2.82842708;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat22);
    u_xlat9.xy = u_xlat0.xy * vec2(_MatcapUVScale) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale2) + vec2(0.5, 0.5);
    u_xlat10_9.xyz = texture2D(_StarryTex, u_xlat9.xy).xyz;
    u_xlat10_0.xyz = texture2D(_StarryTex2, u_xlat0.xy).xyz;
    u_xlat7.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat7.xy;
    u_xlat8.xy = (-u_xlat7.xy) + u_xlat8.xy;
    u_xlat7.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat8.xy + u_xlat7.xy;
    u_xlat29.xy = _Time.yy * _Starry_Speed2.xxyz.yz + u_xlat29.xy;
    u_xlat8.xy = (-u_xlat29.xy) + u_xlat30.xy;
    u_xlat29.xy = vec2(vec2(_IsLoopUv2, _IsLoopUv2)) * u_xlat8.xy + u_xlat29.xy;
    u_xlat7.xy = u_xlat7.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_8.xyz = texture2D(_StarryTex, u_xlat7.xy).xyz;
    u_xlat7.xy = u_xlat29.xy * _StarryTex2_ST.xy + _StarryTex2_ST.zw;
    u_xlat10_7.xyz = texture2D(_StarryTex2, u_xlat7.xy).xyz;
    u_xlat9.xyz = (-u_xlat10_8.xyz) + u_xlat10_9.xyz;
    u_xlat8.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat9.xyz + u_xlat10_8.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat10_7.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir2, _UseViewDir2, _UseViewDir2)) * u_xlat0.xyz + u_xlat10_7.xyz;
    u_xlat7.xyz = u_xlat8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat8.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat0.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(_Starry_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Starry_Intensity2);
    u_xlat6.xyz = u_xlat10_6.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat6.xyz + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat10_2.xyz * u_xlat6.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    u_xlat2.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat2.xy = _Noise_Speed_Strength.xy * _Time.yy + u_xlat2.xy;
    u_xlat10_34 = texture2D(_NoiseTex, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat24.xy = vec2(u_xlat10_34) + (-u_xlat2.xy);
    u_xlat2.xy = _Noise_Speed_Strength.zw * u_xlat24.xy + u_xlat2.xy;
    u_xlat10_2.xy = texture2D(_DissolveTex, u_xlat2.xy).xw;
    u_xlat34 = (-u_xlat10_2.x) * u_xlat10_2.y + 1.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * 0.526315808;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat2.x = (-_SoftEdge) * 0.49000001 + 1.0;
    u_xlat13.xy = vec2(_SoftEdge, _DissolveEdge) * vec2(0.49000001, 1.00999999) + vec2(-1.0, -0.00999999978);
    u_xlat13.x = _Dissolve * (-u_xlat13.x) + u_xlat13.x;
    u_xlat34 = u_xlat34 + (-u_xlat13.x);
    u_xlat13.x = _SoftEdge * 0.49000001 + (-u_xlat2.x);
    u_xlat35 = (-u_xlat2.x) + u_xlat34;
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat35 = u_xlat13.x * u_xlat35;
    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
    u_xlat4.x = u_xlat35 * -2.0 + 3.0;
    u_xlat35 = u_xlat35 * u_xlat35;
    u_xlat35 = (-u_xlat4.x) * u_xlat35 + 1.0;
    u_xlat35 = max(u_xlat35, 0.0);
    u_xlat34 = (-u_xlat13.y) + u_xlat34;
    u_xlat34 = (-u_xlat2.x) + u_xlat34;
    u_xlat34 = u_xlat13.x * u_xlat34;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat2.x = u_xlat34 * -2.0 + 3.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * u_xlat2.x;
    u_xlatb2.x = 0.0>=_Dissolve;
    u_xlat13.x = min(u_xlat34, 1.0);
    u_xlat13.x = u_xlat13.x * u_xlat35;
    u_xlat13.xyz = u_xlat13.xxx * _EdgeColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(vec3(_EdgeColorStrength, _EdgeColorStrength, _EdgeColorStrength));
    u_xlat2.xyz = (u_xlatb2.x) ? vec3(0.0, 0.0, 0.0) : u_xlat13.xyz;
    u_xlat0.xyz = (-u_xlat1.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat34) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat34 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat34 = u_xlat34 / _FogDistance;
    u_xlat2.x = max(_FogFade, 0.0);
    u_xlat34 = log2(u_xlat34);
    u_xlat34 = u_xlat34 * u_xlat2.x;
    u_xlat34 = exp2(u_xlat34);
    u_xlat34 = min(u_xlat34, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	vec4 _Diff2_ST;
uniform 	vec4 _Em_G_CU_R_MASK2_ST;
uniform 	float _Cube_power2;
uniform 	float _ES_PW2;
uniform 	vec4 _StarryTex_ST;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	vec4 _StarryTex2_ST;
uniform 	float _Starry_Intensity2;
uniform 	mediump float _IsScreenPos2;
uniform 	mediump float _IsLoopUv2;
uniform 	mediump float _UseViewDir2;
uniform 	float _MatcapUVScale2;
uniform 	vec3 _Starry_Speed2;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _SoftEdge;
uniform 	float _DissolveEdge;
uniform 	vec4 _EdgeColor;
uniform 	float _Dissolve;
uniform 	float _EdgeColorStrength;
uniform 	vec4 _Noise_Speed_Strength;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform 	float _USE_CUSTOM_SHADOWMAP;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _CustomShadowTex;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Diff2;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp sampler2D _Em_G_CU_R_MASK2;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform lowp sampler2D _StarryTex2;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _DissolveTex;
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
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
int u_xlati2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
lowp vec2 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
lowp vec3 u_xlat10_8;
vec3 u_xlat9;
lowp vec3 u_xlat10_9;
vec3 u_xlat10;
vec3 u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
float u_xlat22;
float u_xlat23;
bool u_xlatb23;
vec2 u_xlat24;
int u_xlati24;
vec2 u_xlat26;
lowp vec2 u_xlat10_26;
vec2 u_xlat29;
vec2 u_xlat30;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
lowp float u_xlat10_34;
bool u_xlatb34;
float u_xlat35;
lowp float u_xlat10_35;
bool u_xlatb35;
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
    u_xlatb33 = 0.0<_USE_CUSTOM_SHADOWMAP;
    if(u_xlatb33){
        u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4_CustomShadowMatrix[1];
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[0] * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat1 = hlslcc_mtx4x4_CustomShadowMatrix[2] * vs_TEXCOORD2.zzzz + u_xlat1;
        u_xlat1 = u_xlat1 + hlslcc_mtx4x4_CustomShadowMatrix[3];
        u_xlat1.xyz = u_xlat1.xyz / u_xlat1.www;
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
        u_xlat33 = (-u_xlat1.z) + 1.0;
        u_xlatb23 = u_xlat33>=1.0;
        u_xlatb34 = 0.0>=u_xlat33;
        u_xlatb23 = u_xlatb34 || u_xlatb23;
        u_xlatb2.xy = lessThan(u_xlat1.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb23 = u_xlatb23 || u_xlatb2.x;
        u_xlatb2.xz = lessThan(vec4(1.0, 0.0, 1.0, 0.0), u_xlat1.xxyx).xz;
        u_xlatb23 = u_xlatb23 || u_xlatb2.x;
        u_xlatb23 = u_xlatb2.y || u_xlatb23;
        u_xlatb23 = u_xlatb2.z || u_xlatb23;
        if(u_xlatb23){
            u_xlat23 = 1.0;
        } else {
            u_xlatb34 = 0.0<_UsePCF;
            if(u_xlatb34){
                u_xlat34 = 0.0;
                for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
                {
                    u_xlat4.x = float(u_xlati_loop_1);
                    u_xlat13.x = u_xlat34;
                    for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
                    {
                        u_xlat4.y = float(u_xlati_loop_2);
                        u_xlat15.xy = u_xlat4.xy * _CustomShadowTex_TexelSize.xy + u_xlat1.xy;
                        u_xlat10_35 = texture2DLodEXT(_CustomShadowTex, u_xlat15.xy, 0.0).x;
                        u_xlat35 = (-u_xlat10_35) + 1.0;
                        u_xlatb35 = u_xlat33<u_xlat35;
                        u_xlat35 = (u_xlatb35) ? _CustomShadowStrength : 1.0;
                        u_xlat13.x = u_xlat35 + u_xlat13.x;
                    }
                    u_xlat34 = u_xlat13.x;
                }
                u_xlat23 = u_xlat34 * 0.111111112;
            } else {
                u_xlat10_1.x = texture2DLodEXT(_CustomShadowTex, u_xlat1.xy, 0.0).x;
                u_xlat1.x = (-u_xlat10_1.x) + 1.0;
                u_xlatb33 = u_xlat33<u_xlat1.x;
                u_xlat23 = (u_xlatb33) ? _CustomShadowStrength : 1.0;
            }
        }
    } else {
        u_xlat1.xyw = vs_TEXCOORD7.xyz / vs_TEXCOORD7.www;
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
        u_xlat33 = dot(u_xlat2, vec4(0.25, 0.25, 0.25, 0.25));
        u_xlat1.x = (-_LightShadowData.x) + 1.0;
        u_xlat23 = u_xlat33 * u_xlat1.x + _LightShadowData.x;
    }
    u_xlat33 = u_xlat23 + -1.0;
    u_xlat33 = _ReceiveShadowsStrength * u_xlat33 + 1.0;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_1.xyz = texture2D(_Diff, u_xlat1.xy).xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff2_ST.xy + _Diff2_ST.zw;
    u_xlat10_2.xyz = texture2D(_Diff2, u_xlat2.xy).xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_4.xy = texture2D(_Em_G_CU_R_MASK, u_xlat4.xy).xy;
    u_xlat26.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK2_ST.xy + _Em_G_CU_R_MASK2_ST.zw;
    u_xlat10_26.xy = texture2D(_Em_G_CU_R_MASK2, u_xlat26.xy).xy;
    u_xlat5.xyz = u_xlat10_1.xyz * u_xlat10_4.yyy;
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat10_26.yyy;
    u_xlat10_3 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat7.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat9.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2));
    u_xlat8.xyz = u_xlat8.xyz * vec3(_Cube_FW);
    u_xlat9.xyz = u_xlat9.xyz * vec3(_Cube_FW);
    u_xlat10.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat10.xyz + u_xlat8.xyz;
    u_xlat34 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat8.xyz = vec3(u_xlat34) * u_xlat8.xyz;
    u_xlat4.xyw = u_xlat10_4.xxx * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2)) + (-u_xlat9.xyz);
    u_xlat7.xyz = u_xlat9.xyz * u_xlat7.xyz + u_xlat9.xyz;
    u_xlat7.xyz = vec3(u_xlat34) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat10_26.xxx * u_xlat7.xyz;
    u_xlat4.xyz = u_xlat5.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat4.xyw;
    u_xlat5.xyz = u_xlat6.xyz * vec3(vec3(_ES_PW2, _ES_PW2, _ES_PW2)) + u_xlat7.xyz;
    u_xlat6.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_6.xyz = texture2D(_Light, u_xlat6.xy).xyz;
    u_xlat7.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat7.xy = u_xlat7.xy + (-vs_TEXCOORD0.xy);
    u_xlat29.xy = u_xlat7.xy * vec2(_IsScreenPos);
    u_xlat7.xy = vec2(_IsScreenPos) * u_xlat7.xy + vs_TEXCOORD0.xy;
    u_xlat29.xy = vec2(_IsScreenPos2) * u_xlat29.xy + vs_TEXCOORD0.xy;
    u_xlat34 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat8.xy = vec2(u_xlat34) * _Starry_Speed.xxyz.yz + u_xlat7.xy;
    u_xlat34 = (-_Starry_Speed2.xxyz.w) + 1.0;
    u_xlat34 = u_xlat34 * _Time.y;
    u_xlat34 = cos(u_xlat34);
    u_xlat34 = sin(u_xlat34);
    u_xlat30.xy = vec2(u_xlat34) * _Starry_Speed2.xxyz.yz + u_xlat29.xy;
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat34);
    u_xlat22 = u_xlat0.z * u_xlat34 + 1.0;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = u_xlat22 * 2.82842708;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat22);
    u_xlat9.xy = u_xlat0.xy * vec2(_MatcapUVScale) + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * vec2(_MatcapUVScale2) + vec2(0.5, 0.5);
    u_xlat10_9.xyz = texture2D(_StarryTex, u_xlat9.xy).xyz;
    u_xlat10_0.xyz = texture2D(_StarryTex2, u_xlat0.xy).xyz;
    u_xlat7.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat7.xy;
    u_xlat8.xy = (-u_xlat7.xy) + u_xlat8.xy;
    u_xlat7.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat8.xy + u_xlat7.xy;
    u_xlat29.xy = _Time.yy * _Starry_Speed2.xxyz.yz + u_xlat29.xy;
    u_xlat8.xy = (-u_xlat29.xy) + u_xlat30.xy;
    u_xlat29.xy = vec2(vec2(_IsLoopUv2, _IsLoopUv2)) * u_xlat8.xy + u_xlat29.xy;
    u_xlat7.xy = u_xlat7.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_8.xyz = texture2D(_StarryTex, u_xlat7.xy).xyz;
    u_xlat7.xy = u_xlat29.xy * _StarryTex2_ST.xy + _StarryTex2_ST.zw;
    u_xlat10_7.xyz = texture2D(_StarryTex2, u_xlat7.xy).xyz;
    u_xlat9.xyz = (-u_xlat10_8.xyz) + u_xlat10_9.xyz;
    u_xlat8.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat9.xyz + u_xlat10_8.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat10_7.xyz);
    u_xlat0.xyz = vec3(vec3(_UseViewDir2, _UseViewDir2, _UseViewDir2)) * u_xlat0.xyz + u_xlat10_7.xyz;
    u_xlat7.xyz = u_xlat8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat7.xyz = u_xlat8.xyz * u_xlat7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat0.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat8.xyz;
    u_xlat7.xyz = u_xlat7.xyz * vec3(_Starry_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Starry_Intensity2);
    u_xlat6.xyz = u_xlat10_6.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat6.xyz + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat10_2.xyz * u_xlat6.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat5.xyz;
    u_xlat2.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat2.xy = _Noise_Speed_Strength.xy * _Time.yy + u_xlat2.xy;
    u_xlat10_34 = texture2D(_NoiseTex, u_xlat2.xy).x;
    u_xlat2.xy = vs_TEXCOORD1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat24.xy = vec2(u_xlat10_34) + (-u_xlat2.xy);
    u_xlat2.xy = _Noise_Speed_Strength.zw * u_xlat24.xy + u_xlat2.xy;
    u_xlat10_2.xy = texture2D(_DissolveTex, u_xlat2.xy).xw;
    u_xlat34 = (-u_xlat10_2.x) * u_xlat10_2.y + 1.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * 0.526315808;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat2.x = (-_SoftEdge) * 0.49000001 + 1.0;
    u_xlat13.xy = vec2(_SoftEdge, _DissolveEdge) * vec2(0.49000001, 1.00999999) + vec2(-1.0, -0.00999999978);
    u_xlat13.x = _Dissolve * (-u_xlat13.x) + u_xlat13.x;
    u_xlat34 = u_xlat34 + (-u_xlat13.x);
    u_xlat13.x = _SoftEdge * 0.49000001 + (-u_xlat2.x);
    u_xlat35 = (-u_xlat2.x) + u_xlat34;
    u_xlat13.x = float(1.0) / u_xlat13.x;
    u_xlat35 = u_xlat13.x * u_xlat35;
    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
    u_xlat4.x = u_xlat35 * -2.0 + 3.0;
    u_xlat35 = u_xlat35 * u_xlat35;
    u_xlat35 = (-u_xlat4.x) * u_xlat35 + 1.0;
    u_xlat35 = max(u_xlat35, 0.0);
    u_xlat34 = (-u_xlat13.y) + u_xlat34;
    u_xlat34 = (-u_xlat2.x) + u_xlat34;
    u_xlat34 = u_xlat13.x * u_xlat34;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat2.x = u_xlat34 * -2.0 + 3.0;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat34 = u_xlat34 * u_xlat2.x;
    u_xlatb2.x = 0.0>=_Dissolve;
    u_xlat13.x = min(u_xlat34, 1.0);
    u_xlat13.x = u_xlat13.x * u_xlat35;
    u_xlat13.xyz = u_xlat13.xxx * _EdgeColor.xyz;
    u_xlat13.xyz = u_xlat13.xyz * vec3(vec3(_EdgeColorStrength, _EdgeColorStrength, _EdgeColorStrength));
    u_xlat2.xyz = (u_xlatb2.x) ? vec3(0.0, 0.0, 0.0) : u_xlat13.xyz;
    u_xlat0.xyz = (-u_xlat1.xyz) + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat34) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat34 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat34 = u_xlat34 / _FogDistance;
    u_xlat2.x = max(_FogFade, 0.0);
    u_xlat34 = log2(u_xlat34);
    u_xlat34 = u_xlat34 * u_xlat2.x;
    u_xlat34 = exp2(u_xlat34);
    u_xlat34 = min(u_xlat34, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + _FogColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	vec4 _Diff2_ST;
uniform 	vec4 _Em_G_CU_R_MASK2_ST;
uniform 	float _Cube_power2;
uniform 	float _ES_PW2;
uniform 	vec4 _StarryTex_ST;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	vec4 _StarryTex2_ST;
uniform 	float _Starry_Intensity2;
uniform 	mediump float _IsScreenPos2;
uniform 	mediump float _IsLoopUv2;
uniform 	mediump float _UseViewDir2;
uniform 	float _MatcapUVScale2;
uniform 	vec3 _Starry_Speed2;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _SoftEdge;
uniform 	float _DissolveEdge;
uniform 	vec4 _EdgeColor;
uniform 	float _Dissolve;
uniform 	float _EdgeColorStrength;
uniform 	vec4 _Noise_Speed_Strength;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff2;
UNITY_LOCATION(3) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(4) uniform mediump sampler2D _Em_G_CU_R_MASK2;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _Light;
UNITY_LOCATION(7) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(8) uniform mediump sampler2D _StarryTex2;
UNITY_LOCATION(9) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec2 u_xlat10;
float u_xlat12;
vec2 u_xlat19;
vec2 u_xlat21;
vec2 u_xlat22;
mediump vec2 u_xlat16_22;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
float u_xlat28;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_2.zzz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat27 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat27 = u_xlat27 + u_xlat27;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat27)) + (-u_xlat1.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.x = u_xlat0.z * u_xlat27 + 1.0;
    u_xlat10.xy = vec2(u_xlat27) * u_xlat0.xy;
    u_xlat27 = sqrt(u_xlat1.x);
    u_xlat27 = u_xlat27 * 2.82842708;
    u_xlat1.xy = u_xlat10.xy / vec2(u_xlat27);
    u_xlat19.xy = u_xlat1.xy * vec2(_MatcapUVScale2) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale) + vec2(0.5, 0.5);
    u_xlat16_3.xyz = texture(_StarryTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_StarryTex2, u_xlat19.xy).xyz;
    u_xlat27 = (-_Starry_Speed2.xxyz.w) + 1.0;
    u_xlat27 = u_xlat27 * _Time.y;
    u_xlat27 = cos(u_xlat27);
    u_xlat27 = sin(u_xlat27);
    u_xlat4.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat4.xy = u_xlat4.xy + (-vs_TEXCOORD0.xy);
    u_xlat22.xy = u_xlat4.xy * vec2(_IsScreenPos);
    u_xlat4.xy = vec2(_IsScreenPos) * u_xlat4.xy + vs_TEXCOORD0.xy;
    u_xlat22.xy = vec2(_IsScreenPos2) * u_xlat22.xy + vs_TEXCOORD0.xy;
    u_xlat5.xy = vec2(u_xlat27) * _Starry_Speed2.xxyz.yz + u_xlat22.xy;
    u_xlat22.xy = _Time.yy * _Starry_Speed2.xxyz.yz + u_xlat22.xy;
    u_xlat5.xy = (-u_xlat22.xy) + u_xlat5.xy;
    u_xlat22.xy = vec2(vec2(_IsLoopUv2, _IsLoopUv2)) * u_xlat5.xy + u_xlat22.xy;
    u_xlat22.xy = u_xlat22.xy * _StarryTex2_ST.xy + _StarryTex2_ST.zw;
    u_xlat16_5.xyz = texture(_StarryTex2, u_xlat22.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + (-u_xlat16_5.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir2, _UseViewDir2, _UseViewDir2)) * u_xlat1.xyz + u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Starry_Intensity2);
    u_xlat22.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_5.xyz = texture(_Light, u_xlat22.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * vec3(_light_PW);
    u_xlat22.xy = vs_TEXCOORD0.xy * _Diff2_ST.xy + _Diff2_ST.zw;
    u_xlat16_6.xyz = texture(_Diff2, u_xlat22.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat27 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat16_2 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat7.xyz = u_xlat0.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2));
    u_xlat7.xyz = u_xlat7.xyz * vec3(_Cube_FW);
    u_xlat8.xyz = u_xlat0.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2)) + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat7.xyz = vec3(u_xlat27) * u_xlat7.xyz;
    u_xlat22.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK2_ST.xy + _Em_G_CU_R_MASK2_ST.zw;
    u_xlat16_22.xy = texture(_Em_G_CU_R_MASK2, u_xlat22.xy).xy;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_22.xxx;
    u_xlat6.xyz = u_xlat16_22.yyy * u_xlat16_6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_ES_PW2, _ES_PW2, _ES_PW2)) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat28 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat28 = u_xlat28 * _Time.y;
    u_xlat28 = cos(u_xlat28);
    u_xlat28 = sin(u_xlat28);
    u_xlat22.xy = vec2(u_xlat28) * _Starry_Speed.xxyz.yz + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat4.xy;
    u_xlat22.xy = (-u_xlat4.xy) + u_xlat22.xy;
    u_xlat4.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat22.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_4.xyz = texture(_StarryTex, u_xlat4.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat3.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat3.xyz + u_xlat16_4.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_Starry_Intensity);
    u_xlat4.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_4.xyz = texture(_Diff, u_xlat4.xy).xyz;
    u_xlat3.xyz = u_xlat16_4.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat0.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat5.xyz = u_xlat5.xyz * vec3(_Cube_FW);
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat5.xyz);
    u_xlat0.xyz = u_xlat5.xyz * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat5.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_5.xy = texture(_Em_G_CU_R_MASK, u_xlat5.xy).xy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = u_xlat16_4.xyz * u_xlat16_5.yyy;
    u_xlat0.xyz = u_xlat4.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.xy = _Noise_Speed_Strength.xy * _Time.yy + u_xlat3.xy;
    u_xlat16_27 = texture(_NoiseTex, u_xlat3.xy).x;
    u_xlat3.xy = vs_TEXCOORD1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat21.xy = vec2(u_xlat16_27) + (-u_xlat3.xy);
    u_xlat3.xy = _Noise_Speed_Strength.zw * u_xlat21.xy + u_xlat3.xy;
    u_xlat16_3.xy = texture(_DissolveTex, u_xlat3.xy).xw;
    u_xlat27 = (-u_xlat16_3.x) * u_xlat16_3.y + 1.0;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = u_xlat27 * 0.526315808;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat3.xy = vec2(_SoftEdge, _DissolveEdge) * vec2(0.49000001, 1.00999999) + vec2(-1.0, -0.00999999978);
    u_xlat28 = _Dissolve * (-u_xlat3.x) + u_xlat3.x;
    u_xlat27 = u_xlat27 + (-u_xlat28);
    u_xlat28 = (-u_xlat3.y) + u_xlat27;
    u_xlat3.x = (-_SoftEdge) * 0.49000001 + 1.0;
    u_xlat28 = u_xlat28 + (-u_xlat3.x);
    u_xlat12 = _SoftEdge * 0.49000001 + (-u_xlat3.x);
    u_xlat27 = u_xlat27 + (-u_xlat3.x);
    u_xlat3.x = float(1.0) / u_xlat12;
    u_xlat28 = u_xlat28 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat27 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat0.xyz = vec3(u_xlat28) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = min(u_xlat28, 1.0);
    u_xlat10.x = u_xlat27 * -2.0 + 3.0;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = (-u_xlat10.x) * u_xlat27 + 1.0;
    u_xlat27 = max(u_xlat27, 0.0);
    u_xlat27 = u_xlat1.x * u_xlat27;
    u_xlat1.xyz = vec3(u_xlat27) * _EdgeColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EdgeColorStrength, _EdgeColorStrength, _EdgeColorStrength));
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0>=_Dissolve);
#else
    u_xlatb27 = 0.0>=_Dissolve;
#endif
    u_xlat1.xyz = (bool(u_xlatb27)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _FogColor.xyz;
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = u_xlat27 / _FogDistance;
    u_xlat27 = log2(u_xlat27);
    u_xlat28 = max(_FogFade, 0.0);
    u_xlat27 = u_xlat27 * u_xlat28;
    u_xlat27 = exp2(u_xlat27);
    u_xlat27 = min(u_xlat27, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat27);
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat1.xyz + u_xlat0.xyz;
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
uniform 	vec4 _Diff2_ST;
uniform 	vec4 _Em_G_CU_R_MASK2_ST;
uniform 	float _Cube_power2;
uniform 	float _ES_PW2;
uniform 	vec4 _StarryTex_ST;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	vec4 _StarryTex2_ST;
uniform 	float _Starry_Intensity2;
uniform 	mediump float _IsScreenPos2;
uniform 	mediump float _IsLoopUv2;
uniform 	mediump float _UseViewDir2;
uniform 	float _MatcapUVScale2;
uniform 	vec3 _Starry_Speed2;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _SoftEdge;
uniform 	float _DissolveEdge;
uniform 	vec4 _EdgeColor;
uniform 	float _Dissolve;
uniform 	float _EdgeColorStrength;
uniform 	vec4 _Noise_Speed_Strength;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff2;
UNITY_LOCATION(3) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(4) uniform mediump sampler2D _Em_G_CU_R_MASK2;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _Light;
UNITY_LOCATION(7) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(8) uniform mediump sampler2D _StarryTex2;
UNITY_LOCATION(9) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec2 u_xlat10;
float u_xlat12;
vec2 u_xlat19;
vec2 u_xlat21;
vec2 u_xlat22;
mediump vec2 u_xlat16_22;
float u_xlat27;
mediump float u_xlat16_27;
bool u_xlatb27;
float u_xlat28;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_2.zzz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat27 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat27 = u_xlat27 + u_xlat27;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat27)) + (-u_xlat1.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.x = u_xlat0.z * u_xlat27 + 1.0;
    u_xlat10.xy = vec2(u_xlat27) * u_xlat0.xy;
    u_xlat27 = sqrt(u_xlat1.x);
    u_xlat27 = u_xlat27 * 2.82842708;
    u_xlat1.xy = u_xlat10.xy / vec2(u_xlat27);
    u_xlat19.xy = u_xlat1.xy * vec2(_MatcapUVScale2) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale) + vec2(0.5, 0.5);
    u_xlat16_3.xyz = texture(_StarryTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_StarryTex2, u_xlat19.xy).xyz;
    u_xlat27 = (-_Starry_Speed2.xxyz.w) + 1.0;
    u_xlat27 = u_xlat27 * _Time.y;
    u_xlat27 = cos(u_xlat27);
    u_xlat27 = sin(u_xlat27);
    u_xlat4.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat4.xy = u_xlat4.xy + (-vs_TEXCOORD0.xy);
    u_xlat22.xy = u_xlat4.xy * vec2(_IsScreenPos);
    u_xlat4.xy = vec2(_IsScreenPos) * u_xlat4.xy + vs_TEXCOORD0.xy;
    u_xlat22.xy = vec2(_IsScreenPos2) * u_xlat22.xy + vs_TEXCOORD0.xy;
    u_xlat5.xy = vec2(u_xlat27) * _Starry_Speed2.xxyz.yz + u_xlat22.xy;
    u_xlat22.xy = _Time.yy * _Starry_Speed2.xxyz.yz + u_xlat22.xy;
    u_xlat5.xy = (-u_xlat22.xy) + u_xlat5.xy;
    u_xlat22.xy = vec2(vec2(_IsLoopUv2, _IsLoopUv2)) * u_xlat5.xy + u_xlat22.xy;
    u_xlat22.xy = u_xlat22.xy * _StarryTex2_ST.xy + _StarryTex2_ST.zw;
    u_xlat16_5.xyz = texture(_StarryTex2, u_xlat22.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + (-u_xlat16_5.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir2, _UseViewDir2, _UseViewDir2)) * u_xlat1.xyz + u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Starry_Intensity2);
    u_xlat22.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_5.xyz = texture(_Light, u_xlat22.xy).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * vec3(_light_PW);
    u_xlat22.xy = vs_TEXCOORD0.xy * _Diff2_ST.xy + _Diff2_ST.zw;
    u_xlat16_6.xyz = texture(_Diff2, u_xlat22.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat27 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat16_2 = texture(_Cubemap, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat7.xyz = u_xlat0.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2));
    u_xlat7.xyz = u_xlat7.xyz * vec3(_Cube_FW);
    u_xlat8.xyz = u_xlat0.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2)) + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat7.xyz = vec3(u_xlat27) * u_xlat7.xyz;
    u_xlat22.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK2_ST.xy + _Em_G_CU_R_MASK2_ST.zw;
    u_xlat16_22.xy = texture(_Em_G_CU_R_MASK2, u_xlat22.xy).xy;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_22.xxx;
    u_xlat6.xyz = u_xlat16_22.yyy * u_xlat16_6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_ES_PW2, _ES_PW2, _ES_PW2)) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat28 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat28 = u_xlat28 * _Time.y;
    u_xlat28 = cos(u_xlat28);
    u_xlat28 = sin(u_xlat28);
    u_xlat22.xy = vec2(u_xlat28) * _Starry_Speed.xxyz.yz + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat4.xy;
    u_xlat22.xy = (-u_xlat4.xy) + u_xlat22.xy;
    u_xlat4.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat22.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_4.xyz = texture(_StarryTex, u_xlat4.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlat3.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat3.xyz + u_xlat16_4.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_Starry_Intensity);
    u_xlat4.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_4.xyz = texture(_Diff, u_xlat4.xy).xyz;
    u_xlat3.xyz = u_xlat16_4.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat0.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat5.xyz = u_xlat5.xyz * vec3(_Cube_FW);
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat5.xyz);
    u_xlat0.xyz = u_xlat5.xyz * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat5.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_5.xy = texture(_Em_G_CU_R_MASK, u_xlat5.xy).xy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    u_xlat4.xyz = u_xlat16_4.xyz * u_xlat16_5.yyy;
    u_xlat0.xyz = u_xlat4.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.xy = _Noise_Speed_Strength.xy * _Time.yy + u_xlat3.xy;
    u_xlat16_27 = texture(_NoiseTex, u_xlat3.xy).x;
    u_xlat3.xy = vs_TEXCOORD1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat21.xy = vec2(u_xlat16_27) + (-u_xlat3.xy);
    u_xlat3.xy = _Noise_Speed_Strength.zw * u_xlat21.xy + u_xlat3.xy;
    u_xlat16_3.xy = texture(_DissolveTex, u_xlat3.xy).xw;
    u_xlat27 = (-u_xlat16_3.x) * u_xlat16_3.y + 1.0;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = u_xlat27 * 0.526315808;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat3.xy = vec2(_SoftEdge, _DissolveEdge) * vec2(0.49000001, 1.00999999) + vec2(-1.0, -0.00999999978);
    u_xlat28 = _Dissolve * (-u_xlat3.x) + u_xlat3.x;
    u_xlat27 = u_xlat27 + (-u_xlat28);
    u_xlat28 = (-u_xlat3.y) + u_xlat27;
    u_xlat3.x = (-_SoftEdge) * 0.49000001 + 1.0;
    u_xlat28 = u_xlat28 + (-u_xlat3.x);
    u_xlat12 = _SoftEdge * 0.49000001 + (-u_xlat3.x);
    u_xlat27 = u_xlat27 + (-u_xlat3.x);
    u_xlat3.x = float(1.0) / u_xlat12;
    u_xlat28 = u_xlat28 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat28 = min(max(u_xlat28, 0.0), 1.0);
#else
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
#endif
    u_xlat27 = u_xlat27 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat27 = min(max(u_xlat27, 0.0), 1.0);
#else
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat0.xyz = vec3(u_xlat28) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = min(u_xlat28, 1.0);
    u_xlat10.x = u_xlat27 * -2.0 + 3.0;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = (-u_xlat10.x) * u_xlat27 + 1.0;
    u_xlat27 = max(u_xlat27, 0.0);
    u_xlat27 = u_xlat1.x * u_xlat27;
    u_xlat1.xyz = vec3(u_xlat27) * _EdgeColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EdgeColorStrength, _EdgeColorStrength, _EdgeColorStrength));
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0>=_Dissolve);
#else
    u_xlatb27 = 0.0>=_Dissolve;
#endif
    u_xlat1.xyz = (bool(u_xlatb27)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _FogColor.xyz;
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = u_xlat27 / _FogDistance;
    u_xlat27 = log2(u_xlat27);
    u_xlat28 = max(_FogFade, 0.0);
    u_xlat27 = u_xlat27 * u_xlat28;
    u_xlat27 = exp2(u_xlat27);
    u_xlat27 = min(u_xlat27, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat27);
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat1.xyz + u_xlat0.xyz;
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
uniform 	vec4 _Diff2_ST;
uniform 	vec4 _Em_G_CU_R_MASK2_ST;
uniform 	float _Cube_power2;
uniform 	float _ES_PW2;
uniform 	vec4 _StarryTex_ST;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	vec4 _StarryTex2_ST;
uniform 	float _Starry_Intensity2;
uniform 	mediump float _IsScreenPos2;
uniform 	mediump float _IsLoopUv2;
uniform 	mediump float _UseViewDir2;
uniform 	float _MatcapUVScale2;
uniform 	vec3 _Starry_Speed2;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _SoftEdge;
uniform 	float _DissolveEdge;
uniform 	vec4 _EdgeColor;
uniform 	float _Dissolve;
uniform 	float _EdgeColorStrength;
uniform 	vec4 _Noise_Speed_Strength;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Diff2;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp sampler2D _Em_G_CU_R_MASK2;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform lowp sampler2D _StarryTex2;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec2 u_xlat10;
float u_xlat12;
vec2 u_xlat19;
vec2 u_xlat21;
vec2 u_xlat22;
lowp vec2 u_xlat10_22;
float u_xlat27;
lowp float u_xlat10_27;
bool u_xlatb27;
float u_xlat28;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_2.zzz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat27 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat27 = u_xlat27 + u_xlat27;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat27)) + (-u_xlat1.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.x = u_xlat0.z * u_xlat27 + 1.0;
    u_xlat10.xy = vec2(u_xlat27) * u_xlat0.xy;
    u_xlat27 = sqrt(u_xlat1.x);
    u_xlat27 = u_xlat27 * 2.82842708;
    u_xlat1.xy = u_xlat10.xy / vec2(u_xlat27);
    u_xlat19.xy = u_xlat1.xy * vec2(_MatcapUVScale2) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale) + vec2(0.5, 0.5);
    u_xlat10_3.xyz = texture2D(_StarryTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_StarryTex2, u_xlat19.xy).xyz;
    u_xlat27 = (-_Starry_Speed2.xxyz.w) + 1.0;
    u_xlat27 = u_xlat27 * _Time.y;
    u_xlat27 = cos(u_xlat27);
    u_xlat27 = sin(u_xlat27);
    u_xlat4.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat4.xy = u_xlat4.xy + (-vs_TEXCOORD0.xy);
    u_xlat22.xy = u_xlat4.xy * vec2(_IsScreenPos);
    u_xlat4.xy = vec2(_IsScreenPos) * u_xlat4.xy + vs_TEXCOORD0.xy;
    u_xlat22.xy = vec2(_IsScreenPos2) * u_xlat22.xy + vs_TEXCOORD0.xy;
    u_xlat5.xy = vec2(u_xlat27) * _Starry_Speed2.xxyz.yz + u_xlat22.xy;
    u_xlat22.xy = _Time.yy * _Starry_Speed2.xxyz.yz + u_xlat22.xy;
    u_xlat5.xy = (-u_xlat22.xy) + u_xlat5.xy;
    u_xlat22.xy = vec2(vec2(_IsLoopUv2, _IsLoopUv2)) * u_xlat5.xy + u_xlat22.xy;
    u_xlat22.xy = u_xlat22.xy * _StarryTex2_ST.xy + _StarryTex2_ST.zw;
    u_xlat10_5.xyz = texture2D(_StarryTex2, u_xlat22.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + (-u_xlat10_5.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir2, _UseViewDir2, _UseViewDir2)) * u_xlat1.xyz + u_xlat10_5.xyz;
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Starry_Intensity2);
    u_xlat22.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_5.xyz = texture2D(_Light, u_xlat22.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * vec3(_light_PW);
    u_xlat22.xy = vs_TEXCOORD0.xy * _Diff2_ST.xy + _Diff2_ST.zw;
    u_xlat10_6.xyz = texture2D(_Diff2, u_xlat22.xy).xyz;
    u_xlat1.xyz = u_xlat10_6.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat27 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat10_2 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat7.xyz = u_xlat0.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2));
    u_xlat7.xyz = u_xlat7.xyz * vec3(_Cube_FW);
    u_xlat8.xyz = u_xlat0.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2)) + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat7.xyz = vec3(u_xlat27) * u_xlat7.xyz;
    u_xlat22.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK2_ST.xy + _Em_G_CU_R_MASK2_ST.zw;
    u_xlat10_22.xy = texture2D(_Em_G_CU_R_MASK2, u_xlat22.xy).xy;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_22.xxx;
    u_xlat6.xyz = u_xlat10_22.yyy * u_xlat10_6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_ES_PW2, _ES_PW2, _ES_PW2)) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat28 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat28 = u_xlat28 * _Time.y;
    u_xlat28 = cos(u_xlat28);
    u_xlat28 = sin(u_xlat28);
    u_xlat22.xy = vec2(u_xlat28) * _Starry_Speed.xxyz.yz + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat4.xy;
    u_xlat22.xy = (-u_xlat4.xy) + u_xlat22.xy;
    u_xlat4.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat22.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_4.xyz = texture2D(_StarryTex, u_xlat4.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz + (-u_xlat10_4.xyz);
    u_xlat3.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat3.xyz + u_xlat10_4.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_Starry_Intensity);
    u_xlat4.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_4.xyz = texture2D(_Diff, u_xlat4.xy).xyz;
    u_xlat3.xyz = u_xlat10_4.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat0.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat5.xyz = u_xlat5.xyz * vec3(_Cube_FW);
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat5.xyz);
    u_xlat0.xyz = u_xlat5.xyz * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat5.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_5.xy = texture2D(_Em_G_CU_R_MASK, u_xlat5.xy).xy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_5.xxx;
    u_xlat4.xyz = u_xlat10_4.xyz * u_xlat10_5.yyy;
    u_xlat0.xyz = u_xlat4.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.xy = _Noise_Speed_Strength.xy * _Time.yy + u_xlat3.xy;
    u_xlat10_27 = texture2D(_NoiseTex, u_xlat3.xy).x;
    u_xlat3.xy = vs_TEXCOORD1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat21.xy = vec2(u_xlat10_27) + (-u_xlat3.xy);
    u_xlat3.xy = _Noise_Speed_Strength.zw * u_xlat21.xy + u_xlat3.xy;
    u_xlat10_3.xy = texture2D(_DissolveTex, u_xlat3.xy).xw;
    u_xlat27 = (-u_xlat10_3.x) * u_xlat10_3.y + 1.0;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = u_xlat27 * 0.526315808;
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    u_xlat3.xy = vec2(_SoftEdge, _DissolveEdge) * vec2(0.49000001, 1.00999999) + vec2(-1.0, -0.00999999978);
    u_xlat28 = _Dissolve * (-u_xlat3.x) + u_xlat3.x;
    u_xlat27 = u_xlat27 + (-u_xlat28);
    u_xlat28 = (-u_xlat3.y) + u_xlat27;
    u_xlat3.x = (-_SoftEdge) * 0.49000001 + 1.0;
    u_xlat28 = u_xlat28 + (-u_xlat3.x);
    u_xlat12 = _SoftEdge * 0.49000001 + (-u_xlat3.x);
    u_xlat27 = u_xlat27 + (-u_xlat3.x);
    u_xlat3.x = float(1.0) / u_xlat12;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat27 = u_xlat27 * u_xlat3.x;
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    u_xlat3.x = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat0.xyz = vec3(u_xlat28) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = min(u_xlat28, 1.0);
    u_xlat10.x = u_xlat27 * -2.0 + 3.0;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = (-u_xlat10.x) * u_xlat27 + 1.0;
    u_xlat27 = max(u_xlat27, 0.0);
    u_xlat27 = u_xlat1.x * u_xlat27;
    u_xlat1.xyz = vec3(u_xlat27) * _EdgeColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EdgeColorStrength, _EdgeColorStrength, _EdgeColorStrength));
    u_xlatb27 = 0.0>=_Dissolve;
    u_xlat1.xyz = (bool(u_xlatb27)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _FogColor.xyz;
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = u_xlat27 / _FogDistance;
    u_xlat27 = log2(u_xlat27);
    u_xlat28 = max(_FogFade, 0.0);
    u_xlat27 = u_xlat27 * u_xlat28;
    u_xlat27 = exp2(u_xlat27);
    u_xlat27 = min(u_xlat27, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat27);
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat1.xyz + u_xlat0.xyz;
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
uniform 	vec4 _Diff2_ST;
uniform 	vec4 _Em_G_CU_R_MASK2_ST;
uniform 	float _Cube_power2;
uniform 	float _ES_PW2;
uniform 	vec4 _StarryTex_ST;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	vec4 _StarryTex2_ST;
uniform 	float _Starry_Intensity2;
uniform 	mediump float _IsScreenPos2;
uniform 	mediump float _IsLoopUv2;
uniform 	mediump float _UseViewDir2;
uniform 	float _MatcapUVScale2;
uniform 	vec3 _Starry_Speed2;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _SoftEdge;
uniform 	float _DissolveEdge;
uniform 	vec4 _EdgeColor;
uniform 	float _Dissolve;
uniform 	float _EdgeColorStrength;
uniform 	vec4 _Noise_Speed_Strength;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Diff2;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp sampler2D _Em_G_CU_R_MASK2;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform lowp sampler2D _StarryTex2;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec2 u_xlat10;
float u_xlat12;
vec2 u_xlat19;
vec2 u_xlat21;
vec2 u_xlat22;
lowp vec2 u_xlat10_22;
float u_xlat27;
lowp float u_xlat10_27;
bool u_xlatb27;
float u_xlat28;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_2.zzz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat27 = dot((-u_xlat1.xyz), u_xlat0.xyz);
    u_xlat27 = u_xlat27 + u_xlat27;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat27)) + (-u_xlat1.xyz);
    u_xlat27 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.x = u_xlat0.z * u_xlat27 + 1.0;
    u_xlat10.xy = vec2(u_xlat27) * u_xlat0.xy;
    u_xlat27 = sqrt(u_xlat1.x);
    u_xlat27 = u_xlat27 * 2.82842708;
    u_xlat1.xy = u_xlat10.xy / vec2(u_xlat27);
    u_xlat19.xy = u_xlat1.xy * vec2(_MatcapUVScale2) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale) + vec2(0.5, 0.5);
    u_xlat10_3.xyz = texture2D(_StarryTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_StarryTex2, u_xlat19.xy).xyz;
    u_xlat27 = (-_Starry_Speed2.xxyz.w) + 1.0;
    u_xlat27 = u_xlat27 * _Time.y;
    u_xlat27 = cos(u_xlat27);
    u_xlat27 = sin(u_xlat27);
    u_xlat4.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat4.xy = u_xlat4.xy + (-vs_TEXCOORD0.xy);
    u_xlat22.xy = u_xlat4.xy * vec2(_IsScreenPos);
    u_xlat4.xy = vec2(_IsScreenPos) * u_xlat4.xy + vs_TEXCOORD0.xy;
    u_xlat22.xy = vec2(_IsScreenPos2) * u_xlat22.xy + vs_TEXCOORD0.xy;
    u_xlat5.xy = vec2(u_xlat27) * _Starry_Speed2.xxyz.yz + u_xlat22.xy;
    u_xlat22.xy = _Time.yy * _Starry_Speed2.xxyz.yz + u_xlat22.xy;
    u_xlat5.xy = (-u_xlat22.xy) + u_xlat5.xy;
    u_xlat22.xy = vec2(vec2(_IsLoopUv2, _IsLoopUv2)) * u_xlat5.xy + u_xlat22.xy;
    u_xlat22.xy = u_xlat22.xy * _StarryTex2_ST.xy + _StarryTex2_ST.zw;
    u_xlat10_5.xyz = texture2D(_StarryTex2, u_xlat22.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + (-u_xlat10_5.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir2, _UseViewDir2, _UseViewDir2)) * u_xlat1.xyz + u_xlat10_5.xyz;
    u_xlat5.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat1.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Starry_Intensity2);
    u_xlat22.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_5.xyz = texture2D(_Light, u_xlat22.xy).xyz;
    u_xlat5.xyz = u_xlat10_5.xyz * vec3(_light_PW);
    u_xlat22.xy = vs_TEXCOORD0.xy * _Diff2_ST.xy + _Diff2_ST.zw;
    u_xlat10_6.xyz = texture2D(_Diff2, u_xlat22.xy).xyz;
    u_xlat1.xyz = u_xlat10_6.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat27 = u_xlat0.y * 0.400000006 + 0.600000024;
    u_xlat10_2 = textureCube(_Cubemap, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat7.xyz = u_xlat0.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2));
    u_xlat7.xyz = u_xlat7.xyz * vec3(_Cube_FW);
    u_xlat8.xyz = u_xlat0.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2)) + (-u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat8.xyz + u_xlat7.xyz;
    u_xlat7.xyz = vec3(u_xlat27) * u_xlat7.xyz;
    u_xlat22.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK2_ST.xy + _Em_G_CU_R_MASK2_ST.zw;
    u_xlat10_22.xy = texture2D(_Em_G_CU_R_MASK2, u_xlat22.xy).xy;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_22.xxx;
    u_xlat6.xyz = u_xlat10_22.yyy * u_xlat10_6.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_ES_PW2, _ES_PW2, _ES_PW2)) + u_xlat7.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat6.xyz;
    u_xlat28 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat28 = u_xlat28 * _Time.y;
    u_xlat28 = cos(u_xlat28);
    u_xlat28 = sin(u_xlat28);
    u_xlat22.xy = vec2(u_xlat28) * _Starry_Speed.xxyz.yz + u_xlat4.xy;
    u_xlat4.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat4.xy;
    u_xlat22.xy = (-u_xlat4.xy) + u_xlat22.xy;
    u_xlat4.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat22.xy + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_4.xyz = texture2D(_StarryTex, u_xlat4.xy).xyz;
    u_xlat3.xyz = u_xlat10_3.xyz + (-u_xlat10_4.xyz);
    u_xlat3.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat3.xyz + u_xlat10_4.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat3.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(_Starry_Intensity);
    u_xlat4.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_4.xyz = texture2D(_Diff, u_xlat4.xy).xyz;
    u_xlat3.xyz = u_xlat10_4.xyz * u_xlat5.xyz + u_xlat3.xyz;
    u_xlat5.xyz = u_xlat0.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat5.xyz = u_xlat5.xyz * vec3(_Cube_FW);
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat5.xyz);
    u_xlat0.xyz = u_xlat5.xyz * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat0.xyz = vec3(u_xlat27) * u_xlat0.xyz;
    u_xlat5.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_5.xy = texture2D(_Em_G_CU_R_MASK, u_xlat5.xy).xy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_5.xxx;
    u_xlat4.xyz = u_xlat10_4.xyz * u_xlat10_5.yyy;
    u_xlat0.xyz = u_xlat4.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    u_xlat3.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.xy = _Noise_Speed_Strength.xy * _Time.yy + u_xlat3.xy;
    u_xlat10_27 = texture2D(_NoiseTex, u_xlat3.xy).x;
    u_xlat3.xy = vs_TEXCOORD1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat21.xy = vec2(u_xlat10_27) + (-u_xlat3.xy);
    u_xlat3.xy = _Noise_Speed_Strength.zw * u_xlat21.xy + u_xlat3.xy;
    u_xlat10_3.xy = texture2D(_DissolveTex, u_xlat3.xy).xw;
    u_xlat27 = (-u_xlat10_3.x) * u_xlat10_3.y + 1.0;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = u_xlat27 * 0.526315808;
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    u_xlat3.xy = vec2(_SoftEdge, _DissolveEdge) * vec2(0.49000001, 1.00999999) + vec2(-1.0, -0.00999999978);
    u_xlat28 = _Dissolve * (-u_xlat3.x) + u_xlat3.x;
    u_xlat27 = u_xlat27 + (-u_xlat28);
    u_xlat28 = (-u_xlat3.y) + u_xlat27;
    u_xlat3.x = (-_SoftEdge) * 0.49000001 + 1.0;
    u_xlat28 = u_xlat28 + (-u_xlat3.x);
    u_xlat12 = _SoftEdge * 0.49000001 + (-u_xlat3.x);
    u_xlat27 = u_xlat27 + (-u_xlat3.x);
    u_xlat3.x = float(1.0) / u_xlat12;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = clamp(u_xlat28, 0.0, 1.0);
    u_xlat27 = u_xlat27 * u_xlat3.x;
    u_xlat27 = clamp(u_xlat27, 0.0, 1.0);
    u_xlat3.x = u_xlat28 * -2.0 + 3.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat0.xyz = vec3(u_xlat28) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = min(u_xlat28, 1.0);
    u_xlat10.x = u_xlat27 * -2.0 + 3.0;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = (-u_xlat10.x) * u_xlat27 + 1.0;
    u_xlat27 = max(u_xlat27, 0.0);
    u_xlat27 = u_xlat1.x * u_xlat27;
    u_xlat1.xyz = vec3(u_xlat27) * _EdgeColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EdgeColorStrength, _EdgeColorStrength, _EdgeColorStrength));
    u_xlatb27 = 0.0>=_Dissolve;
    u_xlat1.xyz = (bool(u_xlatb27)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _FogColor.xyz;
    u_xlat3.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat27 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = u_xlat27 / _FogDistance;
    u_xlat27 = log2(u_xlat27);
    u_xlat28 = max(_FogFade, 0.0);
    u_xlat27 = u_xlat27 * u_xlat28;
    u_xlat27 = exp2(u_xlat27);
    u_xlat27 = min(u_xlat27, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat27);
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat1.xyz + u_xlat0.xyz;
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
uniform 	vec4 _Diff2_ST;
uniform 	vec4 _Em_G_CU_R_MASK2_ST;
uniform 	float _Cube_power2;
uniform 	float _ES_PW2;
uniform 	vec4 _StarryTex_ST;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	vec4 _StarryTex2_ST;
uniform 	float _Starry_Intensity2;
uniform 	mediump float _IsScreenPos2;
uniform 	mediump float _IsLoopUv2;
uniform 	mediump float _UseViewDir2;
uniform 	float _MatcapUVScale2;
uniform 	vec3 _Starry_Speed2;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _SoftEdge;
uniform 	float _DissolveEdge;
uniform 	vec4 _EdgeColor;
uniform 	float _Dissolve;
uniform 	float _EdgeColorStrength;
uniform 	vec4 _Noise_Speed_Strength;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff2;
UNITY_LOCATION(3) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(4) uniform mediump sampler2D _Em_G_CU_R_MASK2;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _Light;
UNITY_LOCATION(7) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(8) uniform mediump sampler2D _StarryTex2;
UNITY_LOCATION(9) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(11) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(12) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
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
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
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
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
bool u_xlatb16;
vec4 u_xlat17;
mediump vec2 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
vec3 u_xlat23;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
mediump float u_xlat10_24;
mediump float u_xlat16_30;
vec3 u_xlat40;
mediump float u_xlat10_48;
bool u_xlatb48;
vec2 u_xlat49;
mediump vec2 u_xlat16_54;
mediump vec2 u_xlat16_55;
mediump vec2 u_xlat16_56;
mediump vec2 u_xlat16_57;
mediump vec2 u_xlat16_61;
vec2 u_xlat64;
vec2 u_xlat65;
mediump vec2 u_xlat16_65;
vec2 u_xlat68;
vec2 u_xlat69;
float u_xlat72;
bool u_xlatb72;
float u_xlat73;
mediump float u_xlat16_73;
mediump float u_xlat10_73;
mediump float u_xlat16_78;
float u_xlat88;
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
    u_xlat73 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat2.xyz = vec3(u_xlat73) * _WorldSpaceLightPos0.xyz;
    u_xlat73 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat73 = (-u_xlat73) * u_xlat73 + 1.0;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat73) + vs_TEXCOORD2.xyz;
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
    u_xlat73 = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat73 = u_xlat0.z + (-u_xlat73);
    u_xlat2.x = max((-u_xlat0.w), u_xlat73);
    u_xlat2.x = (-u_xlat73) + u_xlat2.x;
    u_xlat0.z = _ShadowBias.y * u_xlat2.x + u_xlat73;
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
            u_xlat10_73 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_78 = u_xlat10_73 * u_xlat16_10.y;
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
    u_xlat16.xy = vs_TEXCOORD0.xy * _Diff2_ST.xy + _Diff2_ST.zw;
    u_xlat16_16.xyz = texture(_Diff2, u_xlat16.xy).xyz;
    u_xlat17.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_17.xy = texture(_Em_G_CU_R_MASK, u_xlat17.xy).xy;
    u_xlat65.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK2_ST.xy + _Em_G_CU_R_MASK2_ST.zw;
    u_xlat16_65.xy = texture(_Em_G_CU_R_MASK2, u_xlat65.xy).xy;
    u_xlat18.xyz = u_xlat16_24.xyz * u_xlat16_17.yyy;
    u_xlat19.xyz = u_xlat16_16.xyz * u_xlat16_65.yyy;
    u_xlat16_2 = texture(_Cubemap, u_xlat1.xyz);
    u_xlat20.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat21.xyz = u_xlat20.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat22.xyz = u_xlat20.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2));
    u_xlat21.xyz = u_xlat21.xyz * vec3(_Cube_FW);
    u_xlat22.xyz = u_xlat22.xyz * vec3(_Cube_FW);
    u_xlat23.xyz = u_xlat20.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat21.xyz);
    u_xlat21.xyz = u_xlat21.xyz * u_xlat23.xyz + u_xlat21.xyz;
    u_xlat73 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat21.xyz = vec3(u_xlat73) * u_xlat21.xyz;
    u_xlat17.xyw = u_xlat16_17.xxx * u_xlat21.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2)) + (-u_xlat22.xyz);
    u_xlat20.xyz = u_xlat22.xyz * u_xlat20.xyz + u_xlat22.xyz;
    u_xlat20.xyz = vec3(u_xlat73) * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat16_65.xxx * u_xlat20.xyz;
    u_xlat17.xyz = u_xlat18.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat17.xyw;
    u_xlat18.xyz = u_xlat19.xyz * vec3(vec3(_ES_PW2, _ES_PW2, _ES_PW2)) + u_xlat20.xyz;
    u_xlat19.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_19.xyz = texture(_Light, u_xlat19.xy).xyz;
    u_xlat20.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat20.xy = u_xlat20.xy + (-vs_TEXCOORD0.xy);
    u_xlat68.xy = u_xlat20.xy * vec2(_IsScreenPos);
    u_xlat20.xy = vec2(_IsScreenPos) * u_xlat20.xy + vs_TEXCOORD0.xy;
    u_xlat68.xy = vec2(_IsScreenPos2) * u_xlat68.xy + vs_TEXCOORD0.xy;
    u_xlat73 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat73 = u_xlat73 * _Time.y;
    u_xlat73 = cos(u_xlat73);
    u_xlat73 = sin(u_xlat73);
    u_xlat21.xy = vec2(u_xlat73) * _Starry_Speed.xxyz.yz + u_xlat20.xy;
    u_xlat73 = (-_Starry_Speed2.xxyz.w) + 1.0;
    u_xlat73 = u_xlat73 * _Time.y;
    u_xlat73 = cos(u_xlat73);
    u_xlat73 = sin(u_xlat73);
    u_xlat69.xy = vec2(u_xlat73) * _Starry_Speed2.xxyz.yz + u_xlat68.xy;
    u_xlat73 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat1.xy = vec2(u_xlat73) * u_xlat1.xy;
    u_xlat49.x = u_xlat1.z * u_xlat73 + 1.0;
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = u_xlat49.x * 2.82842708;
    u_xlat1.xy = u_xlat1.xy / u_xlat49.xx;
    u_xlat49.xy = u_xlat1.xy * vec2(_MatcapUVScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale2) + vec2(0.5, 0.5);
    u_xlat16_22.xyz = texture(_StarryTex, u_xlat49.xy).xyz;
    u_xlat16_1.xyz = texture(_StarryTex2, u_xlat1.xy).xyz;
    u_xlat20.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat20.xy;
    u_xlat21.xy = (-u_xlat20.xy) + u_xlat21.xy;
    u_xlat20.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat21.xy + u_xlat20.xy;
    u_xlat68.xy = _Time.yy * _Starry_Speed2.xxyz.yz + u_xlat68.xy;
    u_xlat21.xy = (-u_xlat68.xy) + u_xlat69.xy;
    u_xlat68.xy = vec2(vec2(_IsLoopUv2, _IsLoopUv2)) * u_xlat21.xy + u_xlat68.xy;
    u_xlat20.xy = u_xlat20.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_21.xyz = texture(_StarryTex, u_xlat20.xy).xyz;
    u_xlat20.xy = u_xlat68.xy * _StarryTex2_ST.xy + _StarryTex2_ST.zw;
    u_xlat16_20.xyz = texture(_StarryTex2, u_xlat20.xy).xyz;
    u_xlat22.xyz = (-u_xlat16_21.xyz) + u_xlat16_22.xyz;
    u_xlat21.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat22.xyz + u_xlat16_21.xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + (-u_xlat16_20.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir2, _UseViewDir2, _UseViewDir2)) * u_xlat1.xyz + u_xlat16_20.xyz;
    u_xlat20.xyz = u_xlat21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat20.xyz = u_xlat21.xyz * u_xlat20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat20.xyz = u_xlat20.xyz * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat21.xyz = u_xlat1.xyz * u_xlat21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat21.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(_Starry_Intensity);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Starry_Intensity2);
    u_xlat19.xyz = u_xlat16_19.xyz * vec3(_light_PW);
    u_xlat24.xyz = u_xlat16_24.xyz * u_xlat19.xyz + u_xlat20.xyz;
    u_xlat24.xyz = u_xlat24.xyz + u_xlat17.xyz;
    u_xlat1.xyz = u_xlat16_16.xyz * u_xlat19.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat18.xyz;
    u_xlat16.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat16.xy = _Noise_Speed_Strength.xy * _Time.yy + u_xlat16.xy;
    u_xlat16_73 = texture(_NoiseTex, u_xlat16.xy).x;
    u_xlat16.xy = vs_TEXCOORD1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat64.xy = vec2(u_xlat16_73) + (-u_xlat16.xy);
    u_xlat16.xy = _Noise_Speed_Strength.zw * u_xlat64.xy + u_xlat16.xy;
    u_xlat16_16.xy = texture(_DissolveTex, u_xlat16.xy).xw;
    u_xlat73 = (-u_xlat16_16.x) * u_xlat16_16.y + 1.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * 0.526315808;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16.x = (-_SoftEdge) * 0.49000001 + 1.0;
    u_xlat40.xy = vec2(_SoftEdge, _DissolveEdge) * vec2(0.49000001, 1.00999999) + vec2(-1.0, -0.00999999978);
    u_xlat40.x = _Dissolve * (-u_xlat40.x) + u_xlat40.x;
    u_xlat73 = u_xlat73 + (-u_xlat40.x);
    u_xlat40.x = _SoftEdge * 0.49000001 + (-u_xlat16.x);
    u_xlat88 = (-u_xlat16.x) + u_xlat73;
    u_xlat40.x = float(1.0) / u_xlat40.x;
    u_xlat88 = u_xlat40.x * u_xlat88;
#ifdef UNITY_ADRENO_ES3
    u_xlat88 = min(max(u_xlat88, 0.0), 1.0);
#else
    u_xlat88 = clamp(u_xlat88, 0.0, 1.0);
#endif
    u_xlat17.x = u_xlat88 * -2.0 + 3.0;
    u_xlat88 = u_xlat88 * u_xlat88;
    u_xlat88 = (-u_xlat17.x) * u_xlat88 + 1.0;
    u_xlat88 = max(u_xlat88, 0.0);
    u_xlat73 = (-u_xlat40.y) + u_xlat73;
    u_xlat73 = (-u_xlat16.x) + u_xlat73;
    u_xlat73 = u_xlat40.x * u_xlat73;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0>=_Dissolve);
#else
    u_xlatb16 = 0.0>=_Dissolve;
#endif
    u_xlat40.x = min(u_xlat73, 1.0);
    u_xlat40.x = u_xlat40.x * u_xlat88;
    u_xlat40.xyz = u_xlat40.xxx * _EdgeColor.xyz;
    u_xlat40.xyz = u_xlat40.xyz * vec3(vec3(_EdgeColorStrength, _EdgeColorStrength, _EdgeColorStrength));
    u_xlat16.xyz = (bool(u_xlatb16)) ? vec3(0.0, 0.0, 0.0) : u_xlat40.xyz;
    u_xlat1.xyz = (-u_xlat24.xyz) + u_xlat1.xyz;
    u_xlat24.xyz = vec3(u_xlat73) * u_xlat1.xyz + u_xlat24.xyz;
    u_xlat24.xyz = u_xlat16.xyz + u_xlat24.xyz;
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
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	vec4 _Diff2_ST;
uniform 	vec4 _Em_G_CU_R_MASK2_ST;
uniform 	float _Cube_power2;
uniform 	float _ES_PW2;
uniform 	vec4 _StarryTex_ST;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	vec4 _StarryTex2_ST;
uniform 	float _Starry_Intensity2;
uniform 	mediump float _IsScreenPos2;
uniform 	mediump float _IsLoopUv2;
uniform 	mediump float _UseViewDir2;
uniform 	float _MatcapUVScale2;
uniform 	vec3 _Starry_Speed2;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _SoftEdge;
uniform 	float _DissolveEdge;
uniform 	vec4 _EdgeColor;
uniform 	float _Dissolve;
uniform 	float _EdgeColorStrength;
uniform 	vec4 _Noise_Speed_Strength;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Diff;
UNITY_LOCATION(2) uniform mediump sampler2D _Diff2;
UNITY_LOCATION(3) uniform mediump sampler2D _Em_G_CU_R_MASK;
UNITY_LOCATION(4) uniform mediump sampler2D _Em_G_CU_R_MASK2;
UNITY_LOCATION(5) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(6) uniform mediump sampler2D _Light;
UNITY_LOCATION(7) uniform mediump sampler2D _StarryTex;
UNITY_LOCATION(8) uniform mediump sampler2D _StarryTex2;
UNITY_LOCATION(9) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(10) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(11) uniform highp sampler2D _ShadowMapTexture;
UNITY_LOCATION(12) uniform highp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
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
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
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
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
bool u_xlatb16;
vec4 u_xlat17;
mediump vec2 u_xlat16_17;
vec3 u_xlat18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump vec3 u_xlat16_22;
vec3 u_xlat23;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
mediump float u_xlat10_24;
mediump float u_xlat16_30;
vec3 u_xlat40;
mediump float u_xlat10_48;
bool u_xlatb48;
vec2 u_xlat49;
mediump vec2 u_xlat16_54;
mediump vec2 u_xlat16_55;
mediump vec2 u_xlat16_56;
mediump vec2 u_xlat16_57;
mediump vec2 u_xlat16_61;
vec2 u_xlat64;
vec2 u_xlat65;
mediump vec2 u_xlat16_65;
vec2 u_xlat68;
vec2 u_xlat69;
float u_xlat72;
bool u_xlatb72;
float u_xlat73;
mediump float u_xlat16_73;
mediump float u_xlat10_73;
mediump float u_xlat16_78;
float u_xlat88;
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
    u_xlat73 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat2.xyz = vec3(u_xlat73) * _WorldSpaceLightPos0.xyz;
    u_xlat73 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat73 = (-u_xlat73) * u_xlat73 + 1.0;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat73) + vs_TEXCOORD2.xyz;
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
    u_xlat73 = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat73 = u_xlat0.z + (-u_xlat73);
    u_xlat2.x = max((-u_xlat0.w), u_xlat73);
    u_xlat2.x = (-u_xlat73) + u_xlat2.x;
    u_xlat0.z = _ShadowBias.y * u_xlat2.x + u_xlat73;
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
            u_xlat10_73 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec5, 0.0);
            u_xlat16_78 = u_xlat10_73 * u_xlat16_10.y;
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
    u_xlat16.xy = vs_TEXCOORD0.xy * _Diff2_ST.xy + _Diff2_ST.zw;
    u_xlat16_16.xyz = texture(_Diff2, u_xlat16.xy).xyz;
    u_xlat17.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat16_17.xy = texture(_Em_G_CU_R_MASK, u_xlat17.xy).xy;
    u_xlat65.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK2_ST.xy + _Em_G_CU_R_MASK2_ST.zw;
    u_xlat16_65.xy = texture(_Em_G_CU_R_MASK2, u_xlat65.xy).xy;
    u_xlat18.xyz = u_xlat16_24.xyz * u_xlat16_17.yyy;
    u_xlat19.xyz = u_xlat16_16.xyz * u_xlat16_65.yyy;
    u_xlat16_2 = texture(_Cubemap, u_xlat1.xyz);
    u_xlat20.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat21.xyz = u_xlat20.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat22.xyz = u_xlat20.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2));
    u_xlat21.xyz = u_xlat21.xyz * vec3(_Cube_FW);
    u_xlat22.xyz = u_xlat22.xyz * vec3(_Cube_FW);
    u_xlat23.xyz = u_xlat20.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat21.xyz);
    u_xlat21.xyz = u_xlat21.xyz * u_xlat23.xyz + u_xlat21.xyz;
    u_xlat73 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat21.xyz = vec3(u_xlat73) * u_xlat21.xyz;
    u_xlat17.xyw = u_xlat16_17.xxx * u_xlat21.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2)) + (-u_xlat22.xyz);
    u_xlat20.xyz = u_xlat22.xyz * u_xlat20.xyz + u_xlat22.xyz;
    u_xlat20.xyz = vec3(u_xlat73) * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat16_65.xxx * u_xlat20.xyz;
    u_xlat17.xyz = u_xlat18.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat17.xyw;
    u_xlat18.xyz = u_xlat19.xyz * vec3(vec3(_ES_PW2, _ES_PW2, _ES_PW2)) + u_xlat20.xyz;
    u_xlat19.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_19.xyz = texture(_Light, u_xlat19.xy).xyz;
    u_xlat20.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat20.xy = u_xlat20.xy + (-vs_TEXCOORD0.xy);
    u_xlat68.xy = u_xlat20.xy * vec2(_IsScreenPos);
    u_xlat20.xy = vec2(_IsScreenPos) * u_xlat20.xy + vs_TEXCOORD0.xy;
    u_xlat68.xy = vec2(_IsScreenPos2) * u_xlat68.xy + vs_TEXCOORD0.xy;
    u_xlat73 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat73 = u_xlat73 * _Time.y;
    u_xlat73 = cos(u_xlat73);
    u_xlat73 = sin(u_xlat73);
    u_xlat21.xy = vec2(u_xlat73) * _Starry_Speed.xxyz.yz + u_xlat20.xy;
    u_xlat73 = (-_Starry_Speed2.xxyz.w) + 1.0;
    u_xlat73 = u_xlat73 * _Time.y;
    u_xlat73 = cos(u_xlat73);
    u_xlat73 = sin(u_xlat73);
    u_xlat69.xy = vec2(u_xlat73) * _Starry_Speed2.xxyz.yz + u_xlat68.xy;
    u_xlat73 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat1.xy = vec2(u_xlat73) * u_xlat1.xy;
    u_xlat49.x = u_xlat1.z * u_xlat73 + 1.0;
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = u_xlat49.x * 2.82842708;
    u_xlat1.xy = u_xlat1.xy / u_xlat49.xx;
    u_xlat49.xy = u_xlat1.xy * vec2(_MatcapUVScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale2) + vec2(0.5, 0.5);
    u_xlat16_22.xyz = texture(_StarryTex, u_xlat49.xy).xyz;
    u_xlat16_1.xyz = texture(_StarryTex2, u_xlat1.xy).xyz;
    u_xlat20.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat20.xy;
    u_xlat21.xy = (-u_xlat20.xy) + u_xlat21.xy;
    u_xlat20.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat21.xy + u_xlat20.xy;
    u_xlat68.xy = _Time.yy * _Starry_Speed2.xxyz.yz + u_xlat68.xy;
    u_xlat21.xy = (-u_xlat68.xy) + u_xlat69.xy;
    u_xlat68.xy = vec2(vec2(_IsLoopUv2, _IsLoopUv2)) * u_xlat21.xy + u_xlat68.xy;
    u_xlat20.xy = u_xlat20.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat16_21.xyz = texture(_StarryTex, u_xlat20.xy).xyz;
    u_xlat20.xy = u_xlat68.xy * _StarryTex2_ST.xy + _StarryTex2_ST.zw;
    u_xlat16_20.xyz = texture(_StarryTex2, u_xlat20.xy).xyz;
    u_xlat22.xyz = (-u_xlat16_21.xyz) + u_xlat16_22.xyz;
    u_xlat21.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat22.xyz + u_xlat16_21.xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + (-u_xlat16_20.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir2, _UseViewDir2, _UseViewDir2)) * u_xlat1.xyz + u_xlat16_20.xyz;
    u_xlat20.xyz = u_xlat21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat20.xyz = u_xlat21.xyz * u_xlat20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat20.xyz = u_xlat20.xyz * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat21.xyz = u_xlat1.xyz * u_xlat21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat21.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(_Starry_Intensity);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Starry_Intensity2);
    u_xlat19.xyz = u_xlat16_19.xyz * vec3(_light_PW);
    u_xlat24.xyz = u_xlat16_24.xyz * u_xlat19.xyz + u_xlat20.xyz;
    u_xlat24.xyz = u_xlat24.xyz + u_xlat17.xyz;
    u_xlat1.xyz = u_xlat16_16.xyz * u_xlat19.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat18.xyz;
    u_xlat16.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat16.xy = _Noise_Speed_Strength.xy * _Time.yy + u_xlat16.xy;
    u_xlat16_73 = texture(_NoiseTex, u_xlat16.xy).x;
    u_xlat16.xy = vs_TEXCOORD1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat64.xy = vec2(u_xlat16_73) + (-u_xlat16.xy);
    u_xlat16.xy = _Noise_Speed_Strength.zw * u_xlat64.xy + u_xlat16.xy;
    u_xlat16_16.xy = texture(_DissolveTex, u_xlat16.xy).xw;
    u_xlat73 = (-u_xlat16_16.x) * u_xlat16_16.y + 1.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * 0.526315808;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16.x = (-_SoftEdge) * 0.49000001 + 1.0;
    u_xlat40.xy = vec2(_SoftEdge, _DissolveEdge) * vec2(0.49000001, 1.00999999) + vec2(-1.0, -0.00999999978);
    u_xlat40.x = _Dissolve * (-u_xlat40.x) + u_xlat40.x;
    u_xlat73 = u_xlat73 + (-u_xlat40.x);
    u_xlat40.x = _SoftEdge * 0.49000001 + (-u_xlat16.x);
    u_xlat88 = (-u_xlat16.x) + u_xlat73;
    u_xlat40.x = float(1.0) / u_xlat40.x;
    u_xlat88 = u_xlat40.x * u_xlat88;
#ifdef UNITY_ADRENO_ES3
    u_xlat88 = min(max(u_xlat88, 0.0), 1.0);
#else
    u_xlat88 = clamp(u_xlat88, 0.0, 1.0);
#endif
    u_xlat17.x = u_xlat88 * -2.0 + 3.0;
    u_xlat88 = u_xlat88 * u_xlat88;
    u_xlat88 = (-u_xlat17.x) * u_xlat88 + 1.0;
    u_xlat88 = max(u_xlat88, 0.0);
    u_xlat73 = (-u_xlat40.y) + u_xlat73;
    u_xlat73 = (-u_xlat16.x) + u_xlat73;
    u_xlat73 = u_xlat40.x * u_xlat73;
#ifdef UNITY_ADRENO_ES3
    u_xlat73 = min(max(u_xlat73, 0.0), 1.0);
#else
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat16.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0>=_Dissolve);
#else
    u_xlatb16 = 0.0>=_Dissolve;
#endif
    u_xlat40.x = min(u_xlat73, 1.0);
    u_xlat40.x = u_xlat40.x * u_xlat88;
    u_xlat40.xyz = u_xlat40.xxx * _EdgeColor.xyz;
    u_xlat40.xyz = u_xlat40.xyz * vec3(vec3(_EdgeColorStrength, _EdgeColorStrength, _EdgeColorStrength));
    u_xlat16.xyz = (bool(u_xlatb16)) ? vec3(0.0, 0.0, 0.0) : u_xlat40.xyz;
    u_xlat1.xyz = (-u_xlat24.xyz) + u_xlat1.xyz;
    u_xlat24.xyz = vec3(u_xlat73) * u_xlat1.xyz + u_xlat24.xyz;
    u_xlat24.xyz = u_xlat16.xyz + u_xlat24.xyz;
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
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	vec4 _Diff2_ST;
uniform 	vec4 _Em_G_CU_R_MASK2_ST;
uniform 	float _Cube_power2;
uniform 	float _ES_PW2;
uniform 	vec4 _StarryTex_ST;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	vec4 _StarryTex2_ST;
uniform 	float _Starry_Intensity2;
uniform 	mediump float _IsScreenPos2;
uniform 	mediump float _IsLoopUv2;
uniform 	mediump float _UseViewDir2;
uniform 	float _MatcapUVScale2;
uniform 	vec3 _Starry_Speed2;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _SoftEdge;
uniform 	float _DissolveEdge;
uniform 	vec4 _EdgeColor;
uniform 	float _Dissolve;
uniform 	float _EdgeColorStrength;
uniform 	vec4 _Noise_Speed_Strength;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Diff2;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp sampler2D _Em_G_CU_R_MASK2;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform lowp sampler2D _StarryTex2;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _DissolveTex;
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
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
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
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
lowp vec3 u_xlat10_16;
bool u_xlatb16;
vec4 u_xlat17;
lowp vec2 u_xlat10_17;
vec3 u_xlat18;
vec3 u_xlat19;
lowp vec3 u_xlat10_19;
vec3 u_xlat20;
lowp vec3 u_xlat10_20;
vec3 u_xlat21;
lowp vec3 u_xlat10_21;
vec3 u_xlat22;
lowp vec3 u_xlat10_22;
vec3 u_xlat23;
vec3 u_xlat24;
lowp vec3 u_xlat10_24;
mediump float u_xlat16_30;
vec3 u_xlat40;
lowp float u_xlat10_48;
bool u_xlatb48;
vec2 u_xlat49;
mediump vec2 u_xlat16_54;
mediump vec2 u_xlat16_55;
mediump vec2 u_xlat16_56;
mediump vec2 u_xlat16_57;
mediump vec2 u_xlat16_61;
vec2 u_xlat64;
vec2 u_xlat65;
lowp vec2 u_xlat10_65;
vec2 u_xlat68;
vec2 u_xlat69;
float u_xlat72;
bool u_xlatb72;
float u_xlat73;
lowp float u_xlat10_73;
mediump float u_xlat16_78;
float u_xlat88;
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
    u_xlat73 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat2.xyz = vec3(u_xlat73) * _WorldSpaceLightPos0.xyz;
    u_xlat73 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat73 = (-u_xlat73) * u_xlat73 + 1.0;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat73) + vs_TEXCOORD2.xyz;
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
    u_xlat73 = _ShadowBias.x / u_xlat0.w;
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
    u_xlat73 = u_xlat0.z + (-u_xlat73);
    u_xlat2.x = max((-u_xlat0.w), u_xlat73);
    u_xlat2.x = (-u_xlat73) + u_xlat2.x;
    u_xlat0.z = _ShadowBias.y * u_xlat2.x + u_xlat73;
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
            u_xlat10_73 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_78 = u_xlat10_73 * u_xlat16_10.y;
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
    u_xlat16.xy = vs_TEXCOORD0.xy * _Diff2_ST.xy + _Diff2_ST.zw;
    u_xlat10_16.xyz = texture2D(_Diff2, u_xlat16.xy).xyz;
    u_xlat17.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_17.xy = texture2D(_Em_G_CU_R_MASK, u_xlat17.xy).xy;
    u_xlat65.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK2_ST.xy + _Em_G_CU_R_MASK2_ST.zw;
    u_xlat10_65.xy = texture2D(_Em_G_CU_R_MASK2, u_xlat65.xy).xy;
    u_xlat18.xyz = u_xlat10_24.xyz * u_xlat10_17.yyy;
    u_xlat19.xyz = u_xlat10_16.xyz * u_xlat10_65.yyy;
    u_xlat10_2 = textureCube(_Cubemap, u_xlat1.xyz);
    u_xlat20.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat21.xyz = u_xlat20.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat22.xyz = u_xlat20.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2));
    u_xlat21.xyz = u_xlat21.xyz * vec3(_Cube_FW);
    u_xlat22.xyz = u_xlat22.xyz * vec3(_Cube_FW);
    u_xlat23.xyz = u_xlat20.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat21.xyz);
    u_xlat21.xyz = u_xlat21.xyz * u_xlat23.xyz + u_xlat21.xyz;
    u_xlat73 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat21.xyz = vec3(u_xlat73) * u_xlat21.xyz;
    u_xlat17.xyw = u_xlat10_17.xxx * u_xlat21.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2)) + (-u_xlat22.xyz);
    u_xlat20.xyz = u_xlat22.xyz * u_xlat20.xyz + u_xlat22.xyz;
    u_xlat20.xyz = vec3(u_xlat73) * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat10_65.xxx * u_xlat20.xyz;
    u_xlat17.xyz = u_xlat18.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat17.xyw;
    u_xlat18.xyz = u_xlat19.xyz * vec3(vec3(_ES_PW2, _ES_PW2, _ES_PW2)) + u_xlat20.xyz;
    u_xlat19.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_19.xyz = texture2D(_Light, u_xlat19.xy).xyz;
    u_xlat20.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat20.xy = u_xlat20.xy + (-vs_TEXCOORD0.xy);
    u_xlat68.xy = u_xlat20.xy * vec2(_IsScreenPos);
    u_xlat20.xy = vec2(_IsScreenPos) * u_xlat20.xy + vs_TEXCOORD0.xy;
    u_xlat68.xy = vec2(_IsScreenPos2) * u_xlat68.xy + vs_TEXCOORD0.xy;
    u_xlat73 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat73 = u_xlat73 * _Time.y;
    u_xlat73 = cos(u_xlat73);
    u_xlat73 = sin(u_xlat73);
    u_xlat21.xy = vec2(u_xlat73) * _Starry_Speed.xxyz.yz + u_xlat20.xy;
    u_xlat73 = (-_Starry_Speed2.xxyz.w) + 1.0;
    u_xlat73 = u_xlat73 * _Time.y;
    u_xlat73 = cos(u_xlat73);
    u_xlat73 = sin(u_xlat73);
    u_xlat69.xy = vec2(u_xlat73) * _Starry_Speed2.xxyz.yz + u_xlat68.xy;
    u_xlat73 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat1.xy = vec2(u_xlat73) * u_xlat1.xy;
    u_xlat49.x = u_xlat1.z * u_xlat73 + 1.0;
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = u_xlat49.x * 2.82842708;
    u_xlat1.xy = u_xlat1.xy / u_xlat49.xx;
    u_xlat49.xy = u_xlat1.xy * vec2(_MatcapUVScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale2) + vec2(0.5, 0.5);
    u_xlat10_22.xyz = texture2D(_StarryTex, u_xlat49.xy).xyz;
    u_xlat10_1.xyz = texture2D(_StarryTex2, u_xlat1.xy).xyz;
    u_xlat20.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat20.xy;
    u_xlat21.xy = (-u_xlat20.xy) + u_xlat21.xy;
    u_xlat20.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat21.xy + u_xlat20.xy;
    u_xlat68.xy = _Time.yy * _Starry_Speed2.xxyz.yz + u_xlat68.xy;
    u_xlat21.xy = (-u_xlat68.xy) + u_xlat69.xy;
    u_xlat68.xy = vec2(vec2(_IsLoopUv2, _IsLoopUv2)) * u_xlat21.xy + u_xlat68.xy;
    u_xlat20.xy = u_xlat20.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_21.xyz = texture2D(_StarryTex, u_xlat20.xy).xyz;
    u_xlat20.xy = u_xlat68.xy * _StarryTex2_ST.xy + _StarryTex2_ST.zw;
    u_xlat10_20.xyz = texture2D(_StarryTex2, u_xlat20.xy).xyz;
    u_xlat22.xyz = (-u_xlat10_21.xyz) + u_xlat10_22.xyz;
    u_xlat21.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat22.xyz + u_xlat10_21.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + (-u_xlat10_20.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir2, _UseViewDir2, _UseViewDir2)) * u_xlat1.xyz + u_xlat10_20.xyz;
    u_xlat20.xyz = u_xlat21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat20.xyz = u_xlat21.xyz * u_xlat20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat20.xyz = u_xlat20.xyz * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat21.xyz = u_xlat1.xyz * u_xlat21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat21.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(_Starry_Intensity);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Starry_Intensity2);
    u_xlat19.xyz = u_xlat10_19.xyz * vec3(_light_PW);
    u_xlat24.xyz = u_xlat10_24.xyz * u_xlat19.xyz + u_xlat20.xyz;
    u_xlat24.xyz = u_xlat24.xyz + u_xlat17.xyz;
    u_xlat1.xyz = u_xlat10_16.xyz * u_xlat19.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat18.xyz;
    u_xlat16.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat16.xy = _Noise_Speed_Strength.xy * _Time.yy + u_xlat16.xy;
    u_xlat10_73 = texture2D(_NoiseTex, u_xlat16.xy).x;
    u_xlat16.xy = vs_TEXCOORD1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat64.xy = vec2(u_xlat10_73) + (-u_xlat16.xy);
    u_xlat16.xy = _Noise_Speed_Strength.zw * u_xlat64.xy + u_xlat16.xy;
    u_xlat10_16.xy = texture2D(_DissolveTex, u_xlat16.xy).xw;
    u_xlat73 = (-u_xlat10_16.x) * u_xlat10_16.y + 1.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * 0.526315808;
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
    u_xlat16.x = (-_SoftEdge) * 0.49000001 + 1.0;
    u_xlat40.xy = vec2(_SoftEdge, _DissolveEdge) * vec2(0.49000001, 1.00999999) + vec2(-1.0, -0.00999999978);
    u_xlat40.x = _Dissolve * (-u_xlat40.x) + u_xlat40.x;
    u_xlat73 = u_xlat73 + (-u_xlat40.x);
    u_xlat40.x = _SoftEdge * 0.49000001 + (-u_xlat16.x);
    u_xlat88 = (-u_xlat16.x) + u_xlat73;
    u_xlat40.x = float(1.0) / u_xlat40.x;
    u_xlat88 = u_xlat40.x * u_xlat88;
    u_xlat88 = clamp(u_xlat88, 0.0, 1.0);
    u_xlat17.x = u_xlat88 * -2.0 + 3.0;
    u_xlat88 = u_xlat88 * u_xlat88;
    u_xlat88 = (-u_xlat17.x) * u_xlat88 + 1.0;
    u_xlat88 = max(u_xlat88, 0.0);
    u_xlat73 = (-u_xlat40.y) + u_xlat73;
    u_xlat73 = (-u_xlat16.x) + u_xlat73;
    u_xlat73 = u_xlat40.x * u_xlat73;
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
    u_xlat16.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat16.x;
    u_xlatb16 = 0.0>=_Dissolve;
    u_xlat40.x = min(u_xlat73, 1.0);
    u_xlat40.x = u_xlat40.x * u_xlat88;
    u_xlat40.xyz = u_xlat40.xxx * _EdgeColor.xyz;
    u_xlat40.xyz = u_xlat40.xyz * vec3(vec3(_EdgeColorStrength, _EdgeColorStrength, _EdgeColorStrength));
    u_xlat16.xyz = (bool(u_xlatb16)) ? vec3(0.0, 0.0, 0.0) : u_xlat40.xyz;
    u_xlat1.xyz = (-u_xlat24.xyz) + u_xlat1.xyz;
    u_xlat24.xyz = vec3(u_xlat73) * u_xlat1.xyz + u_xlat24.xyz;
    u_xlat24.xyz = u_xlat16.xyz + u_xlat24.xyz;
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
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	vec4 _Diff2_ST;
uniform 	vec4 _Em_G_CU_R_MASK2_ST;
uniform 	float _Cube_power2;
uniform 	float _ES_PW2;
uniform 	vec4 _StarryTex_ST;
uniform 	float _Starry_Intensity;
uniform 	mediump float _IsScreenPos;
uniform 	mediump float _IsLoopUv;
uniform 	mediump float _UseViewDir;
uniform 	float _MatcapUVScale;
uniform 	vec3 _Starry_Speed;
uniform 	vec4 _StarryTex2_ST;
uniform 	float _Starry_Intensity2;
uniform 	mediump float _IsScreenPos2;
uniform 	mediump float _IsLoopUv2;
uniform 	mediump float _UseViewDir2;
uniform 	float _MatcapUVScale2;
uniform 	vec3 _Starry_Speed2;
uniform 	vec4 _DissolveTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	float _SoftEdge;
uniform 	float _DissolveEdge;
uniform 	vec4 _EdgeColor;
uniform 	float _Dissolve;
uniform 	float _EdgeColorStrength;
uniform 	vec4 _Noise_Speed_Strength;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Diff2;
uniform lowp sampler2D _Em_G_CU_R_MASK;
uniform lowp sampler2D _Em_G_CU_R_MASK2;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _StarryTex;
uniform lowp sampler2D _StarryTex2;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _DissolveTex;
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
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
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
mediump vec2 u_xlat16_13;
mediump vec2 u_xlat16_14;
mediump vec4 u_xlat16_15;
vec3 u_xlat16;
lowp vec3 u_xlat10_16;
bool u_xlatb16;
vec4 u_xlat17;
lowp vec2 u_xlat10_17;
vec3 u_xlat18;
vec3 u_xlat19;
lowp vec3 u_xlat10_19;
vec3 u_xlat20;
lowp vec3 u_xlat10_20;
vec3 u_xlat21;
lowp vec3 u_xlat10_21;
vec3 u_xlat22;
lowp vec3 u_xlat10_22;
vec3 u_xlat23;
vec3 u_xlat24;
lowp vec3 u_xlat10_24;
mediump float u_xlat16_30;
vec3 u_xlat40;
lowp float u_xlat10_48;
bool u_xlatb48;
vec2 u_xlat49;
mediump vec2 u_xlat16_54;
mediump vec2 u_xlat16_55;
mediump vec2 u_xlat16_56;
mediump vec2 u_xlat16_57;
mediump vec2 u_xlat16_61;
vec2 u_xlat64;
vec2 u_xlat65;
lowp vec2 u_xlat10_65;
vec2 u_xlat68;
vec2 u_xlat69;
float u_xlat72;
bool u_xlatb72;
float u_xlat73;
lowp float u_xlat10_73;
mediump float u_xlat16_78;
float u_xlat88;
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
    u_xlat73 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat2.xyz = vec3(u_xlat73) * _WorldSpaceLightPos0.xyz;
    u_xlat73 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat73 = (-u_xlat73) * u_xlat73 + 1.0;
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 * _ShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat73) + vs_TEXCOORD2.xyz;
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
    u_xlat73 = _ShadowBias.x / u_xlat0.w;
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
    u_xlat73 = u_xlat0.z + (-u_xlat73);
    u_xlat2.x = max((-u_xlat0.w), u_xlat73);
    u_xlat2.x = (-u_xlat73) + u_xlat2.x;
    u_xlat0.z = _ShadowBias.y * u_xlat2.x + u_xlat73;
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
            u_xlat10_73 = shadow2DEXT(hlslcc_zcmp_ShadowMapTexture, txVec5);
            u_xlat16_78 = u_xlat10_73 * u_xlat16_10.y;
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
    u_xlat16.xy = vs_TEXCOORD0.xy * _Diff2_ST.xy + _Diff2_ST.zw;
    u_xlat10_16.xyz = texture2D(_Diff2, u_xlat16.xy).xyz;
    u_xlat17.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK_ST.xy + _Em_G_CU_R_MASK_ST.zw;
    u_xlat10_17.xy = texture2D(_Em_G_CU_R_MASK, u_xlat17.xy).xy;
    u_xlat65.xy = vs_TEXCOORD0.xy * _Em_G_CU_R_MASK2_ST.xy + _Em_G_CU_R_MASK2_ST.zw;
    u_xlat10_65.xy = texture2D(_Em_G_CU_R_MASK2, u_xlat65.xy).xy;
    u_xlat18.xyz = u_xlat10_24.xyz * u_xlat10_17.yyy;
    u_xlat19.xyz = u_xlat10_16.xyz * u_xlat10_65.yyy;
    u_xlat10_2 = textureCube(_Cubemap, u_xlat1.xyz);
    u_xlat20.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat21.xyz = u_xlat20.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power));
    u_xlat22.xyz = u_xlat20.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2));
    u_xlat21.xyz = u_xlat21.xyz * vec3(_Cube_FW);
    u_xlat22.xyz = u_xlat22.xyz * vec3(_Cube_FW);
    u_xlat23.xyz = u_xlat20.xyz * vec3(vec3(_Cube_power, _Cube_power, _Cube_power)) + (-u_xlat21.xyz);
    u_xlat21.xyz = u_xlat21.xyz * u_xlat23.xyz + u_xlat21.xyz;
    u_xlat73 = u_xlat1.y * 0.400000006 + 0.600000024;
    u_xlat21.xyz = vec3(u_xlat73) * u_xlat21.xyz;
    u_xlat17.xyw = u_xlat10_17.xxx * u_xlat21.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(vec3(_Cube_power2, _Cube_power2, _Cube_power2)) + (-u_xlat22.xyz);
    u_xlat20.xyz = u_xlat22.xyz * u_xlat20.xyz + u_xlat22.xyz;
    u_xlat20.xyz = vec3(u_xlat73) * u_xlat20.xyz;
    u_xlat20.xyz = u_xlat10_65.xxx * u_xlat20.xyz;
    u_xlat17.xyz = u_xlat18.xyz * vec3(vec3(_ES_PW, _ES_PW, _ES_PW)) + u_xlat17.xyw;
    u_xlat18.xyz = u_xlat19.xyz * vec3(vec3(_ES_PW2, _ES_PW2, _ES_PW2)) + u_xlat20.xyz;
    u_xlat19.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_19.xyz = texture2D(_Light, u_xlat19.xy).xyz;
    u_xlat20.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat20.xy = u_xlat20.xy + (-vs_TEXCOORD0.xy);
    u_xlat68.xy = u_xlat20.xy * vec2(_IsScreenPos);
    u_xlat20.xy = vec2(_IsScreenPos) * u_xlat20.xy + vs_TEXCOORD0.xy;
    u_xlat68.xy = vec2(_IsScreenPos2) * u_xlat68.xy + vs_TEXCOORD0.xy;
    u_xlat73 = (-_Starry_Speed.xxyz.w) + 1.0;
    u_xlat73 = u_xlat73 * _Time.y;
    u_xlat73 = cos(u_xlat73);
    u_xlat73 = sin(u_xlat73);
    u_xlat21.xy = vec2(u_xlat73) * _Starry_Speed.xxyz.yz + u_xlat20.xy;
    u_xlat73 = (-_Starry_Speed2.xxyz.w) + 1.0;
    u_xlat73 = u_xlat73 * _Time.y;
    u_xlat73 = cos(u_xlat73);
    u_xlat73 = sin(u_xlat73);
    u_xlat69.xy = vec2(u_xlat73) * _Starry_Speed2.xxyz.yz + u_xlat68.xy;
    u_xlat73 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat73 = inversesqrt(u_xlat73);
    u_xlat1.xy = vec2(u_xlat73) * u_xlat1.xy;
    u_xlat49.x = u_xlat1.z * u_xlat73 + 1.0;
    u_xlat49.x = sqrt(u_xlat49.x);
    u_xlat49.x = u_xlat49.x * 2.82842708;
    u_xlat1.xy = u_xlat1.xy / u_xlat49.xx;
    u_xlat49.xy = u_xlat1.xy * vec2(_MatcapUVScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * vec2(_MatcapUVScale2) + vec2(0.5, 0.5);
    u_xlat10_22.xyz = texture2D(_StarryTex, u_xlat49.xy).xyz;
    u_xlat10_1.xyz = texture2D(_StarryTex2, u_xlat1.xy).xyz;
    u_xlat20.xy = _Time.yy * _Starry_Speed.xxyz.yz + u_xlat20.xy;
    u_xlat21.xy = (-u_xlat20.xy) + u_xlat21.xy;
    u_xlat20.xy = vec2(vec2(_IsLoopUv, _IsLoopUv)) * u_xlat21.xy + u_xlat20.xy;
    u_xlat68.xy = _Time.yy * _Starry_Speed2.xxyz.yz + u_xlat68.xy;
    u_xlat21.xy = (-u_xlat68.xy) + u_xlat69.xy;
    u_xlat68.xy = vec2(vec2(_IsLoopUv2, _IsLoopUv2)) * u_xlat21.xy + u_xlat68.xy;
    u_xlat20.xy = u_xlat20.xy * _StarryTex_ST.xy + _StarryTex_ST.zw;
    u_xlat10_21.xyz = texture2D(_StarryTex, u_xlat20.xy).xyz;
    u_xlat20.xy = u_xlat68.xy * _StarryTex2_ST.xy + _StarryTex2_ST.zw;
    u_xlat10_20.xyz = texture2D(_StarryTex2, u_xlat20.xy).xyz;
    u_xlat22.xyz = (-u_xlat10_21.xyz) + u_xlat10_22.xyz;
    u_xlat21.xyz = vec3(vec3(_UseViewDir, _UseViewDir, _UseViewDir)) * u_xlat22.xyz + u_xlat10_21.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + (-u_xlat10_20.xyz);
    u_xlat1.xyz = vec3(vec3(_UseViewDir2, _UseViewDir2, _UseViewDir2)) * u_xlat1.xyz + u_xlat10_20.xyz;
    u_xlat20.xyz = u_xlat21.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat20.xyz = u_xlat21.xyz * u_xlat20.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat20.xyz = u_xlat20.xyz * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat21.xyz = u_xlat1.xyz * u_xlat21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat21.xyz;
    u_xlat20.xyz = u_xlat20.xyz * vec3(_Starry_Intensity);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Starry_Intensity2);
    u_xlat19.xyz = u_xlat10_19.xyz * vec3(_light_PW);
    u_xlat24.xyz = u_xlat10_24.xyz * u_xlat19.xyz + u_xlat20.xyz;
    u_xlat24.xyz = u_xlat24.xyz + u_xlat17.xyz;
    u_xlat1.xyz = u_xlat10_16.xyz * u_xlat19.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat18.xyz;
    u_xlat16.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat16.xy = _Noise_Speed_Strength.xy * _Time.yy + u_xlat16.xy;
    u_xlat10_73 = texture2D(_NoiseTex, u_xlat16.xy).x;
    u_xlat16.xy = vs_TEXCOORD1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat64.xy = vec2(u_xlat10_73) + (-u_xlat16.xy);
    u_xlat16.xy = _Noise_Speed_Strength.zw * u_xlat64.xy + u_xlat16.xy;
    u_xlat10_16.xy = texture2D(_DissolveTex, u_xlat16.xy).xw;
    u_xlat73 = (-u_xlat10_16.x) * u_xlat10_16.y + 1.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * 0.526315808;
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
    u_xlat16.x = (-_SoftEdge) * 0.49000001 + 1.0;
    u_xlat40.xy = vec2(_SoftEdge, _DissolveEdge) * vec2(0.49000001, 1.00999999) + vec2(-1.0, -0.00999999978);
    u_xlat40.x = _Dissolve * (-u_xlat40.x) + u_xlat40.x;
    u_xlat73 = u_xlat73 + (-u_xlat40.x);
    u_xlat40.x = _SoftEdge * 0.49000001 + (-u_xlat16.x);
    u_xlat88 = (-u_xlat16.x) + u_xlat73;
    u_xlat40.x = float(1.0) / u_xlat40.x;
    u_xlat88 = u_xlat40.x * u_xlat88;
    u_xlat88 = clamp(u_xlat88, 0.0, 1.0);
    u_xlat17.x = u_xlat88 * -2.0 + 3.0;
    u_xlat88 = u_xlat88 * u_xlat88;
    u_xlat88 = (-u_xlat17.x) * u_xlat88 + 1.0;
    u_xlat88 = max(u_xlat88, 0.0);
    u_xlat73 = (-u_xlat40.y) + u_xlat73;
    u_xlat73 = (-u_xlat16.x) + u_xlat73;
    u_xlat73 = u_xlat40.x * u_xlat73;
    u_xlat73 = clamp(u_xlat73, 0.0, 1.0);
    u_xlat16.x = u_xlat73 * -2.0 + 3.0;
    u_xlat73 = u_xlat73 * u_xlat73;
    u_xlat73 = u_xlat73 * u_xlat16.x;
    u_xlatb16 = 0.0>=_Dissolve;
    u_xlat40.x = min(u_xlat73, 1.0);
    u_xlat40.x = u_xlat40.x * u_xlat88;
    u_xlat40.xyz = u_xlat40.xxx * _EdgeColor.xyz;
    u_xlat40.xyz = u_xlat40.xyz * vec3(vec3(_EdgeColorStrength, _EdgeColorStrength, _EdgeColorStrength));
    u_xlat16.xyz = (bool(u_xlatb16)) ? vec3(0.0, 0.0, 0.0) : u_xlat40.xyz;
    u_xlat1.xyz = (-u_xlat24.xyz) + u_xlat1.xyz;
    u_xlat24.xyz = vec3(u_xlat73) * u_xlat1.xyz + u_xlat24.xyz;
    u_xlat24.xyz = u_xlat16.xyz + u_xlat24.xyz;
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
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat1.xyz;
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
  GpuProgramID 67554
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