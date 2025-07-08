//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 u_rgb;

void main()
{
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
	gl_FragColor = vec4(u_rgb, texColor.a);
}
