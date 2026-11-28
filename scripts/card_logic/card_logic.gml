function play_card(_effects) {
	static effect_order = ["strength", "siphon", "weak", "attack", "block", "draw", "push", "pull", "ritual", "exhaust"]
	var _exhaust = false
	for(var i = 0; i<array_length(effect_order); i++) {
		var _key = effect_order[i]
		if (!struct_exists(_effects, _key)) {
			continue
		}
		
		switch (_key){
			case "attack":
				attack(atk_val)
				break
			case "block":
				gain_block(block_val)
				break
			case "draw":
				draw_from_deck(draw_val)
				break
			case "strength":
				gain_strength(str_val)
				break
			case "siphon":
				apply_siphon(siphon_val)
				break
			case "weak":
				apply_weak(weak_val)
				break
			case "push":
				push(push_val)
				break
			case "pull":
				pull(pull_val)
				break
			case "exhaust":
				_exhaust = true
				break
			case "ritual":
				gain_ritual(rit_val)
				break
			default:
				break
		}
	}	
	
	if (_exhaust) {
		array_push(deck_manager.exhaust, id);  
	} 
	else {
		array_push(deck_manager.discard, id)
	}
	array_delete(deck_manager.hand, array_get_index(deck_manager.hand, id), 1);
}

function attack(damage) {
	var weakness_mult = 0.75
	var dmg_falloff = 0.1
	var _target = global.target_enemy
	var _status = obj_player.status_effects
	var _idx = array_get_index(global.enemy_instances, _target)
	
	// positioning dmg fall off
	damage = floor(damage * (1 - dmg_falloff * _idx))
	// status effects 
	// strength 1st
	damage += _status.strength
	
	// siphon is applied before weak 
	var _siphon_stacks = _status.siphon
	if(_siphon_stacks>0) {
		damage -= _siphon_stacks
		_status.siphon--
	}
	
	if(_status.weak > 0) {
		damage = floor(damage * weakness_mult)
	}
	
	if(_target != undefined) {
		var _enemy_block = _target.status_effects.block
		if(_enemy_block > 0) {
			var _remaining_damage = max(0, damage - _enemy_block)
			_target.status_effects.block = max(0, _enemy_block - damage)
			_target.hp -= _remaining_damage
		}
		else {
			_target.hp -= damage
		}
		
		
		if (_target.hp <= 0) {
			_target.state = ENEMY_STATE.DEAD
		}
	}	
}

function gain_block(_val) {
	obj_player.block += _val
}

function draw_from_deck(num_cards) {
	with (deck_manager) {
		draw_cards(num_cards)
	}
}

function gain_strength(_val) {
	obj_player.status_effects.strength += _val
}

function gain_ritual(_val) {
	obj_player.status_effects.ritual += _val
}

function apply_siphon(_val) {
	global.target_enemy.status_effects.siphon += _val
}

function apply_weak(_val) {
	global.target_enemy.status_effects.weak += _val
}

function push(_val) {
	if (!instance_exists(global.target_enemy) || global.target_enemy.hp <= 0) {
		return
	}
	var _idx = array_get_index(global.enemy_instances, global.target_enemy)
	var enemy_count = array_length(global.enemy_instances)
	var enemy_passed = min(_val, enemy_count - 1 - _idx)

	for(var i = _idx + 1; i<=_idx + enemy_passed; i++) {
		with(global.enemy_instances[i]) {
			state = ENEMY_STATE.PULLED
			pulled_x = x - 128
		}
	}
	
	with(global.target_enemy) {
		state = ENEMY_STATE.PUSHED
		pushed_x = x + 128 * enemy_passed
	}
	
	var _type = global.enemy_types[_idx]
	array_delete(global.enemy_instances, _idx, 1)
	array_insert(global.enemy_instances, _idx + enemy_passed, global.target_enemy)
	array_delete(global.enemy_types, _idx, 1)
	array_insert(global.enemy_types, _idx + enemy_passed, _type)
}

function pull(_val) {
	if (!instance_exists(global.target_enemy) || global.target_enemy.hp <= 0) {
		return
	}
	var _idx = array_get_index(global.enemy_instances, global.target_enemy)
	var enemy_count = array_length(global.enemy_instances)
	var enemy_passed = min(_val, _idx)

	for(var i = _idx - 1; i>=_idx - enemy_passed; i--) {
		with(global.enemy_instances[i]) {
			state = ENEMY_STATE.PUSHED
			pushed_x = x + 128
		}
	}
	
	with(global.target_enemy) {
		state = ENEMY_STATE.PULLED
		pulled_x = x - 128 * enemy_passed
	}
	
	var _type = global.enemy_types[_idx]
	array_delete(global.enemy_instances, _idx, 1)
	array_insert(global.enemy_instances, _idx - enemy_passed, global.target_enemy)
	array_delete(global.enemy_types, _idx, 1)
	array_insert(global.enemy_types, _idx - enemy_passed, _type)
}


// testing
function test_siphon(_val) {
	obj_player.status_effects.siphon += _val
}

function test_weakness(_val) {
	obj_player.status_effects.weak += _val
}
