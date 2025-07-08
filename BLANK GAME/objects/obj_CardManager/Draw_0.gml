var i = 0;
var j = 0;
repeat(gridSize){
	repeat(gridSize){
		if cardGrid[i][j] == 0{
			draw_set_colour(c_black)
			draw_rectangle(x1+i*cellSize,x1+j*cellSize,x1+(i+1)*cellSize,x1+(j+1)*cellSize,true)
		}
		if cardGrid[i][j] == 1{
			draw_set_colour(c_blue)
			draw_rectangle(x1+i*cellSize,x1+j*cellSize,x1+(i+1)*cellSize,x1+(j+1)*cellSize,false)
		}
		if cardGrid[i][j] == 2{
			draw_set_colour(c_green)
			draw_rectangle(x1+i*cellSize,x1+j*cellSize,x1+(i+1)*cellSize,x1+(j+1)*cellSize,false)
		}
		if cardGrid[i][j] == 3{
			draw_set_colour(c_yellow)
			draw_rectangle(x1+i*cellSize,x1+j*cellSize,x1+(i+1)*cellSize,x1+(j+1)*cellSize,false)
		}
		i++;
	}
	j++;
	i = 0;
}

//set ghost colour to player colour
switch(player){
	case 1:
		playerColour = c_blue;
		break;
	case 2:
		playerColour = c_green;
		break;
	case 3:
		playerColour = c_yellow;
		break;
}

//draw the placement
shader_set(shd_Players);

shader_set_uniform_f_array(u_rgb,
	[colour_get_red(playerColour),
	colour_get_green(playerColour),
	colour_get_blue(playerColour)]);
draw_self();
shader_reset();