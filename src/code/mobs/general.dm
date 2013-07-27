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

	icon = 'src/sprites/mobs/player.dmi'
	icon_state = "default"

// Inventory

	var/inventory = list()