if (!is_open) {
	global.input_locked = false; // not open
	exit;
}

if (keyboard_check_pressed(vk_escape) || mouse_check_button_pressed(mb_left)) {
	is_open = false;
	exit;
}

var _cards = get_pile_cards();
var _header_height = header_line_height * 3;
var _total_rows = ceil(array_length(_cards) / cards_per_row);
var _content_height = _total_rows * global.card_height + max(0, _total_rows - 1) * row_gap;
var _visible_height = display_get_gui_height() - viewer_margin * 2 - _header_height;
var _max_scroll_y = max(0, _content_height - _visible_height);

if (mouse_wheel_up()) {
	scroll_target_y -= scroll_step;
}
if (mouse_wheel_down()) {
	scroll_target_y += scroll_step;
}

scroll_target_y = clamp(scroll_target_y, 0, _max_scroll_y);
scroll_y = lerp(scroll_y, scroll_target_y, scroll_smoothing);
if (abs(scroll_target_y - scroll_y) < 1) {
	scroll_y = scroll_target_y;
}
