name = "DefaultN";
text = "DefaultT";
energy = 0;
art_sprite = noone;
card_sprite = spr_base_card;


center_x = x;
energy_y = y + 8
name_y = y + 48;
text_y = y + 72;

card_y = room_height - 168;
target_y = card_y - 64;

in_hand = false

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