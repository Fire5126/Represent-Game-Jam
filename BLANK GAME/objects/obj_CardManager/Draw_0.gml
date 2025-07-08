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