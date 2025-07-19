if mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom)
{
	if mouse_x < x{
		global.TOKENS = max(global.TOKENS-1,0);
	}
	else{
		global.TOKENS++;
	}
}

