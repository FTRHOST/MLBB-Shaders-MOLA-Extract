//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/ScreenDouYinWithMask" {
Properties {

}
SubShader {
 LOD 100
 Pass {
 Name "ScreenDouYinWithMask"
  LOD 100
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 38962
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
uniform 	mediump vec4 _ScreenDouYinWithMask_Params1;
uniform 	mediump vec4 _ScreenDouYinWithMask_Params2;
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
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
float u_xlat3;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
float u_xlat6;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.y = 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = (-_ScreenDouYinWithMask_Params2.z) + _ScreenDouYinWithMask_Params2.y;
    u_xlat0.x = u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_4 = _ScreenDouYinWithMask_Params2.z + _ScreenDouYinWithMask_Params2.y;
    u_xlat3 = (-u_xlat16_1.x) + u_xlat16_4;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = u_xlat0.x * _ScreenDouYinWithMask_Params2.w;
    u_xlat16_1.xy = vs_TEXCOORD0.xy + _ScreenDouYinWithMask_Params1.xy;
    u_xlat16_3.x = textureLod(_MainTex, u_xlat16_1.xy, 0.0).z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy + (-_ScreenDouYinWithMask_Params1.xy);
    u_xlat2.x = textureLod(_MainTex, u_xlat16_1.xy, 0.0).x;
    u_xlat6 = u_xlat16_3.x * u_xlat2.x;
    u_xlat2.z = u_xlat6 * 0.100000001 + u_xlat16_3.x;
    u_xlat16_3.xyz = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat2.y = u_xlat16_3.y;
    u_xlat2.xyz = (-u_xlat16_3.xyz) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _ScreenDouYinWithMask_Params1;
uniform 	mediump vec4 _ScreenDouYinWithMask_Params2;
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
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
float u_xlat3;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
float u_xlat6;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.y = 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = (-_ScreenDouYinWithMask_Params2.z) + _ScreenDouYinWithMask_Params2.y;
    u_xlat0.x = u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_4 = _ScreenDouYinWithMask_Params2.z + _ScreenDouYinWithMask_Params2.y;
    u_xlat3 = (-u_xlat16_1.x) + u_xlat16_4;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = u_xlat0.x * _ScreenDouYinWithMask_Params2.w;
    u_xlat16_1.xy = vs_TEXCOORD0.xy + _ScreenDouYinWithMask_Params1.xy;
    u_xlat16_3.x = textureLod(_MainTex, u_xlat16_1.xy, 0.0).z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy + (-_ScreenDouYinWithMask_Params1.xy);
    u_xlat2.x = textureLod(_MainTex, u_xlat16_1.xy, 0.0).x;
    u_xlat6 = u_xlat16_3.x * u_xlat2.x;
    u_xlat2.z = u_xlat6 * 0.100000001 + u_xlat16_3.x;
    u_xlat16_3.xyz = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat2.y = u_xlat16_3.y;
    u_xlat2.xyz = (-u_xlat16_3.xyz) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _CameraShakeParams;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position = in_POSITION0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _CameraShakeParams.xy;
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
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 _ScreenDouYinWithMask_Params1;
uniform 	mediump vec4 _ScreenDouYinWithMask_Params2;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
float u_xlat3;
lowp vec3 u_xlat10_3;
mediump float u_xlat16_4;
float u_xlat6;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.y = 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = (-_ScreenDouYinWithMask_Params2.z) + _ScreenDouYinWithMask_Params2.y;
    u_xlat0.x = u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_4 = _ScreenDouYinWithMask_Params2.z + _ScreenDouYinWithMask_Params2.y;
    u_xlat3 = (-u_xlat16_1.x) + u_xlat16_4;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = u_xlat0.x * _ScreenDouYinWithMask_Params2.w;
    u_xlat16_1.xy = vs_TEXCOORD0.xy + _ScreenDouYinWithMask_Params1.xy;
    u_xlat10_3.x = texture2D(_MainTex, u_xlat16_1.xy, 0.0).z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy + (-_ScreenDouYinWithMask_Params1.xy);
    u_xlat2.x = texture2D(_MainTex, u_xlat16_1.xy, 0.0).x;
    u_xlat6 = u_xlat10_3.x * u_xlat2.x;
    u_xlat2.z = u_xlat6 * 0.100000001 + u_xlat10_3.x;
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat2.y = u_xlat10_3.y;
    u_xlat2.xyz = (-u_xlat10_3.xyz) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat10_3.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _CameraShakeParams;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position = in_POSITION0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _CameraShakeParams.xy;
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
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 _ScreenDouYinWithMask_Params1;
uniform 	mediump vec4 _ScreenDouYinWithMask_Params2;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
float u_xlat3;
lowp vec3 u_xlat10_3;
mediump float u_xlat16_4;
float u_xlat6;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat16_1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.y = 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_1.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = (-_ScreenDouYinWithMask_Params2.z) + _ScreenDouYinWithMask_Params2.y;
    u_xlat0.x = u_xlat0.x + (-u_xlat16_1.x);
    u_xlat16_4 = _ScreenDouYinWithMask_Params2.z + _ScreenDouYinWithMask_Params2.y;
    u_xlat3 = (-u_xlat16_1.x) + u_xlat16_4;
    u_xlat3 = float(1.0) / u_xlat3;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = u_xlat0.x * _ScreenDouYinWithMask_Params2.w;
    u_xlat16_1.xy = vs_TEXCOORD0.xy + _ScreenDouYinWithMask_Params1.xy;
    u_xlat10_3.x = texture2D(_MainTex, u_xlat16_1.xy, 0.0).z;
    u_xlat16_1.xy = vs_TEXCOORD0.xy + (-_ScreenDouYinWithMask_Params1.xy);
    u_xlat2.x = texture2D(_MainTex, u_xlat16_1.xy, 0.0).x;
    u_xlat6 = u_xlat10_3.x * u_xlat2.x;
    u_xlat2.z = u_xlat6 * 0.100000001 + u_xlat10_3.x;
    u_xlat10_3.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat2.y = u_xlat10_3.y;
    u_xlat2.xyz = (-u_xlat10_3.xyz) + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat10_3.xyz;
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