function play_card(_effects) {
	var _keys = struct_get_names(_effects)
	for(var i = 0; i<array_length(_effects); i++) {
		switch (_keys[i]){
			case "attack":
				attack(atk_val)
				break
			case "block":
				defend(def_val)
				break
			case "draw":
			
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
			case "siphon":
			
				break
			

		}

	}	
}

function attack(value){
	var _target = global.target_enemy
	
	if(_target != undefined) {
		_target.hp -= value
	}	
}