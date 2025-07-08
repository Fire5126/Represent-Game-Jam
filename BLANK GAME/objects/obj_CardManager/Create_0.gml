gridSize = 20;

player = 1;

placements = 3;
placeTurn = 3;

cellSize = (room_width/gridSize)*2/3;

image_xscale = cellSize;
image_yscale = cellSize;

x1 = room_width/6;

placeType = 0;

placeable = false;

var i = 0;
var j = 0;
repeat(gridSize+1){
	repeat(gridSize+1){
		cardGrid[i][j] = 0;
		i++;
	}
	j++;
	i = 0;
}

u_rgb = shader_get_uniform(shd_Players, "u_rgb");