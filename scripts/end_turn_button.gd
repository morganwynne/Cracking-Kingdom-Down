class_name EndTurnButton extends Button

@export var turn_counter:TurnCounter

func _on_pressed() -> void:
  turn_counter.increment()