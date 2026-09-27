//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/RayLine" {
Properties {

}
SubShader {
 Pass {
 Name "RayLine"
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 31212
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
uniform 	vec4 _RayLineParams0;
uniform 	vec4 _RayLineParams1;
uniform 	vec4 _RayLineParams2;
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
UNITY_LOCATION(1) uniform mediump sampler2D _WorleyTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
bool u_xlatb4;
vec2 u_xlat6;
bool u_xlatb7;
float u_xlat9;
mediump float u_xlat16_9;
void main()
{
    u_xlat0.yz = vs_TEXCOORD0.xy + (-_RayLineParams0.xy);
    u_xlat9 = max(abs(u_xlat0.z), abs(u_xlat0.y));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat1.x = min(abs(u_xlat0.z), abs(u_xlat0.y));
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat4.x = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat4.x = u_xlat1.x * u_xlat4.x + 0.180141002;
    u_xlat4.x = u_xlat1.x * u_xlat4.x + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat4.x + 0.999866009;
    u_xlat4.x = u_xlat9 * u_xlat1.x;
    u_xlat4.x = u_xlat4.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(abs(u_xlat0.z)<abs(u_xlat0.y));
#else
    u_xlatb7 = abs(u_xlat0.z)<abs(u_xlat0.y);
#endif
    u_xlat4.x = u_xlatb7 ? u_xlat4.x : float(0.0);
    u_xlat9 = u_xlat9 * u_xlat1.x + u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat0.z<(-u_xlat0.z));
#else
    u_xlatb1 = u_xlat0.z<(-u_xlat0.z);
#endif
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat9 = u_xlat9 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.z, u_xlat0.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x<(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
#endif
    u_xlat4.x = max(u_xlat0.z, u_xlat0.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat4.x>=(-u_xlat4.x));
#else
    u_xlatb4 = u_xlat4.x>=(-u_xlat4.x);
#endif
    u_xlatb1 = u_xlatb4 && u_xlatb1;
    u_xlat9 = (u_xlatb1) ? (-u_xlat9) : u_xlat9;
    u_xlat1.y = u_xlat9 * 0.159154937;
    u_xlat2 = _RayLineParams0.zwzw * vec4(4.0, 50.0, 2.0, 100.0);
    u_xlat9 = dot(u_xlat0.yz, u_xlat0.yz);
    u_xlat1.x = sqrt(u_xlat9);
    u_xlat1 = u_xlat1.xyxy * u_xlat2 + (-_RayLineParams1.zzzz);
    u_xlat16_9 = texture(_WorleyTex, u_xlat1.xy).x;
    u_xlat16_1 = texture(_WorleyTex, u_xlat1.zw).x;
    u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat2.z = 1.0;
    u_xlat2.xy = _ScreenParams.yx / _ScreenParams.xy;
    u_xlat4.xy = u_xlat4.xy * u_xlat2.xz;
    u_xlat0.x = u_xlat0.y * u_xlat2.y;
    u_xlat0.x = dot(u_xlat0.xz, u_xlat0.xz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_RayLineParams2.y);
    u_xlat0.x = u_xlat0.x / _RayLineParams2.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat6.x = _RayLineParams2.x + -0.5;
    u_xlat6.x = (-u_xlat6.x) * 5.9000001 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat6.x;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat3.x = u_xlat16_9 * u_xlat3.x;
    u_xlat3.x = u_xlat16_1 * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * _RayLineParams1.x;
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat3.x = u_xlat0.x * u_xlat3.x;
    u_xlat6.xy = (-_RayLineParams0.xy) + vec2(1.0, 1.0);
    u_xlat6.xy = u_xlat6.xy + (-vs_TEXCOORD0.xy);
    u_xlat3.xy = u_xlat3.xx * u_xlat6.xy + vs_TEXCOORD0.xy;
    u_xlat1 = textureLod(_MainTex, u_xlat3.xy, 0.0);
    u_xlat3.xyz = u_xlat1.xyz * _RayLineParams1.yyy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat1.xyz;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _RayLineParams0;
uniform 	vec4 _RayLineParams1;
uniform 	vec4 _RayLineParams2;
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
UNITY_LOCATION(1) uniform mediump sampler2D _WorleyTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
bool u_xlatb4;
vec2 u_xlat6;
bool u_xlatb7;
float u_xlat9;
mediump float u_xlat16_9;
void main()
{
    u_xlat0.yz = vs_TEXCOORD0.xy + (-_RayLineParams0.xy);
    u_xlat9 = max(abs(u_xlat0.z), abs(u_xlat0.y));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat1.x = min(abs(u_xlat0.z), abs(u_xlat0.y));
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat4.x = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat4.x = u_xlat1.x * u_xlat4.x + 0.180141002;
    u_xlat4.x = u_xlat1.x * u_xlat4.x + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat4.x + 0.999866009;
    u_xlat4.x = u_xlat9 * u_xlat1.x;
    u_xlat4.x = u_xlat4.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(abs(u_xlat0.z)<abs(u_xlat0.y));
#else
    u_xlatb7 = abs(u_xlat0.z)<abs(u_xlat0.y);
#endif
    u_xlat4.x = u_xlatb7 ? u_xlat4.x : float(0.0);
    u_xlat9 = u_xlat9 * u_xlat1.x + u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat0.z<(-u_xlat0.z));
#else
    u_xlatb1 = u_xlat0.z<(-u_xlat0.z);
#endif
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat9 = u_xlat9 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.z, u_xlat0.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x<(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
#endif
    u_xlat4.x = max(u_xlat0.z, u_xlat0.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat4.x>=(-u_xlat4.x));
#else
    u_xlatb4 = u_xlat4.x>=(-u_xlat4.x);
#endif
    u_xlatb1 = u_xlatb4 && u_xlatb1;
    u_xlat9 = (u_xlatb1) ? (-u_xlat9) : u_xlat9;
    u_xlat1.y = u_xlat9 * 0.159154937;
    u_xlat2 = _RayLineParams0.zwzw * vec4(4.0, 50.0, 2.0, 100.0);
    u_xlat9 = dot(u_xlat0.yz, u_xlat0.yz);
    u_xlat1.x = sqrt(u_xlat9);
    u_xlat1 = u_xlat1.xyxy * u_xlat2 + (-_RayLineParams1.zzzz);
    u_xlat16_9 = texture(_WorleyTex, u_xlat1.xy).x;
    u_xlat16_1 = texture(_WorleyTex, u_xlat1.zw).x;
    u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat2.z = 1.0;
    u_xlat2.xy = _ScreenParams.yx / _ScreenParams.xy;
    u_xlat4.xy = u_xlat4.xy * u_xlat2.xz;
    u_xlat0.x = u_xlat0.y * u_xlat2.y;
    u_xlat0.x = dot(u_xlat0.xz, u_xlat0.xz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_RayLineParams2.y);
    u_xlat0.x = u_xlat0.x / _RayLineParams2.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat6.x = _RayLineParams2.x + -0.5;
    u_xlat6.x = (-u_xlat6.x) * 5.9000001 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat6.x;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat3.x = u_xlat16_9 * u_xlat3.x;
    u_xlat3.x = u_xlat16_1 * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * _RayLineParams1.x;
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat3.x = u_xlat0.x * u_xlat3.x;
    u_xlat6.xy = (-_RayLineParams0.xy) + vec2(1.0, 1.0);
    u_xlat6.xy = u_xlat6.xy + (-vs_TEXCOORD0.xy);
    u_xlat3.xy = u_xlat3.xx * u_xlat6.xy + vs_TEXCOORD0.xy;
    u_xlat1 = textureLod(_MainTex, u_xlat3.xy, 0.0);
    u_xlat3.xyz = u_xlat1.xyz * _RayLineParams1.yyy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat1.xyz;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _RayLineParams0;
uniform 	vec4 _RayLineParams1;
uniform 	vec4 _RayLineParams2;
uniform lowp sampler2D _WorleyTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
bool u_xlatb4;
vec2 u_xlat6;
bool u_xlatb7;
float u_xlat9;
lowp float u_xlat10_9;
void main()
{
    u_xlat0.yz = vs_TEXCOORD0.xy + (-_RayLineParams0.xy);
    u_xlat9 = max(abs(u_xlat0.z), abs(u_xlat0.y));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat1.x = min(abs(u_xlat0.z), abs(u_xlat0.y));
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat4.x = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat4.x = u_xlat1.x * u_xlat4.x + 0.180141002;
    u_xlat4.x = u_xlat1.x * u_xlat4.x + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat4.x + 0.999866009;
    u_xlat4.x = u_xlat9 * u_xlat1.x;
    u_xlat4.x = u_xlat4.x * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.z)<abs(u_xlat0.y);
    u_xlat4.x = u_xlatb7 ? u_xlat4.x : float(0.0);
    u_xlat9 = u_xlat9 * u_xlat1.x + u_xlat4.x;
    u_xlatb1 = u_xlat0.z<(-u_xlat0.z);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat9 = u_xlat9 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.z, u_xlat0.y);
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
    u_xlat4.x = max(u_xlat0.z, u_xlat0.y);
    u_xlatb4 = u_xlat4.x>=(-u_xlat4.x);
    u_xlatb1 = u_xlatb4 && u_xlatb1;
    u_xlat9 = (u_xlatb1) ? (-u_xlat9) : u_xlat9;
    u_xlat1.y = u_xlat9 * 0.159154937;
    u_xlat2 = _RayLineParams0.zwzw * vec4(4.0, 50.0, 2.0, 100.0);
    u_xlat9 = dot(u_xlat0.yz, u_xlat0.yz);
    u_xlat1.x = sqrt(u_xlat9);
    u_xlat1 = u_xlat1.xyxy * u_xlat2 + (-_RayLineParams1.zzzz);
    u_xlat10_9 = texture2D(_WorleyTex, u_xlat1.xy).x;
    u_xlat10_1 = texture2D(_WorleyTex, u_xlat1.zw).x;
    u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat2.z = 1.0;
    u_xlat2.xy = _ScreenParams.yx / _ScreenParams.xy;
    u_xlat4.xy = u_xlat4.xy * u_xlat2.xz;
    u_xlat0.x = u_xlat0.y * u_xlat2.y;
    u_xlat0.x = dot(u_xlat0.xz, u_xlat0.xz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_RayLineParams2.y);
    u_xlat0.x = u_xlat0.x / _RayLineParams2.z;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat6.x = _RayLineParams2.x + -0.5;
    u_xlat6.x = (-u_xlat6.x) * 5.9000001 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat6.x;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat3.x = u_xlat10_9 * u_xlat3.x;
    u_xlat3.x = u_xlat10_1 * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * _RayLineParams1.x;
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat3.x = u_xlat0.x * u_xlat3.x;
    u_xlat6.xy = (-_RayLineParams0.xy) + vec2(1.0, 1.0);
    u_xlat6.xy = u_xlat6.xy + (-vs_TEXCOORD0.xy);
    u_xlat3.xy = u_xlat3.xx * u_xlat6.xy + vs_TEXCOORD0.xy;
    u_xlat1 = texture2D(_MainTex, u_xlat3.xy, 0.0);
    u_xlat3.xyz = u_xlat1.xyz * _RayLineParams1.yyy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat1.xyz;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _RayLineParams0;
uniform 	vec4 _RayLineParams1;
uniform 	vec4 _RayLineParams2;
uniform lowp sampler2D _WorleyTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
bool u_xlatb4;
vec2 u_xlat6;
bool u_xlatb7;
float u_xlat9;
lowp float u_xlat10_9;
void main()
{
    u_xlat0.yz = vs_TEXCOORD0.xy + (-_RayLineParams0.xy);
    u_xlat9 = max(abs(u_xlat0.z), abs(u_xlat0.y));
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat1.x = min(abs(u_xlat0.z), abs(u_xlat0.y));
    u_xlat9 = u_xlat9 * u_xlat1.x;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat4.x = u_xlat1.x * 0.0208350997 + -0.0851330012;
    u_xlat4.x = u_xlat1.x * u_xlat4.x + 0.180141002;
    u_xlat4.x = u_xlat1.x * u_xlat4.x + -0.330299497;
    u_xlat1.x = u_xlat1.x * u_xlat4.x + 0.999866009;
    u_xlat4.x = u_xlat9 * u_xlat1.x;
    u_xlat4.x = u_xlat4.x * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.z)<abs(u_xlat0.y);
    u_xlat4.x = u_xlatb7 ? u_xlat4.x : float(0.0);
    u_xlat9 = u_xlat9 * u_xlat1.x + u_xlat4.x;
    u_xlatb1 = u_xlat0.z<(-u_xlat0.z);
    u_xlat1.x = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat9 = u_xlat9 + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.z, u_xlat0.y);
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
    u_xlat4.x = max(u_xlat0.z, u_xlat0.y);
    u_xlatb4 = u_xlat4.x>=(-u_xlat4.x);
    u_xlatb1 = u_xlatb4 && u_xlatb1;
    u_xlat9 = (u_xlatb1) ? (-u_xlat9) : u_xlat9;
    u_xlat1.y = u_xlat9 * 0.159154937;
    u_xlat2 = _RayLineParams0.zwzw * vec4(4.0, 50.0, 2.0, 100.0);
    u_xlat9 = dot(u_xlat0.yz, u_xlat0.yz);
    u_xlat1.x = sqrt(u_xlat9);
    u_xlat1 = u_xlat1.xyxy * u_xlat2 + (-_RayLineParams1.zzzz);
    u_xlat10_9 = texture2D(_WorleyTex, u_xlat1.xy).x;
    u_xlat10_1 = texture2D(_WorleyTex, u_xlat1.zw).x;
    u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat2.z = 1.0;
    u_xlat2.xy = _ScreenParams.yx / _ScreenParams.xy;
    u_xlat4.xy = u_xlat4.xy * u_xlat2.xz;
    u_xlat0.x = u_xlat0.y * u_xlat2.y;
    u_xlat0.x = dot(u_xlat0.xz, u_xlat0.xz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_RayLineParams2.y);
    u_xlat0.x = u_xlat0.x / _RayLineParams2.z;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat6.x = _RayLineParams2.x + -0.5;
    u_xlat6.x = (-u_xlat6.x) * 5.9000001 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat6.x;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat3.x = u_xlat10_9 * u_xlat3.x;
    u_xlat3.x = u_xlat10_1 * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * _RayLineParams1.x;
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat3.x = u_xlat0.x * u_xlat3.x;
    u_xlat6.xy = (-_RayLineParams0.xy) + vec2(1.0, 1.0);
    u_xlat6.xy = u_xlat6.xy + (-vs_TEXCOORD0.xy);
    u_xlat3.xy = u_xlat3.xx * u_xlat6.xy + vs_TEXCOORD0.xy;
    u_xlat1 = texture2D(_MainTex, u_xlat3.xy, 0.0);
    u_xlat3.xyz = u_xlat1.xyz * _RayLineParams1.yyy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat1.xyz;
    SV_Target0 = u_xlat1;
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