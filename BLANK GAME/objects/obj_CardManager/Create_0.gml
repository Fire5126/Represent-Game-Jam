gridSize = 10;

player = 1;

placementTurns = 1;
placeTurn = 1;

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
//cross
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
[[-1,-1], [0,0], [1,0]]
];

i = 0;

repeat(array_length(patterns)) {
	order[i] = i;
	i++;
}

i = 0
var holder;

repeat(array_length(patterns)) {
	target = irandom(array_length(patterns) - 1);
	holder = order[i];
	order[i] = order[target];
	order[target] = holder;
	i++;
}


sprite_index = -1;
randomize();

test = 0;

finished = false;