gridSize = 7;
player = 1;
placements = 3;
placeTurn = 3;

cellSize = (room_width/gridSize)*2/3;

x1 = room_width/6;

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


patterns = [[[0,0], [1,0], [0,-1], [1,1]], 
[[0,0], [1,0]], 
[[0,0], [0,1]], 
[[0,0], [1,-1]], 
[[0,0], [-1,1], [1,1], [-1,-1], [1,-1]], 
[[-1,0], [0,1], [1,0], [0,-1]], 
[[0,0], [-1,-1]], 
[[-1,1], [0,0], [1,0]], 
[[-1,0], [0,0], [0,1], [0,-1], [1,0]], 
[[-1,-1], [0,0], [1,1]], 
[[-1,0], [0,0], [1,1]], 
[[-1,1], [0,0], [1,-1]], 
[[-1,0], [0,0], [1,-1]], 
[[0,0], [0,1], [0,-1], [1,1], [1,-1]], 
[[-1,-1], [0,0], [1,0]]];

i = 0;

repeat(array_length(patterns)) {
	order[i] = i;
	i++;
}

i = 0
var holder;

repeat(array_length(patterns)) {
	target = irandom(array_length(patterns) - 1)
	holder = order[i];
	order[i] = order[target];
	order[target] = [holder];
}