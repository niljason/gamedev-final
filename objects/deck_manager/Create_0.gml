// base deck --> every card in the deck
// change to cur deck instead for battles
global.base_deck = []
for (var i = 0; i < 3; i++) {
	// create the instances off screen
	var _deckx = deck_pile_hud.x
	var strike = instance_create_depth(_deckx, -200, 0, a_strike)
	var block = instance_create_depth(_deckx, -200, 0, a_block)
	var draw = instance_create_depth(_deckx, -200, 0, a_draw_test)
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
hand_needs_reposition = false
hand_y = room_height - 168;
turn_start_draw = 5;
// for now hand just draw 5 from deck and removes those from the deck

function draw_cards(num_cards) {
	for (var i = 0; i < num_cards; i++) {
		if (array_length(deck) <= 0 && array_length(discard) > 0) {
			// Move all discarded cards into the empty draw pile, then shuffle it.
			deck = discard
			discard = []
			array_shuffle_ext(deck);
		}

		if (array_length(deck) <= 0) {
			// no cards remain in either pile
			return
		}
		
		// we can always determine where the y of the card is supposed to be
		var next_card = array_pop(deck)
		next_card.y = hand_y
		next_card.card_y = hand_y
		next_card.target_y = hand_y - 64
		next_card.in_hand = true
		array_push(hand, next_card);
		hand_needs_reposition = true
	}
}
draw_cards(turn_start_draw);

discard = [];
exhaust = [];

base_energy = 3;
energy_count = base_energy;
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
