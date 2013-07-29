////////////////////////////////////////////////////
/////////////// Procedure Definitions //////////////
////////////////////////////////////////////////////

/*

When writing a new procedure, or modifying an old one, ensure that you are using the full
path to it. This will ensure that the procedures will be easy to locate through the code.
Generally, this will use procedures that are multi-purpose. If it isn't, include it with its
own, proper file, or ensure that you state specifically where it is used in comments.

*/


////// Predefined Procedures ////////

/mob/Move()
	if(src.anchored)
		return
	else
		..()


/mob/Click()
	if(get_dist(src, usr) <= 1)
		usr.attack(src)

///// Created Procedures ///////////

//////// Wait ////////////
// Called when performing an action, so
// as to make a player immobile. Can be
// called fairly close to anywhere.

/mob/proc/wait(delay)
	src.anchored = 1
	src.busy = 1
	sleep(delay)
	src.anchored = 0
	src.busy = 0

