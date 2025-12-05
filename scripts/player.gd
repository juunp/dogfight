extends Node2D

@export var health = 100
@export var speed = 100
@export var rotation_speed = 4


func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		rotation = rotation + (rotation_speed * delta)
	elif Input.is_action_pressed("ui_right"):
		rotation = rotation + (rotation_speed * delta * - 1)
		
	
func take_damage(amount: int) -> int:
	return health - amount

func player_death() -> void:
	pass
