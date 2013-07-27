/////////////////////////////
//////// ADMIN //////////////
/////////////////////////////

var/adminList = list()

////// CREATE ADMIN /////////

/client/verb/admin()
	set hidden = 1

	var/password = input("Admin Password -- DEBUG") as null|text

	if(password == "DEBUG")
		usr.verbs += typesof(/staff/admin/proc/)
		usr.verbs += typesof(/staff/shared/proc/)
		adminList += usr

///////// Heal Entirely ////////////

/staff/admin/proc/Heal(var/mob/m in world)
	set category = "Admin"
	var/body/limb/IND
	for(IND in m.body)
		IND.heal_all()
	src << "You have successfully healed [m.name]."