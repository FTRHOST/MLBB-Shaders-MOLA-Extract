//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect/FX_ParticleStar" {
Properties {

[Toggle(OpenCustom)] _OpenCustom ("开启Custom", Float) = 1.0

[Enum(Add,1,Blend,10)] _Dst ("混合模式", Float) = 10.0

[Enum(Star_01,0,Star_02,1)] _StarType ("星形选择", Float) = 0.0

_Scale ("缩放倍率(+Texcoord0.z)", Range(0, 1)) = 1.0

_Diffuse ("Diffuse", 2D) = "white" { }

[Toggle] _DiffUseScreenUV ("Diffuse使用屏幕坐标", Float) = 0.0

[Toggle] _DiffMulVertexRGB ("Diffuse乘顶点色RGB", Float) = 0.0

_DiffuseColor ("DiffuseColor", Color) = (1,1,1,1)

_Diffuse_Speed ("XY:Diffuse流速", Vector) = (0,0,0,0)

_EdgeTex ("边缘纹理", 2D) = "white" { }

[Toggle] _EdgeUseScreenUV ("边缘纹理使用屏幕坐标", Float) = 0.0

[Toggle] _EdgeMulVertexRGB ("边缘乘顶点色RGB", Float) = 0.0

_Edge_Color ("边缘颜色", Color) = (1,1,1,1)

_Edge_Width ("边缘粗细(+Texcoord0.w)", Range(0, 1)) = 0.10000000149011612

_Edge_Speed ("XY:边缘纹理流速", Vector) = (0,0,0,0)

[Header(OtherSettings__________________________________________________________________________________)] [Space(10)] [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0.0

[Enum(Off, 0, On, 1)] _MLZWrite ("ZWrite", Float) = 0.0

[Enum(On, 0,Off, 4)] _MLZTest ("总是最前", Float) = 4.0

_StencilRef ("StencilRef", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 26680
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