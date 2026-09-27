//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/BloomHDRTheseus" {
Properties {

}
SubShader {
 Pass {
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 38673
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
uniform 	float _bloomClamp;
uniform 	mediump float _threshold;
uniform 	mediump float _thresholdKnee;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_12;
mediump float u_xlat16_17;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -0.5, 0.0, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_2.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_3.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, -0.5, -1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_4.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 0.5, 1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_4.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
    u_xlat0.xyz = min(u_xlat16_2.xyz, vec3(_bloomClamp));
    u_xlat16_2.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_2.x = max(u_xlat0.z, u_xlat16_2.x);
    u_xlat16_7 = u_xlat16_2.x + (-_threshold);
    u_xlat16_2.z = u_xlat16_7 + _thresholdKnee;
    u_xlat16_2.xz = max(u_xlat16_2.xz, vec2(9.99999975e-05, 0.0));
    u_xlat16_17 = _thresholdKnee + _thresholdKnee;
    u_xlat16_12 = min(u_xlat16_17, u_xlat16_2.z);
    u_xlat16_12 = u_xlat16_12 * u_xlat16_12;
    u_xlat16_17 = _thresholdKnee * 4.0 + 9.99999975e-05;
    u_xlat16_12 = u_xlat16_12 / u_xlat16_17;
    u_xlat16_7 = max(u_xlat16_12, u_xlat16_7);
    u_xlat16_2.x = u_xlat16_7 / u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    SV_Target0.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	float _bloomClamp;
uniform 	mediump float _threshold;
uniform 	mediump float _thresholdKnee;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_12;
mediump float u_xlat16_17;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -0.5, 0.0, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_2.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_3.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, -0.5, -1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_4.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 0.5, 1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_4.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
    u_xlat0.xyz = min(u_xlat16_2.xyz, vec3(_bloomClamp));
    u_xlat16_2.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_2.x = max(u_xlat0.z, u_xlat16_2.x);
    u_xlat16_7 = u_xlat16_2.x + (-_threshold);
    u_xlat16_2.z = u_xlat16_7 + _thresholdKnee;
    u_xlat16_2.xz = max(u_xlat16_2.xz, vec2(9.99999975e-05, 0.0));
    u_xlat16_17 = _thresholdKnee + _thresholdKnee;
    u_xlat16_12 = min(u_xlat16_17, u_xlat16_2.z);
    u_xlat16_12 = u_xlat16_12 * u_xlat16_12;
    u_xlat16_17 = _thresholdKnee * 4.0 + 9.99999975e-05;
    u_xlat16_12 = u_xlat16_12 / u_xlat16_17;
    u_xlat16_7 = max(u_xlat16_12, u_xlat16_7);
    u_xlat16_2.x = u_xlat16_7 / u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    SV_Target0.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	float _bloomClamp;
uniform 	mediump float _threshold;
uniform 	mediump float _thresholdKnee;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_12;
mediump float u_xlat16_17;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -0.5, 0.0, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_2.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_3.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, -0.5, -1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_4.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 0.5, 1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_4.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
    u_xlat0.xyz = min(u_xlat16_2.xyz, vec3(_bloomClamp));
    u_xlat16_2.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_2.x = max(u_xlat0.z, u_xlat16_2.x);
    u_xlat16_7 = u_xlat16_2.x + (-_threshold);
    u_xlat16_2.z = u_xlat16_7 + _thresholdKnee;
    u_xlat16_2.xz = max(u_xlat16_2.xz, vec2(9.99999975e-05, 0.0));
    u_xlat16_17 = _thresholdKnee + _thresholdKnee;
    u_xlat16_12 = min(u_xlat16_17, u_xlat16_2.z);
    u_xlat16_12 = u_xlat16_12 * u_xlat16_12;
    u_xlat16_17 = _thresholdKnee * 4.0 + 9.99999975e-05;
    u_xlat16_12 = u_xlat16_12 / u_xlat16_17;
    u_xlat16_7 = max(u_xlat16_12, u_xlat16_7);
    u_xlat16_2.x = u_xlat16_7 / u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    SV_Target0.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	float _bloomClamp;
uniform 	mediump float _threshold;
uniform 	mediump float _thresholdKnee;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_12;
mediump float u_xlat16_17;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -0.5, 0.0, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_2.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_3.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, -0.5, -1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_4.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 0.5, 1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_4.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.166666672, 0.166666672, 0.166666672);
    u_xlat0.xyz = min(u_xlat16_2.xyz, vec3(_bloomClamp));
    u_xlat16_2.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_2.x = max(u_xlat0.z, u_xlat16_2.x);
    u_xlat16_7 = u_xlat16_2.x + (-_threshold);
    u_xlat16_2.z = u_xlat16_7 + _thresholdKnee;
    u_xlat16_2.xz = max(u_xlat16_2.xz, vec2(9.99999975e-05, 0.0));
    u_xlat16_17 = _thresholdKnee + _thresholdKnee;
    u_xlat16_12 = min(u_xlat16_17, u_xlat16_2.z);
    u_xlat16_12 = u_xlat16_12 * u_xlat16_12;
    u_xlat16_17 = _thresholdKnee * 4.0 + 9.99999975e-05;
    u_xlat16_12 = u_xlat16_12 / u_xlat16_17;
    u_xlat16_7 = max(u_xlat16_12, u_xlat16_7);
    u_xlat16_2.x = u_xlat16_7 / u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    SV_Target0.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
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
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 68515
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
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_2.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_3.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(-0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(4.0, 4.0, 4.0) + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
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
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_2.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_3.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(-0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(4.0, 4.0, 4.0) + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
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
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_2.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_3.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(-0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(4.0, 4.0, 4.0) + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
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
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_2.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_3.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(-0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(4.0, 4.0, 4.0) + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
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
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 192818
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _scatter;
UNITY_LOCATION(0) uniform mediump sampler2D _bloomRrcTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec2 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_1.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(0.0, -1.0) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0833333358, 0.0833333358, 0.0833333358);
    u_xlat16_0.xyz = textureLod(_bloomRrcTex, vs_TEXCOORD0.xy, 0.0).xyz;
    SV_Target0.xyz = vec3(vec3(_scatter, _scatter, _scatter)) * u_xlat16_2.xyz + u_xlat16_0.xyz;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _scatter;
UNITY_LOCATION(0) uniform mediump sampler2D _bloomRrcTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec2 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_1.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz + u_xlat16_2.xyz;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(0.0, -1.0) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0833333358, 0.0833333358, 0.0833333358);
    u_xlat16_0.xyz = textureLod(_bloomRrcTex, vs_TEXCOORD0.xy, 0.0).xyz;
    SV_Target0.xyz = vec3(vec3(_scatter, _scatter, _scatter)) * u_xlat16_2.xyz + u_xlat16_0.xyz;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _scatter;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _bloomRrcTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(0.0, -1.0) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0833333358, 0.0833333358, 0.0833333358);
    u_xlat10_0.xyz = texture2DLodEXT(_bloomRrcTex, vs_TEXCOORD0.xy, 0.0).xyz;
    SV_Target0.xyz = vec3(vec3(_scatter, _scatter, _scatter)) * u_xlat16_2.xyz + u_xlat10_0.xyz;
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _scatter;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _bloomRrcTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_1.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz + u_xlat16_2.xyz;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(0.0, -1.0) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0833333358, 0.0833333358, 0.0833333358);
    u_xlat10_0.xyz = texture2DLodEXT(_bloomRrcTex, vs_TEXCOORD0.xy, 0.0).xyz;
    SV_Target0.xyz = vec3(vec3(_scatter, _scatter, _scatter)) * u_xlat16_2.xyz + u_xlat10_0.xyz;
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
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 230144
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _bloomParams;
uniform 	float _bloomClamp;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_17;
mediump float u_xlat16_18;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-2.0, -1.0, 0.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_3.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_17 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_17 = u_xlat16_17 + 1.0;
    u_xlat16_17 = float(1.0) / u_xlat16_17;
    u_xlat16_3.xyz = vec3(u_xlat16_17) * u_xlat16_3.xyz;
    u_xlat16_18 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_18) + u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.0, -1.0, -2.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_3.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_4.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_18 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_18 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 2.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_3.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_4.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_18 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_18 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_2.xyz / vec3(u_xlat16_17);
    u_xlat0.xyz = min(u_xlat16_2.xyz, vec3(_bloomClamp));
    u_xlat16_2.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_2.x = max(u_xlat0.z, u_xlat16_2.x);
    u_xlat16_2.yz = u_xlat16_2.xx + (-_bloomParams.yx);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(9.99999975e-05, 0.0));
    u_xlat16_7 = min(u_xlat16_2.y, _bloomParams.z);
    u_xlat16_7 = u_xlat16_7 * u_xlat16_7;
    u_xlat16_7 = u_xlat16_7 * _bloomParams.w;
    u_xlat16_7 = max(u_xlat16_7, u_xlat16_2.z);
    u_xlat16_2.x = u_xlat16_7 / u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    SV_Target0.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _bloomParams;
