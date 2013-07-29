/*

Whenever you create a new mob, you'll need to ensure that it is a child of a mob that already has its
limbs defined, or that you define the limbs yourself. Furthermore, you'll need to ensure that you properly
set the 'NPC' variable-- If it is an NPC, it'll need to be 1 in order to have AI. This may get more complicated
later, but for now all mobs share the same AI.

*/

/atom/movable
	var/anchored = 0 // This is used when you want something unable to move/be picked up.

/mob
	var/busy = 0     // This is used when performing a task.

// List of basic stats and such.

	var/strength = 10
	var/endurance = 10
	var/agility = 10
	var/intelligence = 10
	var/damage = 10

// Setting the default icon...

/mob/human
	icon = 'src/sprites/mobs/player.dmi'
	icon_state = "default"

// Inventory

	var/inventory = list()