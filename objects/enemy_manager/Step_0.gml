if(global.game_state == GAME_STATE.START_BATTLE and array_length(global.enemy_instances) != array_length(global.enemy_types)) {
	spawn_enemies()
	global.target_enemy = global.enemy_instances[0]
}

if (global.game_state == GAME_STATE.ENEMY_TURN && global.enemy_actions_remaining <= 0) {
	obj_player.armor = 0;
	global.game_state = GAME_STATE.START_TURN;
}

