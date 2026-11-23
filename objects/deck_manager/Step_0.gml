if (global.game_state == GAME_STATE.START_BATTLE) {
	global.game_state = GAME_STATE.START_TURN;
}
else if (global.game_state == GAME_STATE.PLAY_CARD) {
	global.game_state = GAME_STATE.START_TURN;
}
else if (global.game_state == GAME_STATE.END_TURN) {
	// discard all remaining cards ---- modify for ethereal, etc
	while (array_length(hand) > 0) {
		array_push(discard, array_pop(hand));
	}

	for (var i = 0; i < 5; i++) {
		if (array_length(deck) <= 0 && array_length(discard) > 0) {
			// draw from remaining deck and then shuffle if needed
			deck = discard;
			discard = [];
			array_shuffle_ext(deck);
		}

		if (array_length(deck) <= 0) {
			// no cards remain anywhere
			break;
		}

		array_push(hand, array_pop(deck));
	}

	energy_count = start_turn_energy;
	hand_needs_rebuild = true;
	global.game_state = GAME_STATE.START_TURN;
}

// check whether the card instances need to be recreated or repositioned
var _hand_size = array_length(hand);
var _needs_rebuild = hand_needs_rebuild || _hand_size != array_length(hand_instances);
var _hand_start_x = room_width / 2 - (_hand_size - 1) * (card_width + card_offset) / 2;
var _hand_y = display_get_gui_height() - 168;

if (!_needs_rebuild) {
	for (var i = 0; i < _hand_size; i++) {
		if (!instance_exists(hand_instances[i])) {
			_needs_rebuild = true;
			break;
		}
	}
}

// recreate the hand when its data and instance list no longer match
if (_needs_rebuild) {
	// clear the old card objects before rebuilding their layout
	for (var i = 0; i < array_length(hand_instances); i++) {
		if (instance_exists(hand_instances[i])) {
			instance_destroy(hand_instances[i]);
		}
	}

	hand_instances = [];
	for (var i = 0; i < _hand_size; i++) {
		var _card_x = _hand_start_x + (card_width + card_offset) * i;
		draw_card(id, _card_x, _hand_y, hand[i]);
	}
	hand_needs_rebuild = false;
}
else {
	// move existing card objects into their current hand positions
	for (var i = 0; i < _hand_size; i++) {
		var _card_x = _hand_start_x + (card_width + card_offset) * i;
		hand_instances[i].x = lerp(hand_instances[i].x, _card_x, 0.15);
		hand_instances[i].y = _hand_y;
	}
}
