if (global.game_state == GAME_STATE.START_BATTLE) {
	global.game_state = GAME_STATE.START_TURN;
} 
else if (global.game_state == GAME_STATE.START_TURN) {
	global.game_state = GAME_STATE.PLAYER_TURN;
	// set energy
	combat_energy = base_energy + floor(obj_player.status_effects.ritual/10)
	energy_count = combat_energy;
	global.enemy_turn += 1;
	global.enemy_actions_remaining = instance_number(enemy_base);
} else if (global.game_state == GAME_STATE.PLAY_CARD){
	global.game_state = GAME_STATE.PLAYER_TURN;
} else if (global.game_state == GAME_STATE.END_TURN) {
	// move all cards to the deck so it looks like drawing
	base_card.x = deck_pile_hud.x
	
	// discard hand (might need more code for retain cards)
	while (array_length(hand) > 0) {
		var discarded_card = array_pop(hand)
		discarded_card.in_hand = false
		array_push(discard, discarded_card);
	}

	// draw a new hand
    draw_cards(turn_start_draw);
	
	// decrement ritual
	var _ritual = obj_player.status_effects.ritual - 10
	if(_ritual > 0) {
		obj_player.status_effects.ritual = 10 + floor(_ritual * 0.75)
	}
	global.game_state = GAME_STATE.ENEMY_TURN;
}

// check if the card instances need to be repositioned, which just means a card has been played/drawn
if (hand_needs_reposition) {
	var hand_size = array_length(hand)
	hand_start_x = room_width / 2 + (hand_size - 1) * (card_width + card_offset) / 2;
	for (var i = 0; i < hand_size; i++) {
		var _card_x = hand_start_x - (card_width + card_offset) * i;
		hand[i].state_moving = true
		hand[i].endx = _card_x
		
	}
	hand_needs_reposition = false
}
