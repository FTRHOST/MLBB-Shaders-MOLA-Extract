//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Prometheus/BattleHero/BattleHero_Chocolate" {
Properties {

_Usage ("【国际|国内】【局内英雄】【S1-S6】", Float) = 1.0

_TopHelpBox ("一些注意事项:\n1.仅用于局内英雄\n2.通常原始资源尺寸512，游戏尺寸256", Float) = 1.0

_Link ("https://moonton.feishu.cn/docx/Pf9LdwZVMoZ3k7xd8kEcpacinu1", Float) = 1.0

[Enum(UnityEngine.Rendering.BlendMode)] _SrcBlend ("Src Blend", Float) = 1.0

[Enum(UnityEngine.Rendering.BlendMode)] _DstBlend ("Dst Blend", Float) = 0.0

[Foldout(1,1,1)] _Basic_Foldout ("Basic_Foldout", Float) = 1.0

[Tex] _MainTex ("[RGB/A]Main Texture", 2D) = "white" { }

_MainTex_HelpBox ("在不透明模式下使用RGB Texture", Float) = 1.0

_MainTexBrightness ("Main Texture Brightness", Range(0, 10)) = 1.0

_EmissiveCompensation ("Emissive Compensation", Range(0, 10)) = 0.5

[Tex] _RoughEmissiveEnv ("[RGBA]Mix Texture", 2D) = "white" { }

_RoughEmissiveEnv_HelpBox ("R通道用于粗糙度\nG通道用于标注自发光区域\nB通道用于环境光强度控制\nA通道不能使用灰色,仅能使用黑白,用于调节MainTexBrightness和EmissiveCompensation", Float) = 1.0

[Tex] _SpecularTex ("[RGB]Specular Texture", 2D) = "gray" { }

_SpecularTex_HelpBox ("RGB控制高光颜色，Alpha无用", Float) = 1.0

[Tex] _EnvMap ("[Cubemap][RGB]Enironment Map", Cube) = "_Skybox" { }

_EnvSpecularIntensity ("Environment Specular Intensity", Range(0, 20)) = 8.0

_LightColor ("[HDR&RGB]Light Color", Color) = (1,1,1,1)

_EnvDiffuseLighting ("Env Diffuse Lighting", Color) = (0.5,0.5,0.5,1)

_EmiIntensity ("Emissive Intensity", Range(0, 5)) = 0.0

[Foldout(2,3,0)] _Outline_Foldout ("Outline_Foldout", Float) = 1.0

_OutlineColor ("Outline Color", Color) = (0,0,0,1)

_OutlineWidth ("Outline Width", Range(0, 0.05)) = 0.009999999776482582

_OutlineOffset ("Outline Offfset", Float) = 25.0

[Foldout(1,1,0)] _Other_Foldout ("Other_Foldout", Float) = 1.0

[Foldout(2,3,0)] _HIT_EFF_Foldout ("HIT_EFF_Foldout", Float) = 1.0

_HitColFix ("HitColFix", Vector) = (0,0,0,0)

[Foldout(2,3,0)] _EFF_MAP_Foldout ("EFF_MAP_Foldout", Float) = 1.0

[Toggle(_EFF_MAP_ON)] _EFF_MAP_ON ("EFF_MAP_ON", Float) = 0.0

[Tex] _EffMap ("EffMap (RGB)", 2D) = "white" { }

_EffRate ("EffectFactor", Float) = 0.8500000238418579

_EffMapScale ("EffMapScale", Float) = 1.0

_EffMapMoveSpd ("EffMapMoveSpd", Float) = 0.0

_EffMapColor ("EffMapColor", Vector) = (0,0,0,0)

[Foldout(2,3,0)] _EFF_MAP_NEW_Foldout ("EFF_MAP_NEW_Foldout", Float) = 1.0

[Toggle(_EFF_MAP_NEW_ON)] _EFF_MAP_NEW_ON ("EFF_MAP_NEW_ON", Float) = 0.0

[Tex] _LG_Tex ("LG_Tex", 2D) = "white" { }

_LG_Color ("LG_Color", Color) = (0.5,0.5,0.5,1)

_LG_Pw ("LG_Pw", Float) = 1.0

_L_V ("L_V", Float) = 0.0

_L_U ("L_U", Float) = 0.0

_Fr_Fw ("Fr_Fw", Float) = 0.0

_Fr_Pw ("Fr_Pw", Float) = 0.0

[Foldout(2,3,0)] _EFF_FLUFoldout ("EFF_FLU_Foldout", Float) = 1.0

[Toggle(_EFF_FLU_ON)] _EFF_FLU_ON ("EFF_FLU_ON", Float) = 0.0

[Tex] _Flu_Tex ("[RGB]Flu_Tex", 2D) = "black" { }

[Enum(Tex2U_Mask1U,0,Tex1U_Mask1U,1,Tex2U_Mask2U,2)] _Flu_UV ("Flu_UV", Float) = 1.0

_Flu_UV_OffsetSpeedU ("Flu_UV_OffsetSpeedU", Float) = 0.0

_Flu_UV_OffsetSpeedV ("Flu_UV_OffsetSpeedV", Float) = 0.0

_Flu_Color ("Flu_Color", Color) = (0.5,0.5,0.5,1)

_Flu_Intensity ("Flu_Intensity", Float) = 0.0

_Flu_Intensity_HelpBox ("Flu_Intensity为0时不显示流光", Float) = 1.0

[Tex] _Flu_Mask ("[RGBA]Flu_Mask", 2D) = "black" { }

_Flu_Mask_HelpBox ("R通道用于标注流光区域\nG通道用于标注边缘光区域\nB通道用于标注闪点区域\nA通道用于闪点样式\n闪点区域UV的连续性需要大致相同以保证闪点映射到UV上后大小一致", Float) = 1.0

_RimColor ("Rim_Color", Color) = (1,1,1,1)

_RimIntensity ("Rim_Intensity", Float) = 0.0

_RimIntensity_HelpBox ("Rim_Intensity为0时不显示边缘光", Float) = 1.0

_RimPower ("Rim_Size", Float) = 1.0

_Glint_Tilling_Offset ("Glint_Tilling_Offset", Vector) = (1,1,0,0)

[Enum(2U,0,1U,1)] _Glint_UV ("Glint_UV", Float) = 1.0

_Glint_Color ("Glint_Color", Color) = (1,1,1,1)

_Glint_Intensity ("Glint_Intensity", Float) = 0.0

_Glint_Intensity_HelpBox ("Glint_Intensity为0时不显示闪点", Float) = 1.0

_Glint_Speed ("Glint_Speed", Float) = 1.0

_Glint_Power ("Glint_Size", Float) = 1.0

[Foldout(2,3,0)] _EFF_CHOCOLATEFoldout ("EFF_CHOCOLATE_Foldout", Float) = 1.0

[Tex] _Chocolate_Mask ("[R]Chocolate_Mask", 2D) = "black" { }

_Chocolate_Mask_HelpBox ("R通道为巧克力区域Mask", Float) = 1.0

_Chocolate_Color ("Chocolate_Diffuse_Color", Color) = (1,1,1,1)

_Chocolate_Wrap ("Chocolate_Diffuse_Intensity", Range(0, 10)) = 1.0

_Chocolate_Color_Spec ("Chocolate_Spec_Color", Color) = (1,1,1,1)

_Chocolate_Pow ("Chocolate_Spec_Range", Range(0, 3)) = 1.0

_Chocolate_Blend ("Chocolate_Blend", Range(0, 1)) = 1.0

[Foldout(1,1,0)] _ForProgrammer ("ForProgrammer_Foldout", Float) = 1.0

_HeroBattleLightDir ("HeroBattleLightDir", Vector) = (-0.19617,0.93969,-0.28016,-1)

_lightDir ("LightDir", Vector) = (2,-2.7,-1.2,0)

_ShadowPara ("ShadowPara", Vector) = (0,0.22,0,0)

_ShadowColor ("ShadowColor", Color) = (0.08,0.08,0.08,1)

_ShadowAlpha ("ShadowAlpha", Range(0, 2)) = 1.0

}
SubShader {
 LOD 850
 Tags { "QUEUE" = "AlphaTest+1" }
 UsePass "Prometheus/Hidden/BattleHero/BattleHeroBase_Chocolate/FORWARDBASE_CHOCOLATE"
 UsePass "Prometheus/Hidden/BattleHero/HeroBase/PLANARSHADOWPASS"
 UsePass "Prometheus/Hidden/BattleHero/HeroBase/OUTLINEPASS"
}
SubShader {
 LOD 700
 Tags { "QUEUE" = "AlphaTest+1" }
 UsePass "Prometheus/Hidden/BattleHero/BattleHeroBase_Chocolate/FORWARDBASE_CHOCOLATE"
 UsePass "Prometheus/Hidden/BattleHero/HeroBase/OUTLINEPASS"
}
SubShader {
 LOD 600
 Tags { "QUEUE" = "AlphaTest+1" }
 UsePass "Prometheus/Hidden/BattleHero/BattleHeroBase_Chocolate/FORWARDBASE_CHOCOLATE"
 UsePass "Prometheus/Hidden/BattleHero/HeroBase/PLANARSHADOWPASS"
}
SubShader {
 LOD 200
 Tags { "QUEUE" = "AlphaTest+1" }
 UsePass "Prometheus/Hidden/BattleHero/BattleHeroBase_Chocolate/FORWARDBASE_CHOCOLATE"
}
CustomEditor "Prometheus.PrometheusShaderGUI_BattleHero"
}