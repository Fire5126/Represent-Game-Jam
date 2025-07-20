player = 1;

//this variable controls how many blocks are placed per player turn
placementTurns = 3;
placeTurn = placementTurns;

//sets the size of each individual cell
cellSize = (room_width/global.GRIDSIZE)*2/3;

//makes the tiles the size of the cells when drawn
image_xscale = cellSize;
image_yscale = cellSize;

//this sets the margins of the board from the edge of the screen
x1 = room_width/6;

//controls when a placement can be made
placeable = false;

/*
tracks the number of tiles placed, used in non-endless 
games to track when to finish. Otherwise the game will crash
trying to access shapes outside the array's range.
*/
placements = 0;

/*
creates the baord, a two dimensional array with an initial value of 0 in
all spaces.
*/
var i = 0;
var j = 0;
repeat(global.GRIDSIZE+1){
	repeat(global.GRIDSIZE+1){
		cardGrid[i][j] = 0;
		i++;
	}
	j++;
	i = 0;
}

/*this grabs the uniform (variable) index from the shader to be used later
when drawing the tile's colours
*/
u_rgb = shader_get_uniform(shd_Players, "u_rgb");

//declaring the playerColour variable and using a placeholder value.
playerColour = c_yellow;


/*
	These are all the patterns in the game stored in one large array.
	Each entry itself is an array which contains an array for every space
	a pattern occupies. [0,0] corresponds to the base x, y of the space selected
	with [-1,0] corresponding to one tile to the left.
*/
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
[[0,-1], [-1,1]],
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


/*
this declares the order array which is used to decide which patterns come in what order
and fills each entry from 0 to the length of the pattern array.
*/
repeat(array_length(patterns)) {
	order[i] = i;
	i++;
}


//this randomises the order of the numbers in the array, randomising the order of the patterns in game.
i = 0;
var holder;
randomize();

repeat(array_length(patterns)) {
	target = irandom(array_length(patterns) - 1);
	holder = order[i];
	order[i] = order[target];
	order[target] = holder;
	i++;
}

//turns true once all patterns have been used up/when placements equalss the length of the patterns array.
finished = false;

//test variable
test = 0;

//points
difpoints = 0;
