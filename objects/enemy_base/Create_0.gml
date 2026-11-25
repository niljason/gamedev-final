max_hp = 20
hp = max_hp

moveset = [
	{attack: 7},
	{attack: 2}
]
move_index = 0
strength = 0
last_action_turn = -1

status_effects = [
	{strength: 0},
	{siphon: 0},
	{weak: 0}
]

state = ENEMY_STATE.IDLE
enum ENEMY_STATE {
	IDLE,
	PULLED,
	PUSHED,
	DEAD
}

pulled_x = x - 128