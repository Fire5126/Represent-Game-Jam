if mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom) && cd < 0
{
	if mouse_x < x{
		global.GRIDSIZE = max(global.GRIDSIZE-1,0);
		
	}
	else{
		global.GRIDSIZE++;
	}
	cd = cooldown;
	cooldown -= 3;
}
cd--;
cooldown = lerp(cooldown,30,0.01);