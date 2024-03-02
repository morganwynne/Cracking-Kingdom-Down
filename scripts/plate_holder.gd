extends StaticBody2D

func _ready() -> void:
  modulate = Color(Color.MEDIUM_PURPLE, 0.7)

func _process(_delta:float) -> void:
  if global.is_dragging:
    visible = true
  else:
    visible = false
