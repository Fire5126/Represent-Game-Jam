if mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x,mouse_y,bbox_left,bbox_top,bbox_right,bbox_bottom)
{
	if mouse_x < x{
		global.PLAYERNUMB = max(global.PLAYERNUMB-1,0);
		playerNumb = max(playerNumb-1,0);
		
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
