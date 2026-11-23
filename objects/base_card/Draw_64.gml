// draw card sprite
// can now lerp it
draw_sprite(card_sprite, image_index, x, card_y);

// draw hb for testing
// (disabled; collision is handled in the Step event.)
draw_set_halign(fa_center);
draw_set_valign(fa_center);

// draw card info
draw_text(x+8, energy_y, string(energy));
draw_text(center_x, name_y, name);
draw_text(center_x, text_y, text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
