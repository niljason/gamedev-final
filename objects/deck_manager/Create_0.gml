deck = [];
for (var i = 0; i < 6; i++) {
	array_push(deck, a_strike);
}

hand = []

discard = []

exhaust = []

start_turn_energy = 3;
energy_count = start_turn_energy;


enum GAME_STATE {
	START_BATTLE,
	START_TURN,
	PLAY_CARD,
	CARD_STUFF,
	END_TURN,
	END_BATTLE,
	NOTHING,
}