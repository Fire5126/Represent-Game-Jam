gridSize = 5;

player = 1;

placements = 3;
placeTurn = 3;

cellSize = (room_width/gridSize)*2/3;

x1 = room_width/6;

placeType = 1;

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
