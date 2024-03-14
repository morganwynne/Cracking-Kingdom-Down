class_name Game extends Node

func handle_end_game() -> void:
  var score:int = 0
  var plates_node:Node = $Plates
  var plates:Array[Node] = plates_node.get_children()
  for plate:Plate in plates:
    score = (plate.resources * plate.nobility * plate.morale)

  var games:Node = get_parent()
  var core:Core = games.get_parent()
  core.end_game(score)