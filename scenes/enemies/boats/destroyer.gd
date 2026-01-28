extends Enemy

@onready var canon: Polygon2D = $canon
@onready var main: Node = get_tree().get_root().get_node("Main")
@onready var bullet = load("res://scenes/enemies/bullet.tscn")

@export var _max_angle : int =  -160
@export var _min_angle : int = -20
@export var frames_count := 5

var player: Player

func _ready() -> void:
	find_player()
	if player != null:
		canon.look_at(player.position)
	
func _process(_delta: float) -> void:
	if player == null:
		return
	if angle_to_player_in_view(calculate_angle_to_player(player.global_position)):
		canon.look_at(player.position)

func _on_timer_timeout() -> void:
	if player != null && can_shoot():
		shoot()
	
func find_player():
	player = get_tree().get_first_node_in_group("player")

func can_shoot() -> bool:
	return angle_to_player_in_view(calculate_angle_to_player(player.global_position))

func calculate_angle_to_player(player_position: Vector2) -> float:
	var direction = player_position - global_position
	return rad_to_deg(direction.angle())
	
func angle_to_player_in_view(angle: float) -> bool:
	return angle < _min_angle && angle > _max_angle


func shoot() -> void: 
	var inst = bullet.instantiate()
	inst.direction = canon.rotation + PI / 2
	inst.spawnPosition = get_spawn_position()
	inst.spawnRotation = canon.rotation + PI / 2
	main.add_child.call_deferred(inst)


func get_spawn_position() -> Vector2:
	return canon.get_node("bullet_spawn").global_position
