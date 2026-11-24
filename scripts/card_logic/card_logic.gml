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
			
				break
			case "siphon":
			
				break
			case "weak":
			
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
			
				break
			case "retain":
			
				break
			default:
				break
		}

	}	
}

function attack(damage) {
	var dmg_falloff = 0.1
	var _target = global.target_enemy
	var _idx = array_get_index(global.enemy_instances, _target)
	
	damage = floor(damage * (1 - dmg_falloff * _idx))
	
	if(_target != undefined) {
		_target.cur_hp -= damage
		if (_target.cur_hp <= 0) {
			enemy_death(_target)
		}
	}	
}

function gain_armor(armor) {
	global.plyr_armor += armor
}

function draw_from_deck(num_cards) {
	deck_manager.draw_cards(num_cards)
}
