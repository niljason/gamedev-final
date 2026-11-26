if (state == ENEMY_STATE.DEAD) {
	exit;
}

if(state == ENEMY_STATE.IDLE) {
	// idle animation
	draw_self()
	draw_text(x, y-24, string(hp) + "/" + string(max_hp))
}
else if(state == ENEMY_STATE.PULLED) {
	draw_self()
	draw_text(x, y-24, string(hp) + "/" + string(max_hp))
	move_enemy(pulled_x)
}
else if(state == ENEMY_STATE.PUSHED) {
	draw_self()
	draw_text(x, y-24, string(hp) + "/" + string(max_hp))
	move_enemy(pushed_x)
}

var _next_move = moveset[move_index];
if (variable_struct_exists(_next_move, "attack")) {
	draw_text(x, y-48, "attack: " + string(_next_move.attack + strength));
}
