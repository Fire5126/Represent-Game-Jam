image_alpha -= 0.01;
if image_alpha <= 0{
	instance_destroy();
}
x += lengthdir_x(velocity,dir);
y += lengthdir_y(velocity,dir);