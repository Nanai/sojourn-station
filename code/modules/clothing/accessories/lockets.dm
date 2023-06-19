/obj/item/clothing/accessory/locket
	name = "locket"
	desc = "An oval shaped argentium sterling locket. A picture can be placed inside."
	icon_state = "locket"
	item_state = "konaahirano"
	slot_flags = 0
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_MASK | SLOT_ACCESSORY_BUFFER
	var/base_icon
	var/open
	var/obj/item/held //Item inside locket.

/obj/item/clothing/accessory/locket/attack_self(mob/user as mob)
	if(!base_icon)
		base_icon = icon_state

	if(!("[base_icon]_open" in icon_states(icon)))
		to_chat(user, "\The [src] doesn't seem to open.")
		return

	open = !open
	to_chat(user, "You flip \the [src] [open?"open":"closed"].")
	if(open)
		icon_state = "[base_icon]_open"
		if(held)
			to_chat(user, "\The [held] falls out!")
			held.loc = get_turf(user)
			src.held = null
	else
		icon_state = "[base_icon]"

/obj/item/clothing/accessory/locket/attackby(var/obj/item/O as obj, mob/user as mob)
	if(!open)
		to_chat(user, "You have to open it first.")
		return

	if(istype(O,/obj/item/paper) || istype(O, /obj/item/photo))
		if(held)
			to_chat(usr, "\The [src] already has something inside it.")
		else
			to_chat(usr, "You slip [O] into [src].")
			user.drop_item()
			O.loc = src
			src.held = O
		return
	..()

/obj/item/clothing/accessory/locket/youtried
	name = "Medal of Dubious Valor"
	desc = "Made of a fairly thick gold alloy, this hand-sized pin in the shape of a star is etched with the words <font color=#AAAA77>You Tried!</font>. There is a barely perceptioble clasp on it..."
	icon_state = "youtried"
	item_state = "youtried"