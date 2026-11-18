function enemy_death(idx){
	array_delete(global.enemy_instances, idx, 1)
	array_delete(global.enemy_types, idx, 1)
	update_enemy_pos()
}

function update_enemy_pos() {
	instance_destroy(enemy_base)
	global.enemy_instances = []
	
	var _x = room_width/2 + 100
	var _y = room_height/2
	var _offset = 128
	
	for(var i = 0; i<array_length(global.enemy_types); i++) {
		array_push(global.enemy_instances, instance_create_depth(_x + i * _offset, _y, 0, enemy_base))
	}
}

