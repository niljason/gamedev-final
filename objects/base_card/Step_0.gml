if (!in_hand) {
	return
}

center_x = x;
energy_y = card_y - sprite_width / 2
name_y = card_y + 48 - sprite_width / 2;
text_y = card_y + 72 - sprite_width / 2;

var _hovered = hover()

if (_hovered) {
	if(mouse_check_button_pressed(mb_left)) {
		// play card
		var can_play_card = instance_exists(deck_manager) 
			&& global.game_state == GAME_STATE.START_TURN 
			&& deck_manager.energy_count >= energy;
		if (can_play_card) {
			var _hand_index = -1;
			// find card id in hand so we can remove it later
			for (var i = 0; i < array_length(deck_manager.hand); i++) {
				if(deck_manager.hand[i] == id) {
					_hand_index = i;
					break;
				}
			}

			global.game_state = GAME_STATE.PLAY_CARD;
			deck_manager.energy_count -= energy;
			deck_manager.hand_needs_reposition = true
			array_push(deck_manager.discard, deck_manager.hand[_hand_index]);
			array_delete(deck_manager.hand, _hand_index, 1);
			
			play_card(card_effects)
			in_hand = false
		}
	}
	card_y = lerp(card_y, target_y, 0.1);
} else {
	card_y = lerp(card_y, y, 0.2);
}

