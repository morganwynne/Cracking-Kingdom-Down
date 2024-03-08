class_name StatLabel extends Label

enum Stats {RESOURCES, NOBILITY, MORALE}
@export var stat:Stats

func _process(_delta:float) -> void:
  if (global.dragging):
    if (stat == Stats.RESOURCES):
      text = "Resources: " + str(global.dragging.resources)
    if (stat == Stats.NOBILITY):
      text = "Nobility: " + str(global.dragging.nobility)
    if (stat == Stats.MORALE):
      text = "Morale: " + str(global.dragging.morale)
  elif (global.hovering):
    if (stat == Stats.RESOURCES):
      text = "Resources: " + str(global.hovering.resources)
    if (stat == Stats.NOBILITY):
      text = "Nobility: " + str(global.hovering.nobility)
    if (stat == Stats.MORALE):
      text = "Morale: " + str(global.hovering.morale)
  else:
      text = ""
