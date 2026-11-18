deck = [];
for (var i = 0; i < 6; i++) {
	var _card = instance_create_layer(0, 0, 0, a_strike);
	array_push(deck, _card);
}

hand = []
for (var i = 0; i < 6; i++) {
	var _card = instance_create_layer(0, 0, 0, a_strike);
	array_push(hand, a_strike);
}

discard = []

exhaust = []

start_turn_energy = 3;
energy_count = start_turn_energy;


enum GAME_STATE {
	START_BATTLE,
	START_TURN,
	PLAY_CARD,
	CARD_STUFF,
	END_TURN,
	END_BATTLE,
	NOTHING,
}

card_width = 128;
card_offset = card_width / 8;
card_height = 200;