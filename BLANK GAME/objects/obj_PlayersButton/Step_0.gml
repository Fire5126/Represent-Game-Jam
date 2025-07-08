if mouse_check_button_pressed(mb_left) && point_in_circle(mouse_x,mouse_y,x,y,30)
{
	playerSelection++;
	if playerSelection > maxPlayers{
		playerSelection = 0;
	}
}
if playerNumber > global.PLAYERNUMB{
	instance_destroy();
}

variable_global_set("p"+string(playerNumber)+"Name",players[playerSelection][0])
variable_global_set("p"+string(playerNumber)+"Sprite",players[playerSelection][1])
variable_global_set("p"+string(playerNumber)+"Colour",players[playerSelection][2])
