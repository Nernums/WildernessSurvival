/////////////////////////////
/////// DEVELOPER ///////////
/////////////////////////////

var/devList = list()



////// CREATE DEVELOPER /////////

/client/verb/developer()
	set hidden = 1

	var/password = input("Developer Password -- DEBUG") as null|text

	if(password == "DEBUG" && usr.ckey == "deciusreln") // The ckey is only temporary, to allow updating of hosting.
		usr.verbs += typesof(/staff/developer/proc/)
		usr.verbs += typesof(/staff/developer/proc/)
		devList += usr



/////////// Updating! //////////
// Allows a developer to update the code manually
// from where they are. Depending on if we want to
// add more things later, it may need changed-- for
// now, it more than works.

/staff/developer/proc/Update(F as file)
	set category = "Developer"

	if(isnull(F))
		return

	var/filename = "[F]"
	var/file_ext = lowertext(copytext(filename, max(length(filename)-3,1))) // Stores the file extension.
	var/file_size = length(F)

	if(file_ext != ".dmb" && file_ext != ".src")
		src << "Invalid file extension. File must be either a .dmb or a .rsc file."
		return

	if(file_size > 10485760)
		src << "File is too large. It must be less than 10MB."
		return

	fcopy(F,"[filename]")