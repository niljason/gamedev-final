is_open = false;
depth = -100000;
pile_key = "";
pile_label = "";
cards_per_row = 5;
row_gap = 16;
viewer_margin = 32;
header_line_height = 24;
scroll_y = 0;
scroll_target_y = 0;
scroll_step = 64;
scroll_smoothing = 0.2;

function open_pile(_pile_key, _pile_label) {
	is_open = true;
	global.input_locked = true; // switch it
	pile_key = _pile_key;
	pile_label = _pile_label;
	scroll_y = 0;
	scroll_target_y = 0;
}

function get_pile_cards() {
	var _deck_manager = instance_find(deck_manager, 0);
	if (!instance_exists(_deck_manager)) {
		return [];
	}

	switch (pile_key) {
		case "deck": return _deck_manager.deck;
		case "discard": return _deck_manager.discard;
		case "deck": return; // implement later
	}

	return [];
}
