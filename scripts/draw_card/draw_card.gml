function draw_card(_deck_manager, _x, _y, _card) {
	// 
	var _card_instance = instance_create_depth(_x, _y, 0, _card);
	array_push(_deck_manager.hand_instances, _card_instance);
	
	//draw_text(_x - _width/2, _y, _card.name);
}
