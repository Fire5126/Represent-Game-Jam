if mouse_check_button_pressed(mb_left)
{
	if mouse_x < cellSize*gridSize+x1 && mouse_x > x1 && mouse_y < cellSize*gridSize+x1 && mouse_y > x1 {
		if cardGrid[floor((mouse_x-x1)/cellSize)][floor((mouse_y-x1)/cellSize)] == 0{
			cardGrid[floor((mouse_x-x1)/cellSize)][floor((mouse_y-x1)/cellSize)] = player;
			placeTurn--;
			if placeTurn == 0{
				placeTurn = placements;
				player++;
				if (player > global.PLAYERNUMB)
				{
					player = 1;
				}
			}
		}
	}
}
