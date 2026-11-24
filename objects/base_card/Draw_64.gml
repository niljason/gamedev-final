draw_sprite(card_sprite, image_index, x, card_y);

draw_set_halign(fa_center);
draw_set_valign(fa_center);

// draw card info
draw_text(center_x - sprite_width / 2 + 8, energy_y, string(energy));
draw_text(center_x, name_y, name);
draw_text(center_x, text_y, text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
