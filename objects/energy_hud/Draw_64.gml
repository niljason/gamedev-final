var _deck_manager = instance_find(deck_manager, 0);
var _amount = 0;
var _max_amount = 0;
if (instance_exists(_deck_manager)) {
	_amount = _deck_manager.energy_count;
	_max_amount = _deck_manager.combat_energy;
}

event_inherited();
draw_text(hud_x, hud_y + label_y_offset, "ENERGY");
draw_text(hud_x, hud_y + amount_y_offset, string(_amount) + "/" + string(_max_amount));
draw_set_halign(fa_left);
draw_set_valign(fa_top);
