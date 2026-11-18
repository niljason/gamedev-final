function draw_card(_x, _y, _width, _height, _card){
	draw_set_colour(c_white);
	draw_rectangle(_x - _width/2, _y-_height/2, _x+_width/2, _y+_height/2, true);
	draw_text(_x - _width/2, _y, _card.name);
}