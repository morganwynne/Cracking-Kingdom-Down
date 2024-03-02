class_name PlateHolder extends StaticBody2D

var plate:Plate

func _ready() -> void:
  modulate = Color(Color.MEDIUM_PURPLE, 0.7)

func _process(_delta:float) -> void:
  if global.dragging:
    visible = true
  else:
    visible = false
