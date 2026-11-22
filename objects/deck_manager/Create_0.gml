// didnt make deck create instances, just stores card types in deck
deck = [];
for (var i = 0; i < 6; i++) {
	// var _card = instance_create_layer(0, 0, 0, a_strike);
	array_push(deck, a_strike);
	array_push(deck, a_block);
}

// shuffle deck
array_shuffle_ext(deck);

// hand stores card types in hand
hand = [];
// hand instances stores instances created for display
hand_instances = [];
hand_needs_rebuild = false;
// for now hand just draw 5 from deck and deletes them from deck from deck
for (var i = 0; i < 5; i++) {
	array_push(hand, array_pop(deck));
}

discard = [];
exhaust = [];

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

global.game_state = GAME_STATE.START_BATTLE;

card_width = 128;
card_offset = card_width / 8;
card_height = 200;
