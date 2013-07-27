/*

For the sake of simplicity, and because I'm not certain how far I want to take this later,
this is currently in its own file. If, and when, changes are made in the way of creating more
mobs, this will need to be made separate into its own files, and each mob will need a procedure
or something with New() in order to have it gain the proper limbs and organs upon being created.

*/
/mob
	var/body = list()

/mob/New()
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

/body/New()
	src.health = src.health_max

//////// Right Arm ////////

/body/limb/right_arm
	name = "right arm"
	health_max = 100

//////// Left Arm ////////

/body/limb/left_arm
	name = "left arm"
	health_max = 100

//////// Right Leg ////////

/body/limb/right_leg
	name = "right leg"
	health_max = 100

//////// Left Leg ////////

/body/limb/left_leg
	name = "left leg"
	health_max = 100

//////// Torso ////////

/body/limb/torso
	name = "torso"
	health_max = 150

//////// Head ////////

/body/limb/head
	name = "head"
	health_max = 75


/body/organ

////////////////////////////////////////////////////
/////////////// Health Related Procs ///////////////
////////////////////////////////////////////////////

/////// Heal Completely ///////////
// Currently called when being created, and also
// called when created.

/body/limb/proc/heal_all()
	src.health = src.health_max

/body/






