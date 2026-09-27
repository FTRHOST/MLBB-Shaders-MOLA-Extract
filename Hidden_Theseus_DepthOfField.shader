//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/DepthOfField" {
Properties {

}
SubShader {
 Pass {
 Name "CircleOfConfusion"
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 57666
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

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
    vs_TEXCOORD0.xy = u_xlat0.xy;
    gl_Position.zw = vec2(-1.0, 1.0);
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
uniform 	mediump float _BokehRadius;
uniform 	mediump float _FocusDistance;
uniform 	mediump float _FocusRange;
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
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump float SV_Target0;
float u_xlat0;
void main()
{
    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0 = _ZBufferParams.z * u_xlat0 + _ZBufferParams.w;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 + (-_FocusDistance);
    u_xlat0 = u_xlat0 / _FocusRange;
    u_xlat0 = max(u_xlat0, -1.0);
    u_xlat0 = min(u_xlat0, 1.0);
    u_xlat0 = u_xlat0 * _BokehRadius;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

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
    vs_TEXCOORD0.xy = u_xlat0.xy;
    gl_Position.zw = vec2(-1.0, 1.0);
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
uniform 	mediump float _BokehRadius;
uniform 	mediump float _FocusDistance;
uniform 	mediump float _FocusRange;
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
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump float SV_Target0;
float u_xlat0;
void main()
{
    u_xlat0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0 = _ZBufferParams.z * u_xlat0 + _ZBufferParams.w;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 + (-_FocusDistance);
    u_xlat0 = u_xlat0 / _FocusRange;
    u_xlat0 = max(u_xlat0, -1.0);
    u_xlat0 = min(u_xlat0, 1.0);
    u_xlat0 = u_xlat0 * _BokehRadius;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position = in_POSITION0;
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
uniform 	mediump float _BokehRadius;
uniform 	mediump float _FocusDistance;
uniform 	mediump float _FocusRange;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
void main()
{
    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0 = _ZBufferParams.z * u_xlat0 + _ZBufferParams.w;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 + (-_FocusDistance);
    u_xlat0 = u_xlat0 / _FocusRange;
    u_xlat0 = max(u_xlat0, -1.0);
    u_xlat0 = min(u_xlat0, 1.0);
    u_xlat0 = u_xlat0 * _BokehRadius;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position = in_POSITION0;
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
uniform 	mediump float _BokehRadius;
uniform 	mediump float _FocusDistance;
uniform 	mediump float _FocusRange;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
void main()
{
    u_xlat0 = texture2D(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0 = _ZBufferParams.z * u_xlat0 + _ZBufferParams.w;
    u_xlat0 = float(1.0) / u_xlat0;
    u_xlat0 = u_xlat0 + (-_FocusDistance);
    u_xlat0 = u_xlat0 / _FocusRange;
    u_xlat0 = max(u_xlat0, -1.0);
    u_xlat0 = min(u_xlat0, 1.0);
    u_xlat0 = u_xlat0 * _BokehRadius;
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
 Pass {
 Name "PreFilter"
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 85523
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

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
    vs_TEXCOORD0.xy = u_xlat0.xy;
    gl_Position.zw = vec2(-1.0, 1.0);
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
uniform 	mediump vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -0.5, 0.0, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_2 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_2 = u_xlat16_2 + 1.0;
    u_xlat16_2 = float(1.0) / u_xlat16_2;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_2);
    u_xlat16_3 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, -0.5, -1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat16_3 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 0.5, 1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat16_3 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    SV_Target0.xyz = u_xlat16_6.xyz / vec3(u_xlat16_2);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

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
    vs_TEXCOORD0.xy = u_xlat0.xy;
    gl_Position.zw = vec2(-1.0, 1.0);
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
uniform 	mediump vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -0.5, 0.0, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_2 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_2 = u_xlat16_2 + 1.0;
    u_xlat16_2 = float(1.0) / u_xlat16_2;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_2);
    u_xlat16_3 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, -0.5, -1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat16_3 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 0.5, 1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat16_3 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    SV_Target0.xyz = u_xlat16_6.xyz / vec3(u_xlat16_2);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position = in_POSITION0;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -0.5, 0.0, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_2 = dot(u_xlat10_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_2 = u_xlat16_2 + 1.0;
    u_xlat16_2 = float(1.0) / u_xlat16_2;
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(u_xlat16_2);
    u_xlat16_3 = dot(u_xlat10_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, -0.5, -1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3 = dot(u_xlat10_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat16_3 = dot(u_xlat10_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 0.5, 1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3 = dot(u_xlat10_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat16_3 = dot(u_xlat10_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    SV_Target0.xyz = u_xlat16_6.xyz / vec3(u_xlat16_2);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position = in_POSITION0;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -0.5, 0.0, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_2 = dot(u_xlat10_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_2 = u_xlat16_2 + 1.0;
    u_xlat16_2 = float(1.0) / u_xlat16_2;
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(u_xlat16_2);
    u_xlat16_3 = dot(u_xlat10_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, -0.5, -1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3 = dot(u_xlat10_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat16_3 = dot(u_xlat10_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 0.5, 1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3 = dot(u_xlat10_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat16_3 = dot(u_xlat10_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    SV_Target0.xyz = u_xlat16_6.xyz / vec3(u_xlat16_2);
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
 Pass {
 Name "Bokeh"
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 146136
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

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
    vs_TEXCOORD0.xy = u_xlat0.xy;
    gl_Position.zw = vec2(-1.0, 1.0);
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
vec4 ImmCB_0[9];
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _BokehRadius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _CoCTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FrontOcclusion;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_4;
int u_xlati5;
mediump vec3 u_xlat16_8;
vec2 u_xlat10;
mediump float u_xlat16_10;
bool u_xlatb10;
mediump float u_xlat16_16;
mediump float u_xlat16_17;
void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.466699988,0.0,0.0,0.0);
ImmCB_0[2] = vec4(-0.2333,0.404100001,0.0,0.0);
ImmCB_0[3] = vec4(-0.2333,-0.404100001,0.0,0.0);
ImmCB_0[4] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[5] = vec4(0.308999985,0.951099992,0.0,0.0);
ImmCB_0[6] = vec4(-0.809000015,0.587800026,0.0,0.0);
ImmCB_0[7] = vec4(-0.809000015,-0.587800026,0.0,0.0);
ImmCB_0[8] = vec4(0.308999985,-0.951099992,0.0,0.0);
    u_xlat16_0 = texture(_CoCTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlat16_16 = float(0.0);
    u_xlat16_2.x = float(0.0);
    u_xlat16_2.y = float(0.0);
    u_xlat16_2.z = float(0.0);
    u_xlat16_17 = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
    {
        u_xlat10.xy = vec2(_BokehRadius) * ImmCB_0[u_xlati_loop_1].xy;
        u_xlat3 = dot(u_xlat10.xy, u_xlat10.xy);
        u_xlat3 = sqrt(u_xlat3);
        u_xlat10.xy = u_xlat10.xy * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat16_8.xyz = texture(_MainTex, u_xlat10.xy).xyz;
        u_xlat16_10 = texture(_CoCTex, u_xlat10.xy).x;
        u_xlat16_4 = min(u_xlat16_0, u_xlat16_10);
        u_xlat16_4 = max(u_xlat16_4, 0.0);
        u_xlat16_4 = (-u_xlat3) + u_xlat16_4;
        u_xlat16_4 = u_xlat16_4 + 2.0;
        u_xlat16_4 = u_xlat16_4 * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
        u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
        u_xlat16_1.xyz = u_xlat16_8.xyz * vec3(u_xlat16_4) + u_xlat16_1.xyz;
        u_xlat16_16 = u_xlat16_16 + u_xlat16_4;
        u_xlat16_4 = (-u_xlat3) + (-u_xlat16_10);
        u_xlat16_4 = u_xlat16_4 + 2.0;
        u_xlat16_4 = u_xlat16_4 * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
        u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
        u_xlat16_2.xyz = u_xlat16_8.xyz * vec3(u_xlat16_4) + u_xlat16_2.xyz;
        u_xlat16_17 = u_xlat16_17 + u_xlat16_4;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_16==0.0);
#else
    u_xlatb0 = u_xlat16_16==0.0;
#endif
    u_xlat16_4 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_16 = u_xlat16_16 + u_xlat16_4;
    u_xlat16_16 = float(1.0) / u_xlat16_16;
    u_xlat16_1.xyz = vec3(u_xlat16_16) * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_17==0.0);
#else
    u_xlatb0 = u_xlat16_17==0.0;
#endif
    u_xlat16_16 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_16 = u_xlat16_16 + u_xlat16_17;
    u_xlat16_16 = float(1.0) / u_xlat16_16;
    u_xlat16_0 = texture(_FrontOcclusion, vs_TEXCOORD0.xy).x;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_16) + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

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
    vs_TEXCOORD0.xy = u_xlat0.xy;
    gl_Position.zw = vec2(-1.0, 1.0);
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
vec4 ImmCB_0[9];
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _BokehRadius;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _CoCTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FrontOcclusion;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_4;
int u_xlati5;
mediump vec3 u_xlat16_8;
vec2 u_xlat10;
mediump float u_xlat16_10;
bool u_xlatb10;
mediump float u_xlat16_16;
mediump float u_xlat16_17;
void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.466699988,0.0,0.0,0.0);
ImmCB_0[2] = vec4(-0.2333,0.404100001,0.0,0.0);
ImmCB_0[3] = vec4(-0.2333,-0.404100001,0.0,0.0);
ImmCB_0[4] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[5] = vec4(0.308999985,0.951099992,0.0,0.0);
ImmCB_0[6] = vec4(-0.809000015,0.587800026,0.0,0.0);
ImmCB_0[7] = vec4(-0.809000015,-0.587800026,0.0,0.0);
ImmCB_0[8] = vec4(0.308999985,-0.951099992,0.0,0.0);
    u_xlat16_0 = texture(_CoCTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlat16_16 = float(0.0);
    u_xlat16_2.x = float(0.0);
    u_xlat16_2.y = float(0.0);
    u_xlat16_2.z = float(0.0);
    u_xlat16_17 = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
    {
        u_xlat10.xy = vec2(_BokehRadius) * ImmCB_0[u_xlati_loop_1].xy;
        u_xlat3 = dot(u_xlat10.xy, u_xlat10.xy);
        u_xlat3 = sqrt(u_xlat3);
        u_xlat10.xy = u_xlat10.xy * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat16_8.xyz = texture(_MainTex, u_xlat10.xy).xyz;
        u_xlat16_10 = texture(_CoCTex, u_xlat10.xy).x;
        u_xlat16_4 = min(u_xlat16_0, u_xlat16_10);
        u_xlat16_4 = max(u_xlat16_4, 0.0);
        u_xlat16_4 = (-u_xlat3) + u_xlat16_4;
        u_xlat16_4 = u_xlat16_4 + 2.0;
        u_xlat16_4 = u_xlat16_4 * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
        u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
        u_xlat16_1.xyz = u_xlat16_8.xyz * vec3(u_xlat16_4) + u_xlat16_1.xyz;
        u_xlat16_16 = u_xlat16_16 + u_xlat16_4;
        u_xlat16_4 = (-u_xlat3) + (-u_xlat16_10);
        u_xlat16_4 = u_xlat16_4 + 2.0;
        u_xlat16_4 = u_xlat16_4 * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
        u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
        u_xlat16_2.xyz = u_xlat16_8.xyz * vec3(u_xlat16_4) + u_xlat16_2.xyz;
        u_xlat16_17 = u_xlat16_17 + u_xlat16_4;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_16==0.0);
#else
    u_xlatb0 = u_xlat16_16==0.0;
#endif
    u_xlat16_4 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_16 = u_xlat16_16 + u_xlat16_4;
    u_xlat16_16 = float(1.0) / u_xlat16_16;
    u_xlat16_1.xyz = vec3(u_xlat16_16) * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_17==0.0);
#else
    u_xlatb0 = u_xlat16_17==0.0;
#endif
    u_xlat16_16 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_16 = u_xlat16_16 + u_xlat16_17;
    u_xlat16_16 = float(1.0) / u_xlat16_16;
    u_xlat16_0 = texture(_FrontOcclusion, vs_TEXCOORD0.xy).x;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_16) + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position = in_POSITION0;
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
vec4 ImmCB_0[9];
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _BokehRadius;
uniform lowp sampler2D _CoCTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FrontOcclusion;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_4;
int u_xlati5;
lowp vec3 u_xlat10_8;
vec2 u_xlat10;
lowp float u_xlat10_10;
bool u_xlatb10;
mediump float u_xlat16_16;
mediump float u_xlat16_17;
#define UNITY_DYNAMIC_INDEX_ES2 0



vec4 ImmCB_0DynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return ImmCB_0[i];
#else
#define d_ar ImmCB_0
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.466699988,0.0,0.0,0.0);
ImmCB_0[2] = vec4(-0.2333,0.404100001,0.0,0.0);
ImmCB_0[3] = vec4(-0.2333,-0.404100001,0.0,0.0);
ImmCB_0[4] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[5] = vec4(0.308999985,0.951099992,0.0,0.0);
ImmCB_0[6] = vec4(-0.809000015,0.587800026,0.0,0.0);
ImmCB_0[7] = vec4(-0.809000015,-0.587800026,0.0,0.0);
ImmCB_0[8] = vec4(0.308999985,-0.951099992,0.0,0.0);
    u_xlat10_0 = texture2D(_CoCTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlat16_16 = float(0.0);
    u_xlat16_2.x = float(0.0);
    u_xlat16_2.y = float(0.0);
    u_xlat16_2.z = float(0.0);
    u_xlat16_17 = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
    {
        u_xlat10.xy = vec2(_BokehRadius) * ImmCB_0DynamicIndex(u_xlati_loop_1).xy;
        u_xlat3 = dot(u_xlat10.xy, u_xlat10.xy);
        u_xlat3 = sqrt(u_xlat3);
        u_xlat10.xy = u_xlat10.xy * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat10_8.xyz = texture2D(_MainTex, u_xlat10.xy).xyz;
        u_xlat10_10 = texture2D(_CoCTex, u_xlat10.xy).x;
        u_xlat16_4 = min(u_xlat10_0, u_xlat10_10);
        u_xlat16_4 = max(u_xlat16_4, 0.0);
        u_xlat16_4 = (-u_xlat3) + u_xlat16_4;
        u_xlat16_4 = u_xlat16_4 + 2.0;
        u_xlat16_4 = u_xlat16_4 * 0.5;
        u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
        u_xlat16_1.xyz = u_xlat10_8.xyz * vec3(u_xlat16_4) + u_xlat16_1.xyz;
        u_xlat16_16 = u_xlat16_16 + u_xlat16_4;
        u_xlat16_4 = (-u_xlat3) + (-u_xlat10_10);
        u_xlat16_4 = u_xlat16_4 + 2.0;
        u_xlat16_4 = u_xlat16_4 * 0.5;
        u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
        u_xlat16_2.xyz = u_xlat10_8.xyz * vec3(u_xlat16_4) + u_xlat16_2.xyz;
        u_xlat16_17 = u_xlat16_17 + u_xlat16_4;
    }
    u_xlatb0 = u_xlat16_16==0.0;
    u_xlat16_4 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_16 = u_xlat16_16 + u_xlat16_4;
    u_xlat16_16 = float(1.0) / u_xlat16_16;
    u_xlat16_1.xyz = vec3(u_xlat16_16) * u_xlat16_1.xyz;
    u_xlatb0 = u_xlat16_17==0.0;
    u_xlat16_16 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_16 = u_xlat16_16 + u_xlat16_17;
    u_xlat16_16 = float(1.0) / u_xlat16_16;
    u_xlat10_0 = texture2D(_FrontOcclusion, vs_TEXCOORD0.xy).x;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_16) + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat10_0) * u_xlat16_2.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position = in_POSITION0;
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
vec4 ImmCB_0[9];
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _BokehRadius;
uniform lowp sampler2D _CoCTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FrontOcclusion;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_4;
int u_xlati5;
lowp vec3 u_xlat10_8;
vec2 u_xlat10;
lowp float u_xlat10_10;
bool u_xlatb10;
mediump float u_xlat16_16;
mediump float u_xlat16_17;
#define UNITY_DYNAMIC_INDEX_ES2 0



vec4 ImmCB_0DynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return ImmCB_0[i];
#else
#define d_ar ImmCB_0
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.466699988,0.0,0.0,0.0);
ImmCB_0[2] = vec4(-0.2333,0.404100001,0.0,0.0);
ImmCB_0[3] = vec4(-0.2333,-0.404100001,0.0,0.0);
ImmCB_0[4] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[5] = vec4(0.308999985,0.951099992,0.0,0.0);
ImmCB_0[6] = vec4(-0.809000015,0.587800026,0.0,0.0);
ImmCB_0[7] = vec4(-0.809000015,-0.587800026,0.0,0.0);
ImmCB_0[8] = vec4(0.308999985,-0.951099992,0.0,0.0);
    u_xlat10_0 = texture2D(_CoCTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlat16_16 = float(0.0);
    u_xlat16_2.x = float(0.0);
    u_xlat16_2.y = float(0.0);
    u_xlat16_2.z = float(0.0);
    u_xlat16_17 = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
    {
        u_xlat10.xy = vec2(_BokehRadius) * ImmCB_0DynamicIndex(u_xlati_loop_1).xy;
        u_xlat3 = dot(u_xlat10.xy, u_xlat10.xy);
        u_xlat3 = sqrt(u_xlat3);
        u_xlat10.xy = u_xlat10.xy * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat10_8.xyz = texture2D(_MainTex, u_xlat10.xy).xyz;
        u_xlat10_10 = texture2D(_CoCTex, u_xlat10.xy).x;
        u_xlat16_4 = min(u_xlat10_0, u_xlat10_10);
        u_xlat16_4 = max(u_xlat16_4, 0.0);
        u_xlat16_4 = (-u_xlat3) + u_xlat16_4;
        u_xlat16_4 = u_xlat16_4 + 2.0;
        u_xlat16_4 = u_xlat16_4 * 0.5;
        u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
        u_xlat16_1.xyz = u_xlat10_8.xyz * vec3(u_xlat16_4) + u_xlat16_1.xyz;
        u_xlat16_16 = u_xlat16_16 + u_xlat16_4;
        u_xlat16_4 = (-u_xlat3) + (-u_xlat10_10);
        u_xlat16_4 = u_xlat16_4 + 2.0;
        u_xlat16_4 = u_xlat16_4 * 0.5;
        u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
        u_xlat16_2.xyz = u_xlat10_8.xyz * vec3(u_xlat16_4) + u_xlat16_2.xyz;
        u_xlat16_17 = u_xlat16_17 + u_xlat16_4;
    }
    u_xlatb0 = u_xlat16_16==0.0;
    u_xlat16_4 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_16 = u_xlat16_16 + u_xlat16_4;
    u_xlat16_16 = float(1.0) / u_xlat16_16;
    u_xlat16_1.xyz = vec3(u_xlat16_16) * u_xlat16_1.xyz;
    u_xlatb0 = u_xlat16_17==0.0;
    u_xlat16_16 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_16 = u_xlat16_16 + u_xlat16_17;
    u_xlat16_16 = float(1.0) / u_xlat16_16;
    u_xlat10_0 = texture2D(_FrontOcclusion, vs_TEXCOORD0.xy).x;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_16) + (-u_xlat16_1.xyz);
    SV_Target0.xyz = vec3(u_xlat10_0) * u_xlat16_2.xyz + u_xlat16_1.xyz;
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
 Pass {
 Name "PostFilter"
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 220716
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

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
    vs_TEXCOORD0.xy = u_xlat0.xy;
    gl_Position.zw = vec2(-1.0, 1.0);
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
uniform 	mediump vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.zw);
    u_xlat0 = u_xlat16_0 + u_xlat16_1;
    u_xlat16_1 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.zw);
    u_xlat0 = u_xlat0 + u_xlat16_2;
    u_xlat0 = u_xlat16_1 + u_xlat0;
    SV_Target0 = u_xlat0 * vec4(0.25, 0.25, 0.25, 0.25);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

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
    vs_TEXCOORD0.xy = u_xlat0.xy;
    gl_Position.zw = vec2(-1.0, 1.0);
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
uniform 	mediump vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
void main()
{
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat16_0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat16_0.zw);
    u_xlat0 = u_xlat16_0 + u_xlat16_1;
    u_xlat16_1 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_MainTex, u_xlat16_1.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat16_1.zw);
    u_xlat0 = u_xlat0 + u_xlat16_2;
    u_xlat0 = u_xlat16_1 + u_xlat0;
    SV_Target0 = u_xlat0 * vec4(0.25, 0.25, 0.25, 0.25);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position = in_POSITION0;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
void main()
{
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat16_0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat16_0.zw);
    u_xlat0 = u_xlat10_0 + u_xlat10_1;
    u_xlat16_1 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture2D(_MainTex, u_xlat16_1.xy);
    u_xlat10_1 = texture2D(_MainTex, u_xlat16_1.zw);
    u_xlat0 = u_xlat0 + u_xlat10_2;
    u_xlat0 = u_xlat10_1 + u_xlat0;
    SV_Target0 = u_xlat0 * vec4(0.25, 0.25, 0.25, 0.25);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position = in_POSITION0;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
void main()
{
    u_xlat16_0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat16_0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat16_0.zw);
    u_xlat0 = u_xlat10_0 + u_xlat10_1;
    u_xlat16_1 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture2D(_MainTex, u_xlat16_1.xy);
    u_xlat10_1 = texture2D(_MainTex, u_xlat16_1.zw);
    u_xlat0 = u_xlat0 + u_xlat10_2;
    u_xlat0 = u_xlat10_1 + u_xlat0;
    SV_Target0 = u_xlat0 * vec4(0.25, 0.25, 0.25, 0.25);
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
 Name "FrontOcclusion"
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 300291
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

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
    vs_TEXCOORD0.xy = u_xlat0.xy;
    gl_Position.zw = vec2(-1.0, 1.0);
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
vec4 ImmCB_0[9];
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _BokehRadius;
UNITY_LOCATION(0) uniform mediump sampler2D _CoCTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump float SV_Target0;
mediump float u_xlat16_0;
int u_xlati1;
mediump float u_xlat16_2;
vec2 u_xlat3;
mediump float u_xlat16_3;
bool u_xlatb3;
float u_xlat7;
void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.466699988,0.0,0.0,0.0);
ImmCB_0[2] = vec4(-0.2333,0.404100001,0.0,0.0);
ImmCB_0[3] = vec4(-0.2333,-0.404100001,0.0,0.0);
ImmCB_0[4] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[5] = vec4(0.308999985,0.951099992,0.0,0.0);
ImmCB_0[6] = vec4(-0.809000015,0.587800026,0.0,0.0);
ImmCB_0[7] = vec4(-0.809000015,-0.587800026,0.0,0.0);
ImmCB_0[8] = vec4(0.308999985,-0.951099992,0.0,0.0);
    u_xlat16_0 = 0.0;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
    {
        u_xlat3.xy = vec2(_BokehRadius) * ImmCB_0[u_xlati_loop_1].xy;
        u_xlat7 = dot(u_xlat3.xy, u_xlat3.xy);
        u_xlat7 = sqrt(u_xlat7);
        u_xlat3.xy = u_xlat3.xy * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_CoCTex, u_xlat3.xy).x;
        u_xlat16_2 = (-u_xlat7) + (-u_xlat16_3);
        u_xlat16_2 = u_xlat16_2 + 2.0;
        u_xlat16_2 = u_xlat16_2 * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
        u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
        u_xlat16_0 = u_xlat16_2 + u_xlat16_0;
    }
    u_xlat16_0 = u_xlat16_0 * 0.34906587;
    SV_Target0 = min(u_xlat16_0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

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
    vs_TEXCOORD0.xy = u_xlat0.xy;
    gl_Position.zw = vec2(-1.0, 1.0);
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
vec4 ImmCB_0[9];
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _BokehRadius;
UNITY_LOCATION(0) uniform mediump sampler2D _CoCTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump float SV_Target0;
mediump float u_xlat16_0;
int u_xlati1;
mediump float u_xlat16_2;
vec2 u_xlat3;
mediump float u_xlat16_3;
bool u_xlatb3;
float u_xlat7;
void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.466699988,0.0,0.0,0.0);
ImmCB_0[2] = vec4(-0.2333,0.404100001,0.0,0.0);
ImmCB_0[3] = vec4(-0.2333,-0.404100001,0.0,0.0);
ImmCB_0[4] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[5] = vec4(0.308999985,0.951099992,0.0,0.0);
ImmCB_0[6] = vec4(-0.809000015,0.587800026,0.0,0.0);
ImmCB_0[7] = vec4(-0.809000015,-0.587800026,0.0,0.0);
ImmCB_0[8] = vec4(0.308999985,-0.951099992,0.0,0.0);
    u_xlat16_0 = 0.0;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
    {
        u_xlat3.xy = vec2(_BokehRadius) * ImmCB_0[u_xlati_loop_1].xy;
        u_xlat7 = dot(u_xlat3.xy, u_xlat3.xy);
        u_xlat7 = sqrt(u_xlat7);
        u_xlat3.xy = u_xlat3.xy * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_CoCTex, u_xlat3.xy).x;
        u_xlat16_2 = (-u_xlat7) + (-u_xlat16_3);
        u_xlat16_2 = u_xlat16_2 + 2.0;
        u_xlat16_2 = u_xlat16_2 * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
        u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
        u_xlat16_0 = u_xlat16_2 + u_xlat16_0;
    }
    u_xlat16_0 = u_xlat16_0 * 0.34906587;
    SV_Target0 = min(u_xlat16_0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position = in_POSITION0;
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
vec4 ImmCB_0[9];
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _BokehRadius;
uniform lowp sampler2D _CoCTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
int u_xlati1;
mediump float u_xlat16_2;
vec2 u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb3;
float u_xlat7;
#define UNITY_DYNAMIC_INDEX_ES2 0



vec4 ImmCB_0DynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return ImmCB_0[i];
#else
#define d_ar ImmCB_0
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.466699988,0.0,0.0,0.0);
ImmCB_0[2] = vec4(-0.2333,0.404100001,0.0,0.0);
ImmCB_0[3] = vec4(-0.2333,-0.404100001,0.0,0.0);
ImmCB_0[4] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[5] = vec4(0.308999985,0.951099992,0.0,0.0);
ImmCB_0[6] = vec4(-0.809000015,0.587800026,0.0,0.0);
ImmCB_0[7] = vec4(-0.809000015,-0.587800026,0.0,0.0);
ImmCB_0[8] = vec4(0.308999985,-0.951099992,0.0,0.0);
    u_xlat16_0 = 0.0;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
    {
        u_xlat3.xy = vec2(_BokehRadius) * ImmCB_0DynamicIndex(u_xlati_loop_1).xy;
        u_xlat7 = dot(u_xlat3.xy, u_xlat3.xy);
        u_xlat7 = sqrt(u_xlat7);
        u_xlat3.xy = u_xlat3.xy * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat10_3 = texture2D(_CoCTex, u_xlat3.xy).x;
        u_xlat16_2 = (-u_xlat7) + (-u_xlat10_3);
        u_xlat16_2 = u_xlat16_2 + 2.0;
        u_xlat16_2 = u_xlat16_2 * 0.5;
        u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
        u_xlat16_0 = u_xlat16_2 + u_xlat16_0;
    }
    u_xlat16_0 = u_xlat16_0 * 0.34906587;
    SV_Target0 = min(u_xlat16_0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position = in_POSITION0;
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
vec4 ImmCB_0[9];
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _BokehRadius;
uniform lowp sampler2D _CoCTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump float u_xlat16_0;
int u_xlati1;
mediump float u_xlat16_2;
vec2 u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb3;
float u_xlat7;
#define UNITY_DYNAMIC_INDEX_ES2 0



vec4 ImmCB_0DynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return ImmCB_0[i];
#else
#define d_ar ImmCB_0
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7]; else if (i == 8) return d_ar[8];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
ImmCB_0[0] = vec4(0.0,0.0,0.0,0.0);
ImmCB_0[1] = vec4(0.466699988,0.0,0.0,0.0);
ImmCB_0[2] = vec4(-0.2333,0.404100001,0.0,0.0);
ImmCB_0[3] = vec4(-0.2333,-0.404100001,0.0,0.0);
ImmCB_0[4] = vec4(1.0,0.0,0.0,0.0);
ImmCB_0[5] = vec4(0.308999985,0.951099992,0.0,0.0);
ImmCB_0[6] = vec4(-0.809000015,0.587800026,0.0,0.0);
ImmCB_0[7] = vec4(-0.809000015,-0.587800026,0.0,0.0);
ImmCB_0[8] = vec4(0.308999985,-0.951099992,0.0,0.0);
    u_xlat16_0 = 0.0;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<9 ; u_xlati_loop_1++)
    {
        u_xlat3.xy = vec2(_BokehRadius) * ImmCB_0DynamicIndex(u_xlati_loop_1).xy;
        u_xlat7 = dot(u_xlat3.xy, u_xlat3.xy);
        u_xlat7 = sqrt(u_xlat7);
        u_xlat3.xy = u_xlat3.xy * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat10_3 = texture2D(_CoCTex, u_xlat3.xy).x;
        u_xlat16_2 = (-u_xlat7) + (-u_xlat10_3);
        u_xlat16_2 = u_xlat16_2 + 2.0;
        u_xlat16_2 = u_xlat16_2 * 0.5;
        u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
        u_xlat16_0 = u_xlat16_2 + u_xlat16_0;
    }
    u_xlat16_0 = u_xlat16_0 * 0.34906587;
    SV_Target0 = min(u_xlat16_0, 1.0);
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
 Name "ApplyDof"
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 350862
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
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _CoCTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DoFTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FrontOcclusion;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat16_0.x = texture(_CoCTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = min(abs(u_xlat16_0.x), 1.0);
    u_xlat16_4.x = u_xlat16_1 * -2.0 + 3.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = (-u_xlat16_4.x) * u_xlat16_1 + 1.0;
    u_xlat16_0.x = texture(_FrontOcclusion, vs_TEXCOORD0.xy).x;
    u_xlat16_4.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_1 = (-u_xlat16_1) * u_xlat16_4.x + 1.0;
    u_xlat16_0.xyz = texture(_DoFTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz + (-u_xlat16_2.xyz);
    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat16_4.xyz + u_xlat16_2.xyz;
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
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _CoCTex;
UNITY_LOCATION(2) uniform mediump sampler2D _DoFTex;
UNITY_LOCATION(3) uniform mediump sampler2D _FrontOcclusion;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat16_0.x = texture(_CoCTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = min(abs(u_xlat16_0.x), 1.0);
    u_xlat16_4.x = u_xlat16_1 * -2.0 + 3.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = (-u_xlat16_4.x) * u_xlat16_1 + 1.0;
    u_xlat16_0.x = texture(_FrontOcclusion, vs_TEXCOORD0.xy).x;
    u_xlat16_4.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_1 = (-u_xlat16_1) * u_xlat16_4.x + 1.0;
    u_xlat16_0.xyz = texture(_DoFTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz + (-u_xlat16_2.xyz);
    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat16_4.xyz + u_xlat16_2.xyz;
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
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DoFTex;
uniform lowp sampler2D _CoCTex;
uniform lowp sampler2D _FrontOcclusion;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump float u_xlat16_1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat10_0.x = texture2D(_CoCTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = min(abs(u_xlat10_0.x), 1.0);
    u_xlat16_4.x = u_xlat16_1 * -2.0 + 3.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = (-u_xlat16_4.x) * u_xlat16_1 + 1.0;
    u_xlat10_0.x = texture2D(_FrontOcclusion, vs_TEXCOORD0.xy).x;
    u_xlat16_4.x = (-u_xlat10_0.x) + 1.0;
    u_xlat16_1 = (-u_xlat16_1) * u_xlat16_4.x + 1.0;
    u_xlat10_0.xyz = texture2D(_DoFTex, vs_TEXCOORD0.xy).xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz + (-u_xlat10_2.xyz);
    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat16_4.xyz + u_xlat10_2.xyz;
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
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DoFTex;
uniform lowp sampler2D _CoCTex;
uniform lowp sampler2D _FrontOcclusion;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump float u_xlat16_1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat10_0.x = texture2D(_CoCTex, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = min(abs(u_xlat10_0.x), 1.0);
    u_xlat16_4.x = u_xlat16_1 * -2.0 + 3.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = (-u_xlat16_4.x) * u_xlat16_1 + 1.0;
    u_xlat10_0.x = texture2D(_FrontOcclusion, vs_TEXCOORD0.xy).x;
    u_xlat16_4.x = (-u_xlat10_0.x) + 1.0;
    u_xlat16_1 = (-u_xlat16_1) * u_xlat16_4.x + 1.0;
    u_xlat10_0.xyz = texture2D(_DoFTex, vs_TEXCOORD0.xy).xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz + (-u_xlat10_2.xyz);
    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat16_4.xyz + u_xlat10_2.xyz;
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