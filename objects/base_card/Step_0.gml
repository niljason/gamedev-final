if(position_meeting(mouse_x, mouse_y, id)) {
	if(mouse_check_button_pressed(mb_left)) {
		// play card
		// delete is temp
		instance_destroy(id)
	}
	card_y = lerp(card_y, target_y, 0.1)
}
else {
	card_y = lerp(card_y, y, 0.2)
}