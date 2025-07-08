if mouse_check_button_pressed(mb_left)
{
	//mouse on board
	if mouse_x < cellSize*gridSize+x1 && mouse_x > x1 && mouse_y < cellSize*gridSize+x1 && mouse_y > x1 {
		//check square is empty
		if cardGrid[floor((mouse_x-x1)/cellSize)][floor((mouse_y-x1)/cellSize)] == 0{
			//set square to player number
			//get cell number
			var _xCoord = floor((mouse_x-x1)/cellSize);
			var _yCoord = floor((mouse_y-x1)/cellSize);
			switch(placeType){
				//tile
				case 0:
					cardGrid[_xCoord][_yCoord] = player;
					break;
				//hollow cross
				case 1:
					cardGrid[_xCoord+1][_yCoord] = player;
					cardGrid[_xCoord-1][_yCoord] = player;
					cardGrid[_xCoord][_yCoord+1] = player;
					cardGrid[_xCoord][_yCoord-1] = player;
					break;
				
				
			}
			
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
