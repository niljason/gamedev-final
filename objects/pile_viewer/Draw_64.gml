if (!is_open) {
	exit;
}

var _cards = get_pile_cards();
var _card_width = global.card_width;
var _card_height = global.card_height;
var _header_height = header_line_height * 3;
var _grid_width = cards_per_row * _card_width + (cards_per_row - 1) * global.card_offset;
var _grid_left = display_get_gui_width() / 2 - _grid_width / 2;
var _grid_top = viewer_margin + _header_height;
var _grid_bottom = display_get_gui_height() - viewer_margin;

draw_set_colour(c_black);
draw_set_alpha(0.75);
// whole screen
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);
draw_set_alpha(1);
draw_text(viewer_margin, viewer_margin, pile_label + " PILE (" + string(array_length(_cards)) + ")");
draw_text(viewer_margin, viewer_margin + header_line_height, "Scroll to browse. Click or press Esc to close.");

for (var i = 0; i < array_length(_cards); i++) {
	var _card = _cards[i];
	var _row = floor(i / cards_per_row);
	if (!instance_exists(_card)) {
		continue;
	}

	var _column = i % cards_per_row;
	var _x = _grid_left + _card_width / 2 + _column * (_card_width + global.card_offset);
	var _y = _grid_top + _card_height / 2 + _row * (_card_height + row_gap) - scroll_y;
	if (_y + _card_height / 2 < _grid_top || _y - _card_height / 2 > _grid_bottom) {
		continue;
	}

	draw_card_at(_card, _x, _y);
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
