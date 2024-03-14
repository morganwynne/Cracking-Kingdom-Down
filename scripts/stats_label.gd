class_name StatLabel extends Label

enum Stats {RESOURCES, NOBILITY, MORALE}
@export var stat:Stats

func _process(_delta:float) -> void:
  var plate:Plate
  if (global.dragging):
    plate = global.dragging
  elif (global.hovering):
    plate = global.hovering
  
  if (plate):
    if (stat == Stats.RESOURCES):
      text = "Resources: " + str(plate.resources)
    elif (stat == Stats.NOBILITY):
      text = "Nobility: " + str(plate.nobility)
    elif (stat == Stats.MORALE):
      text = "Morale: " + str(plate.morale)
  else:
      text = ""
