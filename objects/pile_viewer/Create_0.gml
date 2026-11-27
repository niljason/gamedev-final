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

function pile_sorter(current, next) {
	if (current.name > next.name) {
		return 1
	} else if (current.name < next.name) {
		return -1
	}
	return 0
}

function get_pile_cards() {
	var _deck_manager = instance_find(deck_manager, 0);
	if (!instance_exists(_deck_manager)) {
		return [];
	}
	var cards = []
	switch (pile_key) {
		case "draw":
			cards = _deck_manager.draw
			break;
		case "deck": 
			cards = global.base_deck
			break;
		case "discard":
			cards = _deck_manager.discard
			break;
		case "oops": return; // implement later
	}
	var len = array_length(cards)
	var sorted = array_create(len)
	array_copy(sorted, 0, cards, 0, len)
	array_sort(sorted, pile_sorter);
	return sorted
}
