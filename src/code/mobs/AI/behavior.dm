////////// Aggressive Behavior ////////////

/ai/proc/aggressive()
	if(get_dist(owner, target ) > 1)
		step_to(owner, target)
		sleep(1)

	else
		owner.attack(target)
		sleep(10)


////////// Idling Behavior ///////////////
// Currently the default behavior when there is nothing else
// to do. Fairly basic.

/ai/proc/idle()
	step_rand(owner)
	sleep(20)