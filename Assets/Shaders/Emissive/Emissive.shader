Shader "Custom/Emissive" 
{
    Properties {
        _myTex ("Texture", 2D) = "white" {}

        //set this texture to black to stop the white
        //overwhelming the effect if no emission texture
        //is present
        _myEmis ("Texture", 2D) = "black" {}
        _myRange ("Example Range", Range(0,5)) = 1
    }
    SubShader {

      CGPROGRAM
        #pragma surface surf Lambert
        
        sampler2D _myTex;
        sampler2D _myEmis;
        half _myRange;

        struct Input {
            float2 uv_myTex;
            float2 uv_myEmis;
        };
        
        void surf (Input IN, inout SurfaceOutput o) {
            o.Albedo = (tex2D(_myTex, IN.uv_myTex)).rgb;
            o.Emission = (tex2D(_myEmis, IN.uv_myEmis)*_myRange).rgb;
        }
      
      ENDCG
    }
    Fallback "Diffuse"
  }
