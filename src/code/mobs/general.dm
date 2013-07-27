/mob
	var/busy = 0     // This is used when performing a task.
	var/anchored = 0 // This is used when you want the player unable to move. If 1, they will be unable.

// List of basic stats.

	var/health = 100
	var/strength = 10
	var/endurance = 10
	var/agility = 10
	var/intelligence = 10
	var/damage = 10

// Setting the default icon...

	icon = 'src/sprites/mobs/player.dmi'
	icon_state = "default"

////////////////////////////////////////////////////
/////////////// Procedure Definitions //////////////
////////////////////////////////////////////////////

/*

When writing a new procedure, or modifying an old one, ensure that you are using the full
path to it. This will ensure that the procedures will be easy to locate through the code.

Note that this might need moved to its own file at a point. As the scope of the project isn't
too large, I doubt that it will, though.

                                                                    - Decius

*/


////// Predefined Procedures ////////

/mob/Move()
	if(anchored)
		return
	else
		..()


///// Created Procedures ///////////

/mob/proc/wait(delay)
	src.anchored = 1
	src.busy = 1
	sleep(delay)
	src.anchored = 0
	src.busy = 0

// TEMP FOR DEBUG

/mob/proc/take_damage(var/body/limb, damage)
	limb.health -= damage