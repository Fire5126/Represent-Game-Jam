if mouse_check_button_pressed(mb_left) && !finished
{
	//checks if the mouse is on the board
	if mouse_x < cellSize*global.GRIDSIZE+x1 && mouse_x > x1 && mouse_y < cellSize*global.GRIDSIZE+x1 && mouse_y > x1
	{
		//grab the cell's x and y position on the board based off mouse position.
		var _xCoord = floor((mouse_x-x1)/cellSize);
		var _yCoord = floor((mouse_y-x1)/cellSize);
		//set placeable to be true by default
		placeable = true;
		//get the current pattern shape in the queue
		var _pattern = order[placements];
		
		//check if each point on the pattern can be placed or not
		var i = 0;
		repeat(array_length(patterns[_pattern]))
		{
			//get the x and y of the tile being checked in the pattern
			var _xComponent = _xCoord-patterns[order[placements]][i][0];
			var _yComponent = _yCoord-patterns[order[placements]][i][1];
			//if it is on the board...
			if _xComponent > -1 && _xComponent < global.GRIDSIZE &&
			_yComponent > -1 && _yComponent < global.GRIDSIZE
			{
				//...and the space isn't occupied, it remains placeable
				if cardGrid[_xComponent][_yComponent] != 0
				{
					//otherwise it can't be placed
					placeable = false;
				}
				i++;
			}
			else{
				placeable = false;
			}			
		}
		//if the pattern is placeable, for each tile set the corresponding place on the board to the player 
		if placeable
		{
			audio_play_sound(Pick_up, 1, false, global.SFXSLIDER);
			i = 0;
			repeat(array_length(patterns[_pattern]))
			{
				cardGrid[_xCoord-patterns[_pattern][i][0]][_yCoord-patterns[_pattern][i][1]] = player;
				i++;
			}		
			placeTurn--;
			placements++;
			if placements == array_length(order){
				if !global.ENDLESS{					
					finished = true;
				}else{
					randomize();
					i = 0
					repeat(array_length(patterns)) {
						order[i] = i;
						i++;
						}
					i = 0;
					repeat(array_length(patterns)) {
						target = irandom(array_length(patterns) - 1);
						var holder = order[i];
						order[i] = order[target];
						order[target] = holder;
						i++;
					}					
					placements = 0;
				}	
			}


			//calculate points
			i = 0;
			repeat(array_length(patterns[_pattern]))
			{
				//get the x and y of the tile being checked in the pattern
				var _xComponent = _xCoord-patterns[_pattern][i][0];
				var _yComponent = _yCoord-patterns[_pattern][i][1];
				var differentNeighbour = 0;
		
				//checking neighbors							
				if (_xComponent < global.GRIDSIZE){
					if (cardGrid[_xComponent+1][_yComponent] != player) && (cardGrid[_xComponent+1][_yComponent] != 0){
						var k = 0;
						repeat(5){
							instance_create_depth(x1+_xComponent*cellSize+cellSize,x1+_yComponent*cellSize+cellSize*k/4,0,obj_Particle,{
								colour : variable_global_get("p"+string(player)+"Colour"),
								player : player
								});
							k++;
						}
						differentNeighbour++;
					}
				}
				if (_xComponent != 0){
					if (cardGrid[_xComponent-1][_yComponent] != player) && (cardGrid[_xComponent-1][_yComponent] != 0){
						var k = 0;
						repeat(5){
							instance_create_depth(x1+_xComponent*cellSize,x1+_yComponent*cellSize+cellSize*k/4,0,obj_Particle,{
							colour : variable_global_get("p"+string(player)+"Colour"),
							player : player
							});
							k++;
						}
						differentNeighbour++;
					}
				}
				if (_yComponent < global.GRIDSIZE){
					if (cardGrid[_xComponent][_yComponent+1] != player) && (cardGrid[_xComponent][_yComponent+1] != 0){
						var k = 0;
						repeat(5){
							instance_create_depth(x1+_xComponent*cellSize+cellSize*k/4,x1+_yComponent*cellSize+cellSize,0,obj_Particle,{
								colour : variable_global_get("p"+string(player)+"Colour"),
								player : player
								});
							k++;
						}
						differentNeighbour++;
					}
				}
				if (_yComponent != 0 ){
					if (cardGrid[_xComponent][_yComponent-1] != player) && (cardGrid[_xComponent][_yComponent-1] != 0){
						var k = 0;
						repeat(5){
							instance_create_depth(x1+_xComponent*cellSize+cellSize*k/4,x1+_yComponent*cellSize,0,obj_Particle,{
								colour : variable_global_get("p"+string(player)+"Colour"),
								player : player
								});
								k++;
						}
						differentNeighbour++;
					}
				}
							
				difpoints += differentNeighbour;
				
				i++;
			}



				
			//check if game finished
			finished = true;
			var free = 0;
			var _y = 0;
			repeat(global.GRIDSIZE){
				var _x = 0;
				repeat(global.GRIDSIZE){
					i = 0;
					free = 0;
					repeat(array_length(patterns[order[placements]]))
					{
						//get the x and y of the tile being checked in the pattern
						var _xComponent = _x-patterns[order[placements]][i][0];
						var _yComponent = _y-patterns[order[placements]][i][1];
						//if it is on the board...
						if _xComponent > -1 && _xComponent < global.GRIDSIZE &&
						_yComponent > -1 && _yComponent < global.GRIDSIZE
						{
							if cardGrid[_xComponent][_yComponent] == 0
							{
								free++;
							}
						}
						if free == array_length(patterns[order[placements]]){
							finished = false;
						}
						i++;
					}
					_x++;
				}
				_y++;
			}
			//cycle to the next player
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
	

//ghost placement
x = mouse_x-sprite_width/2;
y = mouse_y-sprite_height/2;