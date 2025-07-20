draw_set_colour(c_white);
draw_rectangle(room_width*2/6,room_height/20,room_width*4/6,room_height*2/15,false);

draw_set_colour(c_black);
draw_set_font(fnt_Game)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_alpha(1)
//draw_text(room_width/2,30,samepoints)

if (finished) draw_set_colour(CreateRandomColour());
draw_text(room_width/2,room_height/10,"Points " + string(difpoints))
//draw_text(room_width/5*1,40,test)
