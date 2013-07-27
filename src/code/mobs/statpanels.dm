/*

This is in place in order to handle the statpanels of the mobs. Fairly basic-- More ideas
for this area are appreciated.

*/


/mob/Stat()

///////// Basic Stats-- Not much detail here. //////////

	if(statpanel("Stats"))
		stat("Name: ",name)
		stat("Health: ",health)
		stat("Strength: ",strength)
		stat("Endurance: ",endurance)
		stat("Agility: ",agility)
		stat("Intelligence: ",intelligence)

///////// Inventory. /////////

	if(statpanel("Inventory"))
		var/obj/IND
		for(IND in src.contents)
			stat(IND.icon, IND)

///////// Health /////////////

	if(statpanel("Health"))
		stat("Health Levels")

		var/body/IND
		for(IND in src.body)
			stat("[IND.name]", "[IND.health]/[IND.health_max]")

///////// Skill list ////////////

	if(statpanel("Skills"))
		stat("List of the various skills.")

		var/skill/IND
		for(IND in src.skills)
			stat("-----------------------")
			stat("[IND.name]:" ,"[IND.level]")
			stat("[IND.desc]")