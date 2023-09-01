Shader "Custom/Bumped" {
	
	Properties {
	    _myColour ("Example Colour", Color) = (1,1,1,1)
	    _myBump ("Bump Texture", 2D) = "bump" {}
        _mySlider ("Bump Amount", Range(0,10)) = 1
	}
	
	SubShader {
		
		CGPROGRAM
			#pragma surface surf Lambert
			
			fixed4 _myColour;
			sampler2D _myBump;
        	half _mySlider;

			struct Input {
				float2 uv_myBump;
			};

			void surf (Input IN, inout SurfaceOutput o){
			    o.Albedo = _myColour.rgb;
				o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump));
            	o.Normal *= float3(_mySlider,_mySlider,1);
			}
		
		ENDCG
	}
	
	FallBack "Diffuse"
}