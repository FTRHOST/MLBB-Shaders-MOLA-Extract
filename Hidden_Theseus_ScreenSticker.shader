//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/ScreenSticker" {
Properties {

}
SubShader {
 LOD 100
 Pass {
 Name "ScreenSticker"
  LOD 100
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 22552
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
uniform 	vec4 _StickerTilingOffset;
uniform 	vec4 _StickerParameters0;
uniform 	vec4 _Color0;
uniform 	vec4 _Color1;
UNITY_LOCATION(0) uniform mediump sampler2D _StickerTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = _StickerParameters0.x * 6.28318548;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat4.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat3.xy = u_xlat4.xy * _StickerTilingOffset.xy + _StickerTilingOffset.zw;
    u_xlat3.z = (-u_xlat3.y) + 1.0;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.y = dot(u_xlat3.xz, u_xlat2.xy);
    u_xlat0.x = dot(u_xlat3.xz, u_xlat2.yz);
    u_xlat16_0 = textureLod(_StickerTexture, u_xlat0.xy, 0.0);
    u_xlat1.xyz = (-_Color0.xyz) + _Color1.xyz;
    u_xlat1.xyz = u_xlat16_0.xxx * u_xlat1.xyz + _Color0.xyz;
    u_xlat1.xyz = (-u_xlat16_0.xyz) + u_xlat1.xyz;
    u_xlat1.xyz = _StickerParameters0.zzz * u_xlat1.xyz + u_xlat16_0.xyz;
    u_xlat4.x = u_xlat16_0.w * _StickerParameters0.y;
    u_xlat0.x = u_xlat16_0.x * u_xlat4.x;
    u_xlat4.x = _StickerParameters0.y * u_xlat16_0.w + (-u_xlat0.x);
    u_xlat1.w = _StickerParameters0.w * u_xlat4.x + u_xlat0.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _StickerTilingOffset;
uniform 	vec4 _StickerParameters0;
uniform 	vec4 _Color0;
uniform 	vec4 _Color1;
UNITY_LOCATION(0) uniform mediump sampler2D _StickerTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = _StickerParameters0.x * 6.28318548;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat4.xy = vs_TEXCOORD0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat3.xy = u_xlat4.xy * _StickerTilingOffset.xy + _StickerTilingOffset.zw;
    u_xlat3.z = (-u_xlat3.y) + 1.0;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.y = dot(u_xlat3.xz, u_xlat2.xy);
    u_xlat0.x = dot(u_xlat3.xz, u_xlat2.yz);
    u_xlat16_0 = textureLod(_StickerTexture, u_xlat0.xy, 0.0);
    u_xlat1.xyz = (-_Color0.xyz) + _Color1.xyz;
    u_xlat1.xyz = u_xlat16_0.xxx * u_xlat1.xyz + _Color0.xyz;
    u_xlat1.xyz = (-u_xlat16_0.xyz) + u_xlat1.xyz;
    u_xlat1.xyz = _StickerParameters0.zzz * u_xlat1.xyz + u_xlat16_0.xyz;
    u_xlat4.x = u_xlat16_0.w * _StickerParameters0.y;
    u_xlat0.x = u_xlat16_0.x * u_xlat4.x;
    u_xlat4.x = _StickerParameters0.y * u_xlat16_0.w + (-u_xlat0.x);
    u_xlat1.w = _StickerParameters0.w * u_xlat4.x + u_xlat0.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _StickerTilingOffset;
uniform 	vec4 _StickerParameters0;
uniform 	vec4 _Color0;
uniform 	vec4 _Color1;
uniform lowp sampler2D _StickerTexture;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = _StickerParameters0.x * 6.28318548;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat4.xy = vs_TEXCOORD0.xy;
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat3.xy = u_xlat4.xy * _StickerTilingOffset.xy + _StickerTilingOffset.zw;
    u_xlat3.z = (-u_xlat3.y) + 1.0;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.y = dot(u_xlat3.xz, u_xlat2.xy);
    u_xlat0.x = dot(u_xlat3.xz, u_xlat2.yz);
    u_xlat10_0 = texture2D(_StickerTexture, u_xlat0.xy, 0.0);
    u_xlat1.xyz = (-_Color0.xyz) + _Color1.xyz;
    u_xlat1.xyz = u_xlat10_0.xxx * u_xlat1.xyz + _Color0.xyz;
    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat1.xyz;
    u_xlat1.xyz = _StickerParameters0.zzz * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat4.x = u_xlat10_0.w * _StickerParameters0.y;
    u_xlat0.x = u_xlat10_0.x * u_xlat4.x;
    u_xlat4.x = _StickerParameters0.y * u_xlat10_0.w + (-u_xlat0.x);
    u_xlat1.w = _StickerParameters0.w * u_xlat4.x + u_xlat0.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _StickerTilingOffset;
uniform 	vec4 _StickerParameters0;
uniform 	vec4 _Color0;
uniform 	vec4 _Color1;
uniform lowp sampler2D _StickerTexture;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = _StickerParameters0.x * 6.28318548;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.z = u_xlat0.x;
    u_xlat4.xy = vs_TEXCOORD0.xy;
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat3.xy = u_xlat4.xy * _StickerTilingOffset.xy + _StickerTilingOffset.zw;
    u_xlat3.z = (-u_xlat3.y) + 1.0;
    u_xlat2.y = u_xlat1.x;
    u_xlat2.x = (-u_xlat0.x);
    u_xlat0.y = dot(u_xlat3.xz, u_xlat2.xy);
    u_xlat0.x = dot(u_xlat3.xz, u_xlat2.yz);
    u_xlat10_0 = texture2D(_StickerTexture, u_xlat0.xy, 0.0);
    u_xlat1.xyz = (-_Color0.xyz) + _Color1.xyz;
    u_xlat1.xyz = u_xlat10_0.xxx * u_xlat1.xyz + _Color0.xyz;
    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat1.xyz;
    u_xlat1.xyz = _StickerParameters0.zzz * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat4.x = u_xlat10_0.w * _StickerParameters0.y;
    u_xlat0.x = u_xlat10_0.x * u_xlat4.x;
    u_xlat4.x = _StickerParameters0.y * u_xlat10_0.w + (-u_xlat0.x);
    u_xlat1.w = _StickerParameters0.w * u_xlat4.x + u_xlat0.x;
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