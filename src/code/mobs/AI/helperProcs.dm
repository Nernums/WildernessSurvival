//////////// Hit By ///////////
// Currently only used in attacks. May need to be redone or changed
// in the future, depending upon usage.

/ai/proc/hit_by(attacker)
	if(!target)
		target = attacker