uniform 	float _bloomClamp;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_17;
mediump float u_xlat16_18;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-2.0, -1.0, 0.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_3.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_17 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_17 = u_xlat16_17 + 1.0;
    u_xlat16_17 = float(1.0) / u_xlat16_17;
    u_xlat16_3.xyz = vec3(u_xlat16_17) * u_xlat16_3.xyz;
    u_xlat16_18 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_18) + u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.0, -1.0, -2.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_3.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_4.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_18 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_18 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 2.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_3.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_4.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_18 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_18 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_2.xyz / vec3(u_xlat16_17);
    u_xlat0.xyz = min(u_xlat16_2.xyz, vec3(_bloomClamp));
    u_xlat16_2.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_2.x = max(u_xlat0.z, u_xlat16_2.x);
    u_xlat16_2.yz = u_xlat16_2.xx + (-_bloomParams.yx);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(9.99999975e-05, 0.0));
    u_xlat16_7 = min(u_xlat16_2.y, _bloomParams.z);
    u_xlat16_7 = u_xlat16_7 * u_xlat16_7;
    u_xlat16_7 = u_xlat16_7 * _bloomParams.w;
    u_xlat16_7 = max(u_xlat16_7, u_xlat16_2.z);
    u_xlat16_2.x = u_xlat16_7 / u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    SV_Target0.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _bloomParams;
