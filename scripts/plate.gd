class_name Plate extends Node2D

var draggable:bool = false ## Mouse is hovering over plate and will drag on click
var is_inside_dropable:bool = false
var hovering_plate_holder:PlateHolder
var plate_holder:PlateHolder
var offset:Vector2

func _process(_delta:float) -> void:
  if draggable:
    if Input.is_action_just_pressed("click"):
      offset = get_global_mouse_position() - global_position
      global.is_dragging = true
    if Input.is_action_pressed("click"):
      global_position = get_global_mouse_position() - offset
    elif Input.is_action_just_released("click"):
      global.is_dragging = false
      var tween:Tween = get_tree().create_tween()
      if hovering_plate_holder:
        plate_holder = hovering_plate_holder
        tween.tween_property(self, "position", hovering_plate_holder.position, 0.2).set_ease(Tween.EASE_OUT)
      else:
        tween.tween_property(self, "global_position", plate_holder.position, 0.2).set_ease(Tween.EASE_OUT)

func _on_area_2d_mouse_entered() -> void:
  print("_on_area_2d_mouse_entered triggered")

  if not global.is_dragging:
    draggable = true
    scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited() -> void:
  print("_on_area_2d_mouse_exited triggered")

  if not global.is_dragging:
    draggable = false
    scale = Vector2(1, 1)

func _on_area_2d_body_entered(body:StaticBody2D) -> void:
  print("_on_area_2d_body_entered triggered")

  if body is PlateHolder:
    body.modulate = Color(Color.REBECCA_PURPLE, 1)
    if body != plate_holder:
      hovering_plate_holder = body

func _on_area_2d_body_exited(body:StaticBody2D) -> void:
  print("_on_area_2d_body_exited triggered")

  if body is PlateHolder:
    body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)
    if body == hovering_plate_holder:
      hovering_plate_holder = null
