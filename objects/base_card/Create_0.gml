name = "DefaultN";
text = "DefaultT";
energy = 0;
art_sprite = noone;
card_sprite = spr_card;

center_x = x;
energy_y = y
name_y = y + 48;
text_y = y + 72;

card_original_y = y
target_y = y - 64;

in_hand = false
state_moving = false
endx = x

// card_effects will be object with key from CARD_EFFECTS:Int
// affects with no need for number will just be 0
/*
attack
block
strength
siphon
weak
push
pull
exhaust
innate
fatal
ritual
retain
*/
card_effects = {}