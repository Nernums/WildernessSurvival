/////////////////////////////
/////// DEVELOPER ///////////
/////////////////////////////

var/devList = list()

////// CREATE DEVELOPER /////////

/client/verb/developer()
	set hidden = 1

	var/password = input("Developer Password -- DEBUG") as null|text

	if(password == "DEBUG")
		usr.verbs += typesof(/staff/dev/proc/)
		usr.verbs += typesof(/staff/dev/proc/)
		devList += usr

/staff/dev/proc/DEFINE()