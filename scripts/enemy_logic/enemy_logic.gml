function enemy_death(_id){
	var _inst = global.enemy_instances
	var _index = array_get_index(_inst, _id)
	array_delete(global.enemy_instances, _index, 1)
	array_delete(global.enemy_types, _index, 1)
	
	if(array_length(_inst)>0) {
		global.target_enemy = global.enemy_instances[0]
	}
	else {
		global.target_enemy = undefined
	}

	instance_destroy(_id)
	update_enemy_pos(_index)
}

function update_enemy_pos(idx) {
	for(var i = idx; i<array_length(global.enemy_instances); i++) {
		with(global.enemy_instances[i]) {
			state = ENEMY_STATE.PULLED
			pulled_x = x - 128
		}
	}
}

function spawn_enemies() {
	global.enemy_instances = []
	
	var _x = room_width/2 + 100
	var _y = room_height/2
	var _offset = 128
	
	for(var i = 0; i<array_length(global.enemy_types); i++) {
		array_push(global.enemy_instances, instance_create_layer(_x + i * _offset, _y, 0, global.enemy_types[i]))
	}
}

function move_enemy(endx) {
	x = lerp(x, endx, 0.05)
	if (abs(endx - x) < 0.5) {
		x = endx
	}
	
	if(x == endx) {
		state = ENEMY_STATE.IDLE	
	}
}

function draw_enemy_info() {
	var _offy = 24
	var _starty = y + sprite_height + 16
	draw_self()
	draw_text(x, y-24, string(hp) + "/" + string(max_hp))
	
	var _line = 0
	var _keys = struct_get_names(status_effects)
	for(var i = 0; i < array_length(_keys); i++) {
		var _status = _keys[i]
		var _amount = status_effects[$ _status]

		if (_amount > 0) {
			draw_text(x, _starty + _line * _offy, _status + ": " + string(_amount))
			_line++
		}
		// display icon and number for future
	}
}

function enemy_turn(_move, _actions) {
	for (var i = 0; i < array_length(_actions); i++) {
		var _action = _actions[i];
		var _value = variable_struct_get(_move, _action);

		switch (_action) {
			case "attack":
				var _damage = _value + status_effects.strength;
				var _blocked = min(obj_player.block, _damage);
				obj_player.block -= _blocked;
				obj_player.hp -= _damage - _blocked;
				break;
			case "strength":
				status_effects.strength += _value;
				break;
			case "block":
				status_effects.block += _value;
				break;
			case "weak":
				obj_player.status_effects.weak += _value
				break
			case "siphon":
				obj_player.status_effects.siphon += _value
				break
		}
	}	
}