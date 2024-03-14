class_name Core extends Node

func _ready() -> void:
  get_tree().paused = true

func _on_start_game_pressed() -> void:
  var main_menu_ui:Control = $MainMenuUI
  main_menu_ui.hide()
  get_tree().paused = false
  change_game.call_deferred(load("scenes/game.tscn"))

func _on_restart_game_pressed() -> void:
  var end_game_ui:Control = $EndGameUI
  end_game_ui.hide()
  get_tree().paused = false
  change_game.call_deferred(load("scenes/game.tscn"))

func change_game(scene:PackedScene) -> void:
  var game:Node = $Game
  for child:Node in game.get_children():
    game.remove_child(child)
    child.queue_free()
  game.add_child(scene.instantiate())

func end_game(score:int) -> void:
  get_tree().paused = true
  var game:Node = $Game
  for child:Node in game.get_children():
    game.remove_child(child)
    child.queue_free()
  var end_game_menu:Control = $EndGameUI
  var score_label:Label = end_game_menu.get_child(0)
  score_label.text = "Score: " + str(score)
  end_game_menu.show()

