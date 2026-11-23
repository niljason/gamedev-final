event_inherited();

hud_x = display_get_gui_width() - 72;
hud_y = display_get_gui_height() / 2;

if (hovered && mouse_check_button_pressed(mb_left)
&& global.game_state == GAME_STATE.START_TURN) {
	global.game_state = GAME_STATE.END_TURN;
}
