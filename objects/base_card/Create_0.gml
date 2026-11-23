name = "DefaultN";
text = "DefaultT";
energy = 0;
art_sprite = noone;
card_sprite = spr_base_card;

center_x = x + sprite_width / 2;
energy_y = y + 8
name_y = y + 48;
text_y = y + 72;

card_y = y;
target_y = y - 64;

// card_affects will be object with key from CARD_EFFECTS:Int
// affects with no need for number will just be 0
/*
attack
block
strength
siphon
weak
shuffle
push
pull
exhaust
innate
fatal
ritual
retain
*/
card_affects = {}