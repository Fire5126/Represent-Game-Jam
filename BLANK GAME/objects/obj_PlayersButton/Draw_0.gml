draw_set_colour(players[playerSelection][2]);
draw_circle(x,y,20,false);
draw_sprite_ext(players[playerSelection][1],0,x,y,4,4,0,c_white,1);
draw_set_font(fnt_mune);
draw_text(x+30,y-20,players[playerSelection][0])

