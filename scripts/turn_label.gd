class_name TurnLabel extends Label

@export var turn_counter:TurnCounter

func _process(_delta:float) -> void:
  text = "Turn: " + str(turn_counter.turn)
