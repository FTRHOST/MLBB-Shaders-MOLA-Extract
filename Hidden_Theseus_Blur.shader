//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/Blur" {
Properties {

}
SubShader {
 Pass {
 Name "ArtBlur"
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 49263
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
uniform 	vec4 _CameraShakeParams;
out highp vec2 vs_TEXCOORD0;
vec2 u_xlat0;
uvec3 u_xlatu0;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatu0.x = uint(int(int_bitfieldInsert(0,gl_VertexID,1,1) ));
    u_xlatu0.z = uint(uint(gl_VertexID) & 2u);
    u_xlat0.xy = vec2(u_xlatu0.xz);
    gl_Position.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy + _CameraShakeParams.xy;
    gl_Position.zw = vec2(-1.0, 1.0);
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
uniform 	float _MaskRadius;
uniform 	float _MaskSoftness;
uniform 	mediump vec2 _BlurCenter;
uniform 	int _SampleCount;
uniform 	mediump float _BlurFactor;
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
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec2 u_xlat3;
float u_xlat9;
int u_xlati9;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.yz = vs_TEXCOORD0.xy + (-_BlurCenter.xy);
    u_xlat9 = _ScreenParams.x / _ScreenParams.y;
    u_xlat0.x = u_xlat9 * u_xlat0.y;
    u_xlat0.x = dot(u_xlat0.xz, u_xlat0.xz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_MaskRadius);
    u_xlat0.x = u_xlat0.x / _MaskSoftness;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9;
    u_xlat3.xy = u_xlat0.yz * vec2(_BlurFactor);
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlati9 = 0;
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlati9>=_SampleCount);
#else
        u_xlatb2 = u_xlati9>=_SampleCount;
#endif
        if(u_xlatb2){break;}
        u_xlat2.x = float(u_xlati9);
        u_xlat2.xy = u_xlat3.xy * u_xlat2.xx;
        u_xlat2.xy = (-u_xlat2.xy) * u_xlat0.xx + vs_TEXCOORD0.xy;
        u_xlat16_2.xyz = textureLod(_MainTex, u_xlat2.xy, 0.0).xyz;
        u_xlat1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
        u_xlati9 = u_xlati9 + 1;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    u_xlat16_10 = float(_SampleCount);
    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_10);
    SV_Target0.w = 1.0;
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
uniform 	vec4 _CameraShakeParams;
out highp vec2 vs_TEXCOORD0;
vec2 u_xlat0;
uvec3 u_xlatu0;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatu0.x = uint(int(int_bitfieldInsert(0,gl_VertexID,1,1) ));
    u_xlatu0.z = uint(uint(gl_VertexID) & 2u);
    u_xlat0.xy = vec2(u_xlatu0.xz);
    gl_Position.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy + _CameraShakeParams.xy;
    gl_Position.zw = vec2(-1.0, 1.0);
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
uniform 	float _MaskRadius;
uniform 	float _MaskSoftness;
uniform 	mediump vec2 _BlurCenter;
uniform 	int _SampleCount;
uniform 	mediump float _BlurFactor;
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
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec2 u_xlat3;
float u_xlat9;
int u_xlati9;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.yz = vs_TEXCOORD0.xy + (-_BlurCenter.xy);
    u_xlat9 = _ScreenParams.x / _ScreenParams.y;
    u_xlat0.x = u_xlat9 * u_xlat0.y;
    u_xlat0.x = dot(u_xlat0.xz, u_xlat0.xz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_MaskRadius);
    u_xlat0.x = u_xlat0.x / _MaskSoftness;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9;
    u_xlat3.xy = u_xlat0.yz * vec2(_BlurFactor);
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlati9 = 0;
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlati9>=_SampleCount);
#else
        u_xlatb2 = u_xlati9>=_SampleCount;
#endif
        if(u_xlatb2){break;}
        u_xlat2.x = float(u_xlati9);
        u_xlat2.xy = u_xlat3.xy * u_xlat2.xx;
        u_xlat2.xy = (-u_xlat2.xy) * u_xlat0.xx + vs_TEXCOORD0.xy;
        u_xlat16_2.xyz = textureLod(_MainTex, u_xlat2.xy, 0.0).xyz;
        u_xlat1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
        u_xlati9 = u_xlati9 + 1;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    u_xlat16_10 = float(_SampleCount);
    SV_Target0.xyz = u_xlat16_1.xyz / vec3(u_xlat16_10);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
}
}
}
}