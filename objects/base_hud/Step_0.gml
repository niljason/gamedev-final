var _mouse_x_gui = device_mouse_x_to_gui(0);
var _mouse_y_gui = device_mouse_y_to_gui(0);

if (hud_shape == "circle") {
	hovered = point_in_circle(_mouse_x_gui, _mouse_y_gui, hud_x, hud_y, radius);
}
else {
	hovered = point_in_rectangle(_mouse_x_gui, _mouse_y_gui,
		hud_x - pile_width / 2, hud_y - pile_height / 2,
		hud_x + pile_width / 2, hud_y + pile_height / 2);
}

if (click_timer > 0) {
	click_timer--;
}
if (hovered && mouse_check_button_pressed(mb_left)) {
	click_timer = 10;
}
