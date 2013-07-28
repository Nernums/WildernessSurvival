/*

For the sake of simplicity, and because I'm not certain how far I want to take this later,
this is currently in its own file. If, and when, changes are made in the way of creating more
mobs, this will need to be made separate into its own files, and each mob will need a procedure
or something with New() in order to have it gain the proper limbs and organs upon being created.

*/

/mob
	var/body = list()

/mob/player/New()

/*
Needs to be placed into the body upon creation. We could just use
the typesof() proc, but that will mean we don't have a list to view
and it will need to be written out separately if we add more limbs
that humans don't necessarily have, for other races.
*/
	src.body += new /body/limb/right_arm
	src.body += new /body/limb/left_arm
	src.body += new /body/limb/right_leg
	src.body += new /body/limb/left_leg
	src.body += new /body/limb/torso
	src.body += new /body/limb/head
	..()


//////// Body Definitions /////////////////


// General

/body
	var/name

	var/health_max
	var/health

	var/robustness //If it is more 'robust', it'll take less damage when hit. May be renamed... Currently arbitrary numbers.

/body/New()
	src.health = src.health_max

//////// Right Arm ////////

/body/limb/right_arm
	name = "right arm"
	health_max = 100
	robustness = 4

//////// Left Arm ////////

/body/limb/left_arm
	name = "left arm"
	health_max = 100
	robustness = 4

//////// Right Leg ////////

/body/limb/right_leg
	name = "right leg"
	health_max = 100
	robustness = 4

//////// Left Leg ////////

/body/limb/left_leg
	name = "left leg"
	health_max = 100
	robustness = 4

//////// Torso ////////

/body/limb/torso
	name = "torso"
	health_max = 100
	robustness = 6

//////// Head ////////

/body/limb/head
	name = "head"
	health_max = 100
	robustness = 2

////////////////////////////////////////////////////
/////////////// Health Related Procs ///////////////
////////////////////////////////////////////////////

/////// Heal Completely ///////////
// Currently called when being created, and also
// called when created.

/body/limb/proc/heal_all()
	src.health = src.health_max



//////// Take Damage ////////////
// Called by any procs trying to do damage
// to something. Currently only causes damage
// to specific limbs.

/mob/proc/take_damage(var/body/limb, damage)
	limb.health -= (damage - limb.robustness)



////// Check Damage ////////////
// Currently called by the attack verb. I don't really like
// how not-versatile this proc is, and it'll likely end up
// changed or replaced.

/mob/proc/check_damage(damage)
	if(damage >= 100) return "cataclysmic"
	if(damage >= 70) return "devastating"
	if(damage >= 50) return "massive"
	if(damage >= 20) return "large"
	if(damage >= 10) return "fair"
	if(damage >= 5) return "some"
	if(damage >= 0) return "weak"