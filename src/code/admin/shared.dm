/staff/shared/proc/changeName()
	set category = "Special"
	var/newName = input("Choose a new name.") as null|text
	usr.name = newName