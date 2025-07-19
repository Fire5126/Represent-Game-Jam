var i = 0;
var j = 0;
var difpoints = 0;
var addedPoints = 0;
repeat(global.GRIDSIZE){
	repeat(global.GRIDSIZE){
		var matchingNeighbour = 0;
		var differentNeighbour = 0;
		var k = 1;
		repeat(global.PLAYERNUMB)
		{
			if cardGrid[i][j] == k
			{
				addedPoints = 0
				if (i < global.GRIDSIZE) if (cardGrid[i+1][j] == k) matchingNeighbour++;
				if (i != 0) if (cardGrid[i-1][j] == k) matchingNeighbour++;
				if (j < global.GRIDSIZE) if (cardGrid[i][j+1] == k) matchingNeighbour++;
				if (j != 0 )if (cardGrid[i][j-1] == k) matchingNeighbour++;
				/*if (matchingNeighbour > 0){
					samepoints++;
					draw_set_colour(c_white)
					draw_set_alpha(0.5);
					draw_rectangle(x1+i*cellSize,x1+j*cellSize,x1+(i+1)*cellSize,x1+(j+1)*cellSize,true)
					draw_set_alpha(1);
				}
		
				if (matchingNeighbour > 3){
					samepoints += 2;
					draw_set_colour(c_black)
					draw_set_alpha(0.5);
					draw_rectangle(x1+i*cellSize,x1+j*cellSize,x1+(i+1)*cellSize,x1+(j+1)*cellSize,true)
					draw_set_alpha(1);
				}*/
				
				if (i < global.GRIDSIZE) if (cardGrid[i+1][j] != k) && (cardGrid[i+1][j] != 0) differentNeighbour++;
				if (i != 0) if (cardGrid[i-1][j] != k) && (cardGrid[i-1][j] != 0) differentNeighbour++;
				if (j < global.GRIDSIZE) if (cardGrid[i][j+1] != k) && (cardGrid[i][j+1] != 0) differentNeighbour++;
				if (j != 0 ) if (cardGrid[i][j-1] != k) && (cardGrid[i+1][j-1] != 0) differentNeighbour++;
				if (differentNeighbour > 2){
					addedPoints += 5;
					draw_set_colour(c_black)
					draw_set_alpha(0.5);
					draw_rectangle(x1+i*cellSize,x1+j*cellSize,x1+(i+1)*cellSize,x1+(j+1)*cellSize,true)
					draw_set_alpha(1);
				}
				else if (differentNeighbour > 1){
					addedPoints += 2;
					draw_set_colour(c_white)
					draw_set_alpha(0.5);
					draw_rectangle(x1+i*cellSize,x1+j*cellSize,x1+(i+1)*cellSize,x1+(j+1)*cellSize,true)
					draw_set_alpha(1);
				}
				addedPoints = clamp(addedPoints, 0, 50);
				difpoints += addedPoints;
			}
			k++;
		}
		i++;
	}
	j++;
	i = 0;
}	
draw_set_colour(c_white);
draw_rectangle(room_width*2/6,room_height/20,room_width*4/6,room_height*2/15,false);

draw_set_colour(c_black);
draw_set_font(fnt_Game)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_alpha(1)
//draw_text(room_width/2,30,samepoints)

draw_text(room_width/2,room_height/10,"Points " + string(difpoints))
//draw_text(room_width/5*1,40,test)
