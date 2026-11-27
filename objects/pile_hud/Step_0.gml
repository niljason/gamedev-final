var _viewer = instance_find(pile_viewer, 0);
if (global.input_locked) {
	hovered = false;
	exit;
}

event_inherited();

if (hovered && mouse_check_button_released(mb_left) && instance_exists(_viewer) && !_viewer.is_open) {
	_viewer.open_pile(pile_key, pile_label);
}
