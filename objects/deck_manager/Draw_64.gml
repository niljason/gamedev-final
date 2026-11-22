var _handsize = array_length(hand);


var _x = room_width / 2 - (_handsize - 1) * (card_width + card_offset) / 2;

// if instances don't match whats in hand
if(_handsize != array_length(hand_instances)) {
	// temp just deletes all for now
	instance_destroy(base_card)
	for (var i = 0; i < _handsize; i++) {
		var _cardX = _x + (card_width + card_offset) * i;
		draw_card(_cardX, 600, hand[i])
	}
}

// print(string(hand))