if mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom)
{
	if sign(mouse_x) < 0{
		global.PLAYERNUMB--;
		playerNumb--;
	}
	else{
		global.PLAYERNUMB++;
		playerNumb++;
	}
}

if instance_number(obj_PlayersButton) < playerNumb {
	instance_create_depth(room_width/10*playerNumb,room_height/2,0,obj_PlayersButton,{
		playerNumber : playerNumb})
}
