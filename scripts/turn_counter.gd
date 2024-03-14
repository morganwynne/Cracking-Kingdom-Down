class_name TurnCounter extends Node

var turn:int
@export var plates:Array[Plate]

func _ready() -> void:
  turn = 1;

func increment() -> void:
  for plate:Plate in plates:
    plate.process_end_turn(turn)
  if (turn == 10):
    var game:Game = get_parent()
    game.handle_end_game()
  else:
    turn += 1;
