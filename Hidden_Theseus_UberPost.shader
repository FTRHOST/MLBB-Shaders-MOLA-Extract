//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/UberPost" {
Properties {

}
SubShader {
 LOD 100
 Pass {
 Name "UberPostHDR"
  LOD 100
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 19507
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
uniform 	vec4 _Lut2D_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutHdrTonemap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat10_1;
vec2 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat10_3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat0.xyz = u_xlat16_0.zxy * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat1.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat1.yz = u_xlat3.yz * _Lut2D_Params.xy + u_xlat1.xy;
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat1.x = u_xlat3.x * _Lut2D_Params.y + u_xlat1.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat3.x);
    u_xlat2.x = _Lut2D_Params.y;
    u_xlat2.y = 0.0;
    u_xlat3.xy = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.xyz = textureLod(_LutHdrTonemap, u_xlat1.xz, 0.0).xyz;
    u_xlat10_3.xyz = textureLod(_LutHdrTonemap, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat10_1.xyz) + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat10_1.xyz;
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
uniform 	vec4 _Lut2D_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutHdrTonemap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat10_1;
vec2 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat10_3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat0.xyz = u_xlat16_0.zxy * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat1.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat1.yz = u_xlat3.yz * _Lut2D_Params.xy + u_xlat1.xy;
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat1.x = u_xlat3.x * _Lut2D_Params.y + u_xlat1.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat3.x);
    u_xlat2.x = _Lut2D_Params.y;
    u_xlat2.y = 0.0;
    u_xlat3.xy = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.xyz = textureLod(_LutHdrTonemap, u_xlat1.xz, 0.0).xyz;
    u_xlat10_3.xyz = textureLod(_LutHdrTonemap, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat10_1.xyz) + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat10_1.xyz;
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
uniform 	vec4 _Lut2D_Params;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutHdrTonemap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat0.xyz = u_xlat10_0.zxy * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat3.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat1.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat1.yz = u_xlat3.yz * _Lut2D_Params.xy + u_xlat1.xy;
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat1.x = u_xlat3.x * _Lut2D_Params.y + u_xlat1.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat3.x);
    u_xlat2.x = _Lut2D_Params.y;
    u_xlat2.y = 0.0;
    u_xlat3.xy = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.xyz = texture2D(_LutHdrTonemap, u_xlat1.xz, 0.0).xyz;
    u_xlat10_3.xyz = texture2D(_LutHdrTonemap, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat10_1.xyz) + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat10_1.xyz;
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
uniform 	vec4 _Lut2D_Params;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutHdrTonemap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat0.xyz = u_xlat10_0.zxy * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat3.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat1.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat1.yz = u_xlat3.yz * _Lut2D_Params.xy + u_xlat1.xy;
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat1.x = u_xlat3.x * _Lut2D_Params.y + u_xlat1.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat3.x);
    u_xlat2.x = _Lut2D_Params.y;
    u_xlat2.y = 0.0;
    u_xlat3.xy = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.xyz = texture2D(_LutHdrTonemap, u_xlat1.xz, 0.0).xyz;
    u_xlat10_3.xyz = texture2D(_LutHdrTonemap, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat10_1.xyz) + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BLACK_WHITE_FLASH" }
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
uniform 	mediump vec4 _BlackWhiteFlash_Params;
uniform 	mediump vec4 _BlackWhiteFlash_Color1;
uniform 	mediump vec4 _BlackWhiteFlash_Color2;
uniform 	vec4 _Lut2D_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutHdrTonemap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat10_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
float u_xlat5;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat0.xyz = u_xlat16_0.zxy * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat1.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat1.yz = u_xlat4.yz * _Lut2D_Params.xy + u_xlat1.xy;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat1.x = u_xlat4.x * _Lut2D_Params.y + u_xlat1.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat4.x);
    u_xlat2.x = _Lut2D_Params.y;
    u_xlat2.y = 0.0;
    u_xlat4.xy = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.xyz = textureLod(_LutHdrTonemap, u_xlat1.xz, 0.0).xyz;
    u_xlat10_4.xyz = textureLod(_LutHdrTonemap, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat10_1.xyz) + u_xlat10_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat12 = u_xlat12 + (-_BlackWhiteFlash_Params.x);
    u_xlat1.x = float(1.0) / (-_BlackWhiteFlash_Params.y);
    u_xlat12 = u_xlat12 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat5 = (-u_xlat1.x) * u_xlat12 + 1.0;
    u_xlat5 = (-u_xlat1.x) * u_xlat12 + u_xlat5;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat12 = _BlackWhiteFlash_Params.w * u_xlat5 + u_xlat12;
    u_xlat1.xyz = (-_BlackWhiteFlash_Color1.xyz) + _BlackWhiteFlash_Color2.xyz;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz + _BlackWhiteFlash_Color1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    SV_Target0.xyz = _BlackWhiteFlash_Params.zzz * u_xlat16_3.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BLACK_WHITE_FLASH" }
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
uniform 	mediump vec4 _BlackWhiteFlash_Params;
uniform 	mediump vec4 _BlackWhiteFlash_Color1;
uniform 	mediump vec4 _BlackWhiteFlash_Color2;
uniform 	vec4 _Lut2D_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutHdrTonemap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat10_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
float u_xlat5;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat0.xyz = u_xlat16_0.zxy * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat1.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat1.yz = u_xlat4.yz * _Lut2D_Params.xy + u_xlat1.xy;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat1.x = u_xlat4.x * _Lut2D_Params.y + u_xlat1.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat4.x);
    u_xlat2.x = _Lut2D_Params.y;
    u_xlat2.y = 0.0;
    u_xlat4.xy = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.xyz = textureLod(_LutHdrTonemap, u_xlat1.xz, 0.0).xyz;
    u_xlat10_4.xyz = textureLod(_LutHdrTonemap, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat10_1.xyz) + u_xlat10_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat12 = u_xlat12 + (-_BlackWhiteFlash_Params.x);
    u_xlat1.x = float(1.0) / (-_BlackWhiteFlash_Params.y);
    u_xlat12 = u_xlat12 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat5 = (-u_xlat1.x) * u_xlat12 + 1.0;
    u_xlat5 = (-u_xlat1.x) * u_xlat12 + u_xlat5;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat12 = _BlackWhiteFlash_Params.w * u_xlat5 + u_xlat12;
    u_xlat1.xyz = (-_BlackWhiteFlash_Color1.xyz) + _BlackWhiteFlash_Color2.xyz;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz + _BlackWhiteFlash_Color1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    SV_Target0.xyz = _BlackWhiteFlash_Params.zzz * u_xlat16_3.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BLACK_WHITE_FLASH" }
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
uniform 	mediump vec4 _BlackWhiteFlash_Params;
uniform 	mediump vec4 _BlackWhiteFlash_Color1;
uniform 	mediump vec4 _BlackWhiteFlash_Color2;
uniform 	vec4 _Lut2D_Params;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutHdrTonemap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
float u_xlat5;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat0.xyz = u_xlat10_0.zxy * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat1.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat1.yz = u_xlat4.yz * _Lut2D_Params.xy + u_xlat1.xy;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat1.x = u_xlat4.x * _Lut2D_Params.y + u_xlat1.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat4.x);
    u_xlat2.x = _Lut2D_Params.y;
    u_xlat2.y = 0.0;
    u_xlat4.xy = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.xyz = texture2D(_LutHdrTonemap, u_xlat1.xz, 0.0).xyz;
    u_xlat10_4.xyz = texture2D(_LutHdrTonemap, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat10_1.xyz) + u_xlat10_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat12 = u_xlat12 + (-_BlackWhiteFlash_Params.x);
    u_xlat1.x = float(1.0) / (-_BlackWhiteFlash_Params.y);
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat1.x = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat5 = (-u_xlat1.x) * u_xlat12 + 1.0;
    u_xlat5 = (-u_xlat1.x) * u_xlat12 + u_xlat5;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat12 = _BlackWhiteFlash_Params.w * u_xlat5 + u_xlat12;
    u_xlat1.xyz = (-_BlackWhiteFlash_Color1.xyz) + _BlackWhiteFlash_Color2.xyz;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz + _BlackWhiteFlash_Color1.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    SV_Target0.xyz = _BlackWhiteFlash_Params.zzz * u_xlat16_3.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BLACK_WHITE_FLASH" }
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
uniform 	mediump vec4 _BlackWhiteFlash_Params;
uniform 	mediump vec4 _BlackWhiteFlash_Color1;
uniform 	mediump vec4 _BlackWhiteFlash_Color2;
uniform 	vec4 _Lut2D_Params;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutHdrTonemap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
float u_xlat5;
float u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat0.xyz = u_xlat10_0.zxy * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat1.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat1.yz = u_xlat4.yz * _Lut2D_Params.xy + u_xlat1.xy;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat1.x = u_xlat4.x * _Lut2D_Params.y + u_xlat1.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat4.x);
    u_xlat2.x = _Lut2D_Params.y;
    u_xlat2.y = 0.0;
    u_xlat4.xy = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.xyz = texture2D(_LutHdrTonemap, u_xlat1.xz, 0.0).xyz;
    u_xlat10_4.xyz = texture2D(_LutHdrTonemap, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat10_1.xyz) + u_xlat10_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat12 = u_xlat12 + (-_BlackWhiteFlash_Params.x);
    u_xlat1.x = float(1.0) / (-_BlackWhiteFlash_Params.y);
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat1.x = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat5 = (-u_xlat1.x) * u_xlat12 + 1.0;
    u_xlat5 = (-u_xlat1.x) * u_xlat12 + u_xlat5;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat12 = _BlackWhiteFlash_Params.w * u_xlat5 + u_xlat12;
    u_xlat1.xyz = (-_BlackWhiteFlash_Color1.xyz) + _BlackWhiteFlash_Color2.xyz;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz + _BlackWhiteFlash_Color1.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = (-u_xlat0.xyz) + u_xlat1.xyz;
    SV_Target0.xyz = _BlackWhiteFlash_Params.zzz * u_xlat16_3.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_VIGNETTE" }
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
uniform 	mediump vec4 _Vignette_Params1;
uniform 	vec4 _Vignette_Params2;
uniform 	vec4 _Lut2D_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutHdrTonemap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat10_1;
vec2 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat10_3;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat0.xyz = u_xlat16_0.zxy * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat1.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat1.yz = u_xlat3.yz * _Lut2D_Params.xy + u_xlat1.xy;
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat1.x = u_xlat3.x * _Lut2D_Params.y + u_xlat1.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat3.x);
    u_xlat2.x = _Lut2D_Params.y;
    u_xlat2.y = 0.0;
    u_xlat3.xy = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.xyz = textureLod(_LutHdrTonemap, u_xlat1.xz, 0.0).xyz;
    u_xlat10_3.xyz = textureLod(_LutHdrTonemap, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat10_1.xyz) + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat10_1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_Vignette_Params2.xy);
    u_xlat1.yz = abs(u_xlat1.xy) * _Vignette_Params2.zz;
    u_xlat1.x = u_xlat1.y * _Vignette_Params1.w;
    u_xlat9 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = max(u_xlat9, 0.0);
    u_xlat9 = log2(u_xlat9);
    u_xlat9 = u_xlat9 * _Vignette_Params2.w;
    u_xlat9 = exp2(u_xlat9);
    u_xlat1.xyz = (-_Vignette_Params1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz + _Vignette_Params1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_VIGNETTE" }
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
uniform 	mediump vec4 _Vignette_Params1;
uniform 	vec4 _Vignette_Params2;
uniform 	vec4 _Lut2D_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutHdrTonemap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat10_1;
vec2 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat10_3;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat0.xyz = u_xlat16_0.zxy * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat1.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat1.yz = u_xlat3.yz * _Lut2D_Params.xy + u_xlat1.xy;
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat1.x = u_xlat3.x * _Lut2D_Params.y + u_xlat1.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat3.x);
    u_xlat2.x = _Lut2D_Params.y;
    u_xlat2.y = 0.0;
    u_xlat3.xy = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.xyz = textureLod(_LutHdrTonemap, u_xlat1.xz, 0.0).xyz;
    u_xlat10_3.xyz = textureLod(_LutHdrTonemap, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat10_1.xyz) + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat10_1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_Vignette_Params2.xy);
    u_xlat1.yz = abs(u_xlat1.xy) * _Vignette_Params2.zz;
    u_xlat1.x = u_xlat1.y * _Vignette_Params1.w;
    u_xlat9 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = max(u_xlat9, 0.0);
    u_xlat9 = log2(u_xlat9);
    u_xlat9 = u_xlat9 * _Vignette_Params2.w;
    u_xlat9 = exp2(u_xlat9);
    u_xlat1.xyz = (-_Vignette_Params1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz + _Vignette_Params1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_VIGNETTE" }
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
uniform 	mediump vec4 _Vignette_Params1;
uniform 	vec4 _Vignette_Params2;
uniform 	vec4 _Lut2D_Params;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutHdrTonemap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat0.xyz = u_xlat10_0.zxy * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat3.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat1.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat1.yz = u_xlat3.yz * _Lut2D_Params.xy + u_xlat1.xy;
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat1.x = u_xlat3.x * _Lut2D_Params.y + u_xlat1.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat3.x);
    u_xlat2.x = _Lut2D_Params.y;
    u_xlat2.y = 0.0;
    u_xlat3.xy = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.xyz = texture2D(_LutHdrTonemap, u_xlat1.xz, 0.0).xyz;
    u_xlat10_3.xyz = texture2D(_LutHdrTonemap, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat10_1.xyz) + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat10_1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_Vignette_Params2.xy);
    u_xlat1.yz = abs(u_xlat1.xy) * _Vignette_Params2.zz;
    u_xlat1.x = u_xlat1.y * _Vignette_Params1.w;
    u_xlat9 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = max(u_xlat9, 0.0);
    u_xlat9 = log2(u_xlat9);
    u_xlat9 = u_xlat9 * _Vignette_Params2.w;
    u_xlat9 = exp2(u_xlat9);
    u_xlat1.xyz = (-_Vignette_Params1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz + _Vignette_Params1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_VIGNETTE" }
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
uniform 	mediump vec4 _Vignette_Params1;
uniform 	vec4 _Vignette_Params2;
uniform 	vec4 _Lut2D_Params;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutHdrTonemap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
float u_xlat9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat0.xyz = u_xlat10_0.zxy * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat3.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat1.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat1.yz = u_xlat3.yz * _Lut2D_Params.xy + u_xlat1.xy;
    u_xlat3.x = floor(u_xlat3.x);
    u_xlat1.x = u_xlat3.x * _Lut2D_Params.y + u_xlat1.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat3.x);
    u_xlat2.x = _Lut2D_Params.y;
    u_xlat2.y = 0.0;
    u_xlat3.xy = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.xyz = texture2D(_LutHdrTonemap, u_xlat1.xz, 0.0).xyz;
    u_xlat10_3.xyz = texture2D(_LutHdrTonemap, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat10_1.xyz) + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat10_1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_Vignette_Params2.xy);
    u_xlat1.yz = abs(u_xlat1.xy) * _Vignette_Params2.zz;
    u_xlat1.x = u_xlat1.y * _Vignette_Params1.w;
    u_xlat9 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = max(u_xlat9, 0.0);
    u_xlat9 = log2(u_xlat9);
    u_xlat9 = u_xlat9 * _Vignette_Params2.w;
    u_xlat9 = exp2(u_xlat9);
    u_xlat1.xyz = (-_Vignette_Params1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz + _Vignette_Params1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_VIGNETTE" }
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
uniform 	mediump vec4 _Vignette_Params1;
uniform 	vec4 _Vignette_Params2;
uniform 	mediump vec4 _BlackWhiteFlash_Params;
uniform 	mediump vec4 _BlackWhiteFlash_Color1;
uniform 	mediump vec4 _BlackWhiteFlash_Color2;
uniform 	vec4 _Lut2D_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutHdrTonemap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat10_5;
float u_xlat15;
float u_xlat16;
float u_xlat17;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat0.xyz = u_xlat16_0.zxy * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat1.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat1.yz = u_xlat5.yz * _Lut2D_Params.xy + u_xlat1.xy;
    u_xlat5.x = floor(u_xlat5.x);
    u_xlat1.x = u_xlat5.x * _Lut2D_Params.y + u_xlat1.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat5.x);
    u_xlat2.x = _Lut2D_Params.y;
    u_xlat2.y = 0.0;
    u_xlat5.xy = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.xyz = textureLod(_LutHdrTonemap, u_xlat1.xz, 0.0).xyz;
    u_xlat10_5.xyz = textureLod(_LutHdrTonemap, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat10_1.xyz) + u_xlat10_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat10_1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_Vignette_Params2.xy);
    u_xlat1.yz = abs(u_xlat1.xy) * _Vignette_Params2.zz;
    u_xlat1.x = u_xlat1.y * _Vignette_Params1.w;
    u_xlat15 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _Vignette_Params2.w;
    u_xlat15 = exp2(u_xlat15);
    u_xlat1.xyz = (-_Vignette_Params1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz + _Vignette_Params1.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat15 = dot(u_xlat2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat15 = u_xlat15 + (-_BlackWhiteFlash_Params.x);
    u_xlat16 = float(1.0) / (-_BlackWhiteFlash_Params.y);
    u_xlat15 = u_xlat15 * u_xlat16;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16 = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat17 = (-u_xlat16) * u_xlat15 + 1.0;
    u_xlat17 = (-u_xlat16) * u_xlat15 + u_xlat17;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat15 = _BlackWhiteFlash_Params.w * u_xlat17 + u_xlat15;
    u_xlat3.xyz = (-_BlackWhiteFlash_Color1.xyz) + _BlackWhiteFlash_Color2.xyz;
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz + _BlackWhiteFlash_Color1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = (-u_xlat0.xyz) * u_xlat1.xyz + u_xlat3.xyz;
    SV_Target0.xyz = _BlackWhiteFlash_Params.zzz * u_xlat16_4.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_VIGNETTE" }
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
uniform 	mediump vec4 _Vignette_Params1;
uniform 	vec4 _Vignette_Params2;
uniform 	mediump vec4 _BlackWhiteFlash_Params;
uniform 	mediump vec4 _BlackWhiteFlash_Color1;
uniform 	mediump vec4 _BlackWhiteFlash_Color2;
uniform 	vec4 _Lut2D_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutHdrTonemap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat10_5;
float u_xlat15;
float u_xlat16;
float u_xlat17;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat0.xyz = u_xlat16_0.zxy * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat1.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat1.yz = u_xlat5.yz * _Lut2D_Params.xy + u_xlat1.xy;
    u_xlat5.x = floor(u_xlat5.x);
    u_xlat1.x = u_xlat5.x * _Lut2D_Params.y + u_xlat1.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat5.x);
    u_xlat2.x = _Lut2D_Params.y;
    u_xlat2.y = 0.0;
    u_xlat5.xy = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.xyz = textureLod(_LutHdrTonemap, u_xlat1.xz, 0.0).xyz;
    u_xlat10_5.xyz = textureLod(_LutHdrTonemap, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat10_1.xyz) + u_xlat10_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat10_1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_Vignette_Params2.xy);
    u_xlat1.yz = abs(u_xlat1.xy) * _Vignette_Params2.zz;
    u_xlat1.x = u_xlat1.y * _Vignette_Params1.w;
    u_xlat15 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _Vignette_Params2.w;
    u_xlat15 = exp2(u_xlat15);
    u_xlat1.xyz = (-_Vignette_Params1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz + _Vignette_Params1.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat15 = dot(u_xlat2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat15 = u_xlat15 + (-_BlackWhiteFlash_Params.x);
    u_xlat16 = float(1.0) / (-_BlackWhiteFlash_Params.y);
    u_xlat15 = u_xlat15 * u_xlat16;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16 = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat17 = (-u_xlat16) * u_xlat15 + 1.0;
    u_xlat17 = (-u_xlat16) * u_xlat15 + u_xlat17;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat15 = _BlackWhiteFlash_Params.w * u_xlat17 + u_xlat15;
    u_xlat3.xyz = (-_BlackWhiteFlash_Color1.xyz) + _BlackWhiteFlash_Color2.xyz;
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz + _BlackWhiteFlash_Color1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = (-u_xlat0.xyz) * u_xlat1.xyz + u_xlat3.xyz;
    SV_Target0.xyz = _BlackWhiteFlash_Params.zzz * u_xlat16_4.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_VIGNETTE" }
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
uniform 	mediump vec4 _Vignette_Params1;
uniform 	vec4 _Vignette_Params2;
uniform 	mediump vec4 _BlackWhiteFlash_Params;
uniform 	mediump vec4 _BlackWhiteFlash_Color1;
uniform 	mediump vec4 _BlackWhiteFlash_Color2;
uniform 	vec4 _Lut2D_Params;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutHdrTonemap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
float u_xlat15;
float u_xlat16;
float u_xlat17;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat0.xyz = u_xlat10_0.zxy * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat5.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat1.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat1.yz = u_xlat5.yz * _Lut2D_Params.xy + u_xlat1.xy;
    u_xlat5.x = floor(u_xlat5.x);
    u_xlat1.x = u_xlat5.x * _Lut2D_Params.y + u_xlat1.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat5.x);
    u_xlat2.x = _Lut2D_Params.y;
    u_xlat2.y = 0.0;
    u_xlat5.xy = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.xyz = texture2D(_LutHdrTonemap, u_xlat1.xz, 0.0).xyz;
    u_xlat10_5.xyz = texture2D(_LutHdrTonemap, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat10_1.xyz) + u_xlat10_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat10_1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_Vignette_Params2.xy);
    u_xlat1.yz = abs(u_xlat1.xy) * _Vignette_Params2.zz;
    u_xlat1.x = u_xlat1.y * _Vignette_Params1.w;
    u_xlat15 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _Vignette_Params2.w;
    u_xlat15 = exp2(u_xlat15);
    u_xlat1.xyz = (-_Vignette_Params1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz + _Vignette_Params1.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat15 = dot(u_xlat2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat15 = u_xlat15 + (-_BlackWhiteFlash_Params.x);
    u_xlat16 = float(1.0) / (-_BlackWhiteFlash_Params.y);
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat16 = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat17 = (-u_xlat16) * u_xlat15 + 1.0;
    u_xlat17 = (-u_xlat16) * u_xlat15 + u_xlat17;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat15 = _BlackWhiteFlash_Params.w * u_xlat17 + u_xlat15;
    u_xlat3.xyz = (-_BlackWhiteFlash_Color1.xyz) + _BlackWhiteFlash_Color2.xyz;
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz + _BlackWhiteFlash_Color1.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = (-u_xlat0.xyz) * u_xlat1.xyz + u_xlat3.xyz;
    SV_Target0.xyz = _BlackWhiteFlash_Params.zzz * u_xlat16_4.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_VIGNETTE" }
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
uniform 	mediump vec4 _Vignette_Params1;
uniform 	vec4 _Vignette_Params2;
uniform 	mediump vec4 _BlackWhiteFlash_Params;
uniform 	mediump vec4 _BlackWhiteFlash_Color1;
uniform 	mediump vec4 _BlackWhiteFlash_Color2;
uniform 	vec4 _Lut2D_Params;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutHdrTonemap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
float u_xlat15;
float u_xlat16;
float u_xlat17;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat0.xyz = u_xlat10_0.zxy * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat5.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat1.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat1.yz = u_xlat5.yz * _Lut2D_Params.xy + u_xlat1.xy;
    u_xlat5.x = floor(u_xlat5.x);
    u_xlat1.x = u_xlat5.x * _Lut2D_Params.y + u_xlat1.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat5.x);
    u_xlat2.x = _Lut2D_Params.y;
    u_xlat2.y = 0.0;
    u_xlat5.xy = u_xlat1.xz + u_xlat2.xy;
    u_xlat10_1.xyz = texture2D(_LutHdrTonemap, u_xlat1.xz, 0.0).xyz;
    u_xlat10_5.xyz = texture2D(_LutHdrTonemap, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat10_1.xyz) + u_xlat10_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat10_1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_Vignette_Params2.xy);
    u_xlat1.yz = abs(u_xlat1.xy) * _Vignette_Params2.zz;
    u_xlat1.x = u_xlat1.y * _Vignette_Params1.w;
    u_xlat15 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _Vignette_Params2.w;
    u_xlat15 = exp2(u_xlat15);
    u_xlat1.xyz = (-_Vignette_Params1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz + _Vignette_Params1.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat15 = dot(u_xlat2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat15 = u_xlat15 + (-_BlackWhiteFlash_Params.x);
    u_xlat16 = float(1.0) / (-_BlackWhiteFlash_Params.y);
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat16 = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat17 = (-u_xlat16) * u_xlat15 + 1.0;
    u_xlat17 = (-u_xlat16) * u_xlat15 + u_xlat17;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat15 = _BlackWhiteFlash_Params.w * u_xlat17 + u_xlat15;
    u_xlat3.xyz = (-_BlackWhiteFlash_Color1.xyz) + _BlackWhiteFlash_Color2.xyz;
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz + _BlackWhiteFlash_Color1.xyz;
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = (-u_xlat0.xyz) * u_xlat1.xyz + u_xlat3.xyz;
    SV_Target0.xyz = _BlackWhiteFlash_Params.zzz * u_xlat16_4.xyz + u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BLOOM" }
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
uniform 	mediump vec4 _bloomParams;
uniform 	mediump float _BloomSaturation;
uniform 	vec4 _Lut2D_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _bloomTex;
UNITY_LOCATION(2) uniform mediump sampler2D _LutHdrTonemap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat16_0.xyz = textureLod(_bloomTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_1.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat16_0.zxy + (-u_xlat16_1.xxx);
    u_xlat16_1.xyz = vec3(_BloomSaturation) * u_xlat16_5.xyz + u_xlat16_1.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.xxx;
    u_xlat0.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.wyz + u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_1.xyz * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat2.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat2.yz = u_xlat4.yz * _Lut2D_Params.xy + u_xlat2.xy;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat2.x = u_xlat4.x * _Lut2D_Params.y + u_xlat2.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat4.x);
    u_xlat3.x = _Lut2D_Params.y;
    u_xlat3.y = 0.0;
    u_xlat4.xy = u_xlat2.xz + u_xlat3.xy;
    u_xlat10_2.xyz = textureLod(_LutHdrTonemap, u_xlat2.xz, 0.0).xyz;
    u_xlat10_4.xyz = textureLod(_LutHdrTonemap, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat10_2.xyz) + u_xlat10_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BLOOM" }
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
uniform 	mediump vec4 _bloomParams;
uniform 	mediump float _BloomSaturation;
uniform 	vec4 _Lut2D_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _bloomTex;
UNITY_LOCATION(2) uniform mediump sampler2D _LutHdrTonemap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat16_0.xyz = textureLod(_bloomTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_1.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat16_0.zxy + (-u_xlat16_1.xxx);
    u_xlat16_1.xyz = vec3(_BloomSaturation) * u_xlat16_5.xyz + u_xlat16_1.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.xxx;
    u_xlat0.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.wyz + u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_1.xyz * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat2.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat2.yz = u_xlat4.yz * _Lut2D_Params.xy + u_xlat2.xy;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat2.x = u_xlat4.x * _Lut2D_Params.y + u_xlat2.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat4.x);
    u_xlat3.x = _Lut2D_Params.y;
    u_xlat3.y = 0.0;
    u_xlat4.xy = u_xlat2.xz + u_xlat3.xy;
    u_xlat10_2.xyz = textureLod(_LutHdrTonemap, u_xlat2.xz, 0.0).xyz;
    u_xlat10_4.xyz = textureLod(_LutHdrTonemap, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat10_2.xyz) + u_xlat10_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BLOOM" }
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
uniform 	mediump vec4 _bloomParams;
uniform 	mediump float _BloomSaturation;
uniform 	vec4 _Lut2D_Params;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _bloomTex;
uniform lowp sampler2D _LutHdrTonemap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0.xyz = texture2D(_bloomTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_1.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat10_0.zxy + (-u_xlat16_1.xxx);
    u_xlat16_1.xyz = vec3(_BloomSaturation) * u_xlat16_5.xyz + u_xlat16_1.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.xxx;
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.wyz + u_xlat10_0.zxy;
    u_xlat0.xyz = u_xlat16_1.xyz * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat2.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat2.yz = u_xlat4.yz * _Lut2D_Params.xy + u_xlat2.xy;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat2.x = u_xlat4.x * _Lut2D_Params.y + u_xlat2.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat4.x);
    u_xlat3.x = _Lut2D_Params.y;
    u_xlat3.y = 0.0;
    u_xlat4.xy = u_xlat2.xz + u_xlat3.xy;
    u_xlat10_2.xyz = texture2D(_LutHdrTonemap, u_xlat2.xz, 0.0).xyz;
    u_xlat10_4.xyz = texture2D(_LutHdrTonemap, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat10_2.xyz) + u_xlat10_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BLOOM" }
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
uniform 	mediump vec4 _bloomParams;
uniform 	mediump float _BloomSaturation;
uniform 	vec4 _Lut2D_Params;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _bloomTex;
uniform lowp sampler2D _LutHdrTonemap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat10_0.xyz = texture2D(_bloomTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_1.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat10_0.zxy + (-u_xlat16_1.xxx);
    u_xlat16_1.xyz = vec3(_BloomSaturation) * u_xlat16_5.xyz + u_xlat16_1.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.xxx;
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.wyz + u_xlat10_0.zxy;
    u_xlat0.xyz = u_xlat16_1.xyz * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat2.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat2.yz = u_xlat4.yz * _Lut2D_Params.xy + u_xlat2.xy;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat2.x = u_xlat4.x * _Lut2D_Params.y + u_xlat2.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat4.x);
    u_xlat3.x = _Lut2D_Params.y;
    u_xlat3.y = 0.0;
    u_xlat4.xy = u_xlat2.xz + u_xlat3.xy;
    u_xlat10_2.xyz = texture2D(_LutHdrTonemap, u_xlat2.xz, 0.0).xyz;
    u_xlat10_4.xyz = texture2D(_LutHdrTonemap, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat10_2.xyz) + u_xlat10_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_BLOOM" }
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
uniform 	mediump vec4 _bloomParams;
uniform 	mediump float _BloomSaturation;
uniform 	mediump vec4 _BlackWhiteFlash_Params;
uniform 	mediump vec4 _BlackWhiteFlash_Color1;
uniform 	mediump vec4 _BlackWhiteFlash_Color2;
uniform 	vec4 _Lut2D_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _bloomTex;
UNITY_LOCATION(2) uniform mediump sampler2D _LutHdrTonemap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
float u_xlat12;
void main()
{
    u_xlat16_0.xyz = textureLod(_bloomTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_1.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat16_0.zxy + (-u_xlat16_1.xxx);
    u_xlat16_1.xyz = vec3(_BloomSaturation) * u_xlat16_5.xyz + u_xlat16_1.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.xxx;
    u_xlat0.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.wyz + u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_1.xyz * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat2.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat2.yz = u_xlat4.yz * _Lut2D_Params.xy + u_xlat2.xy;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat2.x = u_xlat4.x * _Lut2D_Params.y + u_xlat2.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat4.x);
    u_xlat3.x = _Lut2D_Params.y;
    u_xlat3.y = 0.0;
    u_xlat4.xy = u_xlat2.xz + u_xlat3.xy;
    u_xlat10_2.xyz = textureLod(_LutHdrTonemap, u_xlat2.xz, 0.0).xyz;
    u_xlat10_4.xyz = textureLod(_LutHdrTonemap, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat10_2.xyz) + u_xlat10_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_2.xyz;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat12 = u_xlat12 + (-_BlackWhiteFlash_Params.x);
    u_xlat2.x = float(1.0) / (-_BlackWhiteFlash_Params.y);
    u_xlat12 = u_xlat12 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat6 = (-u_xlat2.x) * u_xlat12 + 1.0;
    u_xlat6 = (-u_xlat2.x) * u_xlat12 + u_xlat6;
    u_xlat12 = u_xlat12 * u_xlat2.x;
    u_xlat12 = _BlackWhiteFlash_Params.w * u_xlat6 + u_xlat12;
    u_xlat2.xyz = (-_BlackWhiteFlash_Color1.xyz) + _BlackWhiteFlash_Color2.xyz;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz + _BlackWhiteFlash_Color1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    SV_Target0.xyz = _BlackWhiteFlash_Params.zzz * u_xlat16_1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_BLOOM" }
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
uniform 	mediump vec4 _bloomParams;
uniform 	mediump float _BloomSaturation;
uniform 	mediump vec4 _BlackWhiteFlash_Params;
uniform 	mediump vec4 _BlackWhiteFlash_Color1;
uniform 	mediump vec4 _BlackWhiteFlash_Color2;
uniform 	vec4 _Lut2D_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _bloomTex;
UNITY_LOCATION(2) uniform mediump sampler2D _LutHdrTonemap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
float u_xlat6;
float u_xlat12;
void main()
{
    u_xlat16_0.xyz = textureLod(_bloomTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_1.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat16_0.zxy + (-u_xlat16_1.xxx);
    u_xlat16_1.xyz = vec3(_BloomSaturation) * u_xlat16_5.xyz + u_xlat16_1.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.xxx;
    u_xlat0.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.wyz + u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_1.xyz * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat2.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat2.yz = u_xlat4.yz * _Lut2D_Params.xy + u_xlat2.xy;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat2.x = u_xlat4.x * _Lut2D_Params.y + u_xlat2.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat4.x);
    u_xlat3.x = _Lut2D_Params.y;
    u_xlat3.y = 0.0;
    u_xlat4.xy = u_xlat2.xz + u_xlat3.xy;
    u_xlat10_2.xyz = textureLod(_LutHdrTonemap, u_xlat2.xz, 0.0).xyz;
    u_xlat10_4.xyz = textureLod(_LutHdrTonemap, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat10_2.xyz) + u_xlat10_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_2.xyz;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat12 = u_xlat12 + (-_BlackWhiteFlash_Params.x);
    u_xlat2.x = float(1.0) / (-_BlackWhiteFlash_Params.y);
    u_xlat12 = u_xlat12 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat6 = (-u_xlat2.x) * u_xlat12 + 1.0;
    u_xlat6 = (-u_xlat2.x) * u_xlat12 + u_xlat6;
    u_xlat12 = u_xlat12 * u_xlat2.x;
    u_xlat12 = _BlackWhiteFlash_Params.w * u_xlat6 + u_xlat12;
    u_xlat2.xyz = (-_BlackWhiteFlash_Color1.xyz) + _BlackWhiteFlash_Color2.xyz;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz + _BlackWhiteFlash_Color1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    SV_Target0.xyz = _BlackWhiteFlash_Params.zzz * u_xlat16_1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_BLOOM" }
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
uniform 	mediump vec4 _bloomParams;
uniform 	mediump float _BloomSaturation;
uniform 	mediump vec4 _BlackWhiteFlash_Params;
uniform 	mediump vec4 _BlackWhiteFlash_Color1;
uniform 	mediump vec4 _BlackWhiteFlash_Color2;
uniform 	vec4 _Lut2D_Params;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _bloomTex;
uniform lowp sampler2D _LutHdrTonemap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
float u_xlat12;
void main()
{
    u_xlat10_0.xyz = texture2D(_bloomTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_1.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat10_0.zxy + (-u_xlat16_1.xxx);
    u_xlat16_1.xyz = vec3(_BloomSaturation) * u_xlat16_5.xyz + u_xlat16_1.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.xxx;
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.wyz + u_xlat10_0.zxy;
    u_xlat0.xyz = u_xlat16_1.xyz * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat2.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat2.yz = u_xlat4.yz * _Lut2D_Params.xy + u_xlat2.xy;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat2.x = u_xlat4.x * _Lut2D_Params.y + u_xlat2.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat4.x);
    u_xlat3.x = _Lut2D_Params.y;
    u_xlat3.y = 0.0;
    u_xlat4.xy = u_xlat2.xz + u_xlat3.xy;
    u_xlat10_2.xyz = texture2D(_LutHdrTonemap, u_xlat2.xz, 0.0).xyz;
    u_xlat10_4.xyz = texture2D(_LutHdrTonemap, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat10_2.xyz) + u_xlat10_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_2.xyz;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat12 = u_xlat12 + (-_BlackWhiteFlash_Params.x);
    u_xlat2.x = float(1.0) / (-_BlackWhiteFlash_Params.y);
    u_xlat12 = u_xlat12 * u_xlat2.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat2.x = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * u_xlat2.x;
    u_xlat2.x = u_xlat12 * -2.0 + 1.0;
    u_xlat12 = _BlackWhiteFlash_Params.w * u_xlat2.x + u_xlat12;
    u_xlat2.xyz = (-_BlackWhiteFlash_Color1.xyz) + _BlackWhiteFlash_Color2.xyz;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz + _BlackWhiteFlash_Color1.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    SV_Target0.xyz = _BlackWhiteFlash_Params.zzz * u_xlat16_1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_BLOOM" }
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
uniform 	mediump vec4 _bloomParams;
uniform 	mediump float _BloomSaturation;
uniform 	mediump vec4 _BlackWhiteFlash_Params;
uniform 	mediump vec4 _BlackWhiteFlash_Color1;
uniform 	mediump vec4 _BlackWhiteFlash_Color2;
uniform 	vec4 _Lut2D_Params;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _bloomTex;
uniform lowp sampler2D _LutHdrTonemap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
float u_xlat12;
void main()
{
    u_xlat10_0.xyz = texture2D(_bloomTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_1.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat10_0.zxy + (-u_xlat16_1.xxx);
    u_xlat16_1.xyz = vec3(_BloomSaturation) * u_xlat16_5.xyz + u_xlat16_1.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.xxx;
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.wyz + u_xlat10_0.zxy;
    u_xlat0.xyz = u_xlat16_1.xyz * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat2.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat2.yz = u_xlat4.yz * _Lut2D_Params.xy + u_xlat2.xy;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat2.x = u_xlat4.x * _Lut2D_Params.y + u_xlat2.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat4.x);
    u_xlat3.x = _Lut2D_Params.y;
    u_xlat3.y = 0.0;
    u_xlat4.xy = u_xlat2.xz + u_xlat3.xy;
    u_xlat10_2.xyz = texture2D(_LutHdrTonemap, u_xlat2.xz, 0.0).xyz;
    u_xlat10_4.xyz = texture2D(_LutHdrTonemap, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat10_2.xyz) + u_xlat10_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_2.xyz;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat12 = u_xlat12 + (-_BlackWhiteFlash_Params.x);
    u_xlat2.x = float(1.0) / (-_BlackWhiteFlash_Params.y);
    u_xlat12 = u_xlat12 * u_xlat2.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat2.x = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * u_xlat2.x;
    u_xlat2.x = u_xlat12 * -2.0 + 1.0;
    u_xlat12 = _BlackWhiteFlash_Params.w * u_xlat2.x + u_xlat12;
    u_xlat2.xyz = (-_BlackWhiteFlash_Color1.xyz) + _BlackWhiteFlash_Color2.xyz;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz + _BlackWhiteFlash_Color1.xyz;
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    SV_Target0.xyz = _BlackWhiteFlash_Params.zzz * u_xlat16_1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BLOOM" "_VIGNETTE" }
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
uniform 	mediump vec4 _bloomParams;
uniform 	mediump float _BloomSaturation;
uniform 	mediump vec4 _Vignette_Params1;
uniform 	vec4 _Vignette_Params2;
uniform 	vec4 _Lut2D_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _bloomTex;
UNITY_LOCATION(2) uniform mediump sampler2D _LutHdrTonemap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
float u_xlat12;
void main()
{
    u_xlat16_0.xyz = textureLod(_bloomTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_1.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat16_0.zxy + (-u_xlat16_1.xxx);
    u_xlat16_1.xyz = vec3(_BloomSaturation) * u_xlat16_5.xyz + u_xlat16_1.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.xxx;
    u_xlat0.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.wyz + u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_1.xyz * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat2.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat2.yz = u_xlat4.yz * _Lut2D_Params.xy + u_xlat2.xy;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat2.x = u_xlat4.x * _Lut2D_Params.y + u_xlat2.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat4.x);
    u_xlat3.x = _Lut2D_Params.y;
    u_xlat3.y = 0.0;
    u_xlat4.xy = u_xlat2.xz + u_xlat3.xy;
    u_xlat10_2.xyz = textureLod(_LutHdrTonemap, u_xlat2.xz, 0.0).xyz;
    u_xlat10_4.xyz = textureLod(_LutHdrTonemap, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat10_2.xyz) + u_xlat10_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_Vignette_Params2.xy);
    u_xlat2.yz = abs(u_xlat2.xy) * _Vignette_Params2.zz;
    u_xlat2.x = u_xlat2.y * _Vignette_Params1.w;
    u_xlat12 = dot(u_xlat2.xz, u_xlat2.xz);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _Vignette_Params2.w;
    u_xlat12 = exp2(u_xlat12);
    u_xlat2.xyz = (-_Vignette_Params1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz + _Vignette_Params1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BLOOM" "_VIGNETTE" }
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
uniform 	mediump vec4 _bloomParams;
uniform 	mediump float _BloomSaturation;
uniform 	mediump vec4 _Vignette_Params1;
uniform 	vec4 _Vignette_Params2;
uniform 	vec4 _Lut2D_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _bloomTex;
UNITY_LOCATION(2) uniform mediump sampler2D _LutHdrTonemap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
float u_xlat12;
void main()
{
    u_xlat16_0.xyz = textureLod(_bloomTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_1.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat16_0.zxy + (-u_xlat16_1.xxx);
    u_xlat16_1.xyz = vec3(_BloomSaturation) * u_xlat16_5.xyz + u_xlat16_1.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.xxx;
    u_xlat0.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.wyz + u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_1.xyz * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat2.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat2.yz = u_xlat4.yz * _Lut2D_Params.xy + u_xlat2.xy;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat2.x = u_xlat4.x * _Lut2D_Params.y + u_xlat2.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat4.x);
    u_xlat3.x = _Lut2D_Params.y;
    u_xlat3.y = 0.0;
    u_xlat4.xy = u_xlat2.xz + u_xlat3.xy;
    u_xlat10_2.xyz = textureLod(_LutHdrTonemap, u_xlat2.xz, 0.0).xyz;
    u_xlat10_4.xyz = textureLod(_LutHdrTonemap, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat10_2.xyz) + u_xlat10_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_Vignette_Params2.xy);
    u_xlat2.yz = abs(u_xlat2.xy) * _Vignette_Params2.zz;
    u_xlat2.x = u_xlat2.y * _Vignette_Params1.w;
    u_xlat12 = dot(u_xlat2.xz, u_xlat2.xz);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _Vignette_Params2.w;
    u_xlat12 = exp2(u_xlat12);
    u_xlat2.xyz = (-_Vignette_Params1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz + _Vignette_Params1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BLOOM" "_VIGNETTE" }
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
uniform 	mediump vec4 _bloomParams;
uniform 	mediump float _BloomSaturation;
uniform 	mediump vec4 _Vignette_Params1;
uniform 	vec4 _Vignette_Params2;
uniform 	vec4 _Lut2D_Params;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _bloomTex;
uniform lowp sampler2D _LutHdrTonemap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
float u_xlat12;
void main()
{
    u_xlat10_0.xyz = texture2D(_bloomTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_1.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat10_0.zxy + (-u_xlat16_1.xxx);
    u_xlat16_1.xyz = vec3(_BloomSaturation) * u_xlat16_5.xyz + u_xlat16_1.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.xxx;
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.wyz + u_xlat10_0.zxy;
    u_xlat0.xyz = u_xlat16_1.xyz * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat2.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat2.yz = u_xlat4.yz * _Lut2D_Params.xy + u_xlat2.xy;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat2.x = u_xlat4.x * _Lut2D_Params.y + u_xlat2.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat4.x);
    u_xlat3.x = _Lut2D_Params.y;
    u_xlat3.y = 0.0;
    u_xlat4.xy = u_xlat2.xz + u_xlat3.xy;
    u_xlat10_2.xyz = texture2D(_LutHdrTonemap, u_xlat2.xz, 0.0).xyz;
    u_xlat10_4.xyz = texture2D(_LutHdrTonemap, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat10_2.xyz) + u_xlat10_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_Vignette_Params2.xy);
    u_xlat2.yz = abs(u_xlat2.xy) * _Vignette_Params2.zz;
    u_xlat2.x = u_xlat2.y * _Vignette_Params1.w;
    u_xlat12 = dot(u_xlat2.xz, u_xlat2.xz);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _Vignette_Params2.w;
    u_xlat12 = exp2(u_xlat12);
    u_xlat2.xyz = (-_Vignette_Params1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz + _Vignette_Params1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BLOOM" "_VIGNETTE" }
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
uniform 	mediump vec4 _bloomParams;
uniform 	mediump float _BloomSaturation;
uniform 	mediump vec4 _Vignette_Params1;
uniform 	vec4 _Vignette_Params2;
uniform 	vec4 _Lut2D_Params;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _bloomTex;
uniform lowp sampler2D _LutHdrTonemap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
float u_xlat12;
void main()
{
    u_xlat10_0.xyz = texture2D(_bloomTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_1.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat10_0.zxy + (-u_xlat16_1.xxx);
    u_xlat16_1.xyz = vec3(_BloomSaturation) * u_xlat16_5.xyz + u_xlat16_1.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.xxx;
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.wyz + u_xlat10_0.zxy;
    u_xlat0.xyz = u_xlat16_1.xyz * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat2.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat2.yz = u_xlat4.yz * _Lut2D_Params.xy + u_xlat2.xy;
    u_xlat4.x = floor(u_xlat4.x);
    u_xlat2.x = u_xlat4.x * _Lut2D_Params.y + u_xlat2.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat4.x);
    u_xlat3.x = _Lut2D_Params.y;
    u_xlat3.y = 0.0;
    u_xlat4.xy = u_xlat2.xz + u_xlat3.xy;
    u_xlat10_2.xyz = texture2D(_LutHdrTonemap, u_xlat2.xz, 0.0).xyz;
    u_xlat10_4.xyz = texture2D(_LutHdrTonemap, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat10_2.xyz) + u_xlat10_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat10_2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_Vignette_Params2.xy);
    u_xlat2.yz = abs(u_xlat2.xy) * _Vignette_Params2.zz;
    u_xlat2.x = u_xlat2.y * _Vignette_Params1.w;
    u_xlat12 = dot(u_xlat2.xz, u_xlat2.xz);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _Vignette_Params2.w;
    u_xlat12 = exp2(u_xlat12);
    u_xlat2.xyz = (-_Vignette_Params1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz + _Vignette_Params1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_BLOOM" "_VIGNETTE" }
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
uniform 	mediump vec4 _bloomParams;
uniform 	mediump float _BloomSaturation;
uniform 	mediump vec4 _Vignette_Params1;
uniform 	vec4 _Vignette_Params2;
uniform 	mediump vec4 _BlackWhiteFlash_Params;
uniform 	mediump vec4 _BlackWhiteFlash_Color1;
uniform 	mediump vec4 _BlackWhiteFlash_Color2;
uniform 	vec4 _Lut2D_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _bloomTex;
UNITY_LOCATION(2) uniform mediump sampler2D _LutHdrTonemap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
float u_xlat15;
float u_xlat17;
float u_xlat18;
void main()
{
    u_xlat16_0.xyz = textureLod(_bloomTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_1.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_6.xyz = u_xlat16_0.zxy + (-u_xlat16_1.xxx);
    u_xlat16_1.xyz = vec3(_BloomSaturation) * u_xlat16_6.xyz + u_xlat16_1.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.xxx;
    u_xlat0.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.wyz + u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_1.xyz * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat2.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat2.yz = u_xlat5.yz * _Lut2D_Params.xy + u_xlat2.xy;
    u_xlat5.x = floor(u_xlat5.x);
    u_xlat2.x = u_xlat5.x * _Lut2D_Params.y + u_xlat2.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat5.x);
    u_xlat3.x = _Lut2D_Params.y;
    u_xlat3.y = 0.0;
    u_xlat5.xy = u_xlat2.xz + u_xlat3.xy;
    u_xlat10_2.xyz = textureLod(_LutHdrTonemap, u_xlat2.xz, 0.0).xyz;
    u_xlat10_5.xyz = textureLod(_LutHdrTonemap, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat10_2.xyz) + u_xlat10_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat10_2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_Vignette_Params2.xy);
    u_xlat2.yz = abs(u_xlat2.xy) * _Vignette_Params2.zz;
    u_xlat2.x = u_xlat2.y * _Vignette_Params1.w;
    u_xlat15 = dot(u_xlat2.xz, u_xlat2.xz);
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _Vignette_Params2.w;
    u_xlat15 = exp2(u_xlat15);
    u_xlat2.xyz = (-_Vignette_Params1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz + _Vignette_Params1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat15 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat15 = u_xlat15 + (-_BlackWhiteFlash_Params.x);
    u_xlat17 = float(1.0) / (-_BlackWhiteFlash_Params.y);
    u_xlat15 = u_xlat15 * u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat17 = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat18 = (-u_xlat17) * u_xlat15 + 1.0;
    u_xlat18 = (-u_xlat17) * u_xlat15 + u_xlat18;
    u_xlat15 = u_xlat15 * u_xlat17;
    u_xlat15 = _BlackWhiteFlash_Params.w * u_xlat18 + u_xlat15;
    u_xlat4.xyz = (-_BlackWhiteFlash_Color1.xyz) + _BlackWhiteFlash_Color2.xyz;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz + _BlackWhiteFlash_Color1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = (-u_xlat0.xyz) * u_xlat2.xyz + u_xlat4.xyz;
    SV_Target0.xyz = _BlackWhiteFlash_Params.zzz * u_xlat16_1.xyz + u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_BLOOM" "_VIGNETTE" }
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
uniform 	mediump vec4 _bloomParams;
uniform 	mediump float _BloomSaturation;
uniform 	mediump vec4 _Vignette_Params1;
uniform 	vec4 _Vignette_Params2;
uniform 	mediump vec4 _BlackWhiteFlash_Params;
uniform 	mediump vec4 _BlackWhiteFlash_Color1;
uniform 	mediump vec4 _BlackWhiteFlash_Color2;
uniform 	vec4 _Lut2D_Params;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _bloomTex;
UNITY_LOCATION(2) uniform mediump sampler2D _LutHdrTonemap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
float u_xlat15;
float u_xlat17;
float u_xlat18;
void main()
{
    u_xlat16_0.xyz = textureLod(_bloomTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_1.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_6.xyz = u_xlat16_0.zxy + (-u_xlat16_1.xxx);
    u_xlat16_1.xyz = vec3(_BloomSaturation) * u_xlat16_6.xyz + u_xlat16_1.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.xxx;
    u_xlat0.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.wyz + u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_1.xyz * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat2.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat2.yz = u_xlat5.yz * _Lut2D_Params.xy + u_xlat2.xy;
    u_xlat5.x = floor(u_xlat5.x);
    u_xlat2.x = u_xlat5.x * _Lut2D_Params.y + u_xlat2.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat5.x);
    u_xlat3.x = _Lut2D_Params.y;
    u_xlat3.y = 0.0;
    u_xlat5.xy = u_xlat2.xz + u_xlat3.xy;
    u_xlat10_2.xyz = textureLod(_LutHdrTonemap, u_xlat2.xz, 0.0).xyz;
    u_xlat10_5.xyz = textureLod(_LutHdrTonemap, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat10_2.xyz) + u_xlat10_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat10_2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_Vignette_Params2.xy);
    u_xlat2.yz = abs(u_xlat2.xy) * _Vignette_Params2.zz;
    u_xlat2.x = u_xlat2.y * _Vignette_Params1.w;
    u_xlat15 = dot(u_xlat2.xz, u_xlat2.xz);
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _Vignette_Params2.w;
    u_xlat15 = exp2(u_xlat15);
    u_xlat2.xyz = (-_Vignette_Params1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz + _Vignette_Params1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat15 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat15 = u_xlat15 + (-_BlackWhiteFlash_Params.x);
    u_xlat17 = float(1.0) / (-_BlackWhiteFlash_Params.y);
    u_xlat15 = u_xlat15 * u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat17 = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat18 = (-u_xlat17) * u_xlat15 + 1.0;
    u_xlat18 = (-u_xlat17) * u_xlat15 + u_xlat18;
    u_xlat15 = u_xlat15 * u_xlat17;
    u_xlat15 = _BlackWhiteFlash_Params.w * u_xlat18 + u_xlat15;
    u_xlat4.xyz = (-_BlackWhiteFlash_Color1.xyz) + _BlackWhiteFlash_Color2.xyz;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz + _BlackWhiteFlash_Color1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = (-u_xlat0.xyz) * u_xlat2.xyz + u_xlat4.xyz;
    SV_Target0.xyz = _BlackWhiteFlash_Params.zzz * u_xlat16_1.xyz + u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_BLOOM" "_VIGNETTE" }
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
uniform 	mediump vec4 _bloomParams;
uniform 	mediump float _BloomSaturation;
uniform 	mediump vec4 _Vignette_Params1;
uniform 	vec4 _Vignette_Params2;
uniform 	mediump vec4 _BlackWhiteFlash_Params;
uniform 	mediump vec4 _BlackWhiteFlash_Color1;
uniform 	mediump vec4 _BlackWhiteFlash_Color2;
uniform 	vec4 _Lut2D_Params;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _bloomTex;
uniform lowp sampler2D _LutHdrTonemap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
float u_xlat15;
float u_xlat17;
void main()
{
    u_xlat10_0.xyz = texture2D(_bloomTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_1.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_6.xyz = u_xlat10_0.zxy + (-u_xlat16_1.xxx);
    u_xlat16_1.xyz = vec3(_BloomSaturation) * u_xlat16_6.xyz + u_xlat16_1.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.xxx;
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.wyz + u_xlat10_0.zxy;
    u_xlat0.xyz = u_xlat16_1.xyz * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat5.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat2.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat2.yz = u_xlat5.yz * _Lut2D_Params.xy + u_xlat2.xy;
    u_xlat5.x = floor(u_xlat5.x);
    u_xlat2.x = u_xlat5.x * _Lut2D_Params.y + u_xlat2.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat5.x);
    u_xlat3.x = _Lut2D_Params.y;
    u_xlat3.y = 0.0;
    u_xlat5.xy = u_xlat2.xz + u_xlat3.xy;
    u_xlat10_2.xyz = texture2D(_LutHdrTonemap, u_xlat2.xz, 0.0).xyz;
    u_xlat10_5.xyz = texture2D(_LutHdrTonemap, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat10_2.xyz) + u_xlat10_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat10_2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_Vignette_Params2.xy);
    u_xlat2.yz = abs(u_xlat2.xy) * _Vignette_Params2.zz;
    u_xlat2.x = u_xlat2.y * _Vignette_Params1.w;
    u_xlat15 = dot(u_xlat2.xz, u_xlat2.xz);
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _Vignette_Params2.w;
    u_xlat15 = exp2(u_xlat15);
    u_xlat2.xyz = (-_Vignette_Params1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz + _Vignette_Params1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat15 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat15 = u_xlat15 + (-_BlackWhiteFlash_Params.x);
    u_xlat17 = float(1.0) / (-_BlackWhiteFlash_Params.y);
    u_xlat15 = u_xlat15 * u_xlat17;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat17 = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat15 * u_xlat17;
    u_xlat17 = u_xlat15 * -2.0 + 1.0;
    u_xlat15 = _BlackWhiteFlash_Params.w * u_xlat17 + u_xlat15;
    u_xlat4.xyz = (-_BlackWhiteFlash_Color1.xyz) + _BlackWhiteFlash_Color2.xyz;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz + _BlackWhiteFlash_Color1.xyz;
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = (-u_xlat0.xyz) * u_xlat2.xyz + u_xlat4.xyz;
    SV_Target0.xyz = _BlackWhiteFlash_Params.zzz * u_xlat16_1.xyz + u_xlat3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_BLOOM" "_VIGNETTE" }
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
uniform 	mediump vec4 _bloomParams;
uniform 	mediump float _BloomSaturation;
uniform 	mediump vec4 _Vignette_Params1;
uniform 	vec4 _Vignette_Params2;
uniform 	mediump vec4 _BlackWhiteFlash_Params;
uniform 	mediump vec4 _BlackWhiteFlash_Color1;
uniform 	mediump vec4 _BlackWhiteFlash_Color2;
uniform 	vec4 _Lut2D_Params;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _bloomTex;
uniform lowp sampler2D _LutHdrTonemap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
float u_xlat15;
float u_xlat17;
void main()
{
    u_xlat10_0.xyz = texture2D(_bloomTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_1.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_6.xyz = u_xlat10_0.zxy + (-u_xlat16_1.xxx);
    u_xlat16_1.xyz = vec3(_BloomSaturation) * u_xlat16_6.xyz + u_xlat16_1.xxx;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.xxx;
    u_xlat0.xy = vs_TEXCOORD0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * _bloomParams.wyz + u_xlat10_0.zxy;
    u_xlat0.xyz = u_xlat16_1.xyz * _Lut2D_Params.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat5.xyz = u_xlat0.xyz * _Lut2D_Params.zzz;
    u_xlat2.xy = _Lut2D_Params.xy * vec2(0.5, 0.5);
    u_xlat2.yz = u_xlat5.yz * _Lut2D_Params.xy + u_xlat2.xy;
    u_xlat5.x = floor(u_xlat5.x);
    u_xlat2.x = u_xlat5.x * _Lut2D_Params.y + u_xlat2.y;
    u_xlat0.x = u_xlat0.x * _Lut2D_Params.z + (-u_xlat5.x);
    u_xlat3.x = _Lut2D_Params.y;
    u_xlat3.y = 0.0;
    u_xlat5.xy = u_xlat2.xz + u_xlat3.xy;
    u_xlat10_2.xyz = texture2D(_LutHdrTonemap, u_xlat2.xz, 0.0).xyz;
    u_xlat10_5.xyz = texture2D(_LutHdrTonemap, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat10_2.xyz) + u_xlat10_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat10_2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy + (-_Vignette_Params2.xy);
    u_xlat2.yz = abs(u_xlat2.xy) * _Vignette_Params2.zz;
    u_xlat2.x = u_xlat2.y * _Vignette_Params1.w;
    u_xlat15 = dot(u_xlat2.xz, u_xlat2.xz);
    u_xlat15 = (-u_xlat15) + 1.0;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = log2(u_xlat15);
    u_xlat15 = u_xlat15 * _Vignette_Params2.w;
    u_xlat15 = exp2(u_xlat15);
    u_xlat2.xyz = (-_Vignette_Params1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz + _Vignette_Params1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat15 = dot(u_xlat3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat15 = u_xlat15 + (-_BlackWhiteFlash_Params.x);
    u_xlat17 = float(1.0) / (-_BlackWhiteFlash_Params.y);
    u_xlat15 = u_xlat15 * u_xlat17;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat17 = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = u_xlat15 * u_xlat17;
    u_xlat17 = u_xlat15 * -2.0 + 1.0;
    u_xlat15 = _BlackWhiteFlash_Params.w * u_xlat17 + u_xlat15;
    u_xlat4.xyz = (-_BlackWhiteFlash_Color1.xyz) + _BlackWhiteFlash_Color2.xyz;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz + _BlackWhiteFlash_Color1.xyz;
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = (-u_xlat0.xyz) * u_xlat2.xyz + u_xlat4.xyz;
    SV_Target0.xyz = _BlackWhiteFlash_Params.zzz * u_xlat16_1.xyz + u_xlat3.xyz;
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
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BLACK_WHITE_FLASH" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BLACK_WHITE_FLASH" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BLACK_WHITE_FLASH" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BLACK_WHITE_FLASH" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_VIGNETTE" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_VIGNETTE" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_VIGNETTE" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_VIGNETTE" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_VIGNETTE" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_VIGNETTE" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_VIGNETTE" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_VIGNETTE" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BLOOM" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BLOOM" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BLOOM" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BLOOM" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_BLOOM" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_BLOOM" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_BLOOM" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_BLOOM" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BLOOM" "_VIGNETTE" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BLOOM" "_VIGNETTE" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BLOOM" "_VIGNETTE" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BLOOM" "_VIGNETTE" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_BLOOM" "_VIGNETTE" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_BLOOM" "_VIGNETTE" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_BLOOM" "_VIGNETTE" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_BLACK_WHITE_FLASH" "_BLOOM" "_VIGNETTE" }
""
}
}
}
}
}