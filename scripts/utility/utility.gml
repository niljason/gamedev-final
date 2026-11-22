function print(str){
	show_debug_message(str)
}

function reset() {
	with (all) {
		instance_destroy()	
	}
	room_goto(rm_main)
}
