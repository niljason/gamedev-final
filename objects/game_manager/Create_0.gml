global.card_width = 256;
global.card_height = 256;
global.card_offset = -64;
global.input_locked = false;

game_font = font_add("LinLibertine_RZ.ttf", 18, false, false, 32, 128)
font_enable_sdf(game_font, true)
font_enable_effects(game_font, true, {
    outlineEnable: true,
    outlineDistance: 2,
    outlineColour: c_black
});

draw_set_font(game_font)
