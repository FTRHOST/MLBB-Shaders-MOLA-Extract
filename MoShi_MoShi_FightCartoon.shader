//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "MoShi/MoShi_FightCartoon" {
Properties {

_MainTex ("Diffuse (RGB)", 2D) = "white" { }

_MainColor ("MainColor", Color) = (0,0,0,1)

_HitColFix ("HitColFix", Vector) = (0,0,0,0)

_RAMP ("RAMP", 2D) = "white" { }

_LightCartoon ("LightCartoon", Vector) = (0,0,0,0)

_InSideRimColor ("InSideRimColor", Color) = (1,1,1,1)

_InSideRimPower ("InSideRimPower", Range(0, 5)) = 0.0

_InSideRimIntensity ("InSideRimIntensity", Range(0, 10)) = 0.0

[Header(EFF_MAP)] _EffMap ("EffMap (RGB)", 2D) = "white" { }

_EffRate ("EffectFactor", Float) = 0.8500000238418579

_EffMapScale ("EffMapScale", Float) = 1.0

_EffMapMoveSpd ("EffMapMoveSpd", Float) = 0.0

_EffMapColor ("EffMapColor", Vector) = (0,0,0,0)

[Header(EFF_MAP_NEW)] _LG_Tex ("LG_Tex", 2D) = "white" { }

_LG_Color ("LG_Color", Color) = (0.5,0.5,0.5,1)

_LG_Pw ("LG_Pw", Float) = 1.0

_L_V ("L_V", Float) = 0.0

_L_U ("L_U", Float) = 0.0

_Fr_Fw ("Fr_Fw", Float) = 0.0

_Fr_Pw ("Fr_Pw", Float) = 0.0

[Header(MICAI)] _Fre_color ("Fre_color", Color) = (0.5,0.5,0.5,1)

_Fresmel ("Fresmel", Range(0, 2)) = 0.0

_Cut_off ("Cut_off", 2D) = "white" { }

_Cut_off_Pw ("Cut_off_Pw", Range(0, 1)) = 1.0

_Alpha ("Alpha", Range(0, 1)) = 0.0

[Header(EFF_FLU)] _Flu_LG_Pw ("Flu LG_Pw", Float) = 1.0

_Flu_LG_Tex ("Flu LG_Tex", 2D) = "white" { }

_Flu_LG_Color ("Flu LG_Color", Color) = (0.5,0.5,0.5,1)

_Flu_L_V ("Flu L_V", Float) = 0.0

_Flu_L_U ("Flu L_U", Float) = 0.0

_Flu_NQ_Tex ("Flu NQ_Tex", 2D) = "white" { }

_Flu_NQ_pw ("Flu NQ_pw", Float) = 0.4000000059604645

_Flu_N_V ("Flu N_V", Float) = 1.0

_Flu_N_U ("Flu N_U", Float) = 1.0

_Flu_Mask ("Mask Flu(R流光)(G边缘光)", 2D) = "white" { }

_OutlineColor ("Outline Color", Color) = (0,0,0,1)

_OutlineWidth ("Outline Width", Range(0, 1)) = 0.0

_Outline_Offset_X ("Outline_Offset_X", Float) = 0.0

_Outline_Offset_Y ("Outline_Offset_Y", Float) = 0.0

_GradHeight ("GradHeight", Float) = 1.0

_GradColor ("GradColor", Color) = (0.125,0.125,0.125,1)

[Header(SHADOW)] _ShadowColor ("Shadow Color", Color) = (0.08,0.08,0.08,1)

_ShadowPara ("Shadow Param(X:Switch, Y:Intensity)", Vector) = (0,0.22,0,0)

_lightDir ("LightDir", Vector) = (2,-2.7,-1.2,0)

}
SubShader {
 LOD 850
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest+1" "RenderType" = "Opaque" }
 UsePass "MlHero/ML_FightCartoonBase/MYPASS"
 UsePass "Hidden/MoShi/MoShi_FightCartoonOutline/OUTLINE"
 UsePass "Hidden/Common/Shadow/SHADOW"
}
SubShader {
 LOD 700
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest+1" "RenderType" = "Opaque" }
 UsePass "MlHero/ML_FightCartoonBase/MYPASS"
 UsePass "Hidden/MoShi/MoShi_FightCartoonOutline/OUTLINE"
}
SubShader {
 LOD 600
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest+1" "RenderType" = "Opaque" }
 UsePass "MlHero/ML_FightCartoonBase/MYPASS"
 UsePass "Hidden/MoShi/MoShi_FightCartoonOutline/OUTLINE"
 UsePass "Hidden/Common/Shadow/SHADOW"
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest+1" "RenderType" = "Opaque" }
 UsePass "MlHero/ML_FightCartoonBase/MYPASS"
 UsePass "Hidden/MoShi/MoShi_FightCartoonOutline/OUTLINE"
}
}