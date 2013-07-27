/*

For versatility's and experimentalities sake, even if it is an extra line of work,
I'd like for all verbs that players use to be, instead, procs that are given to them upon being created.

This... might /not/ go well. It might work fine, too. Keep verbs and what they use
self contained for the most part-- and if you add one, make sure that you add it
to the "New()" proc at the top of the file. Remember headers, like the following, which
should include the verb name.

///// VERB NAME /////

*/

/mob/New()
	src.verbs += new /mob/proc/attack
	src.verbs += new /mob/proc/pick_up
	src.verbs += new /mob/proc/set_down
	src.verbs += new /mob/proc/ingest
	src.verbs += new /mob/proc/search
	src.verbs += new /mob/proc/harvest
	..()



///// Attack //////////////
// Likely temporary.

/mob/proc/attack (var/mob/m in view(1) )
	var/body/limb = pick(m.body)
	m.take_damage(limb, src.damage)
	src << "You have attacked [m.name]'s [limb.name] for [check_damage(src.damage - limb.robustness)] damage!"



////// Pick Up ////////////

/mob/proc/pick_up (var/obj/item in view(1) )
	if(!item.anchored)
		src.inventory += item
		item.loc = src.inventory
		usr << "You pick up the [item.name]."



/////// Drop/Set Down /////

/mob/proc/set_down (var/obj/item in src.inventory)
	src.inventory -= item
	item.loc = src.loc
	usr << "You set down the [item.name]."



//////// Ingesting /////////
// Eating/drinking. May add some more details here
// depending on whether it is eating or drinking, or
// possibly even split this up into two verbs later.


/mob/proc/ingest (var/obj/consumable/item in src.inventory)
	src.need_less("hunger", item.sates)
	src.need_less("thirst", item.slakes)
	item.portions -= 1
	usr << "You ingest some of the [item.name]."
	if (item.portions <= 0)
		src << "Looks like all of the [item.name] has been used up"
		del item



/// Searching for Items ///////
// Searches the turfs underneath,
// like grass or sand. May need some work.

/mob/proc/search ( var/turf/searched in oview(0) )
	if(searched.searchable && !src.busy)
		src << "Searching through the [searched.name]..."
		src.wait(50)
		src << "Searching finished.."
		searched.searchable = 0
		searched.reset()
		return
	if(!searched.searchable || src.busy)
		src << "You can't search this right now!"
		return



///////// Harvest From Plant /////////

/mob/proc/harvest ( var/obj/flora/harvested in oview(1) )
	if (!harvested.harvestable || !harvested.amount_to_harvest || src.busy)
		src << "You can't harvest from the [harvested.name] right now..."
		return

	else
		src << "You look around for some things to harvest from the [harvested.name]..."
		wait(20)

		var/obj/picked = input("Take what from the plant?") in harvested.harvest

		usr << "You pick \a [picked.name] from the [harvested.name]!"
		src.inventory += picked
		picked.loc = src.inventory