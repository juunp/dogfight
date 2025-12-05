extends CharacterBody2D

@export var health = 100
@export var speed = 400
@export var rotation_speed = 4

@onready var boost_flames = $"boost flames"

func _ready() -> void:
	rotation_degrees = -45
	
	
var rotation_direction = 0

func _physics_process(delta: float) -> void:
	velocity -= Vector2(velocity).normalized() 
	
	if Input.is_action_pressed("ui_left"):
		rotation = rotation + (rotation_speed * delta * - 1)
	elif Input.is_action_pressed("ui_right"):
		rotation = rotation + (rotation_speed * delta)
	if Input.is_action_pressed("ui_accept"):
		velocity = transform.x * speed
		boost_flames.visible = true
	if Input.is_action_just_released("ui_accept"):
		boost_flames.visible = false;
	move_and_slide()
	
func take_damage(amount: int) -> int:
	return health - amount

func player_death() -> void:
	pass
