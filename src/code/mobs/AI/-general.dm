/*

Here is the AI of the project. It's currently very basic and will be entirely reworked
at a point, but for something simple to build on, it should work for now. Uses the type
"/mob/ai/ when a new creature is made, which annoys me to no end-- Don't expect that to
stay the same.

*/

/mob
	var/target

/mob/ai/New()
	..()
	spawn(rand(10,30)) src.AI()



///// Main AI Procedure ////////
// This is definitely going to need to be reworked at a point,
// preferably as a datum to be able to give to specific creatures
// that need it.

/mob/proc/AI()
	if(target)
		aggressive()

	else
		step_rand(src)
		sleep(20)

	spawn() AI()



///// Aggressive /////////
// The aggressive behavior that happens when the AI has a target.
// It's fairly simple.

/mob/proc/aggressive()
	if(get_dist(src, target ) > 1)
		step_to(src, target)
		sleep(1)

	else
		attack(target)
		sleep(10)