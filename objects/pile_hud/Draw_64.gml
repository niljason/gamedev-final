var _deck_manager = instance_find(deck_manager, 0);
var _amount = 0;
if (instance_exists(_deck_manager)) {
	switch (pile_key) {
		case "draw":
			_amount = array_length(_deck_manager.deck);
			break;
		case "discard":
			_amount = array_length(_deck_manager.discard);
			break;
	}
}

event_inherited();
draw_text(hud_x, hud_y + label_y_offset, pile_label);
draw_text(hud_x, hud_y + amount_y_offset, string(_amount));
draw_set_halign(fa_left);
draw_set_valign(fa_top);
