/*

For versatility's sake, even if it is an extra line of work, I'd like for all verbs
that players use to be, instead, procs that are given to them upon being created.

This... might /not/ go well. It might work fine, too. Keep verbs and what they use
self contained for the most part-- and if you add one, make sure that you add it
to the "New()" proc at the top of the file. Remember headers, like the following, which
should include the verb name.

///// VERB NAME /////

*/

/mob/New()
	src.verbs += new /mob/proc/attack
	..()

///// Attack /////

// Likely temporary.

/mob/proc/attack(var/mob/m in view(1) )
	var/body/limb = pick(m.body)
	m.take_damage(limb, src.damage)
	usr << "You have attacked [m.name]'s [limb.name] for 10!"