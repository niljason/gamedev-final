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

function attack(_val) {
	var _target = global.target_enemy
	
	if(_target != undefined) {
		_target.cur_hp -= _val
		if (_target.cur_hp <= 0) {
			// temporary delete
			instance_destroy(_target)
		}
	}	
}

function gain_armor(_val) {
	global.plyr_armor += _val
}

function draw_from_deck(_val) {
	var _deck = deck_manager.deck
	var _hand = deck_manager.hand
	var drawn_card = array_pop(_deck)
	drawn_card.in_hand = true
	array_push(_hand, drawn_card)
}
