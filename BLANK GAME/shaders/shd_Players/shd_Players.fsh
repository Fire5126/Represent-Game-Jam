//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec4 u_rgba;

void main()
{
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
	gl_FragColor = vec4(u_rgba.w,u_rgba.x,u_rgba.y,u_rgba.z);
}
