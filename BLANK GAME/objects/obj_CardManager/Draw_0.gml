var i = 0;
var j = 0;
var offset = 0;
repeat(global.GRIDSIZE){
	repeat(global.GRIDSIZE){
		if cardGrid[i][j] == 0{
			draw_set_colour(c_black)
			draw_rectangle(x1+i*cellSize,x1+j*cellSize,x1+(i+1)*cellSize,x1+(j+1)*cellSize,true)
		}
		else{
			draw_set_colour(variable_global_get("p"+string(cardGrid[i][j])+"Colour"))
			if (finished) offset = random_range(-1,1)*cellSize/30
			draw_rectangle(x1+i*cellSize+offset,x1+j*cellSize+offset,x1+(i+1)*cellSize+offset,x1+(j+1)*cellSize+offset,false)
		}
		i++;
	}
	j++;
	i = 0;
}


//set ghost colour to player colour
playerColour = variable_global_get("p"+string(player)+"Colour");

if !is_numeric(playerColour){
	playerColour = CreateRandomColour();
	variable_global_set("p"+string(player)+"Colour",playerColour);
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





//////draw the placement

////shader_set(shd_Players);

////shader_set_uniform_f_array(u_rgb,
////	[color_get_red(playerColour),
////	color_get_green(playerColour),
////	color_get_blue(playerColour)]);
draw_self();
////shader_reset();