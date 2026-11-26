function move_card(endx) {
	x = lerp(x, endx, 0.05)
	if (abs(endx - x) < 0.5) {
		x = endx
	}
	
	if(x == endx) {
		state_moving = false	
	}
}