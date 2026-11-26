if (!in_hand) {
	return
}

center_x = x;
energy_y = y - sprite_width / 2
name_y = y + 48 - sprite_width / 2;
text_y = y + 72 - sprite_width / 2;

var _hovered = hover()

if (_hovered) {
	if(mouse_check_button_pressed(mb_left)) {
		// play card
		var can_play_card = instance_exists(deck_manager) 
			&& global.game_state == GAME_STATE.PLAYER_TURN
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

			deck_manager.energy_count -= energy;
			deck_manager.hand_needs_reposition = true
		
			play_card(card_effects)
			in_hand = false
		}
	}
	y = lerp(y, target_y, 0.9);
} else {
	y = lerp(y, card_original_y, 0.2);
}

if(state_moving) {
	move_card(endx)
}
