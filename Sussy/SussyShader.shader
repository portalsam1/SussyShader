Shader "Amogus/SussyShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
		_Sussy ("Suspicious Dither", 2D) = "white" {}
		_BlendAlpha ("Suspicious Blend", float) = 0
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
    }
    SubShader
    {
	
        Tags { "RenderType"="Cutout" }
        LOD 200

        CGPROGRAM  
        #pragma surface surf Standard fullforwardshadows

        #pragma target 3.0

        sampler2D _MainTex;
		
		sampler2D _Sussy;
		float _BlendAlpha;
		
        struct Input
        {
            float2 uv_MainTex;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;

        UNITY_INSTANCING_BUFFER_START(Props)
        UNITY_INSTANCING_BUFFER_END(Props)

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = ((1 - _BlendAlpha) * tex2D(_MainTex, IN.uv_MainTex) + _BlendAlpha * tex2D(_Sussy, IN.uv_MainTex )) * _Color;
            o.Albedo = c.rgb;
            o.Metallic = _Metallic;
            o.Smoothness = _Glossiness;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}