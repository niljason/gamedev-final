// base deck --> every card in the deck
// change to cur deck instead for battles
global.base_deck = []
draw = []
for (var i = 0; i < 5; i++) {
	// create the instances off screen
	var _deckx = draw_pile_hud.x
	var _strike = instance_create_depth(_deckx, -200, 0, a_strike)
	var _block = instance_create_depth(_deckx, -200, 0, a_block)
	array_push(global.base_deck, _strike);
	array_push(global.base_deck, _block);
	
	var _draw = instance_create_depth(_deckx, -200, 0, a_draw_test)
	array_push(global.base_deck, _draw);
	
	var pull = instance_create_depth(_deckx, -200, 0, a_pull_test)
	array_push(global.base_deck, pull);
	var push = instance_create_depth(_deckx, -200, 0, a_push_test)
	array_push(global.base_deck, push);
	
	/* testing card effects
	var ritual = instance_create_depth(_deckx, -200, 0, a_ritual_test)
	array_push(global.base_deck, ritual);
	var weak = instance_create_depth(_deckx, -200, 0, a_weak_test)
	array_push(global.base_deck, weak);
	var strength = instance_create_depth(_deckx, -200, 0, a_strength_test)
	array_push(global.base_deck, strength);
	var pull = instance_create_depth(_deckx, -200, 0, a_pull_test)
	array_push(global.base_deck, pull);
	var push = instance_create_depth(_deckx, -200, 0, a_push_test)
	array_push(global.base_deck, push);
	*/
}

// copy the base deck into the draw pile and then shuffle it
draw = array_create(array_length(global.base_deck));
array_copy(draw, 0, global.base_deck, 0, array_length(global.base_deck));
array_shuffle_ext(draw);

hand = [];
discard = [];
exhaust = [];

hand_needs_reposition = false
hand_y = room_height;
turn_start_draw = 5;
// for now hand just draw 5 from draw and removes those from the draw

base_energy = 3;
combat_energy = base_energy
energy_count = base_energy;
enum GAME_STATE {
	START_BATTLE,
	START_TURN,
	PLAYER_TURN,
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

function draw_cards(num_cards) {
	for (var i = 0; i < num_cards; i++) {
		if (array_length(draw) <= 0 && array_length(discard) > 0) {
			// Move all discarded cards into the empty draw pile, then shuffle it.
			draw = discard
			discard = []
			array_shuffle_ext(draw);
		}

		if (array_length(draw) <= 0) {
			// no cards remain in either pile
			return
		}
		
		// we can always determine where the y of the card is supposed to be
		var next_card = array_pop(draw)
		next_card.y = hand_y
		next_card.card_original_y = hand_y
		next_card.target_y = hand_y - global.card_height / 2
		next_card.in_hand = true
		array_push(hand, next_card);
		hand_needs_reposition = true
	}
}
draw_cards(turn_start_draw);
