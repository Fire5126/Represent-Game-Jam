var i = 0;
var j = 0;
var difpoints = 0;
var samepoints = 0;
repeat(gridSize){
	repeat(gridSize){
		var matchingNeighbour = 0;
		var differentNeighbour = 0;
		var k = 1;
		repeat(global.PLAYERNUMB)
		{
			if cardGrid[i][j] == k
			{
				if (i < gridSize) if (cardGrid[i+1][j] == k) matchingNeighbour++;
				if (i != 0) if (cardGrid[i-1][j] == k) matchingNeighbour++;
				if (j < gridSize) if (cardGrid[i][j+1] == k) matchingNeighbour++;
				if (j != 0 )if (cardGrid[i][j-1] == k) matchingNeighbour++;
				if (matchingNeighbour > 0){
					samepoints++;
					draw_set_colour(c_white)
					draw_set_alpha(0.3);
					draw_rectangle(x1+i*cellSize,x1+j*cellSize,x1+(i+1)*cellSize,x1+(j+1)*cellSize,false)
					draw_set_alpha(1);
				}
		
				if (matchingNeighbour > 2){
					samepoints -= 5;
					draw_set_colour(c_black)
					draw_set_alpha(0.3);
					draw_rectangle(x1+i*cellSize,x1+j*cellSize,x1+(i+1)*cellSize,x1+(j+1)*cellSize,false)
					draw_set_alpha(1);
				}
				
				if (i < gridSize) if (cardGrid[i+1][j] != k) && (cardGrid[i+1][j] != 0) differentNeighbour++;
				if (i != 0) if (cardGrid[i-1][j] != k) && (cardGrid[i-1][j] != 0) differentNeighbour++;
				if (j < gridSize) if (cardGrid[i][j+1] != k) && (cardGrid[i][j+1] != 0) differentNeighbour++;
				if (j != 0 ) if (cardGrid[i][j-1] != k) && (cardGrid[i+1][j-1] != 0) differentNeighbour++;
				if (differentNeighbour > 0){
					difpoints++;
					draw_set_colour(c_white)
					draw_set_alpha(0.3);
					draw_rectangle(x1+i*cellSize,x1+j*cellSize,x1+(i+1)*cellSize,x1+(j+1)*cellSize,false)
					draw_set_alpha(1);
				}
				if (differentNeighbour > 2){
					difpoints -= 5;
					draw_set_colour(c_black)
					draw_set_alpha(0.3);
					draw_rectangle(x1+i*cellSize,x1+j*cellSize,x1+(i+1)*cellSize,x1+(j+1)*cellSize,false)
					draw_set_alpha(1);
				}
			}
			k++;
		}
		i++;
	}
	j++;
	i = 0;
}	
draw_set_colour(c_black);
draw_set_font(fnt_Game)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_alpha(1)
draw_text(room_width/2,30,samepoints)
//draw_text(room_width/2,30,difpoints)
//draw_text(room_width/5*3,80,test)