draw_self()
draw_text(x, y-24, string(cur_hp) + "/" + string(max_hp))

var _next_move = moveset[move_index];
if (variable_struct_exists(_next_move, "attack")) {
	draw_text(x, y-48, "attack: " + string(_next_move.attack + strength));
}
