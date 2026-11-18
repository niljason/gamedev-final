var _handsize = array_length(hand);

var _x = room_width / 2;


for (var _i = 0; _i < _handsize; _i++) {
	var _cardX = _x - (_handsize - 1) * 100;
	draw_card(_cardX, 500, hand[_i]);
}