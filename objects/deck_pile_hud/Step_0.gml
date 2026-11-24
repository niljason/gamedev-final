hud_y = display_get_gui_height() - 48;
event_inherited();

if(hovered and mouse_check_button_pressed(mb_left)) {
	print(string("clicked"))
}