function print(str){
	show_debug_message(str)
}

function reset() {
	with (all) {
		instance_destroy()	
	}
	room_goto(rm_main)
}

function hover() {
	var _mouse_x_gui = device_mouse_x_to_gui(0);
	var _mouse_y_gui = device_mouse_y_to_gui(0);
	return position_meeting(_mouse_x_gui, _mouse_y_gui, id)
}