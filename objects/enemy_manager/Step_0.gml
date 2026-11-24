if(global.game_state == GAME_STATE.START_BATTLE and array_length(global.enemy_instances) != array_length(global.enemy_types)) {
	update_enemy_pos()
	global.target_enemy = global.enemy_instances[0]
}

if (global.game_state == GAME_STATE.ENEMY_TURN && global.enemy_actions_remaining <= 0) {
	global.plyr_armor = 0;
	global.game_state = GAME_STATE.START_TURN;
}

