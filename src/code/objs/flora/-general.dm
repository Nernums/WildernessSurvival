/obj/flora
	var/harvestable // Checked when being picked.
	var/amount_to_harvest

	var/harvested

	var/harvest = list()
	var/type_of_harvest

// Using numbers for this would be silly, because then you might
// not be certain what level of maturity it is at a glance. For this,
// simply ensure that the state at which they can be picked from is
// "mature" if you're making a new plant. Might need harsher restrictions
// for new plants in the future.
	var/maturity