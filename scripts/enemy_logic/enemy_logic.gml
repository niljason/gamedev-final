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
		global.enemy_instances[i].state = ENEMY_STATE.PULLED
	}
}

function spawn_enemies() {
	global.enemy_instances = []
	
	var _x = room_width/2 + 100
	var _y = room_height/2
	var _offset = 128
	
	for(var i = 0; i<array_length(global.enemy_types); i++) {
		array_push(global.enemy_instances, instance_create_layer(_x + i * _offset, _y, 0, enemy_base))
	}
}

function pull_forward(endx) {
	x = lerp(x, endx, 0.05)
	if (abs(endx - x) < 0.5) {
		x = endx
	}
	
	if(x == endx) {
		state = ENEMY_STATE.IDLE	
	}
}