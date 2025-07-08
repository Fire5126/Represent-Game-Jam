if mouse_check_button_pressed(mb_left)
{
	playerSelection++;
	if playerSelection > maxPlayers{
		playerSelection = 0;
	}
}

