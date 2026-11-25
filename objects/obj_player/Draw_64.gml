if(room == rm_main) {
	draw_self()	
	draw_text(x, y-48, string(hp) + "/" + string(max_hp))
	draw_text(x, y-24, "armor:" + string(armor))
	
	var _keys = struct_get_names(status_effects)
	for(var i = 0; i<array_length(_keys); i++) {
		var _status = _keys[i]
		// display icon and number for future
		draw_text(x, y+72+24*i, string(_keys[i]) + ": " + string(status_effects[$ _status]))
	}
}