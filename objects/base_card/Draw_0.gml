if (in_hand) { // draws the sprite when in hand
	draw_sprite(card_sprite, image_index, x, card_y);
	var prev_halign = draw_get_halign()
	var prev_valign = draw_get_valign()
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);

	// draw card info
	draw_text(center_x - sprite_width / 2 + 55, energy_y + 15, string(energy));
	draw_text(center_x, energy_y + 15, name);
	draw_text(center_x, text_y + 75, text);

	draw_set_halign(prev_halign);
	draw_set_valign(prev_valign);
}