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

if(_hover) {
	if(mouse_check_button_pressed(mb_left)) {
		global.target_enemy = id
	}
}

if (global.game_state == GAME_STATE.ENEMY_TURN && last_action_turn != global.enemy_turn) {
	var _move = moveset[move_index];
	var _actions = struct_get_names(_move);
	enemy_turn(_move, _actions)

	move_index = (move_index + 1) % array_length(moveset);
	last_action_turn = global.enemy_turn;
	global.enemy_actions_remaining -= 1;
}
