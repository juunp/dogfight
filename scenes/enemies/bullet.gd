extends CharacterBody2D
class_name Bullet 

@export var SPEED = 110

var direction : float
var spawnPosition : Vector2
var spawnRotation : float

func _ready() -> void:
	global_position = spawnPosition
	global_rotation = spawnRotation
	
func _physics_process(_delta: float) -> void:
	velocity = Vector2(0, -SPEED).rotated(direction)
	move_and_slide()
