max_hp = 20
cur_hp = max_hp

moveset = [
	{attack: 1},
	{attack: 2}
]
move_index = 0
strength = 0
last_action_turn = -1

state = ENEMY_STATE.IDLE
enum ENEMY_STATE {
	IDLE,
	PULLED,
	PUSHED
}

pulled_x = x - 128