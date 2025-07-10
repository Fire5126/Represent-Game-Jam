draw_self();

draw_set_font(fnt_muneSmall);
draw_set_color(c_black);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _text = "on"
if (global.ENDLESS == false) var _text = "off"

draw_text(x,y, button_text+_text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);