class_name TurnCounter extends Node

var turn:int

func _ready() -> void:
  turn = 1;

func increment() -> void:
  turn += 1;
