if(room == rm_main) {
	draw_self()	
	draw_text(x, y-48, string(hp) + "/" + string(max_hp))
	draw_text(x, y-24, "armor:" + string(armor))
	
	var _keys = struct_get_names(status_effects)
	var start_pos = 0;
	for(var i = 0; i < array_length(_keys); i++) {
		var _status = _keys[i]
		if (status_effects[$ _status] > 0) {
			draw_text(x, y+72+24*start_pos, string(_keys[i]) + ": " + string(status_effects[$ _status]))
			start_pos++;
		}
		// display icon and number for future
	}
}