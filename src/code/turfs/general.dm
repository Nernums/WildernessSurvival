/turf

	icon_state = "default"
	var/searchable = 1

/turf/proc/reset()
	sleep(50)
	searchable = 1



/turf/grass
	icon = 'src/sprites/turfs/grass.dmi'

/turf/sand
	icon = 'src/sprites/turfs/sand.dmi'

/turf/water
	icon = 'src/sprites/turfs/water.dmi'