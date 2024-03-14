class_name Plate extends Node2D

var draggable:bool = false ## Mouse is hovering over plate and will drag on click
var is_inside_dropable:bool = false
var hovering_plate_holder:PlateHolder
@export var plate_holder:PlateHolder
var offset:Vector2
var original_position:Vector2

@export var adjacent_plates: Array[Plate] = []

@export var nobility:int = 0
@export var morale:int = 0
@export var resources:int = 0

enum Stats {RESOURCES, NOBILITY, MORALE}
@export var boosted_stat:Stats
@export var boosted_amount:int

func _process(_delta:float) -> void:
  if draggable:
    if Input.is_action_just_pressed("click"):
      var parent:Node = get_parent()
      var childrenCount:int = parent.get_child_count()
      parent.move_child(self, childrenCount - 1); 
      
      offset = get_global_mouse_position() - global_position
      original_position = global_position
      global.dragging = self
    if Input.is_action_pressed("click") and global.dragging == self:
      global_position = get_global_mouse_position() - offset
    elif Input.is_action_just_released("click") and global.dragging == self:
      global.dragging = null
      if hovering_plate_holder and ((hovering_plate_holder.plate and plate_holder) or (hovering_plate_holder.plate == null)):
        if hovering_plate_holder.plate and hovering_plate_holder.plate != self:
          hovering_plate_holder.plate.change_plate_holder(plate_holder, true)
        change_plate_holder(hovering_plate_holder, true)
      else:
        var tween:Tween = get_tree().create_tween()
        tween.tween_property(self, "global_position", original_position, 0.2).set_ease(Tween.EASE_OUT)

func _on_area_2d_mouse_entered() -> void:
  global.hovering = self
  if not global.dragging:
    draggable = true
    scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited() -> void:
  if (global.hovering == self):
    global.hovering = null
  if not global.dragging:
    draggable = false
    scale = Vector2(1, 1)

func _on_area_2d_body_entered(body:StaticBody2D) -> void:
  if body is PlateHolder:
    body.modulate = Color(Color.REBECCA_PURPLE, 1)
    if body != plate_holder:
      hovering_plate_holder = body

func _on_area_2d_body_exited(body:StaticBody2D) -> void:
  if body is PlateHolder:
    body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)
    if body == hovering_plate_holder:
      hovering_plate_holder = null

func change_plate_holder(new_plate_holder:PlateHolder, animate:bool) -> void:
  if plate_holder and plate_holder.plate == self:
    plate_holder.plate = null
  new_plate_holder.plate = self
  plate_holder = new_plate_holder

  if animate:
    var tween:Tween = get_tree().create_tween()
    tween.tween_property(self, "position", new_plate_holder.position, 0.2).set_ease(Tween.EASE_OUT)

func process_end_turn(_turn:int) -> void:
  for adjacent_plate:Plate in adjacent_plates:
    if (adjacent_plate.boosted_stat == Stats.RESOURCES):
      resources += adjacent_plate.boosted_amount
    elif (adjacent_plate.boosted_stat == Stats.NOBILITY):
      nobility += adjacent_plate.boosted_amount
    elif (adjacent_plate.boosted_stat == Stats.MORALE):
      morale += adjacent_plate.boosted_amount 
