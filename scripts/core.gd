extends Node

func _ready():
  print("_ready triggered")

  get_tree().paused = true

func _on_start_game_pressed():
  print("_on_start_game_pressed triggered")

  $MainMenuUI.hide()
  get_tree().paused = false

  change_game(load("scenes/game.tscn"))

func change_game(scene: PackedScene):
  print("change_game called")

  var game = $Game
  
  for child in game.get_children():
    game.remove_child(child)
    child.queue_free()

  game.add_child(scene.instantiate())
