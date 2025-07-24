//u_rgba = shader_get_uniform(shd_Players, "u_rgba");
image_alpha = 1;

image_xscale = obj_CardManager.cellSize/sprite_width/5;
image_yscale = image_xscale;

dir = random_range(0,360);
velocity = random_range(0.01,0.2);