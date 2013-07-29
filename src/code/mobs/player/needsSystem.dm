/*

The needs system is simple and should also be fairly simple to add to. Simply ensure that
you have created the variables needed for the type near the top, then, if you created a new
proc, ensure that it is called upon New() in the area provided after a spawn(0) (We don't want
it to interfere with other things in New().), and, finally, create a new procedure or place
it into the existing one. I doubt much will be added here except for modifications and a few new
procs as needed.

*/

//////////////////////////////////////////
//////// Variable Definitions ////////////
//////////////////////////////////////////

/mob/human
	var/hunger_max = 100
	var/hunger = 0

	var/thirst_max = 100
	var/thirst = 0





//////////////////////////////////////////
//////// Upon the creation of... /////////
//////////////////////////////////////////

/mob/human/New()
	spawn(0) needs_system()
	..()





//////////////////////////////////////////
//////// Need System Procs ///////////////
//////////////////////////////////////////



///////// Needs System ///////////
// Main proc-- Have the actual needs be incremented
// and organized here. If you add a need, you'll need
// to add it to here.

/mob/human/proc/needs_system()
	need_more("hunger", 1)
	need_more("thirst", 4)
	sleep(pick(240, 320))
	needs_system()



//////// Need more /////////
// Is usually called by needs_system,
// but can be called from anywhere within
// the source that is appropriate.

/mob/human/proc/need_more(need, amount)

	if(need == "hunger" && src.hunger < 100)
		src.hunger += amount

	if(need == "thirst" && src.thirst < 100)
		src.thirst += amount



///////// Need less ////////
// Could have one need incrementation proc, but
// for eating purposes this is easier to remember
// rather than messing around with more variables
// and negative numbers. Usually called when
// eating food (once that is implemented).

/mob/human/proc/need_less(need, amount)

	if(need == "hunger" && src.hunger > 0)
		src.hunger -= amount

	if(need == "thirst" && src.thirst > 0)
		src.thirst -= amount



///////// Check needs ///////
// Checks up on the needs and returns a vague description.
// This will be seen in stat-panels.

/mob/human/proc/check_needs(need)

	if(need == "hunger")

		if (hunger <= 10)
			return "Satiated"

		if (hunger <= 20)
			return "A Bit Hungry"

		if (hunger <= 40)
			return "Rather Hungry"

		if (hunger <= 60)
			return "Very Hungry"

		if (hunger <= 80)
			return "Starved"

		if (hunger <= 100)
			return "Dying of Hunger"

	if(need == "thirst")

		if (thirst <= 10)
			return "Slaked"

		if (thirst <= 20)
			return "A Bit Thirsty"

		if (thirst <= 40)
			return "Rather Thirsty"

		if (thirst <= 60)
			return "Very Thirsty"

		if (thirst <= 80)
			return "Dehydrated"

		if (thirst <= 100)
			return "Dying of Thirst"