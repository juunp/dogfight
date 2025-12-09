extends Node2D

@export var _max_angle := 160
@export var _min_angle := 20

func _ready() -> void:
	rotation_degrees = _min_angle
