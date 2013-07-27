/mob/Login()
	src.loc = locate(1,1,1)

	if(src in adminList)
		src.verbs += typesof(/staff/admin/proc/)
		src.verbs += typesof(/staff/shared/proc/)

	if(src in devList)
		src.verbs += typesof(/staff/dev/proc/)
		src.verbs += typesof(/staff/shared/proc/)

	..()