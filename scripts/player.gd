extends CharacterBody2D

@export var _health := 100
@export var _speed := 400
@export var _rotation_speed := 4

@onready var _boost_flames := $"boost flames"

func _ready() -> void:
	rotation_degrees = -45

func _physics_process(delta: float) -> void:
	velocity -= Vector2(velocity).normalized() 
	
	var rotation_speed = _rotation_speed * delta
	if Input.is_action_pressed("rotate_left"):
		rotation = rotation + rotation_speed * - 1
	elif Input.is_action_pressed("rotate_right"):
		rotation = rotation + rotation_speed
	if Input.is_action_pressed("accelerate"):
		velocity = transform.x * _speed
		_boost_flames.visible = true
	if Input.is_action_just_released("accelerate"):
		_boost_flames.visible = false;
	move_and_slide()
	
func take_damage(amount: int) -> int:
	return _health - amount

func player_death() -> void:
	pass
