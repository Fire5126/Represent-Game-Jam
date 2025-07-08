draw_set_colour(c_white)
if mouse_check_button(mb_left) && point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom)
{
	if mouse_x < x{
		draw_button(bbox_left,bbox_top,x,bbox_bottom,false);
		draw_button(bbox_right,bbox_top,x,bbox_bottom,true);
	} else{
		draw_button(bbox_right,bbox_top,x,bbox_bottom,false);
		draw_button(bbox_left,bbox_top,x,bbox_bottom,true);
	}
}
else{
	draw_button(bbox_right,bbox_top,x,bbox_bottom,true);
	draw_button(bbox_left,bbox_top,x,bbox_bottom,true);
}
draw_set_colour(c_black);
draw_set_font(fnt_mune);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x,y,"Grid Size: "+string(global.GRIDSIZE));