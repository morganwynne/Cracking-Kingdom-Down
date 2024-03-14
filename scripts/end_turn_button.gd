class_name EndTurnButton extends Button

@export var turn_counter:TurnCounter
@export var plates:Array[Plate]

func _on_pressed() -> void:
  turn_counter.increment()
  for plate:Plate in plates:
    plate.process_end_turn(turn_counter.turn)
