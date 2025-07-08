if mouse_check_button_pressed(mb_left) && !finished
{
	//mouse on board
	if mouse_x < cellSize*gridSize+x1 && mouse_x > x1 && mouse_y < cellSize*gridSize+x1 && mouse_y > x1
	{
		//grab cell numbers
		var _xCoord = floor((mouse_x-x1)/cellSize);
		var _yCoord = floor((mouse_y-x1)/cellSize);
		//switch based on placement type to check if squares empty
		placeable = false;
		
		var i = 0;
		placeable = true;
		var _pattern = order[placements];
		repeat(array_length(patterns[_pattern]))
		{
			var _xComponent = _xCoord-patterns[order[placements]][i][0];
			var _yComponent = _yCoord-patterns[order[placements]][i][1];
			if _xComponent > -1 && _xComponent < gridSize &&
			_yComponent > -1 && _yComponent < gridSize
			{
				if cardGrid[_xComponent][_yComponent] != 0
				{
					placeable = false;
				}
				i++;
			}
			else{
				placeable = false;
			}
			
		}
			
			
			
			
			
		//place sqaures
		if placeable
		{
			audio_play_sound(Pick_up, 1, false);
			i = 0;
			repeat(array_length(patterns[_pattern]))
			{
				cardGrid[_xCoord-patterns[order[placements]][i][0]][_yCoord-patterns[order[placements]][i][1]] = player;
				i++;
			}
			
				
			
			
			placeTurn--;
			placements++;
			if placements == array_length(order){
				finished = true;
			}
			if placeTurn == 0{
				placeTurn = placementTurns;
				player++;
				if (player > global.PLAYERNUMB)
				{
					player = 1;
				}
			}
		}
	}
}
	
//placement colour

//ghost placement

x = mouse_x-sprite_width/2;
y = mouse_y-sprite_height/2;