uniform 	float _bloomClamp;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_17;
mediump float u_xlat16_18;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-2.0, -1.0, 0.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_3.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_17 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_17 = u_xlat16_17 + 1.0;
    u_xlat16_17 = float(1.0) / u_xlat16_17;
    u_xlat16_3.xyz = vec3(u_xlat16_17) * u_xlat16_3.xyz;
    u_xlat16_18 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_18) + u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.0, -1.0, -2.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_3.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_4.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_18 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_18 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 2.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_3.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_4.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_18 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_18 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_2.xyz / vec3(u_xlat16_17);
    u_xlat0.xyz = min(u_xlat16_2.xyz, vec3(_bloomClamp));
    u_xlat16_2.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_2.x = max(u_xlat0.z, u_xlat16_2.x);
    u_xlat16_2.yz = u_xlat16_2.xx + (-_bloomParams.yx);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(9.99999975e-05, 0.0));
    u_xlat16_7 = min(u_xlat16_2.y, _bloomParams.z);
    u_xlat16_7 = u_xlat16_7 * u_xlat16_7;
    u_xlat16_7 = u_xlat16_7 * _bloomParams.w;
    u_xlat16_7 = max(u_xlat16_7, u_xlat16_2.z);
    u_xlat16_2.x = u_xlat16_7 / u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    SV_Target0.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _bloomParams;
uniform 	float _bloomClamp;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_7;
mediump float u_xlat16_17;
mediump float u_xlat16_18;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-2.0, -1.0, 0.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_3.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_17 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_17 = u_xlat16_17 + 1.0;
    u_xlat16_17 = float(1.0) / u_xlat16_17;
    u_xlat16_3.xyz = vec3(u_xlat16_17) * u_xlat16_3.xyz;
    u_xlat16_18 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_18) + u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(2.0, -1.0, -2.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_3.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_4.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_18 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_18 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 2.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_3.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_4.xyz = max(u_xlat10_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1024.0, 1024.0, 1024.0));
    u_xlat16_18 = dot(u_xlat16_4.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_18 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_2.xyz / vec3(u_xlat16_17);
    u_xlat0.xyz = min(u_xlat16_2.xyz, vec3(_bloomClamp));
    u_xlat16_2.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_2.x = max(u_xlat0.z, u_xlat16_2.x);
    u_xlat16_2.yz = u_xlat16_2.xx + (-_bloomParams.yx);
    u_xlat16_2.xy = max(u_xlat16_2.xy, vec2(9.99999975e-05, 0.0));
    u_xlat16_7 = min(u_xlat16_2.y, _bloomParams.z);
    u_xlat16_7 = u_xlat16_7 * u_xlat16_7;
    u_xlat16_7 = u_xlat16_7 * _bloomParams.w;
    u_xlat16_7 = max(u_xlat16_7, u_xlat16_2.z);
    u_xlat16_2.x = u_xlat16_7 / u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    SV_Target0.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
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