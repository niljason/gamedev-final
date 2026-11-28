if (state == ENEMY_STATE.DEAD) {
	exit;
}

if(state == ENEMY_STATE.IDLE) {
	draw_enemy_info()
}
else if(state == ENEMY_STATE.PULLED) {
	draw_enemy_info()
	move_enemy(pulled_x)
}
else if(state == ENEMY_STATE.PUSHED) {
	draw_enemy_info()
	move_enemy(pushed_x)
}

var _next_move = moveset[move_index];
var _keys = struct_get_names(_next_move);
array_sort(_keys, true)
var _line_height = 24

for (var i = 0; i < array_length(_keys); i++) {
	var _key = _keys[i];
	var _value = struct_get(_next_move, _key);

	// add strength to attack
	if (_key == "attack") {
		_value += status_effects.strength
	}

	draw_text(x, y - 48 - i * _line_height, _key + ": " + string(_value))
}
