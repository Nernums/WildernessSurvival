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

/staff/admin/proc/DEFINE()