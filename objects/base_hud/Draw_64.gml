var _blend = c_white;
if (hovered) {
	_blend = c_aqua;
}
if (click_timer > 0) {
	_blend = c_yellow;
}

draw_sprite_ext(sprite_index, 0, hud_x, hud_y, 1, 1, 0, _blend, 1);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
