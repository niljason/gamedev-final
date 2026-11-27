event_inherited();

hud_x = display_get_gui_width() - gui_right_margin;
hud_y = display_get_gui_height() / 2;

if (!global.input_locked && hovered && mouse_check_button_pressed(mb_left)
&& global.game_state == GAME_STATE.PLAYER_TURN) {
	global.game_state = GAME_STATE.END_TURN;
}
