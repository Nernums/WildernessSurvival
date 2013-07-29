/*

The AI of the project. Important things to know for anyone interested in working with this part is that
the AI is very basic for the moment-- That said, as is obvious, when a new mob is created and it is an
NPC, it will automatically have a new type of /ai generated in it. It will also pass a reference to itself
as the AI's owner, which the AI code uses to manipulate the mob's behavior and use the mob's procs.

Thanks to Zuhayr for answering a few silly questions to help with this.

*/

///////// Necessary ///////////
// A few necessary things for mobs
// to do in order to make this work.

/mob
	var/ai/ai
	var/NPC

/mob/New()
	if(NPC)
		ai = new /ai
		src.ai.owner = src
	..()



//////// AI definition ////////
// Variables for the AI to use are defined here.
// It also includes, obviously, the beginning of the
// AI loop.

/ai
	var/mob/owner
	var/tmp/target
	var/tmp/behavior

/ai/New()
	spawn(rand(10,50)) AI()
	..()

/////// Main AI Proc //////////
// This is the main AI proc. It, and the two procedures that it calls
// are the main part of the AI. If you want to add any AI behavior,
// you'll need to make sure that you add it to both procs-- update
// behavior to make sure that it can be triggered, and perform behavior
// just as a pointer to the proc that it will call. Definitions do belong
// in either of these. If you create a new behavior, please create a macro
// to refer to it as.

#define IDLE 0
#define AGGRESSIVE 1

/ai/proc/AI()

	update_behavior()
	perform_behavior()

	spawn(2) AI()



//////// Perform Behavior /////////
// Basically the list of behaviors, and what to do for each behavior.
// It should be as simple as setting off the behavior's specific proc.

/ai/proc/perform_behavior()
	if(behavior == AGGRESSIVE)
		aggressive()
	if(behavior == IDLE)
		idle()



//////// Update Behavior ///////////
// Updates the behavior depending on different circumstances. You define
// the circumstances here. It may end up needing its own file at a point.

/ai/proc/update_behavior()
	if(target)
		behavior = AGGRESSIVE
	if(!target)
		behavior = IDLE