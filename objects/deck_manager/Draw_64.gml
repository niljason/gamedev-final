var _handsize = array_length(hand);


var _x = room_width / 2 - (_handsize - 1) * (card_width + card_offset) / 2;


for (var i = 0; i < _handsize; i++) {
	var _cardX = _x + (card_width + card_offset) * i;
	draw_card(_cardX, 500, card_width, card_height, hand[i]);
}