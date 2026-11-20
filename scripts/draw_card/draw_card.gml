function draw_card(_x, _y, _card){
	// 
	var _id = instance_create_layer(_x, _y, 0, _card)
	array_push(deck_manager.hand_instances, _id)
	
	//draw_text(_x - _width/2, _y, _card.name);
}