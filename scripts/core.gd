class_name Core extends Node

func _ready() -> void:
  get_tree().paused = true

func _on_start_game_pressed() -> void:
  var mainMenuUI:Control = $MainMenuUI;

  mainMenuUI.hide()
  get_tree().paused = false

  change_game.call_deferred(load("scenes/game.tscn"))

func change_game(scene:PackedScene) -> void:
  print("change_game called")

  var game:Node = $Game
  
  for child:Node in game.get_children():
    game.remove_child(child)
    child.queue_free()

  game.add_child(scene.instantiate())
