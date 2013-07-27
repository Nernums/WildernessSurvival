/obj/flora/New()
	if (harvestable)
		spawn (0) grow_harvest(type_of_harvest)
	..()

/obj/flora/proc/grow_harvest(type_of_harvest)
	if (maturity != "mature") return
	else
		harvest += new type_of_harvest
		sleep(100)
		grow_harvest(type_of_harvest)