gridSize = 8;

player = 1;

placementTurns = 3;
placeTurn = 3;

cellSize = (room_width/gridSize)*2/3;

image_xscale = cellSize;
image_yscale = cellSize;

x1 = room_width/6;

placeType = 0;

placeable = false;

placements = 0;

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
playerColour = c_yellow;


patterns = [
//up z
[ [0,0], [1,0], [0,-1], [1,1] ],
//line right
[[0,0], [1,0]], 
//line up
[[0,0], [0,1]],
//diagonal right down
[[0,0], [1,-1]],
//clover
[[0,0], [-1,1], [1,1], [-1,-1], [1,-1]], 
//hollow cross
[[-1,0], [0,1], [1,0], [0,-1]], 
//diagonal left down
[[0,0], [-1,-1]], 
//left concave curve
[[-1,1], [0,0], [1,0]], 
//full cross
[[-1,0], [0,0], [0,1], [0,-1], [1,0]], 
//rightward diagonal
[[-1,-1], [0,0], [1,1]], 
//right concave curve
[[-1,0], [0,0], [1,1]], 
//leftward diagonal
[[-1,1], [0,0], [1,-1]], 
//right convex curve
[[-1,0], [0,0], [1,-1]], 
//c
[[0,0], [0,1], [0,-1], [1,1], [1,-1]], 
//left convex curve
[[-1,-1], [0,0], [1,0]],
//left jump
[[0,-1], [1,0]],
//right jump
[[0,-1], [1,1]],
//up right corner
[[0,0], [0,1], [1,0]],
//up left corner
[[-1,0], [0,0], [0,1]],
//down right corner
[[0,0], [0,-1], [1,0]],
//down left corner
[[-1,0], [0,0], [0,-1]]];

i = 0;

repeat(array_length(patterns)) {
	order[i] = i;
	i++;
}

i = 0
var holder;
randomize();

repeat(array_length(patterns)) {
	target = irandom(array_length(patterns) - 1);
	holder = order[i];
	order[i] = order[target];
	order[target] = holder;
	i++;
}


sprite_index = -1;

test = 0;

finished = false;