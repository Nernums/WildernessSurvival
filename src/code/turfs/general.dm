/turf

	icon_state = "default"
	var/searchable = 1

/turf/sand/verb/search()
	if(searchable && !usr.busy)
		usr << "Searching..."
		usr.wait(50)
		usr << "Searching complete."
		src.searchable = 0
		reset()
		return
	if(!searchable || usr.busy)
		usr << "You can't search this right now!"
		return
	else
		usr << "BUG"
		return

/turf/sand/proc/reset()
	sleep(50)
	searchable = 1



/turf/grass
	icon = 'src/sprites/turfs/grass.dmi'

/turf/sand
	icon = 'src/sprites/turfs/sand.dmi'

/turf/water
	icon = 'src/sprites/turfs/water.dmi'