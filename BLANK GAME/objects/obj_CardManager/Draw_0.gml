var i = 0;
var j = 0;
repeat(gridSize){
	repeat(gridSize){
		if cardGrid[i][j] == 0{
			draw_set_colour(c_black)
			draw_rectangle(x1+i*cellSize,x1+j*cellSize,x1+(i+1)*cellSize,x1+(j+1)*cellSize,true)
		}
		if cardGrid[i][j] == 1{
			draw_set_colour(global.p1Colour)
			draw_rectangle(x1+i*cellSize,x1+j*cellSize,x1+(i+1)*cellSize,x1+(j+1)*cellSize,false)
		}
		if cardGrid[i][j] == 2{
			draw_set_colour(global.p2Colour)
			draw_rectangle(x1+i*cellSize,x1+j*cellSize,x1+(i+1)*cellSize,x1+(j+1)*cellSize,false)
		}
		if cardGrid[i][j] == 3{
			draw_set_colour(global.p3Colour)
			draw_rectangle(x1+i*cellSize,x1+j*cellSize,x1+(i+1)*cellSize,x1+(j+1)*cellSize,false)
		}
		i++;
	}
	j++;
	i = 0;
}


//draw ghost block
if !finished{
	i = 0;
	var _xOff = 0;
	var _yOff = 0;
	var _pattern = order[placements];
	repeat(array_length(patterns[_pattern]))
	{
		_xOff = patterns[order[placements]][i][0];
		_yOff = patterns[order[placements]][i][1];
		draw_sprite_ext(spr_Tile,0,mouse_x-cellSize/2-_xOff*cellSize,mouse_y-cellSize/2-_yOff*cellSize,cellSize,cellSize,0,playerColour,1);
		i++;
	}
}



//set ghost colour to player colour
playerColour = variable_global_get("p"+string(player)+"Colour");

//draw the placement
shader_set(shd_Players);

shader_set_uniform_f_array(u_rgb,
	[colour_get_red(playerColour),
	colour_get_green(playerColour),
	colour_get_blue(playerColour)]);
draw_self();
shader_reset();