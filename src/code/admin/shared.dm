/staff/shared/proc/changeName()
	var/newName = input("Choose a new name.") as null|text
	usr.name = newName