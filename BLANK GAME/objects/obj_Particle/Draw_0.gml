shader_set(shd_Players);
shader_set_uniform_f_array(u_rgb,
	[0,
	0,
	50]);
draw_self();
shader_reset();
draw_self();