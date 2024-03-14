class_name BoostLabel extends Label

enum Stats {RESOURCES, NOBILITY, MORALE}

func _process(_delta:float) -> void:
	var plate:Plate
	if (global.dragging):
		plate = global.dragging
	elif (global.hovering):
		plate = global.hovering

	if (plate):
		text = "Boost: "
		if (plate.boosted_stat == Stats.RESOURCES):
			text += "Resource "
		elif (plate.boosted_stat == Stats.NOBILITY):
			text += "Nobility "
		elif (plate.boosted_stat == Stats.MORALE):
			text += "Morale "
		text += "+" + str(plate.boosted_amount)
	else:
		text = ""
