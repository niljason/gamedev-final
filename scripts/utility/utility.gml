function print(str){
	show_debug_message(str)
}

function reset() {
	with (all) {
		instance_destroy()	
	}
	room_goto(rm_main)
}

function hover() {
	var _mouse_x_gui = device_mouse_x_to_gui(0);
	var _mouse_y_gui = device_mouse_y_to_gui(0);
	return position_meeting(_mouse_x_gui, _mouse_y_gui, id)
}

function draw_card_at(_card, _x, _y) {
	var _previous_halign = draw_get_halign();
	var _previous_valign = draw_get_valign();
	var _previous_colour = draw_get_colour();
	var _previous_alpha = draw_get_alpha();

	draw_sprite_ext(_card.card_sprite, _card.image_index, _x, _y,
		_card.image_xscale, _card.image_yscale, _card.image_angle,
		_card.image_blend, _card.image_alpha);

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_colour(c_white);
	draw_set_alpha(1);
	draw_text(_x - global.card_width / 2 + 55, _y - global.card_height / 2 + 15, string(_card.energy));
	draw_text(_x, _y - global.card_height / 2 + 15, _card.name);
	draw_text(_x, _y - global.card_height / 2 + 147, _card.text);

	draw_set_halign(_previous_halign);
	draw_set_valign(_previous_valign);
	draw_set_colour(_previous_colour);
	draw_set_alpha(_previous_alpha);
}
