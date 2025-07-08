if mouse_check_button_pressed(mb_left)
{
	if mouse_x < cellSize*gridSize+x1 && mouse_x > x1 && mouse_y < cellSize*gridSize+x1 && mouse_y > x1 {
		{
			//grab cell numbers
			var _xCoord = floor((mouse_x-x1)/cellSize);
			var _yCoord = floor((mouse_y-x1)/cellSize);
			//switch based on placement type to check if squares empty
			placeable = false;
			switch(placeType)
			{
				//tile
				case 0:
					if (cardGrid[_xCoord][_yCoord] == 0) placeable = true;
					break;
				//hollow cross
				case 1:
					if _xCoord - 1 < 0 &&
					if cardGrid[_xCoord+1][_yCoord] == 0 && 
					cardGrid[_xCoord-1][_yCoord] == 0 &&
					cardGrid[_xCoord][_yCoord+1] == 0 &&
					cardGrid[_xCoord][_yCoord-1] == 0
					{
						placeable = true;
					}
					break;
				//full cross
				case 2:
					if cardGrid[_xCoord+1][_yCoord] == 0 && 
					cardGrid[_xCoord-1][_yCoord] == 0 &&
					cardGrid[_xCoord][_yCoord+1] == 0 &&
					cardGrid[_xCoord][_yCoord-1] == 0 &&
					cardGrid[_xCoord][_yCoord] == 0 
					{
						placeable = true;
					}
					break;
			}
			//place sqaures
			if placeable
			{
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
					//full cross
					case 2:
						cardGrid[_xCoord+1][_yCoord] = player;
						cardGrid[_xCoord-1][_yCoord] = player;
						cardGrid[_xCoord][_yCoord+1] = player;
						cardGrid[_xCoord][_yCoord-1] = player;
						cardGrid[_xCoord][_yCoord] = player;
						break;
				
				
				}
			
			
				placeTurn--;
				placeType = choose(0,1,2);
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
