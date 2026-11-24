// end player turn
// commit actions
var _hover = hover()

if(_hover) {
	if(mouse_check_button_pressed(mb_left)) {
		global.target_enemy = id
	}
}

if (global.game_state == GAME_STATE.ENEMY_TURN && last_action_turn != global.enemy_turn) {
	var _move = moveset[move_index];
	var _actions = struct_get_names(_move);

	for (var i = 0; i < array_length(_actions); i++) {
		var _action = _actions[i];
		var _value = variable_struct_get(_move, _action);

		switch (_action) {
			case "attack":
				var _damage = _value + strength;
				var _blocked = min(global.plyr_armor, _damage);
				global.plyr_armor -= _blocked;
				global.plyr_hp -= _damage - _blocked;
				break;
			case "strength":
				strength += _value;
				break;
		}
	}

	move_index = (move_index + 1) % array_length(moveset);
	last_action_turn = global.enemy_turn;
	global.enemy_actions_remaining -= 1;
}
