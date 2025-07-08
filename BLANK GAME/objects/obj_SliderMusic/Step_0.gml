if mouse_check_button_pressed(mb_left){
	var button_x = x  + sprite_width * global.MUSICSLIDER;
	var button_y = y;
	var button_width = sprite_get_width(Circle);
	var button_height = sprite_get_height(Circle);
	var button_radius = sprite_get_width(Circle)/2;
	if point_in_circle(mouse_x, mouse_y, button_x, button_y, button_radius){
		selected = true;	
	}
}	
if !mouse_check_button(mb_left){
	selected = false;
}

if selected {
	global.MUSICSLIDER = clamp((mouse_x - x) / sprite_width, 0, max_value);
	
}