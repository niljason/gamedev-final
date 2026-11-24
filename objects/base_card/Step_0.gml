center_x = x;
energy_y = card_y - sprite_width / 2
name_y = card_y + 48 - sprite_width / 2;
text_y = card_y + 72 - sprite_width / 2;

var _hovered = hover()

if (_hovered) {
	if(mouse_check_button_pressed(mb_left)) {
		// play card
		// delete is temp
		var _deck_manager = instance_find(deck_manager, 0);
		if(instance_exists(_deck_manager)
		&& global.game_state == GAME_STATE.START_TURN
		&& _deck_manager.energy_count >= energy) {
			var _hand_index = -1;
			for (var i = 0; i < array_length(_deck_manager.hand_instances); i++) {
				if(_deck_manager.hand_instances[i] == id) {
					_hand_index = i;
					break;
				}
			}

			if(_hand_index >= 0) {
				global.game_state = GAME_STATE.PLAY_CARD;
				_deck_manager.energy_count -= energy;
				array_push(_deck_manager.discard, _deck_manager.hand[_hand_index]);
				array_delete(_deck_manager.hand, _hand_index, 1);
				array_delete(_deck_manager.hand_instances, _hand_index, 1);
				// PLAY CARD EFFECTS HERE
				play_card(card_effects)
				instance_destroy();
			}
		}
	}
	card_y = lerp(card_y, target_y, 0.1);
}
else {
	card_y = lerp(card_y, y, 0.2);
}
