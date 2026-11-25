function play_card(_effects) {
	var _keys = struct_get_names(_effects)
	print(string(_keys))
	for(var i = 0; i<array_length(_keys); i++) {
		switch (_keys[i]){
			case "attack":
				attack(atk_val)
				break
			case "block":
				gain_armor(armor_val)
				break
			case "draw":
				draw_from_deck(draw_val)
				break
			case "strength":
				gain_strength(str_val)
				break
			case "siphon":
				// this is just for testing
				test_siphon(siphon_val)
				break
			case "weak":
				// this is just for testing
				test_weakness(weak_val)
				break
			case "shuffle":
			
				break
			case "push":
			
				break
			case "pull":
			
				break
			case "exhaust":
			
				break
			case "innate":
			
				break
			case "ritual":
				gain_ritual(rit_val)
				break
			case "retain":
			
				break
			default:
				break
		}

	}	
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
	//strength 1st
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
		_target.cur_hp -= damage
		if (_target.cur_hp <= 0) {
			_target.state = ENEMY_STATE.DEAD
		}
	}	
}

function gain_armor(armor) {
	obj_player.armor += armor
}

function draw_from_deck(num_cards) {
	deck_manager.draw_cards(num_cards)
}

function gain_strength(_val) {
	obj_player.status_effects.strength += _val
}

function gain_ritual(_val) {
	obj_player.status_effects.ritual += _val
}

// testing
function test_siphon(_val) {
	obj_player.status_effects.siphon += _val
}

function test_weakness(_val) {
	obj_player.status_effects.weak += _val
}
