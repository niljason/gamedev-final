var _deck_manager = instance_find(deck_manager, 0);
var _amount = 0;
if (instance_exists(_deck_manager)) {
	_amount = array_length(_deck_manager.discard);
}

event_inherited();
draw_text(hud_x, hud_y - 18, "DISCARD");
draw_text(hud_x, hud_y + 14, string(_amount));
draw_set_halign(fa_left);
draw_set_valign(fa_top);
