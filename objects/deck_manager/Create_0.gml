// base deck --> every card in the deck
// change to cur deck instead for battles
global.base_deck = []
for (var i = 0; i < 3; i++) {
	// create the instances off screen
	var strike = instance_create_depth(-200, -200, 0, a_strike)
	var block = instance_create_depth(-200, -200, 0, a_block)
	var draw = instance_create_depth(-200, -200, 0, a_draw_test)
	array_push(global.base_deck, strike);
	array_push(global.base_deck, block);
	// testing
	array_push(global.base_deck, draw);
}

// just copy the base deck to the in combat deck, and then shuffle it
deck = array_create(array_length(global.base_deck));
array_copy(deck, 0, global.base_deck, 0, array_length(global.base_deck));
array_shuffle_ext(deck);

hand = [];
hand_needs_rebuild = false;
// for now hand just draw 5 from deck and removes those from the deck
for (var i = 0; i < 5; i++) {
	var next_card = array_pop(deck)
	next_card.in_hand = true
	array_push(hand, next_card);
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
	ENEMY_TURN,
	END_BATTLE,
	NOTHING,
}

global.game_state = GAME_STATE.START_BATTLE;
global.enemy_turn = 0;
global.enemy_actions_remaining = 0;

card_width = 128;
card_offset = card_width / 8;
card_height = 200;
