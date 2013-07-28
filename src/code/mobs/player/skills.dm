/*
Whenever you add a new skill, you'll need to add it to this list so that
people who make start with it. If, for some reason, they aren't supposed
to start with it, note that in a comment and where they can get it at the
name of the skill.
*/

/mob
	var/skills = list()

/mob/player/New()
	skills += new /skill/foraging
	skills += new /skill/fishing
	skills += new /skill/swimming
	..()

/////////////////////////////////////////////////////////////////////////////
///////////////////////////// Skill Definitions /////////////////////////////
/////////////////////////////////////////////////////////////////////////////

/*

It probably looks a bit redundant, and it may be, to put the skill name like
that, especially when we have a search function-- However, it does serve a purpose.
It allows for us to simply skim through and get what we want, and visually separates
the different functions and the whitespace with them.

The description, in order to properly appear within the statpanels, is required to be
in the format provided. Try to keep the lengths of each line roughly the same.

*/

//////// General ////////////

/skill
	var/name
	var/level
	var/desc



///////// Foraging //////////

/skill/foraging
	name = "Foraging"
	level = 1

	desc = {"Allows the user to more efficiently and effectively acquire
items from bushes and the sort. Important survival skill."}



///////// Fishing //////////

/skill/fishing
	name = "Fishing"
	level = 1

	desc = {"Allows the user to more efficiently and effectively use tools
in order to fish. Masters of this skill, or people who learn a very
specific kind of it, may manage to fish using their hands."}



///////// Swimming //////////

/skill/swimming
	name = "Swimming"
	level = 1

	desc = {"Allows the user to more efficiently and effectively swim through the
ocean."}