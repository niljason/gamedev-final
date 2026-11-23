if(room == rm_main) {
	draw_self()	
	draw_text(x, y-48, string(global.plyr_hp) + "/" + string(max_hp))
	draw_text(x, y-24, "armor:" + string(global.plyr_armor))
}