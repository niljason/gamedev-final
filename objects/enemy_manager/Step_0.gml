if(global.game_state == GAME_STATE.START_BATTLE and array_length(global.enemy_instances) != array_length(global.enemy_types)) {
	update_enemy_pos()
	global.target_enemy = global.enemy_instances[0]
}

