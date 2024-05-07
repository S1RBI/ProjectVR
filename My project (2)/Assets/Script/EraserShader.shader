Shader"Custom/EraserShader" {
    Properties {
        _MainTex ("Texture", 2D) = "white" {}
        _EraserPos ("Eraser Position", Vector) = (0,0,0,0)
        _EraserRadius ("Eraser Radius", Float) = 0.1
    }
    SubShader {
        Tags { "RenderType"="Opaque" }
LOD 100

        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
#include "UnityCG.cginc"

struct appdata
{
    float4 vertex : POSITION;
    float2 uv : TEXCOORD0;
};

struct v2f
{
    float2 uv : TEXCOORD0;
    float4 vertex : SV_POSITION;
};

sampler2D _MainTex;
float4 _EraserPos;
float _EraserRadius;

v2f vert(appdata v)
{
    v2f o;
    o.vertex = UnityObjectToClipPos(v.vertex);
    o.uv = v.uv;
    return o;
}

float4 frag(v2f i) : SV_Target
{
    float dist = distance(_EraserPos.xy, i.uv);
    if (dist < _EraserRadius)
        discard;
    return tex2D(_MainTex, i.uv);
}
            ENDCG
        }
    }
FallBack "Diffuse"
}
