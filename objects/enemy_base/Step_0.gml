// end player turn
// commit actions
if (hp <= 0) {
	state = ENEMY_STATE.DEAD;
}

if (state == ENEMY_STATE.DEAD) {
	global.enemy_actions_remaining -= 1;
	enemy_death(id);
	exit;
}

var _hover = hover()

if(_hover && !global.input_locked) {
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
				var _blocked = min(obj_player.armor, _damage);
				obj_player.armor -= _blocked;
				obj_player.hp -= _damage - _blocked;
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
